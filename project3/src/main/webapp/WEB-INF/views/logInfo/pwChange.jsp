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
width: 400px;
}

.input-group-prepend span{
width: 150px;
align-items: center;

}

</style>
<script type="text/javascript">
function pwCheck() {
	var memPW = $("#memPW").val();
	var memPWCheck = $("#memPWCheck").val();
	console.log(memPW + ":" + memPWCheck);
	if(memPW != "" || memPW != null){
		if(memPW == memPWCheck){
//			alert("check");
			$("#pwChange").submit();
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			$("#memPW").focus();
		}
	}else{
		alert("비밀번호를 입력하세요");
		$("memPW").focus();
	}
	
}
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
				<form action="pwChange" method="post" name="pwChange" id="pwChange">
				<div class="form-group">
					<div class="input-group form-group" style="margin-top: 25px">
						<div class="input-group-prepend">
							<span class="input-group-text">새 비밀번호 입력</span>
						</div>
						<input type="password" class="form-control" id="memPW" name="memPW" placeholder="password">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text">새 비밀번호 확인</span>
						</div>
						<input type="password" class="form-control" id="memPWCheck" name="memPWCheck" placeholder="password check">
					</div>
					</div>
					<input type="hidden" name="memId" value="${data.memId }">
				<div class="d-flex justify-content-center">
					<button class="btn" type="button" onclick="pwCheck();">비밀번호 변경</button>
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