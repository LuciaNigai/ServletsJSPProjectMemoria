<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/javascript/script.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/loginRegisterStyle.css" />
</head>
<body>
	<section class="login-form" id="login1">
		<div class="image-books">
			<img src="<%=request.getContextPath()%>/resources/images/login2.jpg">
		</div>
		<div class="form-login">
			<p>LOGIN</p>
			<div id="result">
				<pre style="color: rgb(179, 116, 121);">${requestScope.output}</pre>
				<br>
			</div>
			<form action="<%=request.getContextPath()%>/login" method="post">
				<input type="email" name="userEmail" placeholder="Enter email">
				<br> <input type="password" name="userPassword"
					placeholder="Enter password"> <br> <input
					type="checkbox" name="ShowPassword" id="show"> <label
					for="show">Show password</label> <br> <input type="submit"
					value="SUBMIT" name="submitbtn" />
			</form>
			<a href="#" style="margin: 10px;">Forgot Password? </a> <br>
			<pre style="margin: 10px;">Don't have account? <a href="#" onclick="register()">Sign up</a>
			</pre>
		</div>
	</section>
	
</body>
</html>