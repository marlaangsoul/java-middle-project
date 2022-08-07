<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

//삭제 확인 modal

var boardDelete = $('#boardDelete');
	function clickDel(boardDelete) {
		console.log("cilckDel 실행");
		boardDelete.action = "csBoardDelete";
		boardDelete.method = "POST";
		boardDelete.submit();
	};


//게시글 수정, 삭제버튼(data.csWriter == member.memId)
var csWriter = "${data.csWriter}";
var memId = "${member.memId}";

$(document).ready(function() {
	//console.log("c"+csWriter + ":"+"s" + memId);

	if(memId == csWriter || memId == "admin"){
		console.log("MD");
		$("#boardMD").css("display","block");
	}
});


var csNum = ${data.csNum}
//댓글 등록
$(document).on('click', '#btnReplySave', function(){
		var replyContent = $('#content').val();
		var replyReg_id = $('#reg_id').val();

		var paramData = JSON.stringify(
				{"csReplyContent": replyContent
				, "csReplyWriter": replyReg_id
				, "csNum" : csNum
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
					alert("댓글이 등록되었습니다.");
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
				htmls += '<br><p class="text-secondary">등록된 댓글이 없습니다.</p><br>';
			} else {
	      		$(result).each(function(){
	      			
	      			htmls += '<div class="commented-section mt-2" style="color: black" id="rid' + this.csReplyNum + '">';
	      			htmls += '<div class="d-flex flex-row align-items-center commented-user">';
	      			htmls +=	'<h5 class="mr-2"><b>' + this.csReplyWriter+ '</b></h5>';
	      			htmls += 	'<span style="margin-left: 10px" class="dot mb-1"></span><span style="margin-left: 5px" class="mb-1 ml-2" font-size: 3pt >';
	      			htmls +=		this.csReplyRegDate + '</span>';

	      			
		      		htmls += '</div>';
	      			htmls += '<div class="comment-text-sm" align="left">';
	      			htmls += 	'<span>' + this.csReplyContent;
	      			if(this.csReplyWriter == memId || memId == "admin"){
			            htmls += '<button style="margin-left: 10px" class="btn btn-outline-secondary btn-sm" style="magin-left:10px"><a class="link-secondary text-decoration-none" href="javascript:void(0)" onclick="fn_editReply(' + this.csReplyNum + ', \'' + this.csReplyWriter + '\', \'' + this.csReplyContent + '\' )">수정</a></button>';
			            htmls += '<button style="margin-left: 10px" class="btn btn-outline-danger btn-sm" style="magin-left:10px" ><a class="link-danger text-decoration-none" href="javascript:void(0)" onclick="fn_deleteReply(' + this.csReplyNum + ')" >삭제</a>';	                	 
			            };
		            htmls += '</span>';
	      			htmls += '</div>';
	      			htmls += '<div class="reply-section">';
	      			htmls += 	'<div class="d-flex flex-row align-items-center voting-icons">';
	      			htmls += 	'</div>';
	      			htmls += '</div>';
	      			htmls += '</div>';
	      			htmls += '<hr>';
	      		
	            	
//	                 htmls += '<div class="media text-muted pt-3" id="rid' + this.csReplyNum + '">';
//	                 htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
//	                 htmls += '<span class="d-block">';
//	                 htmls += '<strong class="text-white">' + this.csReplyWriter + '</strong>';
//	                 htmls += '<span class="text-white">' +"        "+ this.csReplyContent + '</span>';
//	                 htmls += '<span style="padding-left: 7px; font-size: 9pt">';
//	                 if(this.csReplyWriter == memId || memId == "admin"){
//	                 htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.csReplyNum + ', \'' + this.csReplyWriter + '\', \'' + this.csReplyContent + '\' )" style="padding-right:5px">수정</a>';
//	                 htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.csReplyNum + ')" >삭제</a>';	                	 
//	                 };
//	                 htmls += '</span>';
//	                 htmls += '</span>';
//	                 htmls += '</p>';
//	                 htmls += '</div>';
			});	//each end
		}
		$("#replyList").html(htmls);
	     
	    }	   // Ajax success end

	});	// Ajax end
};

</script>
<style type="text/css">
/*
 * Globals
 */

/* Links */
a,
a:focus,
a:hover {
  color: #fff;
}

/* Custom default button */
.btn-default,
.btn-default:hover,
.btn-default:focus {
  color: #333;
  text-shadow: none; /* Prevent inheritence from `body` */
  background-color: #fff;
  border: 1px solid #fff;
}


/*
 * Base structure
 */

html,
body {
  height: 100%;
  background-color: #fff;
}
body {
  color: #fff;
  text-align: center;
  text-shadow: 0 1px 3px rgba(0,0,0,.5);
  
  
  
}

/* Extra markup and styles for table-esque vertical and horizontal centering */
.site-wrapper {
  display: table;
  width: 100%;
  height: 600px;
  text-shadow: 0 .05rem .1rem rgba(0, 0, 0, .5);
  box-shadow: inset 0 0 50rem rgba(0, 0, 0, 10);
  background-image: url("https://images.unsplash.com/photo-1487730116645-74489c95b41b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y2FtcGluZ3xlbnwwfHwwfHw%3D&w=1000&q=80");
  background-size: 100%;
  background-color: #333;
  height: 100%;
  min-height: 100%;
}
.site-wrapper-inner {
  display: table-cell;
  vertical-align: top;
}
.cover-container {
  margin-right: auto;
  margin-left: auto;
}

/* Padding for spacing */
.inner {
  padding: 30px;
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
}


/*
 * Cover
 */

.cover {
  padding: 0 20px;
  
}
.cover .btn-lg {
  padding: 10px 20px;
  font-weight: bold;
}

/*
 * Affix and center
 */

@media (min-width: 768px) {
  /* Pull out the header and footer */
  .masthead {
    position: fixed;
    top: 0;
  }
  /* Start the vertical centering */
  .site-wrapper-inner {
    vertical-align: middle;
  }



.site-wrapper {
  background-image: url("https://media.istockphoto.com/photos/tourists-sitting-near-campfire-under-starry-sky-picture-id1213691432?k=20&m=1213691432&s=612x612&w=0&h=nKhvQ4QWfeKAFskB87yq0L9w2q8ezimm5Qqp-p4Spj4=");
}

.bdge {
  height: 21px;
  background-color: orange;
  color: #fff;
  font-size: 11px;
  padding: 8px;
  border-radius: 4px;
  line-height: 3px;
}

.comments {
  text-decoration: underline;
  text-underline-position: under;
  cursor: pointer;
}

.dot {
  height: 7px;
  width: 7px;
  margin-top: 3px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
}

.hit-voting:hover {
  color: blue;
}

.hit-voting {
  cursor: pointer;
}

hr {
    color: #123455;
}


#boardMD {
	display: none;
	

}

</style>

</head>
<body>
<div class="site-wrapper">
      <div class="site-wrapper-inner" style="text-shadow: none;">
        <div class="container" style="background-color: rgba(255, 255, 255, 0.85);" >
		<form method="post">
        <div class="inner cover">
		<div>
        <br>
  		<h3 align="left"><p class="bg-dark" style="font-style: italic; font-family: MV boli;">No. ${data.csNum}</p></h3>
		<br>
		<h4 align="left" style="color: black; margin-left: 10px; text-shadow: none; "  >
 		 ${data.csTitle}
 		 <small class="text-muted" style="padding-left: 10px">${data.csWriter}</small>
		</h4>
		<br>
		<!--<p class="font-weight-bold text-dark">${data.csTitle}</p>
		<p class="">${data.csWriter}</p>
		<label>조회수 : </label>${data.csViewCnt}<br> 여
		기 넣으면 cnt 초기화 되는것 해결하기-->
		<div class="form">
		<textarea class="form-control" id="textarea" rows="15" cols="90" name="content">${data.csContent}</textarea>
		<div align="right"><p class="text-secondary">작성일시 : ${data.csRegDate}</p></div>
		</div>
	</form>
	</div>


	<form role="form" action="modifyPage" method="post">
		<input type="hidden" name="csNum" value="${data.csNum }">
		<input type="hidden" name="page" value="${cri.page }">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	</form>
	
	
<div class="container" id="boardMD">
  <div class="d-flex justify-content-start">
  <div style="margin-right: 10px">
      <form action="csBoardUpdate" method="get">
		<input type="hidden" name="csTitle" value="${data.csTitle }">
		<input type="hidden" name="csContent" value="${data.csContent }">
		<input type="hidden" name="csNum" value="${data.csNum }">
		<input type="hidden" name="csWriter" value="${data.csWriter }">
		<input type="hidden" name="page" value="${cri.page }">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
		<button type="submit" class="btn btn btn-default">수정</button>
	  </form>
	  </div>
	  <div>  
		<button type="button" class="btn btn btn-danger" data-toggle="modal" data-target="#exampleModal"> 
			삭제
		</button>
		
    	<form id="boardDelte" name="boardDelete">
			<input type="hidden" name="csNum" value="${data.csNum }">
			<input type="hidden" name="page" value="${cri.page }">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
		</form>
		</div>
    </div> 
    </div>
    </div>
    <div style="margin-top: 20px">
      <button class="btn btn-dark">
			<a class="text-decoration-none" href="csBoardList?page=${cri.page }&perPageNum=${cri.perPageNum }&searchType=&keyword=">목록보기</a>
		</button>
 	 </div>

	<!-- 댓글jsp -->
				<div class="container mt-5 mb-5">
					<div class="d-flex justify-content-center row">
						<div class="d-flex flex-column col-md-11">
								<hr>
							<div
								class="d-flex flex-row align-items-center text-left comment-top p-2">
								<div class="profile-image">
								<h2><p class="text-dark" style="font-weight:bold; font-family: segoe Print;">Reply</p></h2>
									<!--<img src="resources/img/replylogo.png" width="100">  -->
								</div>
								<div class="d-flex flex-column ml-3"></div>
							</div>
							<form name="form" id="form" role="form" modelAttribute="csReplyVo" method="post">
							<input type ="hidden" id="bid"/>
							
							<div class="coment-bottom  p-2 px-4">
							<div class="col-2 d-flex align-items-center">
							<input type="text" class="form-control  mb-2" path="reg_id" id="reg_id" value="${member.memId }" readonly="readonly">
							</div>
								<div class="d-flex flex-row add-comment-section">
								<div class="col-11">
									<textarea rows="2" class="form-control" path="content" id="content" placeholder="댓글을 입력하세요"></textarea>
								</div>
								<div class="col-1 d-flex align-items-center" style="margin-left: 10px">
									<button class="btn btn-secondary" type="button" id="btnReplySave">작성</button>
								</div>
								</div>
							</form>
							<br>
								<div id="replyList"></div>
							</div>
						</div>
					</div>
				</div>

				<hr>
	<!-- Reply Form {s} -->

		<!--<div class="container" style="padding-top: 1px">
			<h4 align="left">댓글 작성</h4>
				<form name="form" id="form" role="form" modelAttribute="csReplyVo" method="post">
				<input type ="hidden" id="bid"/>
				<div class="row">
						<div class="col"><input path="reg_id" class="" id="reg_id" value="${member.memId }" readonly="readonly"></div>
						<div class="col"><textarea path="content" id="content" class="" cols="100" rows="3" placeholder="댓글을 입력해 주세요"></textarea></div>
					<div align="right" class="">
						<button type="button" class="btn btn btn-default" id="btnReplySave"> 저 장 </button>
				</div>
					</div>
				</form>
			</div>  -->	
			<!-- Reply Form {e} -->
		
			<!-- Reply List {s}-->
			<!--<div class="" style="padding-top: 10px">
				<h6 class="">Reply list</h6>
				<div id="replyList"></div>
			</div> -->
			
 <!-- 게시글 보기 전체 박스 -->
   </div>
        </div>
      </div>
    </div>
    </div>
    
<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="color: black; text-shadow: none;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">글 삭제 확인</h5>
				<!--	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span> 
					</button> -->
				</div>
				<div class="modal-body">정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" onclick="clickDel(boardDelete)">삭제하기</button>
					<button type="button" class="btn btn-secondary"	data-dismiss="modal">돌아가기</button>
				</div>
			</div>
		</div>
	</div>    
    
</body>
</html>