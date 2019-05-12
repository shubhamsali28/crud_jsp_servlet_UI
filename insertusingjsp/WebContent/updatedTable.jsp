<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String id = request.getParameter("id"); //Getting the id
String name = request.getParameter("name");
String age = request.getParameter("age");
String email = request.getParameter("email");
try
{
	int personID = Integer.parseInt(id);
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pracdatabase?serverTimezone=UTC", "root", "Mercedes9987");
    
	PreparedStatement ps = con.prepareStatement("Update myjspprac set id=?,name=?,age=?,email=? where id="+id);
	
	ps.setString(1,id);
	ps.setString(2, name);
	ps.setString(3, age);
	ps.setString(4, email);
	
	int result = ps.executeUpdate();
	if(result > 0)
	{
	response.sendRedirect("updateAll.jsp");
	}
	else
	{
	response.sendRedirect("error.jsp");
	} 

}
catch(Exception e)
{
	System.out.println(e);
}
%>

</body>
</html>