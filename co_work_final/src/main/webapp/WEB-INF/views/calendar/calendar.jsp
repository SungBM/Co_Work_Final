<%--
  Created by IntelliJ IDEA.
  User: micro
  Date: 2023-03-19
  Time: 오후 4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../main/header.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
    <title>일정</title>
    <style>
        .fc-day a {
            color: black;
        }

        .fc-day-sat a {
            color: blue;
            text-decoration: none;
        }

        .fc-day-sun a {
            color: red;
            text-decoration: none;
        }

    </style>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            $("#datepicker1").datepicker({
                format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                templates: {
                    leftArrow: '&laquo;',
                    rightArrow: '&raquo;'
                }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
                showWeekDays: true,// 위에 요일 보여주는 옵션 기본값 : true
                weekStart: 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일
                language: "ko", //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
                autoclose: true,
                onClose: function (selectedDate) {
                    console.log("닫힘...");
                    $("#datepicker2").datepicker("option", "minDate", selectedDate);
                }
            });//datepicker end

            $("#datepicker2").datepicker({
                format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                templates: {
                    leftArrow: '&laquo;',
                    rightArrow: '&raquo;'
                }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
                showWeekDays: true,// 위에 요일 보여주는 옵션 기본값 : true
                weekStart: 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일
                language: "ko", //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
                autoclose: true
            });//datepicker end


            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl,
                {
                    // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
                    headerToolbar: {
                        left: 'prevYear,prev,next,nextYear today',
                        center: 'title',
                        right: 'dayGridMonth,dayGridWeek,dayGridDay'
                    },

                    locale: "ko",
                    selectable: true,
                    selectMirror: true,
                    navLinks: true, // can click day/week names to navigate views
                    editable: true,
                    dayMaxEvents: true, // allow "more" link when too many events
                    buttonText: {
                        today: "오늘",
                        month: "월별",
                        week: "주별",
                        day: "일별",
                    },

                    select:
                        function (arg) {
                            console.log(arg)
                            var year = arg.end.getFullYear();
                            var month = arg.end.getMonth() + 1;
                            var date = arg.end.getDate() - 1;

                            if (date != 0) {
                                var enddate = year + "-" + month + "-" + date;
                            } else {
                                enddate = year + "-" + month + "-" + date;
                            }
                            $("#myModal").modal("show");
                            $("#datepicker1").val(arg.startStr);
                            $("#datepicker2").val(enddate);
                        },

                    // 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
                    events: [
                        <%--                        <c:forEach var="c" items="${calList}">--%>
                        <%--                        {--%>
                        <%--                            title: '${c.title}',--%>
                        <%--                            start: '${c.cal_start}',--%>
                        <%--                            end: '${c.cal_end}'--%>
                        <%--                        }--%>
                        <%--                        <c:if test="${!empty calList}">, </c:if>--%>
                        <%--                        </c:forEach>--%>
                        {
                            title: 'All Day Event',
                            start: '2023-03-14',
                        }
                    ]
                });

            calendar.render();

        });
    </script>
    <style>
        .datepicker {
            z-index: 1600 !important; /* has to be larger than 1050 */
        }

    </style>
</head>
<body>
<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0 font-size-18">일정</h4>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-xl-3">

                    <!-- Simple card -->
                    <div class="card">
                        <div class="card-body" style="margin: 0 auto; width: 100%">
                            <button type="button" class="btn btn-primary waves-effect waves-light m-1"
                                    style="width: 100%">+ 일정추가
                            </button>
                        </div>
                    </div>

                </div>
                <div class="card col-9">
                    <div class="card-body">
                        <div id='calendar'></div>

                        <!-- insertModal -->
                        <div class="modal fade insertModal" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content" style="z-index: 10000 !important; width: 600px">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">일정 등록</h4>
                                        <button type="button" class="close">&times;
                                        </button>
                                    </div>

                                    <form action="../calendar/calAdd" method="post">
                                        <!-- Modal body -->
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <input type="textbox" class="form-control" placeholder="제목을 입력하세요."
                                                       id="cal_title" name="cal_title">
                                            </div>

                                            <div class="row" style="margin: 0 auto; text-align: center">
                                                <div class="mt-3 col-1"><i class="bx bx-time-five fa-2x"></i></div>
                                                <div class="mt-4 col-md-3" id="startdate">
                                                    <input class="datepicker" name="cal_start_date" type="text"
                                                           id="datepicker1" style="width: 100%"></div>

                                                <div class="col-md-2 mt-4">
                                                    <input class="form-control" type="text" value="" unselectable="on">
                                                    <select class="form-control" id="start" name="cal_start_time"
                                                            style="display: none">
                                                        <c:set var="breakPoint" value="0"/>
                                                        <c:forEach var="i" begin="0" end="23">
                                                            <c:forEach var="j" begin="0" end="1">
                                                                <c:if test="${(i == 24) && (j == 1)}">
                                                                    <c:set var="breakPoint" value="1"/>
                                                                </c:if>
                                                                <c:if test="${breakPoint==0}">
                                                                    <option value="${i}:<fmt:formatNumber pattern="00" value="${j*30}" />">${i}:<fmt:formatNumber
                                                                            pattern="00" value="${j*30}"/></option>
                                                                </c:if>

                                                            </c:forEach>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                                <div class="mt-4 col-md-1"><span class="bar"> _ </span></div>

                                                <div class="mt-4 col-md-3" id="enddate">
                                                    <input class="datepicker" name="cal_end_date" type="text"
                                                           id="datepicker2" style="width: 100%"></div>

                                                <div class="col-md-2 mt-4">
                                                    <input class="form-control" type="text" value="" unselectable="on">
                                                    <select class="form-control" id="end" name="cal_end_time"
                                                            style="display: none">
                                                        <c:set var="breakPoint" value="0"/>
                                                        <c:forEach var="i" begin="0" end="23">
                                                            <c:forEach var="j" begin="0" end="1">
                                                                <c:if test="${(i == 24) && (j == 1)}">
                                                                    <c:set var="breakPoint" value="1"/>
                                                                </c:if>
                                                                <c:if test="${breakPoint==0}">
                                                                    <option value="${i}:<fmt:formatNumber pattern="00" value="${j*30}" />">${i}:<fmt:formatNumber
                                                                            pattern="00" value="${j*30}"/></option>
                                                                </c:if>

                                                            </c:forEach>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                            </div>

                                            <div class="form-group mt-3" style="margin-left: 65px">
                                                <div class="form-check mb-3 ">
                                                    <input class="form-check-input" type="checkbox" id="allday"
                                                           name="cal_allday" checked>
                                                    <label class="form-check-label" for="allday">
                                                        종일
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <div class="col-md-2">
                                                    <label for="cal_content">내용</label></div>
                                                <div class="col-md-10">
                                                    <textarea class="form-control" rows="5" id="cal_content" name="cal_content" style="resize: none;" placeholder="일정에 필요한 설명을 남기세요."></textarea>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary  float-right">저장
                                            </button>
                                            <button type="reset" class="btn btn-warning float-right">취소
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end row -->
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->
    </div>
    <!-- end main content-->
</div>
</body>
</html>