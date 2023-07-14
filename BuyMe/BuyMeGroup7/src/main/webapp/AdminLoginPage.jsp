<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<body bgcolor="#D9EAD3"></body>
<title>admin login page</title>
</head>
<body>
<p style="border-width:3px; border-style:solid; border-color:#38761d; padding: 1em; text-align: center;"> Welcome to the admin login page!</p>
   
   <br>
   <br>
     <form action="AdminLogin.jsp" method="POST">
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     
   <br>
   <br>
</body>
</html>
