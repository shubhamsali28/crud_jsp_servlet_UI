<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">

div.form
{
    display: block;
    text-align: center;
    padding: 100px 400px 50px;     
}

form
{
    display: inline-block;
    margin: auto;
    
}

.my
{
  box-sizing: border-box;
  border: 4px solid #ccc;
  border-radius: 5px;
  padding: 10px;
}

label
{
  font-size: 18px;
  font-weight: 600;
}

</style>

<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>

<%
String id = request.getParameter("id"); //Getting the id

try
{
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pracdatabase?serverTimezone=UTC", "root", "Mercedes9987");
    
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from myjspprac where id="+id);

	while(rs.next())
	{
%>

<div class="form">	
<div class="my">
<h1>UPDATE DATA</h1>
<form method="post" action="updatedTable.jsp">
<input type="hidden" name="id" value="<%= rs.getString("id") %>" class="form-control">
<label>Name: </label><br>
<input type="text" name="name" value="<%= rs.getString("name") %>" class="form-control">
<br>
<label>Age: </label><br>
<input type="text" name="age" value="<%= rs.getString("age") %>" class="form-control">
<br>
<label>Email: </label><br>
<input type="text" name="email" value="<%= rs.getString("email") %>" class="form-control">
<br><br>
<input type="submit" value="Update" class="btn btn-success">
</form>
</div>
</div>

<%
	}

}
catch(Exception e)
{
	System.out.println(e);
}

%>

</body>
</html>