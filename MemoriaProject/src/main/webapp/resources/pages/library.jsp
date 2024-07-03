<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Styles -->
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<!-- JS files -->
<script type="text/javascript" src="../javascript/script.js" defer></script>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
</head>
<body>
	<header>
		<%@ include file="../pages/header.jsp"%>
	</header>
	<hr>
	<div class="all-courses">
		<%
		if (session.getAttribute("courses") != null) {
			List<String> courses = (ArrayList<String>) session.getAttribute("courses");
			if (courses != null) {
				for (String course : courses) {
		%>
		<div class="course-operations">
			<h3><a href=""><%=course%></a></h3>
			<div class="operations">
				<button>Edit</button>
				<button>Delete</button>
			</div>
		</div>
		<%}}} %>
		<h3></h3>
	</div>
</body>
</html>