<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../main/header.jsp" />
<title>회의실 예약</title>
<style>
#meetImg {
	width: 100%;
	height: 220px;
}

ul {
	list-style: none;
	padding-left: 0px;
}

strong {
	margin-right: 10px;
}

#revNot:has(.col-xl-3) {
	opacity: 0.3;
	color: red;
}

</style>
<script>
	$(document).ready(function() {

	})
</script>
</head>
<body>
	<div class="main-content">
		<div class="page-content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div
							class="page-title-box d-sm-flex align-items-center justify-content-center">
							<h4 class="mb-sm-0" style="font-size:24px!important;">회의실 예약</h4>
						</div>
					</div>
				</div>
				<div class="row">
					<c:forEach var="mr" items="${list}" varStatus="status">
						<c:if test="${mr.meet_status == 'CP' }">
							<div class="col-xl-3 col-sm-6">
						</c:if>
						<c:if test="${mr.meet_status == 'ST' }">
							<div class="col-xl-3 col-sm-6" style="opacity: 0.3;">
						</c:if>
						 <div class="card">
							<div class="card-body">
								<div class="mb-4">

									<img
										src="../upload${mr.meet_img}"
										id="meetImg" style="height: 250px !important">
								</div>
								<div class="meetTitle mb-3">
									<strong class="font-size-15">${mr.meet_name }</strong>
								</div>
								<div class="line">
									<ul>
										<li><strong><i class="mdi mdi-account-group" style="color:blue;"></i>
												최대인원</strong> <span>${mr.meet_max_people}</span></li>
										<li><strong><i class="fas fa-bullhorn" style="color:red;"></i> 정보사항</strong>
											<br> <span>${mr.meet_info }</span></li>
									</ul>
								</div>
							</div>

							<div class="card-footer bg-transparent border-top">
								<div class="contact-links d-flex font-size-20">
									<div class="flex-fill">
										<c:if test="${mr.meet_status == 'CP' }">
											<a href="../meet/rev/${mr.meet_no }"><i
												class="far fa-calendar-alt"></i> 예약하기</a>
										</c:if>
										<c:if test="${mr.meet_status == 'ST' }">
											<i class="far fa-calendar-times revNot"></i> 예약불가
										</c:if>
									</div>
								</div>
							</div>
						</div>
				</div>
				</c:forEach>
				<!-- 회의실 view -->
			</div>
		</div>
	</div>
	</div>
</body>
</html>