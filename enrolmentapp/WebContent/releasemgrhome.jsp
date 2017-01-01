<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<sql:query var="rs" dataSource="jdbc/enrolmentapp">
	select * from enrolmentapp.release
</sql:query>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div class="container">

<header>
   <h1>Release Enrolment Tool</h1>
</header>
  
<nav>
  <ul>
    <li><a href="testlogin.jsp">Home</a></li>
    <li><a href="underconstruction.jsp">Search</a></li>
    <li><a href="underconstruction.jsp">Create New Release</a></li>
    <li><a href="underconstruction.jsp">Edit Release</a></li>
    <li><a href="underconstruction.jsp">Approve Enrolment</a></li>
    <li><a href="underconstruction.jsp">Edit Enrolment</a></li>
    <li><a href="underconstruction.jsp">Edit Profile</a></li>
    <li><a href="underconstruction.jsp">Reports</a></li>
    <li><a href="underconstruction.jsp">Help</a></li>
    <li><a href="login.jsp">Logout</a></li>
  </ul>
</nav>

<article>
  <table>
  	<tr>
  		<td><font color="red"><b>Logged-in user: </b></font><%=request.getAttribute("username") %></td>
  		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  		<td><font><b>||</b></font></td>
  		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  		<td><font color="red"><b>Role: </b></font><%=request.getAttribute("role") %></td>
  	</tr>
  </table>
  <h1>About the Tool</h1>
  <p>
  This tool is released to facilitate the project teams to align and plan their releases based on the published release calendar.
  Project Managers are required to enroll their projects in this tool so that the EM & RI team can plan the implementation part of it
  collaborating with different platforms and stakeholders.
  
  <h1><font color="green">List of Releases as on <%= new Date() %></font></h1>
  
  <table frame="box" border="1">
	
	<tr>
		<th>Release</th>
		<th>Start Date</th>
		<th>End Date</th>
		<th>Description</th>
		<th>No. of Enrolments</th>
		<th>Status</th>
	</tr>
	<c:forEach var="row" items="${rs.rows}">
	<tr>
		<td>${row.releasename}</td>
		<td>${row.releasestartdate}</td>
		<td>${row.releaseenddate}</td>
		<td>${row.desc}</td>
		<td>5</td>
		<td>${row.status}</td>
	</tr>
	</c:forEach>
</table>
   
</article>

<footer><i>Developed by: avikdeb@gmail.com</i></footer>

</div>

</body>
</html>
