<%@page import="com.project3.camping.vo.productVo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product.jsp</title>

<style>
.thumbImg {width:60px; height:auto;}
</style>

</head>


<body>
 <div class="container">
          <div class="inner cover">
    <br>
	<br>
	<hr>
	<div class="container">
	<h2 style="align-content: center; color: white;">상품 관리</h2>
	<br>
	<div class="row">
    <div class="col">
  		<form style="color: white;">
		상품 검색: <input type="text" placeholder="검색" name="keyword"
			value="${keyword}" /> <input type="submit" value="검색" />
		</form>
    </div>
    </div>
	</div>
	
	<br>
	
		<table class="table table-light">
		<thead>
			<tr align="center" style="color: black;">
				<th scope="col">이미지</th>
				<th scope="col">상품번호</th>
				<th scope="col">상품명</th>
				<th scope="col">가격</th>
				<th scope="col">설명</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="p" items="${data}">
			<tr align="center" style="color: black;">
				<td><img src = "<%='.' %>${p.proThumbImg}" class="thumbImg"/></td>
				<td>${p.proNum}</td>
				<td><a href="detailProduct?proNum=${p.proNum}">${p.proName}</a></td>
				<td>${p.proPrice}</td>
				<td>${p.proDes}</td>
				<td>${p.proDate}</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
	
	<!-- Paging -->

		<!-- text-center -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev}">
					<li class="page-item">
					<span class="page-link"><a href="csBoardList${pageMaker.makeSearch(pageMaker.startPage -1) }">&laquo;</a></span> 
					</li>
				
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">	
					<li class="page-item" <c:out
						value="${pageMaker.cri.page == idx?'class =active':'' }" />>
							<a class="page-link" href="csBoardList${pageMaker.makeSearch(idx) }">${idx }</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">	
				<li class="page-item"><a class="page-link" href="csBoardList${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a>
				</c:if>
				
			</ul>
	</nav>
	<div align="right">
	<button type="button" class="btn btn-light">
		<a href="productInsert"> 상품등록 </a>
	</button>
	<button type="button" class="btn btn-light">
		<a href="productAdmin"> 전체목록 </a>
	</button>
	</div>
	</div>
	</div>


</body>
</html>