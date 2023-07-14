<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Email</title>
</head>
<p style="border-width:3px; border-style:solid; border-color:#38761d; padding: 1em; text-align: center;">Update Account Email</p>
<body bgcolor="#D9EAD3"></body>
<body>
<center>
 <h2>Enter new email for: <%=request.getParameter("username")%></h2>
		<form action="UpdatedAccountSuccess.jsp" method="GET">
		<label for="type"></label>
				<input type="text" name="updated_email" id="updated_email" placeholder="Enter new email"> 
				<input type="hidden" name="username" value=<%=request.getParameter("username")%>>
				<input type="submit" value="Submit">
				
		</form>
	</div>
<br>
</center>

</body>
</html>