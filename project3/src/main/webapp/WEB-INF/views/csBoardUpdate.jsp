<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>csBoardUpdate.jsp</title>
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
					<h3>글 수정</h3>
					<br>
					<br>
					<form action="csBoardUpdate" method="post">
						<input type="hidden" name="page" value="${cri.page }">
						<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
						<input type="hidden" name="csNum" value="${csdata.csNum }">
						<div class="input-group mb-3" style="width: 700px">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon3">제목</span>
							</div>
							<input type="text" class="form-control" id="basic-url" name="csTitle"
								aria-describedby="basic-addon3" value="${csdata.csTitle}">
						</div>
					<!--<p>
							수정할 제목 : <input type="text" name="csTitle"
								value=" ${data.csTitle}">
						</p>  -->	
						<!-- 이 값을 받아오면 자꾸 중첩되는 이유.. 여쭤볼것 -->
						<div class="input-group mb-3" style="width: 700px">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon3">작성자</span>
							</div>
							<input type="text" class="form-control" id="basic-url" name="csWriter"
								aria-describedby="basic-addon3" placeholder="${csdata.csWriter }" readonly="readonly">
						</div>
						
						
						<div class="form-group" style="width: 800px">
							<label for="exampleFormControlTextarea1">내용 작성</label>
							<textarea class="form-control" id="exampleFormControlTextarea1"
							name="csContent" rows="10">${csdata.csContent }</textarea>
						</div>

						<br>
						<div class="form-group">	
							<input type="submit" value="수정하기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
