<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../main/header.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/board_js/notice/modify.js"></script>
<style>
#upfile{display:none}

textarea{
	resize: none;
}
.container-fluid{
	width:80%;
	margin: 0 auto;
}
.float-date{
	float: right;
}
#user_id{
	width:80px;
	text-align: center;
}
.form-content{
	margin-top: 0.1em;
}
.bottom-active{
	margin-top: 0.1em;
}
.button{
	float:right;
}
.file-value {
	height:50px;
	text-align: right
}

</style>
<head>
<title>게시판 수정</title>
</head>
<body>
	<!-- 게시판 수정 -->
	<div class="page-content">
	    <div class="container-fluid">
        	<!-- start page title -->
			<form action="NoticeModifyAction.bon" method="post" name="modifyform" enctype="multipart/form-data">
				<input type="hidden" name="notice_num" value="${noticedata.notice_num}">
		        <div class="row">
		            <div class="col-12">
		                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
							<h4 class="mb-sm-0 font-size-18">커뮤니티 > 공지사항</h4>
		                </div>
		            </div>
		        </div>
		        <!-- end page title -->
		        <div class="row">
		            <div class="col-lg-12">
		                <div class="card">
		                    <div class="card-body">
								<div class="float-date">
										<span><c:out value="${noticedata.notice_reg_date}"/></span>
								</div>
								<div class="input-group">
									<input name="notice_subject" id="autoSizingInputGroup" type="text"
											maxlength="100" class="form-control" value="${noticedata.notice_subject}">
									<input style="width:80px" class="input-group-text" type="text"
											id="user_id" value="${noticedata.user_id}" readOnly>
								</div>
								<div class="form-content">
									<textarea name="notice_content" id="notice_content" rows="20"
											class="form-control">${noticedata.notice_content}</textarea>		
								</div>
								<div class="bottom-active" >
									<c:if test="${noticedata.notice_re_lev==0}">
										<div class="file-value">
										<%-- 원문글인 경우에만 파일 첨부 수정 가능합니다. --%>
											<div class="form-control">
												<img src="image/board/remove.png" width="10px" class="remove">
												<span id="filevalue">${noticedata.notice_file}</span>
												<label class="upfile-button">
													<input type="file" id="upfile" name="notice_file">
													<img src="image/board/attach.png" width="20px">
												</label>
											</div>
										</div>					
									</c:if>	
								</div>
								<c:if test="${id == 'HTA1'}">
									<div class="button">
										<button type=reset class="btn btn-danger" onClick="history.go(-1)">취소</button>
										<button type=submit class="btn btn-info">완료</button>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div><!-- container-fluid --> 
	</div> <!-- end row -->

</body>
</html>