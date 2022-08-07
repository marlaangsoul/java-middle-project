<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

.input-group-prepend span{
width: 90px;
}
</style>
<title>header.jsp</title>
</head>
<body>

	<div class="container inner">
	<!-- <input type="hidden" name="memName" value="${member.memName}">
		<input type="hidden" name="memId" value="${member.memId}">
		<input type="hidden" name="memPW" value="${member.memPW}">
		<input type="hidden" name="memSex" value="${member.memSex}">
		<input type="hidden" name="memPhone" value="${member.memPhone}">
		<input type="hidden" name="memRegDate" value="${member.memRegDate}"> -->	
		<a href="main" class="masthead-brand">
		<img src="resources/img/logo.png" width="130" ></a>
		<nav>
		
			<ul class="nav masthead-nav">
				<li><a href="myPage">My Page</a></li>
				<li><a href="#">My Cart</a></li>
				<li><a
					href="csBoardList?page=1&perPageNum=10">Community</a></li>
				<li><a href="logout">Logout</a></li>
			</ul>
		</nav>
	</div>


</body>
</html>