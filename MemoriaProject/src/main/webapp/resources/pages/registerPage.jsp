<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/loginRegisterStyle.css" />
</head>
<body>
	<section class="register-form" id="register">
		<div class="image-books">
			<img src="<%=request.getContextPath()%>/resources/images/login.jpg">
		</div>
		<div class="form-register">
			<p>REGISTER</p>
			<div id="result">
				<pre style="color: rgb(179, 116, 121);">${requestScope.output}</pre>
				<br>
			</div>
			<form action="<%=request.getContextPath()%>/register" method="post">
				<input type="text" name="userName" placeholder="Enter name">
				<br> 
				<input type="email" name="userEmail" placeholder="Enter email">
				<br> 
				<input type="password" name="userPassword" placeholder="Enter password"> 
				<br> 
				<input type="password" name="userPasswordRepeat" placeholder="Repeat password"> 
				<br> 
				<input type="checkbox" name="ShowPassword" id="show"> 
				<label for="show">Show password</label> 
				<br>
				<input type="submit" value="SUBMIT" name="submitbtn" />
			</form>
		</div>
	</section>

</body>
</html>