<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>crep login page</title>
<p style="border-width:3px; border-style:solid; border-color:#38761d; padding: 1em; text-align: center;">Delete Account</p>
<body bgcolor="#D9EAD3"></body>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<br>
<body>
	<%
	try {

		//Get the database connection
		//ApplicationDB db = new ApplicationDB();	
		//Connection con = db.getConnection();

		//Create a SQL statement
		//Statement stmt = con.createStatement();
		Class.forName("com.mysql.jdbc.Driver");
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
	    Statement st = con.createStatement();
		//Get parameters from the HTML form at the index.jsp
		String input_username = request.getParameter("username");

		
		String insert = "Delete FROM USERS WHERE username='" + input_username + "'";
		
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		ps = con.prepareStatement(insert); 
		
		//Run the query against the DB
		ps.executeUpdate();
		

		//Run the query against the DB
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("The user account has been successfully deleted." );
		out.println("<a href='CRepHome.jsp'>   Return back to Customer Representative Home Page </a>");		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>