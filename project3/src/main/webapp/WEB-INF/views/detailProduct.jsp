<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detailProduct</title>
<style>
.Area { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:70px; padding:5px; }
label[for='gdsDes'] { display:block; }
input { width:150px; }
textarea#proDes { width:400px; height:180px; }

.oriImg{width:300px; height:auto;}
.thumbImg{width:300px; height:auto;}
</style>
</head>
<body>
	<hr>
	<h1>상품 상세</h1>
	<hr>
	

<p>상품명: ${data.proName } </p>

<p>상품가격: <fmt:formatNumber type="number" 
	maxFractionDigits="3" value="${data.proPrice }"/>  원</p>

<p>입고 날짜 : 
<fmt:parseDate value="${data.proDate}" pattern="yyyy-MM-dd HH:mm" var="myDate"/>
<fmt:formatDate value="${myDate}" pattern="yyyy-MM-dd"/>
<hr>

<div class="Area">
 <label for="proDes">상품 소개 </label>
 <br>
 <span> "${data.proDes}" </span>
</div>

<div class = "inputArea">
<label for = "proImg"> 이미지</label>
<p> 상품 이미지 </p>
<img src = "<%='.' %>${data.proThumbImg}" class="thumbImg"/>
</div>
<div class="inputArea">

</div>
</body>
</html>