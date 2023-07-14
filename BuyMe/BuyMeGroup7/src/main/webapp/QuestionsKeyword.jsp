<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question Keyword</title>
</head>
<p style="border-width:3px; border-style:solid; border-color:#38761d; padding: 1em; text-align: center;">Question Keyword Search Results</p>
<body bgcolor="#D9EAD3"></body>
<body>
<%  try {
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
		
			//Create a SQL statement
			Statement stmt = con.createStatement();
	
			//Create a SQL statement
			String questionKeyword = request.getParameter("questionKeyword");
			ResultSet result = stmt.executeQuery("SELECT * FROM questions WHERE question LIKE " + "'%" + questionKeyword + "%'");

			 %>
			
			  
			  
			<% while (result.next()) { %>
			<table>
			<div>
				<tr>    
					<b><%= result.getString("question") %></b>
					<%= result.getString("answer") %>
				</tr>
				</div>
			</table>
			 	<% 	} %>
				
			
			
			<a href="Questions.jsp"><%= "Return back to questions page"%></a>
			
		<% //close the connection.
			db.closeConnection(con);
		 }catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>

</body>
</html>