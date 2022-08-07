<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin.jsp</title>

<style type="text/css">

.card{
height: 170px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.h6{
color: white;
}
</style>
</head>
<body>
 <div class="site-wrapper">
      <div class="site-wrapper-inner">
	<div class="container">
		<div class="d-flex justify-content-center">

			<div class="card">
				<div class="card-header">
					<h3 style="color: light-gray">쇼핑몰 관리</h3>
					<br>
					<button>
						<a href="memberList">고객 정보 조회 </a>
					</button>
					<button>
						<a href="product">상품 관리 </a>
					</button>
					<button>
						<a href="orderList">주문 내역 조회 </a>
					</button>
					<hr>
					<h6 align="right"><a href="logout">logout</a></h6>
				</div>
			</div>
		</div>
	</div>
</div>
</div>



</body>
</html>