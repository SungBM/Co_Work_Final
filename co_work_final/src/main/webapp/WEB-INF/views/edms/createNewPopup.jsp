<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico">
    <link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" id="bootstrap-style"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath }/resources/assets/css/app.min.css" id="app-style" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.min.css"
          rel="stylesheet" type="text/css">
          <link href="${pageContext.request.contextPath }/resources/assets/css/project_Css/project.css" rel="stylesheet" type="text/css" />
    <meta name="_csrf" content="${_csrf.token }">
    <meta name="_csrf_header" content="${_csrf.headerName}">
<title>Insert title here</title>
</head>
<body>
 <div class="card-body">

                            <div class="d-flex flex-column h-100">
                                <div class="mb-4">
                                    <div class="mb-3">
                                        <div class="dropdown">
                                            <button class="btn btn-light dropdown-toggle w-100" type="button"
                                                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="bx bxs-folder-open text-success" style="font-size: 15px;"></i> 
                                                <font style="font-weight: bold">파일 양식을 선택하세요</font>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#"><i class="bx bx-folder me-1"></i>
                                                    Folder</a>
                                                <a class="dropdown-item" href="#"><i class="bx bx-file me-1"></i>
                                                    File</a>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="list-unstyled categories-list">
                                        <li>
                                            <div class="custom-accordion">
                                                <a class="text-body fw-medium py-1 d-flex align-items-center"
                                                    data-bs-toggle="collapse" href="#categories-collapse" role="button"
                                                    aria-expanded="false" aria-controls="categories-collapse">
                                                    <i class="mdi mdi-folder font-size-16 text-warning me-2"></i> 즐겨찾기
                                                    <i class="mdi mdi-chevron-up accor-down-icon ms-auto"></i>
                                                </a>
                                                <div class="collapse" id="categories-collapse">
                                                    <div class="card border-0 shadow-none ps-2 mb-0">
                                                        <ul class="list-unstyled mb-0">
                                                            <li><a href="${pageContext.request.contextPath }/edms/edmsApprovalLine" class="d-flex align-items-center" id="moveBsForm">
                                                            <i class="bx bxs-file font-size-16 align-middle text-primary me-2"></i>
                                                            <span class="me-auto">출장 신청서</span><i
                                                                        class="mdi mdi-pin ms-auto"></i></a></li>
                                                            <li><a href="#" class="d-flex align-items-center">
                                                            <i class="bx bxs-file font-size-16 align-middle text-primary me-2"></i>
                                                            <span class="me-auto">휴가 신청서</span></a></li>
                                                            <li><a href="#" class="d-flex align-items-center">
                                                             <i class="bx bxs-file font-size-16 align-middle text-primary me-2"></i>
                                                            <span class="me-auto">연장 근로 결재서</span></a></li>
                                                            <li><a href="#" class="d-flex align-items-center">
                                                            <i class="bx bxs-file font-size-16 align-middle text-primary me-2"></i>
                                                            <span class="me-auto">경과 보고서</span></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="javascript: void(0);" class="text-body d-flex align-items-center">
                                                 <i class="mdi mdi-folder font-size-16 text-warning me-2"></i> <span
                                                    class="me-auto">인사자료함</span>
                                                    <i class="mdi mdi-chevron-up accor-down-icon ms-auto"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript: void(0);" class="text-body d-flex align-items-center">
                                                  <i class="mdi mdi-folder font-size-16 text-warning me-2"></i> <span
                                                    class="me-auto">비용신청함</span>
                                                    <i class="mdi mdi-chevron-up accor-down-icon ms-auto"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript: void(0);" class="text-body d-flex align-items-center">
                                                 <i class="mdi mdi-folder font-size-16 text-warning me-2"></i> <span
                                                    class="me-auto">공용문서함</span> 
                                                    <i class="mdi mdi-chevron-up accor-down-icon ms-auto"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript: void(0);" class="text-body d-flex align-items-center">
                                                 <i class="mdi mdi-folder font-size-16 text-warning me-2"></i><span
                                                    class="me-auto">개인문서함</span>
                                                    <i class="mdi mdi-chevron-up accor-down-icon ms-auto"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript: void(0);" class="text-body d-flex align-items-center">
                                                <i class="mdi mdi-trash-can text-danger font-size-16 me-2"></i> <span
                                                    class="me-auto">휴지통</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript: void(0);" class="text-body d-flex align-items-center">
                                                <i class="mdi mdi-cog text-muted font-size-16 me-2"></i> <span
                                                    class="me-auto">Setting</span><span
                                                    class="badge bg-success rounded-pill ms-2">01</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>

                                <div class="mt-auto">
                                    <div class="alert alert-success alert-dismissible fade show px-3 mb-0" role="alert">
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                            aria-label="Close"></button>
                                        <div class="mb-3">
                                            <i class="bx bxs-folder-open h1 text-success"></i>
                                        </div>

                                        <div>
                                            <h5 class="text-success">Upgrade Features</h5>
                                            <p>Cum sociis natoque penatibus et</p>
                                            <div class="text-center">
                                                <button type="button"
                                                    class="btn btn-link text-decoration-none text-success">Upgrade <i
                                                        class="mdi mdi-arrow-right"></i></button>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>

                        </div>
                    <!-- filemanager-leftsidebar -->


</body>

<script src="${pageContext.request.contextPath }/resources/assets/libs/apexcharts/apexcharts.min.js"></script>

<!-- file-manager js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/file-manager.init.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/metismenu/metismenu.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.all.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/js/pages/sweet-alerts.init.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/@chenfengyuan/datepicker/datepicker.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-datepicker/locales/bootstrap-datepicker.ko.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/TableDnD/0.9.1/jquery.tablednd.js"
	integrity="sha256-d3rtug+Hg1GZPB7Y/yTcRixO/wlI78+2m08tosoRn7A="
	crossorigin="anonymous"></script>
	<script type="text/javascript">
	$('#moveBsForm').on('click', function(e) {
	    e.preventDefault();
	    window.opener.location.href = $(this).attr('href');
	    window.close();
	});
	</script>

</html>