<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<title>Login Details</title>
<p style="border-width:3px; border-style:solid; border-color:#38761d; padding: 1em; text-align: center;">Login Details</p>
<body bgcolor="#D9EAD3"></body>

%
<%
try {
//IF CUSTOMER  IS LOGGING IN 
ApplicationDB db3 = new ApplicationDB();	
    String userid3 = request.getParameter("username");   
    String pwd3 = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    ApplicationDB db = new ApplicationDB();	
	Connection con3 = db.getConnection();
    Statement st3 = con3.createStatement();
    ResultSet rs3;
    rs3 = st3.executeQuery("select * from USERS where username='" + userid3 + "' and user_password='" + pwd3 + "'");
    if (rs3.next()) {
        session.setAttribute("user", userid3); // the username will be stored in the session
        out.println("welcome " + userid3);
        out.println("<a href='logout.jsp'>  Log out</a>");
        response.sendRedirect("success.jsp");
    }
	 else {
	    out.println("Invalid password <a href='login.jsp'>try again</a>");
	}
	db3.closeConnection(con3);
}
catch (Exception ex){
	out.print(ex);
	out.print("User login failed");
}
%>
