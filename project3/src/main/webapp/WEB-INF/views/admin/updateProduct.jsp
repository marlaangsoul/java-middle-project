<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addProduct</title>
<style>
.inputArea {margin: 10px 0;}
select {width: 100px;}
label {	display: inline-block;width: 70px;padding: 5px;}
label[for='gdsDes'] {display: block;}
input {	width: 150px;}
textarea#gdsDes {width: 400px;height: 180px;}
.select_img img {	margin: 20px 0;}
</style>

</head>
<body>
	<hr>
	<h1>상품 등록</h1>
	<hr>

	<form role="form" method="post" autocomplete="off"
		enctype="multipart/form-data">

		<div class="inputArea">
			<label for="proNum">상품명</label> <input type="text" name="proName" />
		</div>

		<div class="inputArea">
			<label for="proName">상품가격</label> <input type="text" name="proPrice" />
		</div>

		<div class="inputArea">
			<label for="proDes">상품소개</label>
			<textarea rows="5" cols="50" name="proDes"></textarea>
		</div>

		<div class="inputArea">
			<label for="proImg">이미지</label>
		    <input type="file" id="proImg" name="file" />
			<div class="select_img">
				<img src="">
			</div>
			<script src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.11.3.min.js" />">
				$("#proImg").change(
						function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src",
											data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
			</script>
			<%=request.getRealPath("/") %>
		</div>
		<div class="inputArea">
			<p>
				<input type="submit" value="등록">
			</p>
		</div>

	</form>

</body>
</html>