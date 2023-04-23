<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/board_js/jquery-3.6.3.js"></script>
<link href="${pageContext.request.contextPath }/resources/assets/css/freeBoard_css/freeBoardView.css" rel="stylesheet" type="text/css" />
<style>

</style>
<script src="${pageContext.request.contextPath }/resources/assets/js/freeBoard_js/freeview.js"></script>
<script>
let result = "${result}";
if(result == 'passFail'){
	alert("비밀번호가 일치하지 않습니다.")
}
$(function(){
	$("form[action=freeDelete]").submit(function(){
		if($("#freeboard_pass").val() == ''){
			alert("비밀번호를 입력하세요");
			$("#freeboard_pass").focus();
			return false;
		}
	})
})
</script>
<title>상세페이지</title>

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
	        <div class="card">
				<div class="card-body">
					<div class="float-date">
							<span><c:out value="${freeboarddata.FREEBOARD_REG_DATE}"/></span>
					</div>
					<div class="input-group">
		               	<div id="autoSizingInputGroup" class="form-control"><c:out value="${freeboarddata.FREEBOARD_SUBJECT}"/></div>
						<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal" var="pinfo" />
							<input type="hidden" value="${pinfo.username}" name=USER_ID" >
							<input class="input-group-text" name="USER_ID"  id="user_id" value="co-work" type="text" readOnly>
	                	</sec:authorize> 
	                </div>		
					<div class="form-content">
						<textarea name="FREEBOARD_CONTENT" class="form-control" id="FREEBOARD_content" rows="20" readOnly>${freeboarddata.FREEBOARD_CONTENT}</textarea>
					</div>
					
					<div class="bottom-active" >
						<div class="file-value">
							<label class="form-control" style="height:40px" >
							<c:if test="${freeboarddata.FREEBOARD_RE_LEV==0 }">
								<!-- 파일 첨부한 경우 -->
								<tr>
								<c:if test="${!empty freeboarddata.FREEBOARD_FILE}">
									<a href="#" onclick="document.getElementById('downForm').submit(); return false;" style="color: black;" id="donwloadFile">
								        ${freeboarddata.FREEBOARD_ORIGINAL }
								        <img src="${pageContext.request.contextPath }/resources/assets/images/board/down.png" width="10px">
									</a>
									<form id="downForm" method="post" action="down" style="display:none;">
						  				<input type="hidden" value="${freeboarddata.FREEBOARD_FILE }" name="filename" >
						  				<input type="hidden" value="${freeboarddata.FREEBOARD_ORIGINAL }" name="original" >
						  				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										<img src="${pageContext.request.contextPath }/resources/assets/images/board/down.png" width="10px">
									</form>
								</c:if>
								
								<!-- 파일 첨부 안함 -->
								<c:if test="${empty freeboarddata.FREEBOARD_FILE}">
								</c:if>
							</tr>
							</c:if>
						</label>
						</div>
					</div>
				</div>
					<div class="card"> 
						<div class="card-body col text-center">
								<button class="btn btn-link waves-effect">댓글</button>
									<span id="count">${count }</span>
									
						<sec:authentication property="principal" var="pinfo" />  <!-- principal은 시큐리티가 가지고 있는 기술. principal로 아이디값을 불러올 수 있음-->
						<sec:authorize access="isAuthenticated()">
			 			<c:if test="${freeboarddata.USER_ID == pinfo.username || pinfo.username == pinfo.username}">
			 				<a href="freemodifyView?num=${freeboarddata.FREEBOARD_NUM }">
			 					<button class="btn btn-success waves-effect waves-light">수정</button>
			 				</a>
							<%--href의 주소를 #으로 설정합니다. --%>
							<a>	
								<button class="btn btn-danger waves-effect waves-light" data-bs-toggle="modal"
		 							data-bs-target="#freeMyModal">삭제</button>
							</a>
							</c:if>
							</sec:authorize>
							<a href="freeReplyView?num=${freeboarddata.FREEBOARD_NUM}">
								<button class="btn btn-info">답변</button>
							</a>
							<a href="freeBoardList">
								<button class="btn btn-light waves-effect">목록</button>
							</a>
						</div>
				  </div>
		</div> <!-- container-fluid -->
		
		<%-- modal 시작 --%>
		
		<div class="modal" id="freeMyModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<%-- Modal body --%>
					<div class="modal-body">
						<form name="freeDelete" action="freeDelete" method="post">
							<%-- http://localhost:8088/Board/BoardDetailAction.bo?num=22
								주소를 보면 num을 파라미터로 넘기고 있습니다.
								이 값을 가져와서 ${param.num}을 사용
								또는 ${boarddata.board_num}
							 --%>
							 <input type="hidden" name="num" value="${param.num }" id="freeboard_num">
							 <div class="form-group">
							 	<label for="pwd">비밀번호</label>
							 	<input type="password"
							 		   class="form-control" placeholder="Enter password"
							 		   name="FREEBOARD_PASS" id="freeboard_pass" >
							 </div>
							 <button type="submit" class="btn btn-danger">삭제</button>
							 <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
							 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
					</div>				
				</div>
			</div>
		</div>
		<%-- div class="model" id="myModal" end --%>
		
		<div id="comment">
			<button class="btn btn-light waves-effectt">총 50자까지 가능합니다.</button>
			<button id="write" class="btn btn-primary waves-effect waves-light">등록</button>
			<textarea rows=3 class="form-control" id="content" maxLength="50"></textarea>
			<table class="table table-striped">
				<thead>
					<tr><td>아이디</td><td>내용</td><td>날짜</td></tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
				<div id="message"></div>
		</div> <%-- comment-area end --%>
		
	</div>
</div>
</div>
<!-- End Page-content -->
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>