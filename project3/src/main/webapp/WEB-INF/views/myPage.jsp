<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
@media (min-width: 768px) {
  /* Pull out the header and footer */
  .masthead {
    position: fixed;
    top: 0;
  }
  /* Start the vertical centering */
  .site-wrapper-inner {
    vertical-align: top;
  }
  
  
/*
 * Header
 */
.masthead-brand {
  margin-top: 10px; /*헤더 마진*/
  margin-bottom: 10px;
}

.masthead-nav > li {
  display: inline-block;
}
.masthead-nav > li + li {
  margin-left: 20px;	/*네비 컨텐츠 사이 간격*/
}
.masthead-nav > li > a {
  padding-right: 0;
  padding-left: 0;
  font-size: 16px;
  font-weight: bold;
  color: #fff; /* IE8 proofing */
  color: rgba(255,255,255,.75); /*네비 글자색*/
  border-bottom: 2px solid transparent;
}
.masthead-nav > li > a:hover,
.masthead-nav > li > a:focus {
  background-color: transparent;
  border-bottom-color: #a9a9a9;
  border-bottom-color: rgba(255,255,255,.25);
}
.masthead-nav > .active > a,
.masthead-nav > .active > a:hover,
.masthead-nav > .active > a:focus {
  color: #fff;
  border-bottom-color: #fff;
}

@media (min-width: 768px) {
  .masthead-brand {
    float: left;
  }
  .masthead-nav {
    float: right;
  }
  
 .th-bg{
 text-align: center;
 width: 35%;
 background-color: rgba(0, 0, 0, 0.5);
 }
}
 
/*modal*/
.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
} 
  
</style>
<script>

var memDelete = $('#memDelete');
	function clickDel(memDelete) {
		console.log("cilckDel 실행");
		memDelete.action = "memberDelete";
		memDelete.method = "POST";
		memDelete.submit();
	};
	
function pwUpdate(memPWUpdate){
 	console.log($("#checkPW").val());
	var newPW = $("#newPW").val();
 	var newPWCheck = $("#newPWCheck").val();
 	console.log(newPW);
 	console.log(newPWCheck);
 		
 	if($("#checkPW").val() !=  "${data.memPW}" || $("#checkPW").val() == ""){
 		alert("기존 비밀번호가 틀립니다.");
 		$("#checkPW").focus();
 	}else{
 		if(newPW != newPWCheck) {
 	 		alert("비밀번호가 일치하지 않습니다.");
 			$("#newPW").focus();
 	 	} else { 	 		
 	 		console.log("change");
 	 		memPWUpdate.action = "memberPWUpdate";
 	 		memPWUpdate.method = "POST";
 	 		memPWUpdate.submit();
 	 	}
 	}
 };
 	
	
</script>

</head>
<body>
	<div class="site-wrapper">
		<div class="site-wrapper-inner" align="center">
		<div class="container">
				<div class="inner cover" style="color: white">
					<h1>MY PAGE</h1>
					<br> <br>
					
					<table class="table text-white" style="width: 250px">					
					<tr><th class="th-bg">ID</th><td>${data.memId }</td></tr>
					<tr><th class="th-bg">이름</th><td>${data.memName }</td></tr>
					<tr><th class="th-bg">전화번호</th><td>${data.memPhone }</td></tr>
					<tr><th class="th-bg">성별</th><td>${data.memSex }</td></tr>
					<tr><th class="th-bg">가입일</th><td>${data.memRegDate }</td></tr>
					</table>
				
					<!-- <div class="input-group mb-3" style="width: 400px">
						<input type="text" class="form-control"
							placeholder="ID: ${data.memId }" aria-label="Username"
							aria-describedby="basic-addon1" readonly="readonly">
					</div>

					<div class="input-group mb-3" style="width: 400px">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">PW</span>
						</div>
						<input type="password" class="form-control"
							placeholder="${data.memPW }" aria-describedby="basic-addon1"
							readonly="readonly">
					</div>

					<div class="input-group mb-3" style="width: 400px">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">이름</span>
						</div>
						<input type="text" class="form-control"
							placeholder="${data.memName }" aria-describedby="basic-addon1"
							readonly="readonly">
					</div>

					<div class="input-group mb-3" style="width: 400px">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">전화번호</span>
						</div>
						<input type="text" class="form-control"
							placeholder="${data.memPhone }" aria-describedby="basic-addon1"
							readonly="readonly">
					</div>

					<div class="input-group mb-3" style="width: 400px">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">성별</span>
						</div>
						<input type="text" class="form-control"
							placeholder="${data.memSex }" aria-describedby="basic-addon1"
							readonly="readonly">
					</div>

					<div class="input-group mb-3" style="width: 400px">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">가입일</span>
						</div>
						<input type="text" class="form-control"
							placeholder="${data.memRegDate }" aria-describedby="basic-addon1"
							readonly="readonly">
					</div>  -->
					<br>
					<div class="d-flex justify-content-center">
						<div class="">
				<form action="memberUpdate?memId=${data.memId }" method="get">
				<!-- <input type="hidden" name="memId" value="${data.memId }">
				<input type="hidden" name="memPW" value="${data.memPW }">
				<input type="hidden" name="memName" value="${data.memName }">
				<input type="hidden" name="memPhone" value="${data.memRegDate }">
				<!-- memId가 작성한 사람과 일치할때 수정 버튼 생기도록 추후 수정 -->
					<button type="submit" class="btn btn-sm btn-default">
									정보수정
								</button>
							</form>
						</div>
						<div style="margin-left: 10px">
						<button type="submit" class="btn btn-sm btn-default" data-toggle="modal" data-target="#changePW">
							비밀번호변경
						</button>
						</div>
						<div style="margin-left: 10px">
						<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal"> 
							회원탈퇴
						</button>
						<form id="memDelete" name="memDelete">
							<input type="hidden" name="memId" value="${member.memId }">
						</form>
						</div>


					</div>
				</div>
			</div>
			</div>
			</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Confirm</h5>
				</div>
				<div class="modal-body">정말 탈퇴하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" onclick="clickDel(memDelete)">탈퇴하기</button>
					<button type="button" class="btn btn-secondary"	data-dismiss="modal">돌아가기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal2 -->
	<div class="modal fade" id="changePW" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				
				<div class="modal-header">
	    				<h4 class="modal-title" id="modalLabel1">비밀번호 변경</h4>
	    			</div>
	    			<form name="memPWUpdate" id="memPWUpdate">
	    			<div class="modal-body">
	    				<table>
	    					<tr><th>비밀번호 확인 </th><td><input type="password" id="checkPW"></td></tr>
	    					<tr><th>새 비밀번호 </th><td><input type="password" name="memPW" id="newPW" required></td></tr>
	    					<tr><th>새 비밀번호 확인 </th><td><input type="password" id="newPWCheck" required></td>
	    				</table>
	    			</div>
	    			<div class="modal-footer">
	    				<input type="hidden" name="memId" value="${data.memId}">
	    			<!-- <input type="hidden" name="memPW" value="${data.memPW}"> -->	
	    				<button type="button" class="btn btn-primary" id="changeBtn" onclick="pwUpdate(memPWUpdate);">변경</button>
	    				<button type="button" class="btn btn-secondary"	data-dismiss="modal">취소</button>
	    			</div>
	    		</form>
			</div>
		</div>
	</div>

	
</body>
</html>