<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../main/header.jsp"/>
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
<div class="main-content">
	<div class="page-content">
	    <div class="container-fluid">
        	<!-- start page title -->
			<form action="modifyAction" method="post" name="modifyform" enctype="multipart/form-data">
				<input type="hidden" name="NOTICE_NUM" value="${noticedata.NOTICE_NUM}">
				<input type="hidden" name="NOTICE_FILE" value="${noticedata.NOTICE_FILE}">
		        <div class="row">
		            <div class="col-12">
		                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
							<h4 class="mb-sm-0 font-size-18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수정페이지</h4>
		                </div>
		            </div>
		        </div>
		        <!-- end page title -->
		        <div class="row">
		            <div class="col-lg-12">
		                <div class="card">
		                    <div class="card-body">
								<div class="float-date">
										<span><c:out value="${noticedata.NOTICE_REG_DATE}"/></span>
								</div>
								<div class="input-group">
									<input name="NOTICE_SUBJECT" id="autoSizingInputGroup" type="text"
											maxlength="100" class="form-control" value="${noticedata.NOTICE_SUBJECT}">
									<input style="width:80px" class="input-group-text" type="text"
											id="user_id" value="${noticedata.USER_ID}" readOnly>
								</div>
								<div class="form-content">
									<textarea name="NOTICE_CONTENT" id="notice_content" rows="20"
											class="form-control">${noticedata.NOTICE_CONTENT}</textarea>		
								</div>
								<div class="bottom-active" >
									<c:if test="${noticedata.NOTICE_RE_LEV==0}">
										<div class="file-value">
										<%-- 원문글인 경우에만 파일 첨부 수정 가능합니다. --%>
											<div class="form-control">
												<img src="${pageContext.request.contextPath }/resources/assets/images/board/remove.png" width="10px" class="remove">
												<span id="filevalue">${noticedata.NOTICE_ORIGINAL}</span>
												<label class="upfile-button">
													<input type="file" id="upfile" name="uploadfile">
													<img src="${pageContext.request.contextPath }/resources/assets/images/board/attach.png" width="20px">
												</label>
											</div>
										</div>					
									</c:if>	
								</div>
								<div class="button">
									<button type=reset class="btn btn-danger" onClick="history.go(-1)">취소</button>
									<button type=submit class="btn btn-info">완료</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div><!-- container-fluid --> 
	</div> <!-- end row -->
</div>

</body>
</html>