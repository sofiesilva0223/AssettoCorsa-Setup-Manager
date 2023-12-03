<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="AC.AC_DAO" %>
<%@ page import="AC.SetupList" %>
<% List <SetupList> catalog = AC_DAO.getBestLaps(); %>

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
            color: #ffffff; 
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
<table id="carTable" border="2" width="100%">
    <tr>
        <th>Lap ID</th>
        <th>Track ID</th>
        <th>Car ID</th>
        <th>User ID</th>
        <th>Setup ID</th>
        <th>Lap Time</th>
    </tr>
    <% for (SetupList c : catalog) { %>
        <tr>
            <td><%= c.getLapID() %></td>
            <td><%= c.getTrackID() %></td>
            <td><%= c.getCarID() %></td>
            <td><%= c.getUserID() %></td>
            <td><%= c.getSetupID() %></td>
            <td><%= c.getLapTime() %></td>
        </tr>
    <% } %>
</table>
</body>
</html>