<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>




<!DOCTYPE html>
<html>
	
   <head>
      <title>Login Form</title>
   </head>
	<p style="border-width:3px; border-style:solid; border-color:#38761d; padding: 1em; text-align: center;">Log In or Sign Up!</p>
<body bgcolor="#D9EAD3"></body>
   <body>
   
   Welcome to the login page!
   
   <br>
   <br>
     <form action="checkLoginDetails.jsp" method="POST">
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     
   <br>
   <br>
   
   
<div  style='text-align:left'>
<a href='customerRepLoginPage.jsp'>Customer Rep Login</a>
</div>
      
   <br>
   
<div  style='text-align:left'>
<a href='AdminLoginPage.jsp'>Admin Login</a>
</div>
   
   
     <br>
   <br>
   
	If you would like to create an account, please enter the details below
	<br>
		<form method="post" action="createAccount.jsp">
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
