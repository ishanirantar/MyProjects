<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rep Answer</title>
</head>
<p style="border-width:3px; border-style:solid; border-color:#38761d; padding: 1em; text-align: center;">Rep Answer</p>
<body bgcolor="#D9EAD3"></body>
<body>
<%  try {
	//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Create a SQL statement

			out.print("Answer has been submitted");
			
			String entity = request.getParameter("q_answer");
			String yo = request.getParameter("questionid");
			
			String update = "UPDATE Questions SET answer = '" + entity + "' " + "WHERE question_id = " + yo;
			
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(update);
			ps = con.prepareStatement(update); 
			
			//Run the query against the DB
			ps.executeUpdate();
			 %>
			
			  
			
			<a href="CRepHome.jsp"><%= "Return back to the customer rep home page."%></a>
			
		<% //close the connection.
			db.closeConnection(con);
		 }catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>
