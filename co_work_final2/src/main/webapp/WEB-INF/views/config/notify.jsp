<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"></jsp:include>
<title>알림 설정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
input[type=file] {
	display: none;
}
</style>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="page-title-box d-sm-flex align-items-center justify-content-between">
						<h4 class="mb-sm-0 font-size-18">설정> 알림</h4>

					</div>
				</div>
			</div>
			<div class="col-8">
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-borderless mb-0">
								<tbody>
									<tr>
										<th rowspan="3" scope="row">전체푸시 알람</th>
										<td>새로운 글, 채팅 모든 알림을 수신합니다.</td>
										<td>
											<div class="form-check form-switch form-switch-md mb-3" dir="ltr">
												<input class="form-check-input" type="checkbox" id="SwitchCheckSizemd" checked>
												<label class="form-check-label" for="SwitchCheckSizemd"></label>
											</div>
										</td>
									</tr>
									<tr>
										<td>프로젝트 알림</td>
										<td>
											<div class="form-check form-switch form-switch-md mb-3" dir="ltr">
												<input class="form-check-input" type="checkbox" id="SwitchCheckSizemd">
												<label class="form-check-label" for="SwitchCheckSizemd"></label>
											</div>
										</td>
									</tr>
									<tr>
										<td>채팅 알림</td>
										<td>
											<div class="form-check form-switch form-switch-md mb-3" dir="ltr">
												<input class="form-check-input" type="checkbox" id="SwitchCheckSizemd">
												<label class="form-check-label" for="SwitchCheckSizemd"></label>
											</div>
										</td>
									</tr>
									<tr>
										<th rowspan="3" scope="row">방해 금지 모드</th>
										<td>선택한 시간, 요일에 모든 알림을 차단합니다.</td>
										<td>
											<div class="form-check form-switch form-switch-md mb-3" dir="ltr">
												<input class="form-check-input" type="checkbox" id="SwitchCheckSizemd">
												<label class="form-check-label" for="SwitchCheckSizemd"></label>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											요일
											<div class="btn-group me-2" role="group" aria-label="First group">
												<button type="button" class="btn btn-outline-secondary">일</button>
											</div>
											<div class="btn-group me-2" role="group" aria-label="First group">

												<button type="button" class="btn btn-outline-secondary">월</button>
											</div>
											<div class="btn-group me-2" role="group" aria-label="First group">

												<button type="button" class="btn btn-outline-secondary">화</button>
											</div>
											<div class="btn-group me-2" role="group" aria-label="First group">

												<button type="button" class="btn btn-outline-secondary">수</button>
											</div>
											<div class="btn-group me-2" role="group" aria-label="First group">

												<button type="button" class="btn btn-outline-secondary">목</button>
											</div>
											<div class="btn-group me-2" role="group" aria-label="First group">

												<button type="button" class="btn btn-outline-secondary">금</button>
											</div>
											<div class="btn-group me-2" role="group" aria-label="First group">

												<button type="button" class="btn btn-outline-secondary">토</button>
											</div>
										</td>
										<td></td>
									</tr>
									<tr>
										<td>채팅 알림</td>
										<td>
											<div class="square-switch">
												<input type="checkbox" id="square-switch1" switch="okk" checked="">
												<label for="square-switch1" data-on-label="On" data-off-label="Off"></label>
											</div>
										</td>
									</tr>
									<tr>
										<th rowspan="4" scope="row">E-MAIL 알림</th>
										<td>USER@EMAILADDRESS.COM</td>
										<td>
											<div class="form-check form-switch form-switch-md mb-3" dir="ltr">
												<input class="form-check-input" type="checkbox" id="SwitchCheckSizemd" checked>
												<label class="form-check-label" for="SwitchCheckSizemd"></label>
											</div>
										</td>
									</tr>
									<tr>
										<td>나를 맨션</td>
										<td>
											<div class="form-check form-switch form-switch-md mb-3" dir="ltr">
												<input class="form-check-input" type="checkbox" id="SwitchCheckSizemd">
												<label class="form-check-label" for="SwitchCheckSizemd"></label>
											</div>
										</td>
									</tr>
									<tr>
										<td>나에게 업무 배정</td>
										<td>
											<div class="form-check form-switch form-switch-md mb-3" dir="ltr">
												<input class="form-check-input" type="checkbox" id="SwitchCheckSizemd">
												<label class="form-check-label" for="SwitchCheckSizemd"></label>
											</div>
										</td>
									</tr>
									<tr>
										<td>요청한 업무 상태 변경</td>
										<td>
											<div class="form-check form-switch form-switch-md mb-3" dir="ltr">
												<input class="form-check-input" type="checkbox" id="SwitchCheckSizemd">
												<label class="form-check-label" for="SwitchCheckSizemd"></label>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
					<!-- end card body -->
				</div>
				<!-- end card -->
			</div>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
<!-- apexcharts -->
   <script src="${pageContext.request.contextPath }/resources/assets/libs/apexcharts/apexcharts.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/assets/js/pages/profile.init.js"></script>
</html>