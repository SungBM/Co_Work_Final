<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp" />
<head>
<title>내 프로필</title>
<style>
input[type=file] {
	display: none;
}

#showImage1>img {
	width: 200px;
	height: 200px;
}

#showImage2>img {
	width: 200px;
	height: 111px;
}

.form-control {
	border: none;
	border-bottom: 1px solid #CCC;
	border-radius: 0;
}

.form-control:focus {
	border-bottom: 2px solid blue;
}
</style>
</head>

<body>
	<div class="main-content">
		<div class="page-content ">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="page-title-box d-sm-flex">
							<h4 class="mb-sm-0 font-size-18">내 프로필> 수정</h4>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<div class="row d-flex justify-content-center mb-5">
							<div class="col-3">
								<div>
									<img class="card-img-top img-fluid"
										src="../../resources/static/assets/images/small/img-1.jpg"
										alt="Card image cap">
									<div class="d-flex justify-content-center mt-3">
										<a href="javascript: void(0);"
											class="btn btn-primary waves-effect waves-light">프로필 사진
											변경</a>
									</div>
								</div>
							</div>
							<div class="col-3">
								<div>
									<img class="card-img-top img-fluid"
										src="../../../resources/assets/images/small/img-1.jpg"
										alt="Card image cap">
									<div class="d-flex justify-content-center mt-3">
										<a href="javascript: void(0);"
											class="btn btn-primary waves-effect waves-light">명함 사진 변경</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-6">
						<div class="col-10  align-items-center container-fluid">
							<label class="form-label" for="name"><b>아이디</b></label>
							<div class="input-group" id="name">
								<input type="text" class="form-control" value="${memberinfo.user_id}">
							</div>
						</div>

						<div class="col-10 mt-5  align-items-center container-fluid">
							<label class="form-label" for="name"><b>부서</b></label>
							<div class="input-group" id="name">
								<input type="text" class="form-control"
									value="${memberinfo.dept}">
							</div>
						</div>

						<div class="col-10 mt-5  align-items-center container-fluid">
							<label class="form-label" for="name"><b>연락처</b></label>
							<div class="input-group" id="name">
								<input type="text" class="form-control"
									value="${memberinfo.tel}">
							</div>
						</div>

						<div class="col-10 mt-5  align-items-center container-fluid">
							<label class="form-label" for="name"><b>이메일</b></label>
							<div class="input-group" id="name">
								<input type="text" class="form-control"
									value="${memberinfo.tel}">
							</div>
						</div>

					</div>

					<div class="col-6" style="">
						<div class="col-10  align-items-center container-fluid">
							<label class="form-label" for="name"><b>이름</b></label>
							<div class="input-group" id="name">
								<input type="text" class="form-control" value="">
							</div>
						</div>

						<div class="col-10 mt-5  align-items-center container-fluid">
							<label class="form-label" for="name"><b>직급</b></label>
							<div class="input-group" id="name">
								<input type="text" class="form-control" value="">
							</div>
						</div>

						<div class="col-10 mt-5  align-items-center container-fluid">
							<label class="form-label" for="name"><b>팩스번호</b></label>
							<div class="input-group" id="name">
								<input type="text" class="form-control" value="">
							</div>
						</div>

						<div class="col-10 mt-5  align-items-center container-fluid">
							<label class="form-label" for="name"><b>입사일</b></label>
							<div class="input-group" id="name">
								<input type="text" class="form-control" value="">
							</div>
						</div>


					</div>

					<div class="col-xl-12 mt-5 d-flex justify-content-center">
						<button type="button"
							class="btn btn-outline-info waves-effect waves-light m-1">정보
							변경</button>
						<button type="button"
							class="btn btn-outline-info waves-effect waves-light m-1">비밀번호
							변경</button>

					</div>
				</div>

			</div>
		</div>
		<!-- End Page-content -->
	</div>
</body>
</html>