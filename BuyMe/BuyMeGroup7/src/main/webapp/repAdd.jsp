<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer Representative</title>
    <link rel="stylesheet" href="style.css">
</head>
<p style="border-width:3px; border-style:solid; border-color:#38761d; padding: 1em; text-align: center;">Create A Customer Representative Account</p>
<body bgcolor="#D9EAD3"></body>
<body>

Fill in the info below to create a new customer representative:





<br>
		<form method="post" action="createRep.jsp">
		<table>
		<tr>    
		<td>Username</td><td><input type="text" name="username"></td>
		</tr>
		<tr>
		<td>Password</td><td><input type="password" name="password"></td>
		</tr>
		<tr>
		<td>Email</td><td><input type="text" name="email"></td>
		</tr>
		</table>
		<input type="submit" value="Submit!">
		</form>
	<br>
	
	
   </body>
   
   
</html>
