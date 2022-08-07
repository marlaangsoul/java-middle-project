<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!--Custom styles
<link rel="stylesheet" type="text/css" href="styles.css">-->
<style type="text/css">

.card{
height: 300px;
width: 350px;
}

.input-group-prepend span{
width: 60px;
align-items: center;

}

</style>
<script type="text/javascript">

function isCheck(){
	var memId = $("#memId").val();
	var memName = $("#memName").val();
		if(memId == "" || memId == null){
			alert("ID를 입력하세요");
			$("#memId").focus();
		}else if(memName =="" || memName == null){
			alert("이름을 입력하세요");
			$("#memName").focus();
		}else{
			$("#pwChange").submit();
		}
};




</script>

</head>

<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3 style="color: light-gray">비밀번호 찾기</h3>
				<div class="d-flex justify-content-end social_icon">
					<!--<span><i class="fab fa-google-plus-square"></i></span>  -->
					<span><a href="/camping"><img width="100px" class="fab fa-twitter-square" src="resources/img/logo.png"/></a> </span> 
				</div>
				<!--<div class="d-flex justify-content-end social_icon">
				<span><i class="fab fa-facebook-square"></i></span> 
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span> 
				</div>-->	
			</div>
			
			<div class="card-body">
				<form action="pwChange" method="get" name="pwChange" id="pwChange">
				<div class="form-group">
					<div class="input-group form-group" style="margin-top: 25px">
						<div class="input-group-prepend">
							<span class="input-group-text">ID</span>
						</div>
						<input type="text" class="form-control" id="memId" name="memId" placeholder="ID를 입력하세요">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text">이름</span>
						</div>
						<input type="text" class="form-control" id="memName" name="memName" placeholder="이름이 일치할 시 비밀번호 변경">
					</div>
					</div>
				<div class="d-flex justify-content-center">
					<button class="btn" type="button" id="checkBtn" onclick="isCheck();">비밀번호 설정하기</button>
				</div>
				</form>
				<br>
			</div>
		</div>
	</div>
</div>


</body>
</html>
</html>