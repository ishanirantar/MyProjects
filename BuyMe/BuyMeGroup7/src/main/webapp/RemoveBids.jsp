<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>

<style>

.tab1{
tab-size=50;
}



table, th, td {
  border: 1px solid DarkGreen;
  border-collapse: collapse;
  padding: 10px;
}
th, td {
padding: 30px;
}
</style>
<p style="border-width:3px; border-style:solid; border-color:#38761d; padding: 1em; text-align: center;">Delete A Bid</p>
<body bgcolor="#D9EAD3"></body>
<%
try {
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	
	String str2 = "SELECT * FROM BIDS";
	
	
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str2);
	
	%>
<center>
<h3>BID INFORMATION: SELECT A BID AMOUNT FOR A SPECIFIC USER TO DELETE A BID</h3>




<br>
			<div>
			  <tr>
			  	<th><b>Click to Delete&emsp;&emsp;&ensp;&emsp;</b></th>
			 
			    <th><b>Username &emsp;&ensp;&emsp;&emsp;&emsp;&emsp;</b></th> 
			  <th><b>&emsp;&emsp;Footwear Item Id &emsp;</b></th>
			  <th><b>&emsp;&emsp;&emsp;Amount of Bid&emsp;&ensp;&emsp;&ensp;</b></th>
			    <th><b>Auction Type&emsp;&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</b></th> 
			  <th><b>Bid Upper Limit&emsp;&emsp;&ensp;&emsp;&ensp;</b></th>
			  <th><b>Bid Increment&emsp;&ensp;&emsp;&ensp;&emsp;</b></th>
			  	</tr>
			  </div>
<table style= ""width:50%">
	<%
	//parse out the results
	while (result.next()) { 
	%>
	<div>
	<tr>
	
		<td><a href="RemoveBidInfo.jsp?bid_amount=<%= result.getString("bid_amount")%>&bid_username=<%=result.getString("bid_username")%>">Delete</a>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp;</td></a></td>
		<td> <%= result.getString("bid_username") %>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
		<td> <%= result.getString("bid_footwear_item_id") %>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
		<td> <%= result.getString("bid_amount") %>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
		<% if (result.getString("isAutomatic").equals("1")){ %>
			<td>Automatic&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
		<% }else{ %>
			<td>Manual&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
			<% } %>
			<% if (result.getString("upper_limit")==null){ %>
			<td>None&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
		<% }else{ %>
			<td><%= result.getString("upper_limit") %>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
			<% } %>
			<% if (result.getString("bid_increment")==null){ %>
			<td>None&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
		<% }else{ %>
			<td><%= result.getString("bid_increment") %>&emsp;&ensp;&emsp;&ensp;&emsp;&ensp; </td>
			<% } %>
	</tr>	
	</div>
	<% } %>
	
	<%  db.closeConnection(con);
	%>
	
</table>
</center>

<%} catch (Exception e) {
	out.print(e);
}
%>