<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!--Custom styles
<link rel="stylesheet" type="text/css" href="styles.css">-->
<style type="text/css">
.card{
height: 480px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}	
	
.input-group-prepend span{
width: 70px;
background-color: light-gray;
color: black;
text-align: center;
border:0 !important;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
//id중복체크 ajax

var idCheck = false;
var pwCheck = false;
var nameCheck = false;

function check(){
	memId = $("#memId").val();
	
	var paramData = JSON.stringify(
			{"memId": memId});
	
	var headers = {"Content-Type" : "application/json"
		, "X-HTTP-Method-Override" : "POST"};
	
	$.ajax({
	    url: '/camping/memIdCheck',
	    headers : headers,
	    type: 'POST',
	    dataType: 'text', //서버로부터 내가 받는 데이터의 타입
	    data: paramData ,

	    success: function(data){
	         if(data == 0){
	         //console.log("아이디 없음");
	         alert("사용할 수 있는 ID입니다.");
	         $('#memPW').focus();
	         idCheck = true;
	         }else{
	         	//console.log("아이디 있음");
	         	alert("존재하는 ID입니다.");
	         	 $('#memId').val('');
                 $('#memId').focus();
	         }
	         console.log("idchecked="+idCheck);
	    },
	  });
}

//비밀번호 check
$(function(){
		$('#memPWCheck').blur(function(){
		   if($('#memPW').val() != $('#memPWCheck').val()){
		    	if($('#memPWCheck').val()!='' && $('#memPWCheck').val()!=null){
			    alert("비밀번호가 일치하지 않습니다.");
		    	    $('#memPWCheck').val('');
		    	    $('#memPWCheck').prop('readonly', false); //비밀번호 새로 입력했을때 readonly 해제
		         	$('#memPWCheck').focus();
		    	    pwCheck = false;
		    	    console.log('pwChecked='+pwCheck);
		       }
		   }else{
		    	   alert('비밀번호가 일치합니다.');
		    	   $('#memPWCheck').prop('readonly', true); //비밀번호 확인완료시 readonly처리
		    	   $('#memName').focus();
		    	   pwCheck = true;
		    	   console.log('pwChecked='+pwCheck);
		    }
		})
		   console.log('pwChecked='+pwCheck);
	});

//submit전 최종 check
function lastCheck(){
	
//var checked = false;

	memId = $("#memId").val();
	memPW = $("#memPW").val();
	memPWCheck = $("#memPWCheck").val();
	memName = $("#memName").val();

	if(idCheck == true && pwCheck == true && nameCheck == true){
		return true;
	}else{
		if(memId == ''){
			alert('ID를 입력해주세요');
			$('#memId').focus();
			idCheck = false;
		}else if(idCheck == false){
			alert('ID 중복확인을 해주세요');
		}else if (memPW ==''){
			alert('비밀번호를 입력하세요');
			$('#memPW').focus();
			pwCheck = false;
		}else if(memPWCheck ==''){
			alert('비밀번호 확인을 해주세요');
			$('#memPWCheck').focus();
			pwCheck = false;
		}else if(memName != ''){
			nameCheck = true;
		}else if(memName ==''){
			alert('이름을 입력하세요');
			nameCheck = false;
			$('#memName').focus();
		}
		return false;
	};

		//if(idCheck == true && pwCheck == true && nameCheck == true){
		//	checked = true;
		//};

		//if(checked == true){
		//	return true;
		//};
		
	};
</script>
	
</head>
<body>

<div class="container">
	<div class="d-flex justify-content-center h-100">

		<div class="card">
			<div class="card-header">
				<h3 style="color: light-gray">Join</h3>
				<div class="d-flex justify-content-end social_icon">
					<!--<span><i class="fab fa-google-plus-square"></i></span>  -->
					<span><a href="/camping"><img width="100px" class="fab fa-twitter-square" src="resources/img/logo.png"/></a></span> 
				</div>
			</div>
			<div class="card-body">
			
				<form id="join" action="join" method="post" onsubmit="return lastCheck();">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text">*ID</span> 
						</div>
						<input type="text" class="form-control" id="memId" name="memId" placeholder="아이디 필수입력">
						<button type="button" class="btn float-right" style="width: 80px" name="memIdCheck" id="memIdCheck" onclick="check();">check</button>
						<!-- 아이디 중복검사 ajax -->
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text">*PW</span>
						</div>
						<input type="password" class="form-control" id="memPW" name="memPW" placeholder="비밀번호 필수입력">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text">*PW@</span>
						</div>
						<input type="password" class="form-control" id="memPWCheck" name="memPWCheck" placeholder="비밀번호 확인">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text">*이름</span>
						</div>
						<input type="text" class="form-control" id="memName" name="memName" placeholder="예시) 홍길동">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text">연락처</span>
						</div>
						<input type="text" class="form-control" name="memPhone" placeholder="예시) 010-1234-5678">
					</div>
					
				<div class="input-group form-group">
					<span class="input-group-text">성별</span>
							<input type="radio" class="form-control" value="남성" name="memSex"  checked><p style="color: white">남성</p>
         					<input type="radio" class="form-control" value="여성" name="memSex"><p style="color: white">여성</p>
         					<input type="radio" class="form-control" value="기타" name="memSex"><p style="color: white">기타</p>
					</div>	
				<!--
					<div class="d-md-flex justify-content-start align-items-center mb-4 py-2">

                    <h6 class="mb-0 me-4">성별: </h6>
					
					<div class="form-check form-check-inline mb-0 me-4">
                      <input class="form-check-input" type="radio" name="memSex" value="남성" />
                      <label class="form-check-label">남성</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 me-4">
                      <input class="form-check-input" type="radio" name="memSex" value="여성" />
                      <label class="form-check-label">여성</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 me-4">
                      <input class="form-check-input" type="radio" name="memSex" value="기타" />
                      <label class="form-check-label">기타</label>
                    </div>
                    </div>
                  -->	
					
					<!--<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text">캠핑선호지역</span>
							경기도 <input type = "checkbox" class="form-control"  name="location1">
							강원도 <input type = "checkbox" class="form-control"  name="location2" >
							충청도 <input type = "checkbox" class="form-control"  name="location4" >
							전라도 <input type = "checkbox" class="form-control"  name="location5" >
							경상도 <input type = "checkbox" class="form-control"  name="location6" >
						</div>
						</div>-->
					<!-- <div class="row align-items-center remember">
						<input type="checkbox">Remember Me
					</div> -->
					<div class="form-group">
						<input type="submit" value="가입하기" class="btn float-right login_btn">
					</div>
					
				</form>
			</div>
		<!-- <div class="card-footer">
				<div class="d-flex justify-content-center links">
					회원가입하셨나요?<a href="join"> 가입하기</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#">비밀번호를 잊으셨나요?</a>
				</div>
			</div> -->	
		</div>
	</div>
</div>


</body>
</html>