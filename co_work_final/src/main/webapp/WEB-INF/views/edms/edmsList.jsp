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
<title>Insert title here</title>
</head>
<body>
  <input type="button" class="btn btn-danger inner"
                                                    id="createNew" value="새로 만들기" />
                                                    
                                                    
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
    $('#createNew').on('click', function() {
   	 var width = 600;
   	    var height = 800;
   	    var left = (screen.width / 2) - (width / 2);
   	    var top = (screen.height / 2) - (height / 2);
   	    window.open('${pageContext.request.contextPath }/edms/edmsCreateNew', '', 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top);
   });
	</script>
</html>