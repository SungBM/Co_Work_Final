<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"></jsp:include>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>
<title>결재함</title>
<style>

</style>
<script>
    $(function () {
        $('#datePicker, #datePicker1').datepicker({
            format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
            endDate: '0d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
            autoclose: true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
            calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
            clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
            disableTouchKeyboard: false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
            immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
            templates: {
                leftArrow: '&laquo;',
                rightArrow: '&raquo;'
            }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
            showWeekDays: true,// 위에 요일 보여주는 옵션 기본값 : true
            todayHighlight: true,	//오늘 날짜에 하이라이팅 기능 기본값 :false
            toggleActive: true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
            weekStart: 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일
            language: "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.

        });//datepicker end


        $("#datePicker").datepicker('setDate', '-90D');
        $("#datePicker1").datepicker('setDate', 'today');

    });//ready end
</script>
</head>

<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0 font-size-18">결재함</h4>

                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">전자결재</a></li>
                                <li class="breadcrumb-item active">결재함</li>
                            </ol>
                        </div>

                    </div>
                </div>
            </div>
            <!-- end page title -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body border-bottom">
                            <div class="row">
                                <div class="col-xxl-1 col-lg-2 align-self-center">
                                    <span class="fw-bold">상신일</span>
                                </div>
                                <div class="col-xxl-2 col-lg-2">
                                    <div class="input-group" id="datepicker">
                                        <input type="text" class="form-control form-control-sm" id="datePicker"
                                               style="height: 28px">
                                        <span class="input-group-text" style="height: 28px"><i
                                                class="mdi mdi-calendar"></i></span>
                                    </div>
                                </div>
                                <div class="col-xxl-1 col-lg-1 align-self-center text-center" style="width: 30px">
                                    <span class="fw-bold">~</span>
                                </div>
                                <div class="col-xxl-2 col-lg-2">
                                    <div class="input-group" id="datepicker1">
                                        <input type="text" class="form-control form-control-sm" id="datePicker1"
                                               style="height: 28px">
                                        <span class="input-group-text" style="height: 28px"><i
                                                class="mdi mdi-calendar"></i></span>
                                    </div>
                                </div>

                                <div class="col-xxl-1 col-lg-2 align-self-center ms-5">
                                    <span class="fw-bold">검색</span>
                                </div>
                                <div class="col-xxl-2 col-lg-2">
                                    <select class="form-select form-select-sm" style="width: 100px" id="selectSearch">
                                        <option value="title">기안제목</option>
                                        <option value="name">기안자</option>
                                    </select>
                                </div>
                                <div class="col-xxl-2 col-lg-2">
                                    <input type="text" class="form-control form-control-sm"
                                           style="margin-left: -3.5rem">
                                </div>
                            </div>
                            <hr class="mt-3">
                            <div class="text-center">
                                <button class="btn btn-primary">조회</button>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="card-body">

                    <div class="table-responsive">
                        <table class="table table-bordered align-middle nowrap">
                            <thead>
                            <tr>
                                <th scope="col">양식</th>
                                <th scope="col">기안제목</th>
                                <th scope="col">기안자</th>
                                <th scope="col">상신일시</th>
                                <th scope="col">결재구분</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${docAppList}" var="list">
                                <tr>
                                    <td>${list.CATEGORY_RESULT}</td>
                                    <td><a class="text-dark text-decoration-underline"
                                           href="">${list.DOCUMENT_TITLE}</a></td>
                                    <td><a href=""
                                           data-bs-toggle="offcanvas"
                                           data-bs-target="#offcanvasRight"
                                           aria-controls="offcanvasRight">${list.USER_NAME} ${list.JOB_NAME}
                                        | ${list.DEPT_NAME}</a></td>
                                    <td>${list.DOCUMENT_FORM_DATE}</td>
                                    <td>${list.APPROVAL_DATE_RESULT}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto">
                            <div class="card d-inline-block ms-auto mb-0">
                                <div class="card-body p-2">
                                    <nav aria-label="Page navigation example" class="mb-0">
                                        <ul class="pagination mb-0">
                                            <li class="page-item">
                                                <a class="page-link" href="javascript:void(0);" aria-label="Previous">
                                                    <span aria-hidden="true">«</span>
                                                </a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a>
                                            </li>
                                            <li class="page-item active"><a class="page-link"
                                                                            href="javascript:void(0);">2</a></li>
                                            <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a>
                                            </li>
                                            <li class="page-item"><a class="page-link"
                                                                     href="javascript:void(0);">...</a></li>
                                            <li class="page-item"><a class="page-link" href="javascript:void(0);">12</a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="javascript:void(0);" aria-label="Next">
                                                    <span aria-hidden="true">»</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->
                </div>
            </div><!--end card-->
        </div><!--end col-->

    </div>

    <!-- end row -->

</div> <!-- container-fluid -->
<!-- End Page-content -->
<div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasBottomLabel"
     aria-modal="true" role="dialog">
    <div class="offcanvas-body">
        <span class="font-size-16 fw-bold mb-3">결재선</span>
        <table class="table align-middle table-hover table-bordered table-sm mt-3">
            <thead>
            <tr>
                <th scope="col" class="">순번</th>
                <th scope="col">결재자</th>
                <th scope="col">유형</th>
                <th scope="col">상태</th>
                <th scope="col">일자</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>4</td>
                <td>차홍 부장 | 개발2팀</td>
                <td>결재안함</td>
                <td>결재</td>
                <td>2023.04.18 13:08</td>
            </tr>
            <tr>
                <td>3</td>
                <td>최용수 차장 | 개발2팀</td>
                <td>결재안함</td>
                <td>결재</td>
                <td>2023.04.18 13:08</td>
            </tr>
            <tr>
                <td>2</td>
                <td>임시 대리 | 개발2팀</td>
                <td>결재안함</td>
                <td>결재</td>
                <td>2023.04.18 13:08</td>
            </tr>
            <tr>
                <td>1</td>
                <td>박주호 사원 | 개발2팀</td>
                <td>전결</td>
                <td>결재</td>
                <td>2023.04.18 13:08</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<!-- apexcharts -->
<script src="assets/libs/apexcharts/apexcharts.min.js"></script>
