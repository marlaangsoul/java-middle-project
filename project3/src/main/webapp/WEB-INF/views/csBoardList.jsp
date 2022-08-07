<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>csBoardList.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "csBoardList"
									+ '${pageMaker.makeQuery(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
			});
</script>
<style type="text/css">
.site-wrapper {
  background-image: url("https://media.istockphoto.com/photos/tourists-sitting-near-campfire-under-starry-sky-picture-id1213691432?k=20&m=1213691432&s=612x612&w=0&h=nKhvQ4QWfeKAFskB87yq0L9w2q8ezimm5Qqp-p4Spj4=");
}
/*paging design*/
.pagination-outer{ text-align: center; }
.pagination{
    display: inline-flex;
    position: relative;
}
.pagination:before{
    content: "";
    width: 100%;
    height: 2px;
    background: #e8e8e8;
    position: absolute;
    top: 50%;
    left: 0;
    transform: translateY(-50%);
}
.pagination li a.page-link{
    padding: 5px 15px;
    margin-right: 15px;
    background: #f8f8f8;
    border: 1px solid #e8e8e8;
    border-radius: 5px;
    box-shadow: 0 8px 6px -9px #5b5f5f;
    font-size: 17px;
    color: #686c6c;
}
.pagination li:first-child a.page-link{ margin-right: 30px; }
.pagination li:last-child a.page-link{ margin: 0 0 0 15px; }
.pagination li.active a.page-link,
.pagination li a.page-link:hover{
    background: gray;
    border-color: #739d46;
    color: #fff;
}
@media only screen and (max-width: 479px){
    .pagination{
        display: block;
        overflow: auto;
    }
    .pagination:before{ display: none; }
    .pagination li{ display: inline-block; }
</style>

</head>
<body>
 <div class="site-wrapper">
      <div class="site-wrapper-inner" align="center">
        <div class="container">
          <div class="inner cover" style="text-shadow: none;">
    <br>
	<h2>Community</h2>
	<br>
	<hr>
	<div class="container">
	<div class="d-flex align-items-start justify-content-center">
    <div class="col-2">
    <select class="form-select form-select-sm" name="searchType">
		<option value="n"
			<c:out value="${cri.searchType == null? 'selected' : '' }"/>>
			Search Option</option>
		<option value="t"
			<c:out value="${cri.searchType eq 't'? 'selected' : '' }"/>>
			Title</option>
		<option value="c"
			<c:out value="${cri.searchType eq 'c'? 'selected' : '' }"/>>
			Content</option>
		<option value="w"
			<c:out value="${cri.searchType eq 'w'? 'selected' : '' }"/>>
			Writer</option>
		<option value="tc"
			<c:out value="${cri.searchType eq 'tc'? 'selected' : '' }"/>>
			Title OR Content</option>
		<option value="cw"
			<c:out value="${cri.searchType eq 'cw'? 'selected' : '' }"/>>
			Content Or Writer</option>
		<option value="tcw"
			<c:out value="${cri.searchType eq 'tcw'? 'selected' : '' }"/>>
			Title OR Content Or Writer</option>
	</select>
    </div>
    <div class="">
    <input type="text" name='keyword' id="keywordInput" size="50%" style="margin-left: 10px"
		value="${cri.keyword }">
	</div>
    <div class="">
    <button type="button" class="btn btn-light btn-sm" id='searchBtn' style="margin-left: 10px">검색</button>
    </div>
    </div>
	</div>
	
	<br>
	
		<table class="table" style="color: white">
		<thead>
			<tr align="center">
				<th scope="col">번호</th>
				<th scope="col" width="500px">제목</th>
				<!--<th>내용</th>  -->
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cs" items="${data}">
				<tr align="center">
					<td>${cs.csNum}</td>
					<td><a
						href="csBoardGet${pageMaker.makeSearch(pageMaker.cri.page)}&csNum=${cs.csNum}">${cs.csTitle}</a></td>
					<!--<td>${cs.csContent}</td>  -->
					<td>${cs.csWriter}</td>
					<td>${cs.csRegDate}</td>
					<td>${cs.csViewCnt}</td>
			</c:forEach>
		</tbody>
		</table>
	
	<!-- Paging -->
		<br>
		<br>
		<!-- text-center -->
		<div class="demo">
		<nav class="pagination-outer" aria-label="Page navigation">
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev}">
					<li class="page-item">
					<span><a class="page-link" href="csBoardList${pageMaker.makeSearch(pageMaker.startPage -1) }">&laquo;</a></span> 
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
	</div>
	<br>
	<div align="right">
	<button type="button" class="btn btn-dark">
	    <!--<input type="hidden" name="memId" value="${member.memId}">  -->
		<a class="text-decoration-none" href="csBoardInsert?memId=${member.memId}"> 게시물 작성</a>
	</button>
	<button type="button" class="btn btn-dark">
		<a class="text-decoration-none" href="csBoardList?page=1&perPageNum=10&searchType=&keyword="> 전체목록</a>
	</button>
	</div>
	<br>
	<br>
          </div>
        </div>
      </div>
    </div>
</body>
</html>