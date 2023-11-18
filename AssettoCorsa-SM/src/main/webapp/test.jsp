<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="AC.AC_DAO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Assetto Corsa Setup Manager</title>
    <header><h1>Assetto Corsa Setup Manager 2.0</h1></header>
</head>
<body>

<%
    // *** CONNECTING TO DATABASE ***///
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
     	// NOTE: Replace: "Halo4mlg!" with your own MySQL Password ***///
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/v2ManagerProject", "root", "Halo4mlg!");
        
        // Check if the connection is successful
        if (con != null && !con.isClosed()) {
            out.println("<p style='color: green;'>Database connection successful!</p>");
        } else {
            out.println("<p style='color: red;'>Failed to connect to the database.</p>");
        }

        // Close the connection
        con.close();
    } catch (Exception e) {
        out.println("<p style='color: red;'>Exception: " + e.getMessage() + "</p>");

        // Use a PrintWriter to print the stack trace
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        e.printStackTrace(pw);
        out.println("<p style='color: red;'>Stack trace:<br>" + sw.toString() + "</p>");
    }
%>

</body>
</html>

