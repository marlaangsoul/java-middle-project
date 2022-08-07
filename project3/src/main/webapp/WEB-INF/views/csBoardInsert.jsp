<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>csBoardInsert</title>
<style type="text/css">
.site-wrapper {
  background-image: url("https://media.istockphoto.com/photos/tourists-sitting-near-campfire-under-starry-sky-picture-id1213691432?k=20&m=1213691432&s=612x612&w=0&h=nKhvQ4QWfeKAFskB87yq0L9w2q8ezimm5Qqp-p4Spj4=");
}
</style>


</head>
<body>

	<div class="site-wrapper">
		<div class="site-wrapper-inner" align="center">
			<div class="container">
				<div class="inner cover">
					<br>
					<h3>새로운 글</h3>
					<br>
					<blockquote class="blockquote text-right">
						<p class="mb-0">의견을 자유롭게 남겨주세요.
						<p>지나친 욕설이나 비방글은 삭제될 수 있습니다.</p>
						<footer class="blockquote-footer">
							들살이 닷컴 <cite title="Source Title">project3</cite>
						</footer>
					</blockquote>
					<br>
					<br>
					<form method="post">

						<div class="input-group mb-3" style="width: 700px">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon3">제목</span>
							</div>
							<input type="text" class="form-control" id="basic-url" name="csTitle"
								aria-describedby="basic-addon3">
						</div>
						<div class="input-group mb-3" style="width: 700px">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon3">작성자</span>
							</div>
							<input type="text" class="form-control" id="basic-url" name="csWriter"
								aria-describedby="basic-addon3" value="${member.memId }" readonly="readonly">
						</div>

						<div class="form-group" style="width: 800px">
							<label for="exampleFormControlTextarea1">내용 작성</label>
							<textarea class="form-control" id="textarea"
							name="csContent" rows="10"></textarea>
						</div>
						<br>
							<input type="submit" value="작성하기">
					</form>
					<br>
					<a href="csBoardList?page=1&perPageNum=10&searchType=&keyword=">돌아가기</a>

				</div>
			</div>
		</div>
	</div>


<script type="text/javascript">
var str = document.getElementById("textarea").value;
str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
document.getElementById("textarea").value = str;
</script>
</body>
</html>
