<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">

div { 
    display: block;
    text-align: center;
	padding-top: 50px;
	padding-bottom: 20px;
}

insert
{
 padding-left: 110px;
}


</style>

<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<%!

Connection con;
public void jspInit()
{
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pracdatabase?serverTimezone=UTC", "root", "Mercedes9987");
	}
	catch(Exception e)
	{
		System.out.println(e);
	}	
}

%>

</head>
<body>

<div>
<h1>Click on your option</h1>
<h3>Employee Management</h3>
</div>

<table class="table table-hover">

<tr>
  <th>Id</th>
  <th>Name</th>
  <th>Age</th>
  <th>Email</th>
</tr>

<%

try
{
   Statement st = con.createStatement();
   ResultSet rs = st.executeQuery("SELECT * FROM myjspprac");
   
   while(rs.next())
   {
%>
  <tr class="table-info">
  <td><%= rs.getInt(1) %></td>
  <td><%= rs.getString(2) %></td>
  <td><%= rs.getInt(3) %></td>
  <td><%= rs.getString(4) %></td>
  <td><a href="updateForm.jsp?id=<%= rs.getString("id") %>"><i class="fas fa-user-edit fa-lg"></i></a></td>
  <td><a href="delete.jsp?id=<%=rs.getString("id") %>"><i class="far fa-trash-alt fa-lg"></i></a></td>
  </tr>
<%
   }
}
catch(Exception e)
{
	System.out.println(e);
}
%>

</table>

<insert>
<input type="button" value="Insert" onclick="window.location.href='register.html'" class="btn btn-success"/> 
<input type="button" value="Search" onclick="window.location.href='search.html'" class="btn btn-info"/> 
</insert>

</body>
</html>