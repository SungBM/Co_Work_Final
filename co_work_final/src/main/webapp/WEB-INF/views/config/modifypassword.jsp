<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>
<html lang="en">
<jsp:include page="../main/header.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/mypage_js/password.js"></script>

<title>비밀번호 변경</title>
<style>
	.page-content{
		width:80%
	}
</style>
<script>
 
</script>
</head>
<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-center">
                        <h3 class="mb-sm-0 font-size-24">설정> 비밀번호 변경</h3>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <form action="passwordchangeProcess" method="POST">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <div class="row mb-4">
                                <label for="horizontal-password-input" class="col-sm-3 col-form-label">현재 비밀번호</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="horizontal-password-input"
                                           name="user_password">
                                </div>
                                <label for="horizontal-password-input" class="col-sm-3 col-form-label"></label>
                                <div class="col-sm-9" id="password">
                                </div>
                            </div>
                            <div class="row mb-4">
                                <label for="horizontal-password-input1" class="col-sm-3 col-form-label">새 비밀번호</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="horizontal-password-input1"
                                           name="user_password1">
                                </div>
                                <label for="horizontal-password-input" class="col-sm-3 col-form-label"></label>
                                <div class="col-sm-9" id="password1">
                                </div>
                            </div>
                            <div class="row mb-4">
                                <label for="horizontal-password-input2" class="col-sm-3 col-form-label">새 비밀번호
                                    확인</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="horizontal-password-input2"
                                           name="user_password2">
                                </div>
                                <label for="horizontal-password-input" class="col-sm-3 col-form-label"></label>
                                <div class="col-sm-9" id="password2">
                                </div>
                            </div>
                            <div class="row justify-content-end">
                                <div class="col-sm-9">
                                    <div>
                                        <button type="submit" class="btn btn-primary w-md" disabled>변경</button>
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
</div>
</body>
</html>