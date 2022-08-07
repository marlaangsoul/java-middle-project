<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>main.jsp</title>

<!-- Custom styles for this template -->
</head>
<body>
    <div class="site-wrapper">
      <div class="site-wrapper-inner">
        <div class="container">
          <div class="inner cover">
            <h1 class="cover-heading">들살이닷컴과 함께 떠나는 감성 캠핑</h1>
            <p class="lead">이번주 ${member.memName}님의 완벽한 캠핑을 위한 상품이 준비되어있습니다. </p>
            <p class="lead">
              <a href="productUser" class="btn btn-lg btn-default">더보기</a>
            </p>
          </div>
        </div>
      </div>
    </div>
    
  
</body>
</html>