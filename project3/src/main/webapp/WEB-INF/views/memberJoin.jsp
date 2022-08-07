<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src='{% static "js/jquery-1.11.3.min.js" %}'></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script language="javascript">
	function checks() {

		var getId = document.getElementById("memId");
		var getPw = document.getElementById("memPW");
		var getPwCheck = document.getElementById("password_check");
		
		var memId = getId.value; 
		var memPW = getPw.value; 
		var pwCheck = getPwCheck.value;
		
		var regExp = /^[a-zA-Z0-9]{4,12}$/;

		if (!regExp.test(id)) {
			alert("아이디 다시 설정"); 
			getId.value = ""; 
			getId.focus(); 
			return false; 
		} else if (!regExp.test(pw)) {
			alert("비밀번호 다시 설정"); 
			getPw.value = ""; 
			getPw.focus(); 
			return false; 
		} else if (!(pwCheck.slice(0, pwCheck.length) == pw.slice(0, pw.length))) { 
			password 동일한지 확인 alert("비밀번호 서로 안맞아"); 
			getPwCheck.value = ""; 
			getPwCheck.focus(); 
			return false;
		}
	}	
	
</script>



</head>
<body>
	<form action="join" method="post" onSubmit="return checks()">
		<div style="float: none; margin: 0 auto;">
			<h1 align="center">User Join</h1>
			<div>
				<h6>
					아이디 : 4~12자의 영문 대소문자와 숫자
					<button type="button" id="idCheck">중복 확인</button>
				</h6>
				<input type="text" id="id" name="id">
				<h6>비밀번호 : 4~12자의 영문 대소문자와 숫자</h6>
				<input type="password" id="pw" name="pw">
				<h6>비밀번호 확인</h6>
				<input type="password" id="password_check">
				<h6>이름</h6>
				<input type="text" name="name" id="name">
				
				<h6>전화번호</h6>
				<input type="text" name="phone">
				
				<div align="center">
					<button type="submit">회원 가입</button>
					<button type="reset">다시 입력</button>
					<button type="button" onclick="location.href='login'">뒤로</button>
				</div>
			</div>
	</form>
</body>
</html>

