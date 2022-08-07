<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">

var csNum = 112;

//댓글 등록
$(document).on('click', '#btnReplySave', function(){
		var replyContent = $('#content').val();
		var replyReg_id = $('#reg_id').val();

		var paramData = JSON.stringify(
				{"csReplyContent": replyContent
				, "csReplyWriter": replyReg_id
				, "csNum" : 112
		});	
		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};

		$.ajax({
			url: "/camping/csReplies"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				if(result == 'SUCCESS') {
					alert("등록되었습니다.");
				showReplyList();
				
				$('#content').val('');
				$('#reg_id').val('');
			}
			 
		}}); //댓글 등록 ajax 종료
	});

//댓글 수정 눌렀을때
function fn_editReply(csReplyNum, csReplyWriter, csReplyContent){

		var htmls = "";
		htmls += '<div class="media text-muted pt-3" id="rid' + csReplyNum + '">';
		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		htmls += '<span class="d-block">';
		htmls += '<strong class="text-gray-dark">' + csReplyWriter + '</strong>';
		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
		htmls += csReplyContent;
		htmls += '</textarea>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + csReplyNum + ', \'' + csReplyWriter + '\')" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
		htmls += '</span>';
		htmls += '</span>';		
		htmls += '</p>';
		htmls += '</div>';

		$('#rid' + csReplyNum).replaceWith(htmls);
		$('#rid' + csReplyNum + ' #editContent').focus();
	}

//댓글 수정 저장버튼
function fn_updateReply(csReplyNum, csWriter){

		var replyEditContent = $('#editContent').val();
		var paramData = JSON.stringify({"csReplyContent": replyEditContent
			, "csReplyNum": csReplyNum
		});

		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};

		$.ajax({
			url: "csReplies/"+csReplyNum
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
                console.log(result);
                if(result == 'SUCCESS') {
					alert("댓글 수정 완료");
				showReplyList();
			}
		}
		});
	};
	
//댓글 삭제 버튼
function fn_deleteReply(csReplyNum){

		var paramData = {"csReplyNum": csReplyNum};

		$.ajax({
			url: "csReplies/"+csReplyNum
			, data : paramData
			, type : 'DELETE'
			, dataType : 'text'
			, success: function(result){
				if(result == 'SUCCESS') {
					alert("댓글 삭제 완료");
				showReplyList();
			}
		}
	});
}

$(document).ready(function(){
	showReplyList();
});

//list불러오기
csNum = 112;
var paramData = {"csNum" : "${csNum}"};


function showReplyList() {
	$.ajax({

	    type: 'GET',
	    url: "/camping/csReplies/all/"+csNum,
	    data: paramData,
	    dataType: 'json',
	    success: function(result) {
	       	var htmls = "";
			if(result.length < 1){
			htmls.push("등록된 댓글이 없습니다.");
			} else {
	      		$(result).each(function(){
	                 htmls += '<div class="media text-muted pt-3" id="rid' + this.csReplyNum + '">';
	                 htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	                 htmls += '<span class="d-block">';
	                 htmls += '<strong class="text-gray-dark">' + this.csReplyWriter + '</strong>';
	                 htmls += '<span>' +"        "+ this.csReplyContent + '</span>';
	                 htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	                 htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.csReplyNum + ', \'' + this.csReplyWriter + '\', \'' + this.csReplyContent + '\' )" style="padding-right:5px">수정</a>';
	                 htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.csReplyNum + ')" >삭제</a>';
	                 htmls += '</span>';
	                 htmls += '</span>';
	                 htmls += '</p>';
	                 htmls += '</div>';
			});	//each end
		}
		$("#replyList").html(htmls);
	     
	    }	   // Ajax success end

	});	// Ajax end
};

</script>
</head>
<body>

<div style="margin-top : 20px">

<hr>
<h3>댓글보기</h3>

			<!-- Reply Form {s} -->

			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<form name="form" id="form" role="form" modelAttribute="csReplyVo" method="post">

				<input type ="hidden" id="bid"/>

				<div class="row">

					<div class="col-sm-10">

						<textarea path="content" id="content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></textarea>

					</div>

					<div class="col-sm-2">

						<input path="reg_id" class="form-control" id="reg_id" placeholder="댓글 작성자">

						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>

					</div>

				</div>

				</form>

			</div>

			<!-- Reply Form {e} -->

			

			<!-- Reply List {s}-->

			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<h6 class="border-bottom pb-2 mb-0">Reply list</h6>

				<div id="replyList"></div>

			</div> 

			<!-- Reply List {e}-->

</body>
</html>