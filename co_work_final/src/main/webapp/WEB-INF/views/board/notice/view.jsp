<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../main/header.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/board_js/notice/view.js"></script>
<style>

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
.button-admin{
	float: right;	
}
.button-user{
	float: left;	
}

label {
	text-align: right
}



</style>
<head>
<title>공지사항 작성</title>
</head>
<body>
<div class="main-content">
	<div class="page-content">
	    <div class="container-fluid">
	
	        <!-- start page title -->
	        <div class="row">
	            <div class="col-12">
	                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
						<h4 class="mb-sm-0 font-size-18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상세페이지</h4>
	                </div>
	            </div>
	        </div>
	        <!-- end page title -->
	        <!-- view페이지 -->
			<div class="card">
				<div class="card-body">
					<div class="float-date">
							<span><c:out value="${noticedata.NOTICE_REG_DATE}"/></span>
					</div>
					<div class="input-group">
		               	<div id="autoSizingInputGroup" class="form-control"><c:out value="${noticedata.NOTICE_SUBJECT}"/></div>
						<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal" var="pinfo" />
							<input class="input-group-text" name="USER_ID"  id="user_id" value="${pinfo.username}" type="text" readOnly>
	                	</sec:authorize> 
	                </div>		
					<div class="form-content">
						<textarea name="NOTICE_CONTENT" class="form-control" id="notice_content" rows="20" readOnly>${noticedata.NOTICE_CONTENT}</textarea>
					</div>
					
					<div class="bottom-active" >
						<div class="file-value">
							<label class="form-control" style="height:40px" >
								<!-- 파일 첨부한 경우 -->
								<c:if test="${!empty noticedata.NOTICE_FILE}">
									<a href="#" onclick="document.getElementById('downForm').submit(); return false;">
								        ${noticedata.NOTICE_ORIGINAL }
								        <img src="${pageContext.request.contextPath }/resources/assets/images/board/down.png" width="10px">
									</a>
									<form id="downForm" method="post" action="down" style="display:none;">
						  				<input type="hidden" value="${noticedata.NOTICE_FILE }" name="filename" >
						  				<input type="hidden" value="${noticedata.NOTICE_ORIGINAL }" name="original" >
						  				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										<img src="${pageContext.request.contextPath }/resources/assets/images/board/down.png" width="10px">
									</form>
								</c:if>
								
								<!-- 파일 첨부 안함 -->
								<c:if test="${empty noticedata.NOTICE_FILE}">
								</c:if>
							</label>
						</div>
						<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal" var="pinfo" />  <!-- principal은 시큐리티가 가지고 있는 기술. principal로 아이디값을 불러올 수 있음-->
			 			<c:if test="${noticedata.USER_ID == pinfo.username || pinfo.username == 'admin1'}">
							<%--href의 주소를 #으로 설정합니다. --%>
							<div class="button-admin">
							<a href="#">	
								<button class="btn btn-danger" onclick="confirmDelete()" data-toggle="modal"
		 							data-target="#myModal">삭제</button>
							</a>
							<a href="modifyView?num=${noticedata.NOTICE_NUM}">
								<button class="btn btn-info">수정</button>
							</a>
							</div>
						</c:if>
						</sec:authorize> 
						<div class="button-user">
							<a href="noticeList">
								<button type=reset class="btn btn-secondary">목록</button>
				 			</a>
						</div>
					</div>
				</div>			
			</div>	    
		</div> <!-- container-fluid -->
		<%-- modal 시작 --%>
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<%-- Modal body --%>
					<div class="modal-body">
						<form name="deleteForm" action="delete" method="post">
							<%-- http://localhost:8088/Board/BoardDetailAction.bo?num=22
								주소를 보면 num을 파라미터로 넘기고 있습니다.
								이 값을 가져와서 ${param.num}을 사용
								또는 ${boarddata.board_num}
							 --%>
							 <input type="hidden" name="num" value="${param.num }" id="notice_num">
							 <button type="submit" class="btn btn-primary">전송</button>
							 <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
							 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
					</div>				
				</div>
			</div>
		</div>
		<%-- div class="model" id="myModal" end --%>
		
	</div>
</div>
<!-- End Page-content -->
<jsp:include page="../../main/footer.jsp"></jsp:include>
</body>
</html>