<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../main/header.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
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
<div class="page-content">
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
					<h4 class="mb-sm-0 font-size-18">커뮤니티 > 공지사항</h4>
                </div>
            </div>
        </div>
        <!-- end page title -->
        <!-- view페이지 -->
		<div class="card">
			<div class="card-body">
				<div class="float-date">
						<span><c:out value="${noticedata.notice_reg_date}"/></span>
				</div>
				<div class="input-group">
	               	<div id="autoSizingInputGroup" class="form-control"><c:out value="${noticedata.notice_subject}"/></div>
					<input class="input-group-text" id="user_id" value="${noticedata.user_id}" type="text" readOnly>
                </div>			



				<div class="form-content">
					<textarea class="form-control" id="notice_content" rows="20">${noticedata.notice_content}</textarea>
				</div>
				
				<div class="bottom-active" >
					<div class="file-value">
						<label class="form-control" >
							<span id="filevalue"></span>
							<!-- 파일 첨부한 경우 -->
							<c:if test="${!empty noticedata.notice_file}">
								<a href="NoticeFileDown.bon?filename=${noticedata.notice_file}" target="_blank">
								${noticedata.notice_file}
								<img src="image/board/down.png" width="10px">
								</a>
							</c:if>
							<c:if test="${empty noticedata.notice_file}">
								<img src="image/board/down.png" width="10px">
							</c:if>
						</label>
					</div>
					<div class="button-admin">
						<c:if test="${id == 'HTA1'}">
							<%--href의 주소를 #으로 설정합니다. --%>
							<a onclick="return confirm('정말로 삭제하시겠습니까?')"
								href="NoticeDeleteAction.bon?num=${noticedata.notice_num}">	
								<button class="btn btn-danger">삭제</button>	
							</a>
							<a href="NoticeModifyView.bon?num=${noticedata.notice_num}">
								<button class="btn btn-info">수정</button>
							</a>
						</c:if>
					</div>
					<div class="button-user">
						<a href="NoticeList.bon">
							<button type=reset class="btn btn-secondary">목록</button>
			 			</a>
					</div>
				</div>
			</div>				
		</div>	    
	</div> 
</div><!-- container-fluid -->
<!-- End Page-content -->
<jsp:include page="../../main/footer.jsp"></jsp:include>
</body>
</html>