<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../main/header.jsp"></jsp:include>
<title>회사정보</title>
<style>
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
	<div class="page-content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="page-title-box d-sm-flex align-items-center justify-content-between">
						<h4 class="mb-sm-0 font-size-18">회사> 회사정보</h4>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-8">
					<div class="card">
						<div class="card-body">

							<c:if test="${!empty companyinfo.company_name }">
								<form action="companyupdateProcess.com" method="post">
									<div class="mb-3 row">
										<label for="example-text-input" class="col-md-2 col-form-label">회사명</label>
										<div class="col-md-8">
											<input class="form-control" type="text" value="${companyinfo.company_name }" name="company_name" readOnly>
											<input type="hidden" name="value" value="company_name">
											<input type="hidden" name="def" value="${companyinfo.company_name }">
										</div>
										<div class="col-md-2">
											<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
											<span></span>
											<input class='btn btn-warning waves-effect waves-light' type="reset" id="second" style="display: none" value="취소">
										</div>
									</div>
								</form>
							</c:if>
							<c:if test="${empty companyinfo.company_name }">
								<form action="companycreateProcess.com" method="post">
									<div class="mb-3 row">
										<label for="example-text-input" class="col-md-2 col-form-label">회사명</label>
										<div class="col-md-8">
											<input class="form-control" type="text" name="company_name" placeholder="회사명을 입력하세요.">
											<input type="hidden" name="value" value="company_name">
										</div>
										<div class="col-md-2">
											<button class="btn btn-success waves-effect waves-light" type="submit" name="createcompany">생성</button>
											<input class='btn btn-warning waves-effect waves-light' type="reset" id="second" style="display: none" value="취소">
										</div>
									</div>
								</form>
							</c:if>

							<form action="companyupdateProcess.com" method="post">
								<div class="mb-3 row">
									<label for="example-text-input" class="col-md-2 col-form-label">전용 URL</label>
									<div class="col-md-8">
										<input class="form-control" type="text" value="${companyinfo.company_url }" name="company_url" readOnly>
										<input type="hidden" name="value" value="company_url">
									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<span></span>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id="second" style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="companyimgupdateprocess.com" method="post" enctype="multipart/form-data">
								<div class="mb-2 row">
									<label for="example-text-input" class="col-md-2 col-form-label">로고 설정</label>
									<div class="col-md-8">
										<label>
											<span id="showImage1">
												<c:set var='src' value='${"image/" }${companyinfo.company_logo }' />
												<input type="hidden" name="check" value=${companyinfo.company_logo }>
												<img src="${src }" alt="company_logo" style="width: 312px; height:100px;">
											</span>
											<input class="form-control" type="file" value="${companyinfo.company_logo }" name="company_logo" id="formFile1">
											<input type="hidden" name="company_name" value=${companyinfo.company_name }>
											<input type="hidden" name="value" value="company_logo">
										</label>
									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<span></span>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id="second" style="display: none" value="취소">
									</div>
								</div>
							</form>
							<div class="row">
								<div class="col-2">
								</div>
								<div class="col-md-6">권장크기 : 300px x 100px</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- end row -->

			<!-- list1 -->
			<div class="row">
				<div class="col-xl-4">
					<div class="card">
						<div class="card-body">
							<div class="input-group hstack gap-3">
								<h4 class="mb-sm-0 font-size-18">부서</h4>
								<span class="input-group-btn input-group-append"></span>
								<button class="btn btn-primary bootstrap-touchspin-up bx bx-add-to-queue" type="button">+</button>

								<form action="DeptJobCreateProcess.com" method="post" class="row row-cols-lg-auto" style="display: none" name="addform">
									<div>
										<input class="form-control" type="text" placeholder="부서를 입력해주세요." name="dept_name" style="width: 165px">
										<input type="hidden" name="company_name" value="${companyinfo.company_name}">
										<input type="hidden" name="value" value="dept_name">
									</div>
									<div>
										<span>
											<button type="submit" class="btn btn-primary">추가</button>
											<input class="btn btn-warning waves-effect waves-light" type="reset" id="comsecond" value="취소">
										</span>
									</div>
								</form>
							</div>
							<br>
							<c:forEach var="m" items="${dept }">
								<form action="deptJobUpdateProcess.com" method="post" class="col-lg-12" name="addform">
									<div class="mb-3 row">
										<div class="col-md-7">
											<input class="form-control" type="text" value="${m.dept_name }" name="dept_name" readOnly>
											<input type="hidden" name="value" value="dept_name">
											<input type="hidden" name="def" value="${m.dept_name }">
										</div>
										<div class="col-md-5">
											<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
											<button class="btn btn-danger waves-effect waves-light" type="submit" id="del" name="del">삭제</button>
											<input class="btn btn-warning waves-effect waves-light" type="reset" id="second" style="display: none" value="취소">
										</div>
									</div>
								</form>
							</c:forEach>
						</div>
					</div>
				</div>

				<!-- list 2 -->
				<div class="col-xl-4">
					<div class="card">
						<div class="card-body">
							<div class="input-group hstack gap-3">
								<h4 class="mb-sm-0 font-size-18">직함</h4>
								<span class="input-group-btn input-group-append"></span>
								<button class="btn btn-primary bootstrap-touchspin-up bx bx-add-to-queue" type="button">+</button>
								<form action="DeptJobCreateProcess.com" method="post" class="row row-cols-lg-auto" style="display: none" name="addform">
									<div>
										<input class="form-control" type="text" placeholder="직함을 입력해주세요." name="job_name" style="width: 165px">
										<input type="hidden" name="company_name" value="${companyinfo.company_name}">
										<input type="hidden" name="value" value="job_name">
									</div>
									<div>
										<span>
											<button type="submit" class="btn btn-primary">추가</button>
											<input class="btn btn-warning waves-effect waves-light" type="reset" id="comsecond" value="취소">

										</span>
									</div>
								</form>
							</div>
							<br>
							<c:forEach var="m" items="${job }">
								<form action="deptJobUpdateProcess.com" method="post">
									<div class="mb-3 row">
										<div class="col-md-7">
											<input class="form-control" type="text" value="${m.job_name }" name="job_name" readOnly>
											<input type="hidden" name="value" value="job_name">
											<input type="hidden" name="def" value="${m.job_name }">
										</div>
										<div class="col-md-5">
											<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
											<button class="btn btn-danger waves-effect waves-light" type="submit" id="del" name="del">삭제</button>
											<input class="btn btn-warning waves-effect waves-light" type="reset" id="second" style="display: none" value="취소">
										</div>
									</div>
								</form>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!-- container-fluid -->
		</div>
		<!-- End Page-content -->
	</div>
	<!-- end main content-->
</body>

<jsp:include page="../../main/footer.jsp"></jsp:include>
   <script src="${pageContext.request.contextPath }/resources/assets/js/admin_js/company.js"></script>
</html>