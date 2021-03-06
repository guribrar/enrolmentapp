<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<sql:query var="rs" dataSource="jdbc/enrolmentapp">
	select role from enrolmentapp.role
</sql:query>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>New User Registration</title>
</head>

<body>

<div class="container">

<header>
   <h1>Release Enrolment Tool</h1>
</header>
  
<nav>
  <ul>
    <li><a href="login.jsp">Login</a></li>
    <li><a href="underconstruction.jsp">Help</a></li>
    <li><a href="underconstruction.jsp">About</a></li>
  </ul>
</nav>


<article>
<table frame="box">
	<tr>
		<th><font color="green">New User Registration Form</font></th>
	</tr>
	<tr>
		<td>
			<form action="RegistrationServlet" method="post">
			<table frame="box">
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Firstname</td>
					<td><input type="text" name="firstname" value="" /></td>
					<td>Lastname</td>
					<td><input type="text" name="lastname" value="" /></td>
				</tr>
				<tr>
					<td>Username</td>
					<td><input type="text" name="username" value="" /></td>
					<td>Password</td>
					<td><input type="password" name="password" value="" /></td>
				</tr>
				<tr>
					<td>E-mail</td>
					<td><input type="text" name="email" value="" /></td>
					<td>Mobile</td>
					<td><input type="text" name="mobile" value="" /></td>
				</tr>
				<tr>
					<td>Department</td>
					<td><input type="text" name="department" value="" /></td>
					<td>Application Role</td>
					<td>
						<select name="rolename">
							<option value="">----------- OPTIONS -----------</option>
							<c:forEach var="row" items="${rs.rows}">
    							<option value="${row.role}">${row.role}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" name="save" value="Save"/></td>
					<td><input type="submit" name="cancel" value="Cancel"/></td>
					<td>&nbsp;</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<!--td><a href="login.jsp">login</a></td-->
	</tr>
</table>

</article>

<footer><i>Developed by: avikdeb@gmail.com</i></footer>

</div>



</body>
</html>