<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"></jsp:include>
<style>
label {
	text-align: center
}

input[type=file] {
	display: none;
}

#showImage1>img, #showImage2>img {
	width: 200px;
	height: 200px;
}
</style>
</head>

<body>
	<div class="page-content ">
		<div class="container-fluid">	
			<div class="row">
				<div class="col-8">
					<div class="page-title-box d-sm-flex align-items-center justify-content-between">

						<h4 class="mb-sm-0 font-size-18">프로필 </h4>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3">
					<form action="ImgupdateProcess.my" method="post" enctype="multipart/form-data" id="profile">
						<div class="card h-50">
							<label>
								<span id="showImage1">
									<c:if test='${empty memberinfo.USER_IMG }'>
										<c:set var='src' value='image/profile.png' />
									</c:if>
									<c:if test='${!empty memberinfo.USER_IMG }'>
										<c:set var='src' value='${memberinfo.USER_IMG }' />
										<input type="hidden" name="check" value="${memberinfo.USER_IMG }">
									</c:if>
									<img src="image/${src }" alt="profile">
								</span>
								<input class="form-control" type="file" name="user_img" id="formFile1">
								<input type="hidden" name="user_id" value="${memberinfo.USER_ID}">
								<input type="hidden" name="value" value="user_img">
							</label>
							<div class="col-md-4">
								<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
							</div>
						</div>
					</form>
					<form action="ImgupdateProcess.my" method="post" enctype="multipart/form-data" id="card">
						<div class="card h-50">
							<label>
								<span id="showImage2">
									<c:if test='${empty memberinfo.USER_CARD }'>
										<c:set var='src' value='image/card.jpg' />
									</c:if>
									<c:if test='${!empty memberinfo.USER_CARD }'>
										<c:set var='src' value='${"image/" }${memberinfo.USER_CARD }' />
										<input type="hidden" name="check" value="${memberinfo.USER_CARD }">
									</c:if>
									<img src="${src }" alt="card">
								</span>
								<input class="form-control" type="file" name="user_card" id="formFile2">
								<input type="hidden" name="user_id" value="${memberinfo.USER_ID}">
								<input type="hidden" name="value" value="user_card">
							</label>

							<div class="col-md-6">
								<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
							</div>
						</div>
					</form>
				</div>

				<div class="col-xl-6">
					<div class="card" style="height: 510px">
						<div class="card-body">
							<form action="updateProcess.my" method="post" id="up">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-3 col-form-label">이름</label>
									<div class="col-md-6">
										<input class="form-control" type="text" value="${memberinfo.USER_NAME }" name="user_name" readOnly>
										<input type="hidden" name="user_id" value="${memberinfo.USER_ID}">
										<input type="hidden" name="value" value="user_name">
									</div>
									<div class="col-md-3">
									</div>
								</div>
							</form>

							<form action="updateProcess.my" method="post" id="up">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-3 col-form-label">부서</label>
									<div class="col-md-6">
										<select class="form-select" name="user_dept" disabled required>

											<c:if test="${!empty list.dept_name }">
												<c:forEach var="list" items="${dept }" varStatus="i">
													<option value="${list.dept_name }">${list.dept_name}</option>
												</c:forEach>
											</c:if>

											<c:if test="${empty list.dept_name }">
												<option value="" selected style="display: none">부서를 선택해주세요.</option>
												<c:forEach var="list" items="${dept }" varStatus="i">
													<option value="${list.dept_name }">${list.dept_name}</option>
												</c:forEach>
											</c:if>

										</select>
										<input type="hidden" name="user_id" value="${memberinfo.USER_ID}">
										<input type="hidden" name="value" value="user_dept">
									</div>
									<div class="col-md-3">
									</div>
								</div>
							</form>

							<form action="updateProcess.my" method="post" id="up">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-3 col-form-label">직함</label>
									<div class="col-md-6">
										<select class="form-select" name="user_job" disabled>

											<c:if test="${!empty list.job_name }">
												<c:forEach var="list" items="${job }" varStatus="i">
													<option value="${list.job_name }">${list.job_name}</option>
												</c:forEach>
											</c:if>

											<c:if test="${empty list.job_name }">
												<option value="" selected style="display: none">직함을 선택해주세요.</option>
												<c:forEach var="list" items="${job }" varStatus="i">
													<option value="${list.job_name }">${list.job_name}</option>
												</c:forEach>
											</c:if>
											
										</select>
										<input type="hidden" name="user_id" value="${memberinfo.USER_ID}">
										<input type="hidden" name="value" value="user_job">
									</div>
									<div class="col-md-3">
									</div>
								</div>
							</form>

							<form action="updateProcess.my" method="post" id="up">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-3 col-form-label">이메일 주소</label>
									<div class="col-md-6">
										<input class="form-control" type="email" value="${memberinfo.USER_EMAIL }" name="user_email" readOnly>
										<input type="hidden" name="user_id" value="${memberinfo.USER_ID}">
										<input type="hidden" name="value" value="user_email">

									</div>
									<div class="col-md-3">
									</div>
								</div>
							</form>

							<form action="updateProcess.my" method="post" id="up">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-3 col-form-label">FAX</label>
									<div class="col-md-6">
										<input class="form-control" type="text" value="${memberinfo.USER_FAX}" placeholder="Enter fax" name="user_fax" readOnly>
										<input type="hidden" name="user_id" value="${memberinfo.USER_ID}">
										<input type="hidden" name="value" value="user_fax">

									</div>
									<div class="col-md-3">
									</div>
								</div>
							</form>
							<form action="updateProcess.my" method="post" id="up">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-3 col-form-label">연락처</label>
									<div class="col-md-6">
										<input class="form-control" type="text" value="${memberinfo.USER_PHONE }" placeholder="Enter phone" name="user_phone" readOnly>
										<input type="hidden" name="user_id" value="${memberinfo.USER_ID}">
										<input type="hidden" name="value" value="user_phone">
									</div>
									<div class="col-md-3">
									</div>
								</div>
							</form>

							<form action="updateProcess.my" method="post" id="up">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-3 col-form-label">자기소개</label>
									<div class="col-md-6">
										<textarea class="form-control" placeholder="Enter INTRO" name="user_intro" rows="4" style="resize: none;" readOnly>${memberinfo.USER_INTRO }</textarea>
										<input type="hidden" name="user_id" value="${memberinfo.USER_ID}">
										<input type="hidden" name="value" value="user_intro">
									</div>
									<div class="col-md-3">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<jsp:include page="../main/footer.jsp"></jsp:include>
  <script src="${pageContext.request.contextPath }/resources/assets/js/mypage_js/mypage.js"></script>
<script>
	$("select[name=user_dept]").val('${memberinfo.USER_DEPT}').prop("selected",	true);
	$("option[value='${memberinfo.USER_JOB }']").prop("selected", true);
</script>
</html>