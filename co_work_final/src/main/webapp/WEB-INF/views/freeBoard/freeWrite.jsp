<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/board_js/jquery-3.6.3.js"></script>
<link href="${pageContext.request.contextPath }/resources/assets/css/freeBoard_css/freewrite.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/resources/assets/js/freeBoard_js/freeWrite.js"></script>

<title>게시글 작성</title>
</head>
<body>
<div class="main-content">
	<div class="page-content">
	    <div class="container-fluid">
			<form action="add" method="post" enctype="multipart/form-data" name="freeboardform">	
				<!-- start page title -->
				<div class="row">
				    <div class="col-12">
				        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
							<h4 class="mb-sm-0 font-size-18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자유게시판</h4>
				        </div>
				    </div>
				</div>
		        <!-- end page title -->
		        <div class="row">
		            <div class="col-lg-12">
		                <div class="card">
		                    <div class="card-body">
		                    	<div class="input-group">
		                    		
									<div class="form-group">
									<input name="FREEBOARD_PASS" id="freeboard_pass" type="password" maxlength="30"
											 class="form-control" placeholder="비밀번호 입력">
									</div>
		                    		<input name="FREEBOARD_SUBJECT" id="freeboard_subject" type="text" maxlength="100"
											 class="form-control" placeholder="제목 입력">
											 
									<sec:authorize access="isAuthenticated()">
									<sec:authentication property="principal" var="pinfo" />
										<input class="input-group-text" id="user_id" value="co-work" type="text" readOnly>
	<!-- 내가쓴 글 찾기 위해 숨김 -->			<input type="hidden" name="FREEBOARD_NAME" value="${pinfo.username }">
										
									</sec:authorize>  
	                         	</div>
								<div class="form-content">
									<textarea name="FREEBOARD_CONTENT" id="freeboard_content"
												 rows="20" class="form-control"
												 placeholder="내용을 입력하세요"></textarea>
								</div>
								<div class="bottom-active" >
									<div class="file-value">
										<label class="form-control" >
										<span id="filevalue"></span>
											<input type="file" id="upfile" name="uploadfile">
											<img src="${pageContext.request.contextPath }/resources/assets/images/board/attach.png">
										</label>
									</div>
									<div class="button">
										<button type=reset class="btn btn-danger" onClick="history.go(-1)">취소</button>
										<button type=submit class="btn btn-primary">등록</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div> <!-- end row -->
	</div> <!-- container-fluid -->
</div>
<!-- End Page-content -->
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>