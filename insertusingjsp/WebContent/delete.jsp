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

<jsp:useBean id="service" class="com.demo.service.UserService" />
<jsp:useBean id="user" class="com.demo.model.User" />
<jsp:setProperty property="*" name="user" />

<%

int result = service.deleteUser(user);

if(result > 0)
{
	response.sendRedirect("updateAll.jsp");
}
else
{
	response.sendRedirect("error.jsp");
}

//OLD METHOD TO DELETE USER ON CLICK
//FOR THIS OLD METHOD DONT FORGET TO REMOVE deleteUser method from UserService.java
//String id = request.getParameter("id");

//try
//{
		//Class.forName("com.mysql.cj.jdbc.Driver");
	//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pracdatabase?serverTimezone=UTC", "root", "Mercedes9987");
	
	//Statement st = con.createStatement();
	//int i = st.executeUpdate("DELETE FROM myjspprac WHERE id="+id);

	//response.sendRedirect("deleteAll.jsp");
//}

//catch(Exception e)
//{
	//System.out.println(e);
//}

%>

</body>
</html>