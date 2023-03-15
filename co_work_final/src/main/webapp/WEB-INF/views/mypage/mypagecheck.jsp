<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"></jsp:include>
<title>회원정보수정</title>
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
						<h4 class="mb-sm-0 font-size-18">내 프로필> 수정</h4>

					</div>
				</div>
			</div>
			<div class="col-8">
				<div class="card">
					<div class="card-body">
						<form method="POST" id="mypage" action="mypage.my">
							<div class="row mb-4">
								<label for="horizontal-firstname-input" class="col-sm-3 col-form-label">현재 비밀번호</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" id="horizontal-password-input" name="user_password">
									<input type="hidden" name="user_id" value="${memberinfo.USER_ID}">
								</div>
							</div>
							<div class="row justify-content-end">
								<div class="col-sm-9">
									<div>
										<input type="submit" class="btn btn-primary w-md" id="mypageinfo" value="변경">
										<button type="reset" class="btn btn-secondary w-md">취소</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- end card body -->
				</div>
				<!-- end card -->
			</div>
		</div>
	</div>
</body>

<!-- apexcharts -->

<jsp:include page="../main/footer.jsp"></jsp:include>
<script>
	
</script>
</html>