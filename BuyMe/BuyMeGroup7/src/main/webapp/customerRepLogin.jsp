<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer rep login </title>
</head>
<p style="border-width:3px; border-style:solid; border-color:#38761d; padding: 1em; text-align: center;">Login to a Rep Account</p>
<body bgcolor="#D9EAD3"></body>
<body>

<%
try{
//IF CUSTOMER REP IS LOGGING IN 
ApplicationDB db = new ApplicationDB();	
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
	Connection con = db.getConnection();
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from CUSTOMERREP where crepusername='" + userid + "' and creppassword='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>  Log out</a>");
        response.sendRedirect("CRepHome.jsp");
       } else {
            out.println("Invalid password <a href='customerRepLoginPage.jsp'>try again</a>");
        }
	db.closeConnection(con);
}
catch (Exception ex){
	out.print(ex);
	out.print("Customer Rep login failed");
}
%>
