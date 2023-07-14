<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions</title>
</head>
<p style="border-width:3px; border-style:solid; border-color:#38761d; padding: 1em; text-align: center;">Post Or Browse Questions!</p>
<body bgcolor="#D9EAD3"></body>
<body>
<center>
		<br>
		<div id="searchbar1">
   		<a href="QuestionsDisplay.jsp"><%= "Click Here to see all questions and answers"%></a> or search by keyword below:
		<form action="QuestionsKeyword.jsp" method="POST">
		<br>
				<input type="text" name="questionKeyword" id="questionKeyword" placeholder="Enter keywords to get relevant questions"> <br>
				<input type="submit" value="Search">
		</form>
	</div>
	
	<br>
	<br>
	Please post your question below: 
	<br>
		<form method="post" action="QuestionsAsked.jsp">
		<table>
	
		<td><p><input type="text" name="questionAsked"placeholder="Enter question to post"></p></td>
		
		</table>
		<p>   </p>
		<input type="submit" value="Submit">
		</form>
		</center>
	<br>




</body>
</html>