<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div style="float: none; margin: 0 auto;">
		<h1>Login</h1>
		<form action="loginPage" name="LoginForm" method="post">
			<h1>ID</h1>
			<input type="text" required name="memId">
			<h1>PW</h1>
			<input type="password" required name="memPW">
			<button type="submit">Login</button>
		</form>
		<button type="button" onclick="location.href='joinPage'">Join</button>
		<button type="button" onclick="location.href=''">Find Id/Pw</button>
		<button type="button" onclick="location.href='/'">Main</button>
	</div>
</body>
</html>


