<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="AC.AC_DAO"%>
<%@ page import="AC.SetupList" %>
<% List <SetupList> catalog = AC_DAO.displayView1(); %>
<% List <SetupList> catalog2 = AC_DAO.displayView2(); %>
<% List <SetupList> catalog3 = AC_DAO.displayView3(); %>

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
            text-align: center; 
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

        .edit-button {
            background-color: #4CAF50; 
            color: #ffffff; 
        }

        .edit-button:hover {
            background-color: #45a049; 
        }
        #image1 {
            float: right; 
            margin-left: 20px;
        }
         #imageView {
            float: center; 
            margin-left: 20px;
        }
        
    </style>
</head>
<body>
<img id="image1" src="car2.png" alt="Car Image" width="300" height="150">
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
<h3><a href="car.jsp">Click Here to View the Cars Table</a></h3>
<h3><a href="tracks.jsp">Click Here to View the Tracks Table</a></h3>
<h3><a href="users.jsp">Click Here to View the Users Table</a></h3>
<h3><a href="bestLaps.jsp">Click Here to View the Best Laps Table</a></h3>
<div class="button-container">
    <button type="button" onclick="setup()">Modify Setups</button>
</div>
<table>
    <h2>Views</h2>
    <h3>View 1</h3>
    <tr>
        <th>User ID</th>
        <th>Lap Time</th>
    </tr>
    <% for (SetupList c : catalog) { %>
        <tr>
            <td><%= c.getUserID() %></td>
            <td><%= c.getLapTime() %></td>
        </tr>
    <% } %>
    <img id="imageView" src="view1.png" alt="view1" width="400" height="150">
</table>
	Lap Times Descending from Longest to Shortest

<table>
	<h3>View 2</h3>
	<tr>
	    <th>User Name</th>
	    <th>Setup Name</th>
	    <th>Lap Time</th>
	</tr>
	<% for (SetupList c : catalog2) { %>
	    <tr>
	       <td><%= c.getUserName() %></td>
	       <td><%= c.getSetupName() %></td>
	       <td><%= c.getLapTime() %></td>
	    </tr>
    <% } %>
    <img id="imageView" src="view2.png" alt="view2" width="400" height="150">
</table>
	Best Lap for CarID 2 and TrackID 2

<table>
	<h3>View 3</h3>
	<tr>
        <th>Setup Name</th>
        <th>Track Name</th>
    </tr>
    <% for (SetupList c : catalog3) { %>
        <tr>
            <td><%= c.getSetupName() %></td>
            <td><%= c.getTrackName() %></td>
        </tr>
    <% } %>
    <img id="imageView" src="view3.png" alt="view3" width="400" height="150">
</table>
	Setup Name using CarID 7
	
<script>
    function setup() {
        window.location.href = "setup.jsp";
    }
</script>
</body>
</html>

