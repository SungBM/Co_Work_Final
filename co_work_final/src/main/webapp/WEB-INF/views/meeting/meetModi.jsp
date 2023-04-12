<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp" />
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<title>회의실 관리> 수정</title>
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
	$(document).ready(function() {
		var meetStatus = $("input[name=db_meet_status]").val();
		$("select[name=meet_status]").val(meetStatus).prop("selected", true);
	})
</script>
</head>

<body>
	<div class="main-content">
		<div class="page-content ">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="page-title-box d-sm-flex">
							<h3 class="mb-sm-0">회의실 관리> 수정</h3>
						</div>
					</div>
				</div>

				<form name="update" action="../admin/meetModiProcess" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
					<input type="hidden" name="meet_no"
						value="${mr.meet_no }">	

					<div class="row">
						<div class="col-3">
							<img class="card-img-top img-fluid" src="../upload${mr.meet_img }"
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
									<input type="text" class="form-control" name="meet_name"
										value="${mr.meet_name }">
								</div>
							</div>

							<div class="col-10 mt-5  align-items-center container-fluid">
								<label class="form-label" for="meet_max_people"><b>최대인원(숫자)</b></label>
								<div class="input-group" id="meet_max_people">
									<input type="text" class="form-control" name="meet_max_people"
										value="${mr.meet_max_people }">
								</div>
							</div>

							<div class="col-10 mt-5  align-items-center container-fluid">
								<label class="form-label" for="meet_info"><b>회의실 정보</b></label>
								<div class="input-group" id="meet_info">
									<input type="text" class="form-control" name="meet_info"
										value="${mr.meet_info }">


								</div>
							</div>

							<div class="col-10 mt-5  align-items-center container-fluid">
								<label class="form-label" for="user_email"><b>회의실 상태</b></label>
								<div class="input-group" id="user_email">
									<input type="hidden" name="db_meet_status"	value="${mr.meet_status }"> 
									<select class="form-select" name="meet_status">
										<option value="ST">사용 불가</option>
										<option value="CP">사용 가능</option>
									</select>
								</div>
							</div>

						</div>
						<div class="col-xl-12 mt-5 d-flex justify-content-center">
							<button type="submit"
								class="btn btn-primary waves-effect waves-light m-2">수정완료</button>
							<a type="button" class="btn btn-light waves-effect m-2" href="../admin/meetManage">뒤로가기</a>
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