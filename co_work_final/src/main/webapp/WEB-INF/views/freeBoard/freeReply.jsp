<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/board_js/jquery-3.6.3.js"></script>
<link href="${pageContext.request.contextPath }/resources/assets/css/freeBoard_css/freeReply.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/resources/assets/js/freeBoard_js/freeReply.js"></script>

<title>Insert title here</title>
</head>
<body>
<div class="main-content">
	<div class="page-content">
	    <div class="container-fluid">
			<form action="freereplyAction" method="post" enctype="multipart/form-data" name="freeboardform">	
				<!-- start page title -->
				<div class="row">
				    <div class="col-12">
				        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
							<h4 class="mb-sm-0 font-size-18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;답변글</h4>
				        </div>
				    </div>
				</div>
		        <!-- end page title -->
		        <div class="row">
		            <div class="col-lg-12">
		                <div class="card">
		                    <div class="card-body">
<div class="container">
 	 <!-- replay는 ref, lev, seq를 꼭 챙겨야함 -->
  	<input type="hidden" name="FREEBOARD_RE_REF" value="${freeboarddata.FREEBOARD_RE_REF }">
  	<input type="hidden" name="FREEBOARD_RE_LEV" value="${freeboarddata.FREEBOARD_RE_LEV }">
  	<input type="hidden" name="FREEBOARD_RE_SEQ" value="${freeboarddata.FREEBOARD_RE_SEQ }">
  	<div class="form-group">
  		<label for="freeboard_name">글쓴이</label>   <!-- 라벨for 이름과 id가 똑같아야됨-->
  		<input name="FREEBOARD_NAME" id="freeboard_name" type="text" class="form-control" value="co-work" readOnly>
  	</div>
  	<div class="form-group">
	  	<label for="freeboard_subject">제목</label>   <!-- 라벨for 이름과 id가 똑같아야됨-->
  		<textarea name="FREEBOARD_SUBJECT" id="freeboard_subject" rows="1"
  			   class="form-control" maxlength="100">Re: ${boarddata.FREEBOARD_SUBJECT }</textarea>
  	</div>
  		<div class="form-group">
	  	<label for="freeboard_content">내용</label>   <!-- 라벨for 이름과 id가 똑같아야됨-->
  		<textarea name="FREEBOARD_CONTENT" id="freeboard_content"
  				  rows="10" class="form-control"></textarea>
  	</div>
  	<div class="form-group">
	  	<label for="freeboard_pass">비밀번호</label>   <!-- 라벨for 이름과 id가 똑같아야됨-->
  		<input name="FREEBOARD_PASS" id="freeboard_pass" type="password" 
  			   class="form-control">
  	</div>
  	
  	<div class="form-group button float-right">
  		<input type=submit class="btn btn-primary" value="등록">
  		<input type=button class="btn btn-danger" value="취소" onClick="history.go(-1)">
  	</div>
  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  	</div>
  	</div>
  	</div>
  	</div>
  	</div>
 </form>
 </div>
 </div>
 </div>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>