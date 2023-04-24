<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/board_js/jquery-3.6.3.js"></script>
<link href="${pageContext.request.contextPath }/resources/assets/css/freeBoard_css/freeModify.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/resources/assets/js/freeBoard_js/freeModify.js"></script>
<title>Insert title here</title>
<!-- <script>
if('${result}'=='passFail'){
	alert("비밀번호가 다릅니다.")
}
</script> -->
</head>
<body>
<body>
	<!-- 게시판 수정 -->
<div class="main-content">
	<div class="page-content">
	    <div class="container-fluid">
        	<!-- start page title -->
			<form action="freemodifyAction" method="post" name="freemodifyform" enctype="multipart/form-data">
				<input type="hidden" name="FREEBOARD_NUM" value="${freeboarddata.FREEBOARD_NUM}">
				<input type="hidden" name="FREEBOARD_FILE" value="${freeboarddata.FREEBOARD_FILE}">
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
										<span><c:out value="${freeboarddata.FREEBOARD_REG_DATE}"/></span>
								</div>
								<div class="input-group">
									<input name="FREEBOARD_SUBJECT" id="freeboard_subject" type="text"
											maxlength="100" class="form-control" value="${freeboarddata.FREEBOARD_SUBJECT}">
									<input style="width:80px" class="input-group-text" type="text"
											id="user_id" value="${freeboarddata.USER_ID}" readOnly>
								</div>
								<div class="form-content">
									<textarea name="FREEBOARD_CONTENT" id="freeboard_content" rows="20"
											class="form-control">${freeboarddata.FREEBOARD_CONTENT}</textarea>		
								</div>
								<div class="bottom-active" >
									<c:if test="${freeboarddata.FREEBOARD_RE_LEV==0}">
										<div class="file-value">
										<%-- 원문글인 경우에만 파일 첨부 수정 가능합니다. --%>
											<div class="form-control">
												<img src="${pageContext.request.contextPath }/resources/assets/images/board/remove.png" width="10px" class="remove">
												<span id="filevalue">${freeboarddata.FREEBOARD_ORIGINAL}</span>
												<label class="upfile-button">
													<input type="file" id="upfile" name="uploadfile">
													<img src="${pageContext.request.contextPath }/resources/assets/images/board/attach.png" width="20px">
												</label>
											</div>
										</div>					
									</c:if>	
									<div class="form-group">
	  									<label for="freeboard_pass">비밀번호</label>   <!-- 라벨for 이름과 id가 똑같아야됨-->
								  		<input name="FREEBOARD_PASS" id="freeboard_pass" type="password" size="10" maxlength="30"
								  			   class="form-control" placeholder="Enter board_pass">
								  	</div>
								</div>
								<div class="form-group button float-right" >
									<div>
									<button type=reset class="btn btn-danger" onClick="history.go(-1)">취소</button>
									<button type=submit class="btn btn-primary">완료</button>
									</div>
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