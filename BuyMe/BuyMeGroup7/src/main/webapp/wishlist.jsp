<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>




<!DOCTYPE html>
<html>

   <head>
      <title>Wish List Form</title>
   </head>
   <p style="border-width:3px; border-style:solid; border-color:#38761d; padding: 1em; text-align: center;">Make A Wish</p>
<body bgcolor="#D9EAD3"></body>
   <body>
<center>
   
   <h2>What kind of shoes would you like in your wish list</h2>
   
   <br>
   <br>
   <b>Please input the following details: </b>
   
   
   	<br>
		<form method="post" action="createWishlist.jsp">
		<table>
		<tr>    
		<td>Shoe Type</td><td><select name ="type" size=1>
				<option value="sneakers">Sneakers</option>
				<option value="boots">Boots</option>
				<option value="sandals">Sandals</option>
			</select>
		</tr>
		<tr> 
		<td><b>Size</b></td><td><select name ="size" size=1>
				<option value="4.0">4.0</option>
				<option value="4.5">4.5</option>
				<option value="5.0">5.0</option>
				<option value="5.5">5.5</option>
				<option value="6.0">6.0</option>
				<option value="6.5">6.5</option>
				<option value="7.0">7.0</option>
				<option value="7.5">7.5</option>
				<option value="8.0">8.0</option>
				<option value="8.5">8.5</option>
				<option value="9.0">9.0</option>
				<option value="9.5">9.5</option>
				<option value="10.0">10.0</option>
				<option value="10.5">10.5</option>
				<option value="11.0">11.0</option>
				<option value="11.5">11.5</option>
				<option value="12.0">12.0</option>
			</select>
		</tr>
		<tr>
				<td><b>Brand</b></td><td><select name="brand" size=1>
				<option value="nike">Nike</option>
				<option value="adidas">Adidas</option>
				<option value="reebok">Reebok</option>
				<option value="under armour">Under Armour</option>
				<option value="vans">Vans</option>
				<option value="converse">Converse</option>
				<option value="uggs">Uggs</option>
				<option value="sperry">Sperry</option>
				<option value="bearclaw">Bearclaw</option>
				<option value="hunter">Hunter</option>
				<option value="doc martens">Doc Martens</option>
				<option value="crocs">Crocs</option>
			</select>
		</tr>
		<tr>
		</table>
		<input type="submit" value="Submit!">
		</form>
   <br>
   <br>
   <br>
   
   </center>
   
   </body>
   
</html>
