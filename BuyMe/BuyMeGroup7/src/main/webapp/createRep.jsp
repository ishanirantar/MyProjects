<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>create rep</title>
</head>
<p style="border-width:3px; border-style:solid; border-color:#38761d; padding: 1em; text-align: center;">Create a Rep Account</p>
<body bgcolor="#D9EAD3"></body>
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
		String input_password = request.getParameter("password");
		String input_email = request.getParameter("email");
		
		
		String insert = "INSERT INTO USERS(username, user_password, email)"
				+ " VALUES ('" + input_username + "', '" + input_password + "', '" + input_email + "' )";
		
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		ps = con.prepareStatement(insert); 
		
	
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
/* 		ps.setString(1, input_username);
		ps.setString(2, input_password);
		ps.setString(3, input_email); */
		//set strings are just for question marks
		
		//Run the query against the DB
		ps.executeUpdate();
		

		//Run the query against the DB
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("The new customer rep account has successfully been created");
		out.println("<a href='customerRepLoginPage.jsp'>   Click here to log in </a>");		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>

<%
//THIS INSERTS THE NEW CUSTOMER REP INTO THE CUSTOMERREP SQL TABLE AS WELL AS THE USERS AS SEEN ABOVE
	try {

		//Get the database connection
		//ApplicationDB db = new ApplicationDB();	
		//Connection con = db.getConnection();

		//Create a SQL statement
		//Statement stmt = con.createStatement();
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Projectfirst","root", "Aniagutowska1");
    Statement st = con.createStatement();
		//Get parameters from the HTML form at the index.jsp
		String input_username = request.getParameter("username");
		String input_password = request.getParameter("password");
		String input_email = request.getParameter("email");
		
		
		String insert = "INSERT INTO CUSTOMERREP(crepusername, creppassword, crepemail)"
				+ " VALUES ('" + input_username + "', '" + input_password + "', '" + input_email + "' )";
		
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		ps = con.prepareStatement(insert); 
		
	
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
/* 		ps.setString(1, input_username);
		ps.setString(2, input_password);
		ps.setString(3, input_email); */
		//set strings are just for question marks
		
		//Run the query against the DB
		ps.executeUpdate();
		

		//Run the query against the DB
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		//out.print("The new customer rep account has successfully been created");
		//out.println("<a href='logout.jsp'>   click here to log in </a>");
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>

</body>
</html>
