<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"></jsp:include>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>
<title>전자결재함</title>
<style>

</style>
<script>
    $(document).ready(function () {
    	$(".edmsAddComment").click(function(){
    		var docNum = $(this).parent().prev().prev().text();
    		var loginId = $("#loginId").text();
    		console.log(loginId + " : loginId");
    		console.log(docNum + " : docNum");
    		location.href="${pageContext.request.contextPath }/edms/edmsaddcomments?document_form_code="+docNum+"&approval_user_id="+loginId+"";
    	});
    	
    	$("#detailApproval").click(function(){
    		var docNum = $("#docNum").attr('values');
    		alert(docNum);
    		location.href="${pageContext.request.contextPath }/edms/edmsList?docNum="+docNum+"";
    	});
    	
    	$('#createNew').on('click', function() {
    	  	 	var width = 600;
    	  	    var height = 800;
    	  	    var left = (screen.width / 2) - (width / 2);
    	  	    var top = (screen.height / 2) - (height / 2);
    	  	    window.open('${pageContext.request.contextPath }/edms/edmsCreateNew', '', 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top);
    	  });
    	
        $(document).on("click", "a[name=appLine]", function () {
            var data = $(this).parent().prev().prev().prev().text();
            $.ajax({
                type: "GET",
                url: "getAppLine",
                data: {"data": data},
                success: function (data) {
                    resultHtml(data);
                }

            })
        })
    })

</script>
</head>

<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0 font-size-18">전자결재 목록</h4>
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">전자결재</a></li>
                                <li class="breadcrumb-item active">목록</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="d-xl-flex">
                <div class="w-100">
                    <button type="button" class="btn btn-light" id="createNew">새로 작성</button>

                    <div class="d-md-flex">
                        <!-- filemanager-leftsidebar -->

                        <div class="w-100">
                            <div class="card">
                                <div class="card-body">
                                    <div>
                                        <div class="row mb-3">
                                            <div class="col-xl-3 col-sm-6">
                                                <div class="mt-2">
                                                    <span class="font-size-18 fw-bold">현황</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                        <div class="row">
                                            <div class="col-xl-3 col-sm-6">
                                                <div class="card shadow-none border">
                                                    <div class="card-body p-3">
                                                        <div class="">
                                                            <h5 class="font-size-14 mb-1 fw-bold text-info">상신한</h5>
                                                            <p class="font-size-18 mb-0 fw-bold text-center"><a
                                                                    href="myDoc">${getCountDoc} 건</a></p>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <!-- end col -->

                                            <div class="col-xl-3 col-sm-6">
                                                <div class="card shadow-none border">
                                                    <div class="card-body p-3">
                                                        <div class="h-100">
                                                            <h5 class="font-size-14 mb-1 fw-bold text-info">결재전</h5>
                                                            <p class="font-size-18 mb-0 fw-bold text-center"><a
                                                                    href="myDocApp">${getCountDocApp} 건</a></p>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <!-- end col -->

                                        </div>
                                        <!-- end row -->
                                    </div>

                                    <div class="mt-4">
                                        <div class="d-flex flex-wrap">
                                            <span class="font-size-18 fw-bold">내가 상신한 문서</span>
                                        </div>
                                        <hr class="mt-1">
                                        <div class="table-responsive">
                                            <table class="table align-middle table-hover table-bordered">
                                                <thead>
                                                <tr>
                                                    <th scope="col" style="width: 7%">문서번호</th>
                                                    <th scope="col" style="width: 5%">양식</th>
                                                    <th scope="col" style="width: 22%">기안제목</th>
                                                    <th scope="col" style="width: 15%">결재대기자</th>
                                                    <th scope="col" style="width: 10%">상신일자</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${docList}" var="list" end="2">
                                                    <tr>
                                                        <td>${list.DOCUMENT_FORM_CODE}</td>
                                                        <td>${list.CATEGORY_RESULT}</td>
                                                        <td>
                                                        <a class="text-dark text-decoration-underline edmsAddComment" id="edmsAddComment"
                                                               href="javascript:void(0)">${list.DOCUMENT_TITLE}</a></td>
                                                        <td>
                                                            <a name="appLine" href=""
                                                               data-bs-toggle="offcanvas"
                                                               data-bs-target="#offcanvasRight"
                                                               aria-controls="offcanvasRight">${list.USER_NAME} ${list.JOB_NAME}
                                                                | ${list.DEPT_NAME}
                                                            </a>
                                                        </td>
                                                        <td>${list.DOCUMENT_FORM_DATE}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end card -->
                        </div>
                        <!-- end w-100 -->
                    </div>
                </div>
            </div>
            <!-- end row -->

        </div> <!-- container-fluid -->
    </div>
</div>
<!-- End Page-content -->

<div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasBottomLabel"
     aria-modal="true" role="dialog">
    <div class="offcanvas-body">
        <span class="font-size-16 fw-bold mb-3">결재선</span>
        <button class="btn btn-light" id="detailApproval" style="float: right;">결재선 상세보기</button>
        <div id="display">
		
        </div>
        </table>

    </div>
</div>
<script>
    function resultHtml(data) {
    	var html = '<input type="hidden" id="docNum" values = "' +data[0].document_FORM_CODE+ '">' 
        html += '<table class="table align-middle table-hover table-bordered table-sm mt-3">';
        html += '<thead>';
        html += '<tr>';
        html += '<th scope="col" class="">순번</th>';
        html += '<th scope="col" >결재자</th>';
        html += '<th scope="col" >유형</th>';
        html += '<th scope="col" >상태</th>';
        html += '<th scope="col" >일자</th>';
        html += '</tr>';

        <c:if test="data[i].approval_DATE == null">
        <td></td>
        </c:if>
        <c:if test="data[i].approval_DATE != null">
        <td>data[i].approval_DATE</td>
        </c:if>


        for (var i = 0; i < data.length; i++) {
            html += '<tr>';
            html += '<td>' + parseInt(i + 1) + '</td>';
            html += '<td>' + data[i].user_NAME + ' ' + data[i].job_NAME + ' | ' + data[i].dept_NAME + '</td>';
            if(data[i].approval_STATE == 0) {
            	html += '<td class="text-primary">' + data[i].state_RESULT + '</td>';
            } else if (data[i].approval_STATE == 1){
            	html += '<td class="text-success">' + data[i].state_RESULT + '</td>';
            } else if (data[i].approval_STATE == -1){
            	html += '<td class="text-danger">' + data[i].state_RESULT + '</td>';
            }
            
            html += '<td>결재</td>';
            html += '<td>' + data[i].approval_DATE_RESULT + '</td>';

            console.log(data[i])
        }
        $("#display").empty();
        $("#display").append(html);
    }
</script>