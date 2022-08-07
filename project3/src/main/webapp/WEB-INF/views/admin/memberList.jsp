<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "/camping/memberList?"
									+ '${pageMaker.makeQuery(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
			});
</script>
</head>
 <div class="container">
          <div class="inner cover">
	<br>
	<div class="container">
	<h2 style="align-content: center; color: white;">회원 목록</h2>
	<br>
	<div class="row">
    <div class="col">
    <select class="form-select form-select-sm" name="searchType" value="${cri. keyword }">
		<option value="null"
			<c:out value="${cri.searchType == null? 'selected' : '' }"/>>
			Search Option</option>
		<option value="id"
			<c:out value="${cri.searchType eq 'id'? 'selected' : '' }"/>>
			ID</option>
		<option value="name"
			<c:out value="${cri.searchType eq 'name'? 'selected' : '' }"/>>
			이름</option>
		<option value="phone"
			<c:out value="${cri.searchType eq 'phone'? 'selected' : '' }"/>>
			전화번호</option>
		<option value="sex"
			<c:out value="${cri.searchType eq 'sex'? 'selected' : '' }"/>>
			성별</option>
			<option value="regDate"
			<c:out value="${cri.searchType eq 'regDate'? 'selected' : '' }"/>>
			가입일</option>
	</select>
    </div>
    <div class="col">
    <input type="text" name='keyword' id="keywordInput" size="50%"
		value="${cri.keyword }">
	</div>
    <div class="col">
    <button type="button" class="btn btn-light" id='searchBtn'>검색</button>
    </div>
    </div>
	</div>
	
	<br>
	
		<table class="table table-light">
		<thead>
			<tr align="center" style="color: black;">
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">전화번호</th>
				<th scope="col">성별</th>
				<th scope="col">가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${data}">
				<tr align="center" style="color: black;">
					<td>${member.memId}</td>
					<td>${member.memName}</td>
					<td>${member.memPhone}</td>
					<td>${member.memSex}</td>
					<td>${member.memRegDate}</td>
			</c:forEach>
		</tbody>
		</table>
	
	<!-- Paging -->

		<!-- text-center -->
<!-- 
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
 -->
	

	<button type="button" class="btn btn-light">
		<a href="memberList?page=1&perPageNum=10&searchType=&keyword="> 전체목록</a>
	</button>
	</div>
	</div>
</body>
</html>