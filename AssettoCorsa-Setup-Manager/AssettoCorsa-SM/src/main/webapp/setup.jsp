<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="AC.AC_DAO"%>
<%@ page import="AC.UserIdNamePair" %>
<%@ page import="AC.CarIdNamePair" %>
<%@ page import="AC.TrackIdNamePair" %>
<%@ page import="AC.SetupList" %>
<% List <SetupList> catalog = AC_DAO.getSetups(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Assetto Corsa Setup Manager</title>
    <header><h1>Assetto Corsa Setup Manager 2.0</h1></header>
    <style>
        body {
            background-color: #808080; 
            margin: 0; 
            font-family: Arial, sans-serif; 
            padding: 20px; 
        }

        h2 {
            text-align: left; 
            color: #black; 
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff; 
            margin-top: 20px; 
        }

        th, td {
            border: 2px solid #000000;
            text-align: left;
            padding: 8px;
        }

       .button-container {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }

        button {
            background-color: #ffffff; 
            color: #000000; 
            padding: 15px 20px; 
            cursor: pointer; 
            font-size: 16px; 
        }

        button:hover {
            background-color: #f4f4f4; 
        }
        .delete-button {
            background-color: #ff0000; 
            color: #ffffff; 
        }

        .delete-button:hover {
            background-color: #cc0000;
        }

        #database-image {
            float: right; 
            margin-left: 20px;
        }
    </style>
</head>
<body>
<%
    // *** CONNECTING TO DATABASE ***///
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
     	// NOTE: Replace: "Halo4mlg!" with your own MySQL Password ***///
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/acsetup", "root", "Halo4mlg!");
        
        // Check if the connection is successful
        if (con != null && !con.isClosed()) {
            out.println("<p style='color: green;'>Successfully connected to the database!</p>");
        } else {
            out.println("<p style='color: red;'>Failed to connect to the database.</p>");
        }

        // Close the connection
        con.close();
    } catch (Exception e) {
        out.println("<p style='color: red;'>Exception: " + e.getMessage() + "</p>");

        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        e.printStackTrace(pw);
        out.println("<p style='color: red;'>Stack trace:<br>" + sw.toString() + "</p>");
    }
%>
<h3><a href="main.jsp">Click Here to Return to the Main Setup Page</a></h3>

<h2>Adding a Setup</h2>
<form method="post" action="AddServlet" onsubmit="return handleFormSubmission()">
Setup Name:
    <input type="text" name="setupName" required><br>
User ID:
<select name="userID">
    <%
        List<UserIdNamePair> userPairs = AC_DAO.getUserIdNamePairs(); 
        for (UserIdNamePair userPair : userPairs) {
    %>
        <option value="<%= userPair.getUserId() %>"><%= userPair.getUserId() %> : <%= userPair.getUserName() %></option>
    <%
        }
    %>
</select><br>
Car:
<select name="carID">
    <%
        List<CarIdNamePair> carPairs = AC_DAO.getCarIdNamePairs(); 
        for (CarIdNamePair carPair : carPairs) {
    %>
        <option value="<%= carPair.getCarId() %>"><%= carPair.getCarId() %> : <%= carPair.getCarName() %></option>
    <%
        }
    %>
</select><br>
Track:
<select name="trackID">
    <%
        List<TrackIdNamePair> trackPairs = AC_DAO.getTrackIdNamePairs(); 
        for (TrackIdNamePair trackPair : trackPairs) {
    %>
        <option value="<%= trackPair.getTrackId() %>"><%= trackPair.getTrackId() %>: <%= trackPair.getTrackName() %></option>
    <%
        }
    %>
</select><br>
<input type="submit" value="Add Setup">
</form>

<h2>Current Setups</h2>
<table id="carTable" border="2" width="100%">
    <tr>
        <th>Setup ID</th>
        <th>Setup Name</th>
        <th>User ID</th>
        <th>Car ID</th>
        <th>Track ID</th>
        <th>Delete (Optional)</th>
    </tr>
    <% for (SetupList s : catalog) { %>
        <tr>
            <td><%= s.getSetupID() %></td>
            <td><%= s.getSetupName() %></td>
            <td><%= s.getUserID() %></td>
            <td><%= s.getCarID() %></td>
            <td><%= s.getTrackID() %></td>
            <td><button class="delete-button" data-setup-id="<%= s.getSetupID() %>" onclick="deleteSetup(this)">Delete</button></td>
        </tr>
    <% } %>
</table>

<h2>Editing and Updating a Setup</h2>
<form method="post" action="UpdateServlet" onsubmit="return handleUpdateSubmission()">
    Setup ID:
    <select id="updateSetupId" name="updateSetupId">
    <%
        for (SetupList s : catalog) {
    %>
        <option value="<%= s.getSetupID() %>"><%= s.getSetupID() %></option>
    <%
        }
    %>
</select><br>


    Setup Name:
    <input type="text" id="updateSetupName" name="updateSetupName" required><br>
    User ID:
<select name="userID">
    <%
        List<UserIdNamePair> userPairs2 = AC_DAO.getUserIdNamePairs(); 
        for (UserIdNamePair userPair : userPairs) {
    %>
        <option value="<%= userPair.getUserId() %>"><%= userPair.getUserId() %> : <%= userPair.getUserName() %></option>
    <%
        }
    %>
</select><br>
Car:
<select name="carID">
    <%
        List<CarIdNamePair> carPairs2 = AC_DAO.getCarIdNamePairs(); 
        for (CarIdNamePair carPair : carPairs) {
    %>
        <option value="<%= carPair.getCarId() %>"><%= carPair.getCarId() %> : <%= carPair.getCarName() %></option>
    <%
        }
    %>
</select><br>
Track:
<select name="trackID">
    <%
        List<TrackIdNamePair> trackPairs2 = AC_DAO.getTrackIdNamePairs(); 
        for (TrackIdNamePair trackPair : trackPairs) {
    %>
        <option value="<%= trackPair.getTrackId() %>"><%= trackPair.getTrackId() %>: <%= trackPair.getTrackName() %></option>
    <%
        }
    %>
</select><br>

    <input type="submit" value="Update Setup">
</form>
<script>
function handleFormSubmission() {
    alert("Added successfully");
    return true;
}

function deleteSetup(button) {
    var setupId = button.getAttribute("data-setup-id");

    // AJAX request to delete the setup
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                // Remove the corresponding row from the table
                var row = button.parentNode.parentNode;
                row.parentNode.removeChild(row);
                alert("Delete successful");
            } else {
                console.error("Failed to delete setup");
            }
        }
    };

    xhr.open("POST", "DeleteServlet");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("setupId=" + setupId);
}

function handleUpdateSubmission() {
    alert("Update successful");
    return true;
}
</script>


</body>
</html>