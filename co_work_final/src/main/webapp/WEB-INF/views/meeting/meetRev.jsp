<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../main/header.jsp" />
<script
   src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/meeting_js/meetRev.js"></script>

<title>회의실 예약</title>
<style>
#meetImg {
   width: 100%;
   height: 150px;
}

#datepicker, #calendar {
   margin-left: -40px
}

.fc-event {
   cursor: pointer;
}

#calendar a.fc-event {
   color: #fff; /* bootstrap default styles make it black. undo */
   font-size: 12px
}

ul {
   list-style: none;
   padding-left: 0px;
}
</style>
<script>

    // fullcalendar
   document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
         //timeZone : 'UTC',
         selectable : true,
         headerToolbar : {
            right : 'dayGridMonth,timeGridFourDay'
         },
         eventOverlap: false,
         selectOverlap: false,
         events : [ 
            <c:forEach var="c" items="${list}">
                {
                    meetno: '${c.meet_no}',
                    start: '${c.rev_start_time}',
                    end: '${c.rev_end_time}',
                    title: '${c.rev_content}',
                    people : '${c.rev_people}',
                    userid : '${c.user_id}',
                    username : '${c.user_name}',
                    deptname : '${c.dept_name}',
                    jobname : '${c.job_name}',
                    revno : '${c.rev_no}',
                    rendering: 'background'
                  }   
                <c:if test="${!empty list}">, </c:if>
                </c:forEach>
         ],  eventColor: 'white',
         eventBackgroundColor : 'e8e8e8',
         initialView : 'timeGridFourDay',
         views : {
            timeGridFourDay : {
               type : 'timeGrid',
               duration : {
                  days : 1
               }
            }
         },
         locale : "kr",
         slotMinTime : "08:00",
         slotMaxTime : "19:30",
         slotLabelInterval : {
            minutes : 30
         },
         expandRows : true,
         slotLabelFormat : [ {
            hour : '2-digit',
            minute : '2-digit',
            omitZeroMinute : false,
            meridiem : 'short',
            hour12 : false
         } // lower level of text
         ],
         height : 900,
         allDaySlot : false,
         select : function(arg) {
            console.log(arg)
            
            $("#insertModal").modal("show");
            $("#rev_start_date").val(arg.startStr.substring(0, 10));
            $("#rev_start_time").val(arg.startStr.substring(11, 16)).prop(
                  "selected", true);
            $("#rev_end_time").val(arg.endStr.substring(11, 16)).prop(
                  "selected", true);
                
            $("form[name=add]").submit(function(e){
               var content = $("#rev_content").val();
               var startTime = $("#rev_start_time").val();
               var endTime = $("#rev_end_time").val();
            
               if(content == "" || startTime == "" || endTime == ""){
                  alert("빈칸을 입력하세요.")
                  return false;
               } else if(startTime > endTime){
                  alert("종료시간은 시작시간보다 빠를 수 없습니다.")
                  return false;
               }         
            })
            
            // $.ajax({
            //         url: '../../meet/dateTest',
            //         type:"get",
            //         data: {
            //             "rev_start_date": arg.startStr.substring(0, 10),
            //             "meet_no" : $("input[name=meet_no]").val()
            //         },
            //         traditional: true,
            //         success: function (resp) {
            //             console.log(resp);
            //         }
            //     }) // ajax end
         },
         eventContent: function(arg) {
            console.log(arg)
            var type = arg.view.type;
            var userid = arg.event.extendedProps.userid;
            var loginid = $("input[name=myid]").val();
            if(type=='timeGridFourDay'){
               if(userid == loginid){
                  return {
                     html: '<div class="myevent">' + arg.event.title + " / " + arg.event.extendedProps.deptname+" " +arg.event.extendedProps.username + " " + arg.event.extendedProps.jobname + '</div>'
               }
                  } else {
                     return {
                     html: '<div>' + arg.event.title + " / " + arg.event.extendedProps.deptname+" " +arg.event.extendedProps.username + " " + arg.event.extendedProps.jobname + '</div>'                  
                     }
               }
            } else {
               return {
                  html: arg.timeText
               }   
            }
         },
         eventClick: function(info) {
            var loginId = $("input[name=myid]").val();
            var id = info.event.extendedProps.userid;
            if(loginId == id){
               if(confirm("예약 취소 하시겠습니까?")){
                  $.ajax({
                          url: '../../meet/meetDelete/' + info.event.extendedProps.revno,
                          type:"get",
                          data: {
                              "rev_no": info.event.extendedProps.revno
                              },
                          traditional: true,
                          success: function (resp, xhr, e) {
                             console.log(xhr)
                        if(xhr == 'success'){
                              location.reload();   
                              }
                          }
                      }) // ajax end
               } // if(confirm) end
            }  // if(loginId == id) end 
         }  // eventClick end
      })

      calendar.render();
      
      // 날짜 변경시 우측 calendar 함께 변경
      $("#datepicker").datepicker({
         startDate : new Date(),
         format : "yyyy/mm/dd",
         todayBtn : "linked",
         language : "ko"
      }).on("changeDate", function(e) {
         var getdate = $("#datepicker").datepicker("getDate");
         calendar.gotoDate(getdate.setDate(getdate.getDate()));
      });
      $("#datepicker").datepicker("setDate", new Date());
      
      $("#rev_start_time").change(function(){
         startChange();
      })
      
      // 내가 등록한 이벤트 색상 변경
      $(".myevent").parent().parent().css("background", "green");

   });
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
                     <h4 class="mb-sm-0" style="font-size: 24px !important;">회의실
                        예약</h4>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-lg-3 col-md-6">
                  <div class="card">
                     <div class="card-body">
                        <div class="mb-4">
                           <img src="../../upload${roomInfo.meet_img}" id="meetImg">
                        </div>
                        <div class="meetTitle mb-3">
                           <strong class="font-size-15">${roomInfo.meet_name }</strong>
                        </div>
                        <div class="line">
                           <ul>
                              <li><strong><i class="mdi mdi-account-group"
                                    style="color: blue"></i> 최대인원</strong> <span>${roomInfo.meet_max_people}</span></li>
                              <li><strong><i class="fas fa-bullhorn"
                                    style="color: red"></i> 정보사항</strong> <br> <span>${roomInfo.meet_info }</span></li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-3 col-md-6">
                  <div class="card">
                     <div class="card-body" id="datepicker"></div>
                  </div>
               </div>

               <div class="col-lg-6 col-md-12">
                  <div class="card">
                     <div class="card-body">
                        <div id='calendar'></div>
                     </div>
                  </div>
               </div>

            </div>
         </div>
      </div>
   </div>
   <div class="modal fade insertModal" id="insertModal">
      <div class="modal-dialog">
         <div class="modal-content"
            style="z-index: 10000 !important; width: 600px">

            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">예약</h4>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>

            <form action="../../meet/meetAdd" method="post" name="add">
               <input type="hidden" name="${_csrf.parameterName}"
                  value="${_csrf.token}"> <input type="hidden"
                  name="meet_no" value="${meet_no }"> <input type="hidden"
                  name="myid" value="${myid }">
               <div class="modal-body">

                  <div class="form-group row mb-3">
                     <label class="control-label col-md-4 col-xs-4" for="inputEvent">예약일</label>
                     <div class="col-md-4">
                        <input type="text" class="form-control" name="rev_start_date"
                           id="rev_start_date" placeholder="Select Date" readonly>
                     </div>
                  </div>

                  <div class="form-group row mb-3">
                     <label class="control-label col-md-4 col-xs-4" for="inputBegin">시작
                        시간</label>
                     <div class="col-md-5 col-xs-5" id="createdtp1">
                        <div class="input-group date">
                           <select class="form-control" name="rev_start_time"
                              id="rev_start_time">
                              <option value="08:00">08:00</option>
                              <option value="08:30">08:30</option>
                              <option value="09:00">09:00</option>
                              <option value="09:30">09:30</option>
                              <option value="10:00">10:00</option>
                              <option value="10:30">10:30</option>
                              <option value="11:00">11:00</option>
                              <option value="11:30">11:30</option>
                              <option value="12:00">12:00</option>
                              <option value="12:30">12:30</option>
                              <option value="13:00">13:00</option>
                              <option value="13:30">13:30</option>
                              <option value="14:00">14:00</option>
                              <option value="14:30">14:30</option>
                              <option value="15:00">15:00</option>
                              <option value="15:30">15:30</option>
                              <option value="16:00">16:00</option>
                              <option value="16:30">16:30</option>
                              <option value="17:00">17:00</option>
                              <option value="17:30">17:30</option>
                              <option value="18:00">18:00</option>
                              <option value="18:30">18:30</option>
                              <option value="19:00">19:00</option>
                           </select>
                        </div>
                     </div>
                  </div>
                  <div class="form-group row mb-3">
                     <label class="control-label col-md-4 col-xs-4" for="inputEnd">종료
                        시간</label>
                     <div class="col-md-5 col-xs-5">
                        <div class="input-group date" id="createdtp2">
                           <select class="form-control" name="rev_end_time"
                              id="rev_end_time">
                              <option value="08:00">08:00</option>
                              <option value="08:30">08:30</option>
                              <option value="09:00">09:00</option>
                              <option value="09:30">09:30</option>
                              <option value="10:00">10:00</option>
                              <option value="10:30">10:30</option>
                              <option value="11:00">11:00</option>
                              <option value="11:30">11:30</option>
                              <option value="12:00">12:00</option>
                              <option value="12:30">12:30</option>
                              <option value="13:00">13:00</option>
                              <option value="13:30">13:30</option>
                              <option value="14:00">14:00</option>
                              <option value="14:30">14:30</option>
                              <option value="15:00">15:00</option>
                              <option value="15:30">15:30</option>
                              <option value="16:00">16:00</option>
                              <option value="16:30">16:30</option>
                              <option value="17:00">17:00</option>
                              <option value="17:30">17:30</option>
                              <option value="18:00">18:00</option>
                              <option value="18:30">18:30</option>
                              <option value="19:00">19:00</option>
                              <option value="19:30">19:30</option>
                           </select>
                        </div>
                     </div>
                  </div>
                  <div class="form-group row mb-3">
                     <label class="control-label col-md-4 col-xs-4" for="inputEvent">내용</label>
                     <div class="col-md-8 col-xs-5">
                        <input class="form-control" type="text" id="rev_content"
                           name="rev_content" placeholder="회의 내용 입력">
                     </div>
                  </div>
               </div>

               <!-- Modal footer -->
               <div class="modal-footer">
                  <div>
                     <button type="submit" class="btn btn-primary">저장</button>
                     <button type="button" class="btn btn-light waves-effect"
                        data-bs-dismiss="modal" aria-label="Close">닫기</button>
                  </div>
               </div>
            </form>
         </div>

      </div>

   </div>
</body>
</html>