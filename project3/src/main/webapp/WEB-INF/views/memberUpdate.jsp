<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memupdate.jsp</title>
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
  
</style>

<script type="text/javascript">
var gender = "${data.memSex}";
console.log(gender);

$(document).ready(function() {

	var htmls= "";
	if(gender == "남자"){
		htmls += '<input type="radio" value="남자" name="memSex"  checked="checked">남자';
		htmls += '<input type="radio" value="여자" name="memSex">여자';
		htmls += '<input type="radio" value="기타" name="memSex">기타';
	}else if(gender == "여자"){
		htmls += '<input type="radio" value="남자" name="memSex">남자';
		htmls += '<input type="radio" value="여자" name="memSex" checked="checked">여자';
		htmls += '<input type="radio" value="기타" name="memSex">기타';
	}else{
		htmls += '<input type="radio" value="남자" name="memSex">남자';
		htmls += '<input type="radio" value="여자" name="memSex">여자';
		htmls += '<input type="radio" value="기타" name="memSex" checked="checked">기타';
	}
	$("#memSexCheck").html(htmls);
	
});
	

function update() {
		console.log("update")

		var memId =  $("#memId").val();
		var memName = $("#memName").val();
		var memPhone = $("#memPhone").val();
		var memSex = $("memSex").val();
		
		console.log(memName);
		
		$("#memberUpdate").action = "memberUpdate";
		$("#memberUpdate").method = "POST";
		$("#memberUpdate").submit();
};

</script>
</head>
<body>
	<div class="site-wrapper">
		<div class="site-wrapper-inner" align="center">
		<div class="container">
				<div class="inner cover" style="color: white">
					<h1>회원정보 수정</h1>
					<br> <br>
				
				 <form action="memberUpdate" id="memberUpdate" method="post">
					<table class="table text-white" style="width: 250px">					
					<tr><th class="th-bg">ID</th><td>${data.memId }</td></tr>
					<tr><th class="th-bg">이름</th><td>
					<input type="text" id="memName" name="memName" style="color: black" value="${data.memName }"></td></tr>
					<tr><th class="th-bg">전화번호</th><td>
					<input type="text" id="memPhone"  name="memPhone" style="color: black" value="${data.memPhone }"></td></tr>
					<tr><th class="th-bg">성별</th><td id="memSexCheck"> 
					<input type="radio"  value="남자" name="memSex">남자
         			<input type="radio"  value="여자" name="memSex">여자
         			<input type="radio"  value="기타" name="memSex">기타
					</td></tr>
					</table>
					<br>
					<div class="d-flex justify-content-center">
					<div>
					<input type="hidden" name="memId" value="${data.memId }">
					<button type="button" id="upBtn" class="btn btn-sm btn-default" onclick="update();">
						정보수정
					</button>
					</form> 
				
					
					</div>
					</div>
			
						</div>
					</div>
				</div>
			</div>

	
</body>
</html>