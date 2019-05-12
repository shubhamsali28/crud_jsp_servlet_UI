<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</head>
<body>

	<table class="table table-hover">

		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Age</th>
			<th>Email</th>
		</tr>

		<%
			try {

				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/pracdatabase?serverTimezone=UTC", "root", "Mercedes9987");

				String name = request.getParameter("name"); //Getting the id
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("SELECT * FROM myjspprac WHERE name='" + name + "'");

				while (rs.next()) {
		%>
		<tr class="table-info">
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getInt(3)%></td>
			<td><%=rs.getString(4)%></td>
		</tr>
		<%
			}
			} catch (Exception e) {
				System.out.println(e);
			}
		%>

	</table>
<input type="button" value="Back" onclick="window.location.href='updateAll.jsp'" class="btn btn-success"/> 
</body>
</html>