<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp" />
<head>
<title>회의실 등록</title>
<style>
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

.form-control:read-write:focus {
	border-bottom: 2px solid blue;
}
</style>
<script>
	
</script>
</head>

<body>
	<div class="main-content">
		<div class="page-content ">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="page-title-box d-sm-flex justify-content-center">
							<h3 class="mb-sm-0 font-size-24">회의실 관리> 등록</h3>
						</div>
					</div>
				</div>

				<form name="update" action="../admin/meetAddProcess" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">

					<div class="row">
						<div class="col-3">
							<img class="card-img-top img-fluid"
								style="width: 200px; height: 200px">
							<div class="d-flex justify-content-center mt-3 filebox"
								style="width: 200px;">
								<input class="form-control" type="file" id="imgupload"
									name="imgupload" accept=".jpg, .png">
							</div>
						</div>

						<div class="col-6">
							<div class="col-10 align-items-center container-fluid">
								<label class="form-label" for="meet_name"><b>회의실 이름</b></label>
								<div class="input-group" id="meet_name">
									<input type="text" class="form-control" name="meet_name">
								</div>
							</div>

							<div class="col-10 mt-5  align-items-center container-fluid">
								<label class="form-label" for="meet_max_people"><b>최대인원(숫자)</b></label>
								<div class="input-group" id="meet_max_people">
									<input type="text" class="form-control" name="meet_max_people">
								</div>
							</div>

							<div class="col-10 mt-5  align-items-center container-fluid">
								<label class="form-label" for="meet_info"><b>회의실 정보</b></label>
								<div class="input-group" id="meet_info">
									<input type="text" class="form-control" name="meet_info">


								</div>
							</div>

							<div class="col-10 mt-5  align-items-center container-fluid">
								<label class="form-label" for="user_email"><b>회의실 상태</b></label>
								<div class="input-group" id="user_email">
									<select class="form-select" name="meet_status">
										<option value="ST">사용 불가</option>
										<option value="CP">사용 가능</option>
									</select>
								</div>
							</div>

						</div>
						<div class="col-xl-12 mt-5 d-flex justify-content-center">
							<button type="submit"
								class="btn btn-primary waves-effect waves-light m-1">등록
							</button>
						</div>
					</div>
				</form>

			</div>
		</div>
		<!-- End Page-content -->
	</div>
</body>
<script
	src="../assets/libs/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<script src="../assets/js/pages/form-mask.init.js"></script>
<script>
	$(function() {

	})
</script>
</html>