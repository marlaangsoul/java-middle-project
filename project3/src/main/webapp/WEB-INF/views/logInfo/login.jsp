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
<script type="text/javascript">

//str message = JSON.stringify(Array.from("message"));
//$(document).ready(function(){
//	alert(message);
//});

var check = function () {
	const form = document.loginForm;
	const memId = form.memId;
	const memPW = form.memPW;
	if(memId.value.length == 0){
		alert('ID를 입력하세요');
		memId.focus();
		return;
	}
	if(memPW.value.length == 0){
		alert('비밀번호를 입력하세요');
		memPW.focus();
		return;
	}
	form.submit();
}



</script>
	
</head>

<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3 style="color: light-gray">Sign In</h3>
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
				<form action="login" method="post" name="loginForm" id="loginForm">
				<div class="form-group">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" id="memId" name="memId" placeholder="ID">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" id="memPW" name="memPW" placeholder="Password">
					</div>
					<!-- <div class="row align-items-center remember">
						<input type="checkbox">Remember Me
					</div> -->
						<input type="button" value="Login" class="btn float-right login_btn" onclick="check();">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Don't have an account?<a href="join"> 가입하기</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="pwSearch">Forgot your password?</a>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>
</html>