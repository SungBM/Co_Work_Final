<%--
  Created by IntelliJ IDEA.
  User: micro
  Date: 2023-03-19
  Time: 오후 4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../main/header.jsp" />
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/admin_js/calendar.js"></script>
<title>일정</title>
<style>
.fc-day a {
	color: black;
}

.fc-daygrid-event {
	background-color: #FFFFFF;
}

.fc-h-event {
	height: 20px;
}

.fc-event-time, .fc-event-title {
	margin: -3px;
}

.fc-day-sat a {
	color: blue;
	text-decoration: none;
}

.fc-day-sun a {
	color: red;
	text-decoration: none;
}

.modal-footer {
	justify-content: space-between;
}
</style>
<script>

document.addEventListener('DOMContentLoaded', function () {        		
	
	var datalist = [];
    // 콜백함수 event에 직접적으로 ajax넣게되면 데이터가 넘어오기전에 
    // 실행이 되므로 값이 안나타날수있다
    $.ajax({
        url: '../member/calSelect',
        type:"Get",
        dataType: "json",
        success: function(result) {
             $.each(result, function(index, value){     
                   datalist.push(value);
                   openCalander(datalist); // 이 부분
                   console.log(value);
             });
        }
    }); 

	
	
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl,
        {
            // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,dayGridWeek,dayGridDay'
            },
            locale: "ko",
            timeZone: 'UTC',
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
                    var realdate = arg.end.getDate();

                    if (date != 0) {
                        var enddate = year + "-" + month + "-" + date;
                        var endreal = year + "-" + month + "-" + realdate;
                    } else {
                        enddate = year + "-" + month + "-" + date;
                        endreal = year + "-" + month + "-" + realdate;
                    }

                    $("#myModal").modal("show");
                    $("#datepicker1").datepicker('setDate', arg.startStr);
                    $("#datepicker2").datepicker('setDate', enddate);
                },

            eventClick: function (data) {
                if (data.event.end == null) {
                    var end = new Date();
                    end.setDate(data.event.start.getDate());
                    data.event.setEnd(end);
                }

                if (data.event.extendedProps.caltype == 'P')
                    var caltype = '개인 일정'
                else
                    caltype = '회사 일정';

                var calno = data.event.extendedProps.calno;
                var caltitle = data.event.title;
                var calstart = data.event.start.toISOString().replace('T', ' ').slice(0, -8);
                var calend = data.event.end.toISOString().replace('T', ' ').slice(0, -8);
                var calcontent = data.event.extendedProps.content;
                var allday = data.event.allDay;

                $('#calno').text(calno);
                $('#caltype').val(caltype);
                $('#caltitle').val(caltitle);
                $('#calcontent').val(calcontent);
                $('#allday').text(allday);
                $("#eventModal").modal("show");
                $("#datepicker3").datepicker('setDate', calstart.substring(0, 10));
                $("#datepicker4").datepicker('setDate', calend.substring(0, 10));
                $("#start1").val(calstart.substring(11, 16))
                $("#end1").val(calend.substring(11, 16))

                $("#start1, #datepicker3").change(function () {
                    startChange();
                })

                $("#delbutton").click(function () {
                    var delResult = confirm("정말 삭제하시겠습니까?");
                    if (delResult) {
                        $.ajax({
                            url: '../member/calDelete',
                            data: {
                                "cal_no": calno
                            },
                            success: function (resp) {
                                location.reload();
                            }
                        })
                    }
                })

                $("#modibutton").click(function () {
                    var calstart1 = $("#datepicker3").val()
                    var calend1 = $("#datepicker4").val()
                    var starttime = $("#start1").val();
                    var endtime = $("#end1").val();
                    $.ajax({
                        url: '../member/calUpdate',
                        data: {
                            "cal_no": calno,
                            "cal_title": caltitle,
                            "cal_content": calcontent + " " + starttime,
                            "cal_start_date": calstart1,
                            "cal_end_date": calend1,
                            "cal_end_time": endtime
                        },
                        success: function (resp) {
                            location.reload();
                        }
                    })
                })
            },

            eventDrop: function (data) {
                var calstart = data.event.start.toISOString().replace('T', ' ').slice(0, -8);
                var calend = data.event.end.toISOString().replace('T', ' ').slice(0, -8);
                var calno = data.event.extendedProps.calno;
                var caltitle = data.event.title;
                var calcontent = data.event.extendedProps.content;

                $.ajax({
                    url: '../member/calUpdate',
                    // type: 'post',
                    data: {
                        "cal_no": calno,
                        "cal_title": caltitle,
                        "cal_content": calcontent,
                        "cal_start_date": calstart,
                        "cal_end_date": calend
                    }
                })
            },

            eventChange: function (data) {
                var calstart = data.event.start.toISOString().replace('T', ' ').slice(0, -8);
                var calend = data.event.end.toISOString().replace('T', ' ').slice(0, -8);
                var calno = data.event.extendedProps.calno;
                var caltitle = data.event.title;
                var calcontent = data.event.extendedProps.content;

                $.ajax({
                    url: '../member/calUpdate',
                    // type: 'post',
                    data: {
                        "cal_no": calno,
                        "cal_title": caltitle,
                        "cal_content": calcontent,
                        "cal_start_date": calstart,
                        "cal_end_date": calend
                    }
                })
            },

            // 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
            events: [
                <c:forEach var="c" items="${callist}">
                {
                    calno: '${c.cal_no}',
                    caltype: '${c.cal_type}',
                    title: '${c.cal_title}',
                    start: '${c.cal_start_date}',
                    end: '${c.cal_end_date}',
                    content: '${c.cal_content}',
                    allDay: '${c.cal_allday}',
                    color: "${c.cal_color}"
                }
                <c:if test="${!empty callist}">, </c:if>
                </c:forEach>
            ]
        });

    calendar.render();
    
})
    </script>
<style>
.datepicker {
	z-index: 1600 !important; /* has to be larger than 1050 */
}

#start[readonly], #end[readonly] {
	pointer-events: none;
}
</style>
</head>
<body>
	<div class="main-content">
		<div class="page-content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div
							class="page-title-box d-sm-flex align-items-center justify-content-center">
							<h3 class="mb-sm-0 font-size-24">일정</h3>

						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-xl-3">

						<!-- Simple card -->
						<div class="card">
							<div class="card-body">
								<div class="d-grid">
									<button class="btn font-16 btn-primary" id="btn-new-event"
										onclick="$('#myModal').modal('show')">
										<i class="mdi mdi-plus-circle-outline"></i> 일정생성
									</button>
								</div>
								<div id="external-events" class="mt-4">
									<div class="external-event bg-success text-white"
										data-class="bg-success">
										<input class="form-check-input" type="checkbox"
											name="cal_type" value="P" id="formCheckcolor2" checked="">
										<label class="form-check-label" for="formCheckcolor2">
											개인 일정 </label>
									</div>
									<div class="external-event bg-info mt-2 text-white"
										data-class="bg-info">
										<input class="form-check-input" type="checkbox"
											name="cal_type" value="C" id="formCheckcolor3" checked="">
										<label class="form-check-label" for="formCheckcolor3">
											부서 일정 </label>
									</div>
								</div>

								<div class="row justify-content-center mt-5">
									<img src="assets/images/verification-img.png" alt=""
										class="img-fluid d-block">
								</div>
							</div>
						</div>
					</div>
					<div class="card col-xl-9 col-lg-12">
						<div class="card-body">
							<div id='calendar'></div>

							<!-- insertModal -->
							<div class="modal fade insertModal" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content"
										style="z-index: 10000 !important; width: 600px">

										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">일정 등록</h4>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>

										<form action="../member/calAdd" method="post" name="addForm">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}">

											<!-- Modal body -->
											<div class="modal-body">
												<div class="form-group mb-3">
													<input class="form-check-input" type="radio"
														name="cal_type" id="formRadios1" checked value="P">
													<label class="form-check-label" for="formRadios1">
														개인 일정 </label> <input class="form-check-input" type="radio"
														name="cal_type" id="formRadios2" value="C"> <label
														class="form-check-label" for="formRadios2"> 회사 일정
													</label>


												</div>

												<div class="form-group">
													<input type="textbox" class="form-control"
														placeholder="제목을 입력하세요." id="cal_title" name="cal_title">
												</div>

												<div class="row" style="margin: 0 auto; text-align: center">
													<div class="mt-3 col-1">
														<i class="bx bx-time-five fa-2x"></i>
													</div>
													<div class="mt-4 col-md-3" id="startdate">
														<input class="datepicker" name="cal_start_date"
															type="text" id="datepicker1" style="width: 100%">
													</div>
													<div class="col-md-2 mt-4">
														<select class="form-control" id="start"
															name="cal_start_time" readonly="">
															<c:set var="breakPoint" value="0" />
															<c:forEach var="i" begin="0" end="23">
																<c:forEach var="j" begin="0" end="3">
																	<c:if test="${(i == 24) && (j == 3)}">
																		<c:set var="breakPoint" value="1" />
																	</c:if>
																	<c:if test="${breakPoint==0}">
																		<option
																			value="<fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*15}" />">
																			<fmt:formatNumber pattern="00" value="${i}" />:
																			<fmt:formatNumber pattern="00" value="${j*15}" /></option>
																	</c:if>
																</c:forEach>
															</c:forEach>
														</select>
													</div>

													<div class="mt-4 col-md-1">
														<span class="bar"> _ </span>
													</div>

													<div class="mt-4 col-md-3" id="enddate">
														<input class="datepicker" name="cal_end_date" type="text"
															id="datepicker2" style="width: 100%">
													</div>

													<div class="col-md-2 mt-4">
														<select class="form-control" id="end" name="cal_end_time"
															readonly="">
															<c:set var="breakPoint" value="0" />
															<c:forEach var="i" begin="0" end="23">
																<c:forEach var="j" begin="0" end="3">
																	<c:if test="${(i == 24) && (j == 3)}">
																		<c:set var="breakPoint" value="1" />
																	</c:if>
																	<c:if test="${breakPoint==0}">
																		<option
																			value="<fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*15}" />">
																			<fmt:formatNumber pattern="00" value="${i}" />:
																			<fmt:formatNumber pattern="00" value="${j*15}" /></option>
																	</c:if>
																</c:forEach>
															</c:forEach>
														</select>
													</div>

												</div>

												<div class="form-group mt-3" style="margin-left: 65px">
													<div class="form-check mb-3 ">
														<input class="form-check-input" type="checkbox"
															id="allday" name="cal_allday" value="true" checked>
														<label class="form-check-label" for="allday"> 종일 </label>
													</div>
												</div>

												<div class="form-group row">
													<div class="col-md-2">
														<label for="cal_content">내용</label>
													</div>
													<div class="col-md-10">
														<textarea class="form-control" rows="5" id="cal_content"
															name="cal_content" style="resize: none;"
															placeholder="일정에 필요한 설명을 남기세요."></textarea>
													</div>
												</div>

											</div>
											<!-- Modal footer -->
											<div class="modal-footer">
												<button type="submit" class="btn btn-primary  float-right">저장
												</button>
												<button type="button" class="btn btn-light waves-effect"
													data-bs-dismiss="modal" aria-label="Close">닫기</button>
											</div>
										</form>
									</div>
								</div>
							</div>


							<div class="modal fade insertModal" id="eventModal">
								<div class="modal-dialog">
									<div class="modal-content"
										style="z-index: 10000 !important; width: 600px">

										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">일정 확인</h4>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<table class="table">
											<tr>
												<th style="width: 80px">일정 타입</th>
												<td><input class="form-control" type="text" value=""
													id="caltype"></td>
											</tr>
											<tr>
												<th>제목</th>
												<td><input class="form-control" type="text"
													id="caltitle" value=""></td>
											</tr>
											<tr>
												<th style="margin: 0 auto">날짜</th>
												<td>
													<div class="row">
														<div class="mt-4 col-md-3 mb-3" id="startdate">
															<input class="datepicker" name="cal_start_date"
																type="text" id="datepicker3" style="width: 100%">
														</div>
														<div class="col-md-2 mt-4">
															<select class="form-control" id="start1"
																name="cal_start_time">
																<c:set var="breakPoint" value="0" />
																<c:forEach var="i" begin="0" end="23">
																	<c:forEach var="j" begin="0" end="3">
																		<c:if test="${(i == 24) && (j == 3)}">
																			<c:set var="breakPoint" value="1" />
																		</c:if>
																		<c:if test="${breakPoint==0}">
																			<option
																				value="<fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*15}" />">
																				<fmt:formatNumber pattern="00" value="${i}" />:
																				<fmt:formatNumber pattern="00" value="${j*15}" /></option>
																		</c:if>
																	</c:forEach>
																</c:forEach>
															</select>
														</div>
														<div class="mt-4 col-md-1">
															<span class="bar"> _ </span>
														</div>
														<div class="mt-4 col-md-3" id="enddate">
															<input class="datepicker" name="cal_end_date" type="text"
																id="datepicker4" style="width: 100%">
														</div>
														<div class="col-md-2 mt-4">
															<select class="form-control" id="end1"
																name="cal_end_time">
																<c:set var="breakPoint" value="0" />
																<c:forEach var="i" begin="0" end="23">
																	<c:forEach var="j" begin="0" end="3">
																		<c:if test="${(i == 24) && (j == 3)}">
																			<c:set var="breakPoint" value="1" />
																		</c:if>
																		<c:if test="${breakPoint==0}">
																			<option
																				value="<fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*15}" />">
																				<fmt:formatNumber pattern="00" value="${i}" />:
																				<fmt:formatNumber pattern="00" value="${j*15}" /></option>
																		</c:if>
																	</c:forEach>
																</c:forEach>
															</select>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th>내용</th>
												<td><input class="form-control" type="text"
													id="calcontent" value=""></td>
											</tr>

										</table>


										<!-- Modal footer -->
										<div class="modal-footer">
											<div>
												<button type="button" class="btn btn-danger" id="delbutton"
													style="float: left;">삭제</button>
											</div>
											<div>
												<button type="button" class="btn btn-warning"
													id="modibutton">수정</button>
												<button type="button" class="btn btn-light waves-effect"
													data-bs-dismiss="modal" aria-label="Close">닫기</button>
											</div>
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
	</div>
</body>
</html>