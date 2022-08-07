<%@page import="com.project3.camping.vo.productVo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<head>
<meta charset="UTF-8">
<title>product.jsp</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<style>
.thumbImg {
	width: 60px;
	height: auto;
}
</style>

</head>
<body>
	<hr>
	<h1>상품 목록</h1>
	<hr>
	<hr>
	<form>
		상품 검색: <input type="text" placeholder="검색" name="keyword"
			value="${keyword}" /> <input type="submit" value="검색" />
	</form>
	<br>

	<table border="1">
		<tr>
			<th>이미지</th>
			<th>상품 번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>설명</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="p" items="${data}">
			<tr>
				<td><img src="<%='.'%>${p.proThumbImg}" class="thumbImg" /></td>
				<td>${p.proNum}</td>
				<td><a href="detailProduct?proNum=${p.proNum}">${p.proName}</a></td>
				<td>${p.proPrice }</td>
				<td>${p.proDes}</td>
				<td>${p.proDate}</td>
			</tr>
		</c:forEach>
	</table>


	<hr>
</body>
</html>