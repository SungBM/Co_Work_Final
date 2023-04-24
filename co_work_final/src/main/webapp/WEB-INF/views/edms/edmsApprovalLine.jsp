<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/mypage_js/mypage.js"></script>

<head>
    <title>결재상황 확인</title>
    <style>
 
    </style>
    <script>

    </script>
</head>

<body>
<div class="main-content">
 <div class="page-content">
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                    <h4 class="mb-sm-0 font-size-18">출차신청서ED2311</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">전자결재</a></li>
                            <li class="breadcrumb-item active">출차신청서ED2311</li>
                        </ol>
                    </div>

                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-lg-16">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title mb-4">현재 문서 의견 </h4>

                        <div class="table-responsive">
                            <table class="table align-middle">
                            <thead>
                            	<tr>
                            		<td> </td>
                            		<td>결재자</td>
                            		<td>직위</td>
                            		<td>부서</td>
                            		<td>등록일자</td>
                            		<td>반송의견</td>
                            	</tr>
                            </thead>
                                <tbody>
                                    <tr>
                                        <td style="width: 50px;"><img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-2.jpg"
                                                class="rounded-circle avatar-xs" alt=""></td>
                                        <td>
                                            <h5 class="font-size-14 m-0"><a href="" class="text-dark">Daniel Canales</a>
                                            </h5>
                                        </td>
                                        <td>
                                            <div>
                                                <a href="#"
                                                    class="badge bg-primary bg-soft text-primary font-size-11">대리</a>
                                            </div>
                                        </td>
                                        <td>개발1팀</td>
                                         <td>2023-04-17</td>
                                         <td class="text-success">승인</td>
                                    </tr>
                                    <tr>
                                        <td><img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-1.jpg" class="rounded-circle avatar-xs"
                                                alt=""></td>
                                        <td>
                                            <h5 class="font-size-14 m-0"><a href="" class="text-dark">Jennifer
                                                    Walker</a></h5>
                                        </td>
                                        <td>
                                            <div>
                                                <a href="#"
                                                    class="badge bg-primary bg-soft text-primary font-size-11">과장</a>
                                            </div>
                                        </td>
                                        <td>개발1팀</td>
                                         <td>2023-04-18</td>
                                          <td class="text-danger">반려</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="avatar-xs">
                                                <span
                                                    class="avatar-title rounded-circle bg-primary text-white font-size-16">
                                                    C
                                                </span>
                                            </div>
                                        </td>
                                        <td>
                                            <h5 class="font-size-14 m-0"><a href="" class="text-dark">Carl Mackay</a>
                                            </h5>
                                        </td>
                                        <td>
                                            <div>
                                                <a href="#"
                                                    class="badge bg-primary bg-soft text-primary font-size-11">차장</a>
                                            </div>
                                        </td>
                                        <td>개발1팀</td>
                                         <td></td>
                                         <td></td>
                                    </tr>
                                    <tr>
                                        <td><img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-4.jpg" class="rounded-circle avatar-xs"
                                                alt=""></td>
                                        <td>
                                            <h5 class="font-size-14 m-0"><a href="" class="text-dark">Janice Cole</a>
                                            </h5>
                                        </td>
                                        <td>
                                            <div>
                                                <a href="#"
                                                    class="badge bg-primary bg-soft text-primary font-size-11">부장</a>
                                            </div>
                                        </td>
                                        <td>개발1팀</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end col -->
        </div>
        <!-- end row -->

        <div class="row">
             <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex">
                            <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-2.jpg" alt="" class="avatar-sm me-4">

                            <div class="flex-grow-1 overflow-hidden">
                                <h5 class="text-truncate font-size-15">의견 내용</h5>
                                <p class="text-danger">반려됨</p>
                            </div>
                        </div>

                        <h5 class="font-size-15 mt-4" style="font-weight: bold">의견 내용 :</h5>

                        <p class="text-muted">차랑 번호가 맞지않음 차량번호 확인 요</p>

                        <div class="text-muted mt-4">
                            <p><i class="mdi mdi-chevron-right text-primary me-1"></i> 실제 차량 번호 재확인
                                necessary</p>
                            <p><i class="mdi mdi-chevron-right text-primary me-1"></i> 차량 번호 재기입후 재작성</p>
                        </div>

                        <div class="row task-dates">
                            <div class="col-sm-4 col-6">
                                <div class="mt-4">
                                    <h5 class="font-size-14"><i class="bx bx-calendar me-1 text-primary" style="font-weight: bold"></i> 등록일
                                    </h5>
                                    <p class="text-muted mb-0">2023-04-17</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end col -->
        </div>
        <!-- end row -->

    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->
</div>
</body>
<script src="${pageContext.request.contextPath }/resources//assets/libs/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources//assets/js/pages/form-mask.init.js"></script>
<script>

</script>
</html>