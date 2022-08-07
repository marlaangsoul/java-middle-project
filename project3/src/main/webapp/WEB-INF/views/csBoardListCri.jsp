<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>csBoardListCri.jsp</title>
</head>
<body>

<h2>
고객의 소리
</h2>
<hr>
<form>  
글 검색: <input type="text" placeholder="검색" name="keyword" value="${keyword}" />  
<input type="submit" value="검색" />  
</form>  
<br>

<table border="1">
  <tr align="center">
   <th>번호</th><th>제목</th><th>내용</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>

<c:forEach var="cs" items="${data}">
<tr align="center"><td>${cs.csNum}</td>
<td><a href="csBoardGet?csNum=${cs.csNum}">${cs.csTitle}</a></td>
<td>${cs.csContent}</td>
<td>${cs.csWriter}</td>
<td>${cs.csRegDate}</td>
<td>${cs.csViewCnt}</td>
</c:forEach>
</table>

<p><a href="csBoardInsert"> 게시물 작성</a>


</body>
</html>