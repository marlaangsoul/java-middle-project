<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>csReplyList.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">

//댓글 등록(Insert)
$(document).ready(function(){
	$("#replyAddBtn").click(function() {
		const param = {
				"csNum" : 112,
				"csReplyWriter" : $('#newCsReplyWriter').val(),
				"csReplyContent" : $('#newCsReplyContent').val()
		}
		$.ajax({
			type : 'post',
			url : '/camping/csReplies',
			contentType : 'application/json',
			dataType : 'text',
			data : JSON.stringify(param),
			success : function(result) {
				if(result == 'SUCCESS') {
					alert("등록되었습니다.");
					getAllList();
				}
			}
		}); //end ajax
	});
});



//list 불러오기(스스로 조합해서 성공한거)
function getAllList(){	//ajax호출 함수처리
$.getJSON("/camping/csReplies/all/"+csNum, function(data) {
	//console.log(data.length);
	//console.log(data);
	$(data).each(
		function() {
			html = '';
			const replies = data[0];
			html += '<tr><th>No</th><th>작성자</th><th>댓글</th></tr>\n';
			for(const replies of data){
				html += '<tr>';
				html += '<td class="replyLi">' + replies['csReplyNum'] + '</td>';
				html += '<td class="csReplyWriterUpdate">' + replies['csReplyWriter'] + '</td>';
				html += '<td class="csReplyContentUpdate">' + replies['csReplyContent'] + '<button class="replyBtn">수정/삭제</button>' + '</td>';
				html += '</tr>';
			}
			//console.log(html);
		});
	$("#csReplies").html(html);
});
}

$(function () {
	// onload
	getAllList();
});
	
	
</script>
</head>
<body>

 <hr>

	<hr>
	<h3>댓글</h3>

	
	<div>
		<div>
		작성자 : <input type="text" name="csReplyWriter" id="newCsReplyWriter">
		</div>
		<div>
		<textarea name="csReplyContent" id="newCsReplyContent" rows="3" cols="80" placeholder="댓글을 입력하세요"></textarea>	
		</div>
		<button id="replyAddBtn">댓글 등록</button>
	</div>

<hr>
	<table id="csReplies">
	</table>
	
	
</body>
</html>