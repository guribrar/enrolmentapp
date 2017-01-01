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
    <li><a href="underconstruction.jsp">Edit Profile</a></li>
    <li><a href="underconstruction.jsp">Help</a></li>
    <li><a href="login.jsp">Logout</a></li>
  </ul>
</nav>

<article>
  
  <font color="red"><b>Welcome <%=request.getAttribute("username") %></b></font>
  <p>
  You have granted role <b><font color="red"><%=request.getAttribute("role") %></font></b>. Please logout and login to start using the tool.
  <p>
  <h1>About the Tool</h1>
  <p>
  This tool is released to facilitate the project teams to align and plan their releases based on the published release calendar.
  Project Managers are required to enroll their projects in this tool so that the EM & RI team can plan the implementation part of it
  collaborating with different platforms and stakeholders.
  Please keep sending me the feedback as you start using the tool.
     
</article>

<footer><i>Developed by: avikdeb@gmail.com</i></footer>

</div>

</body>
</html>
