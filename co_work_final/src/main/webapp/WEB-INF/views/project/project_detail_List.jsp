<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<jsp:include page="../main/header.jsp"/>

<link href="${pageContext.request.contextPath }/resources/assets/css/project_Css/project.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-WK8VrW20YdO7VrnJFTQo0iFZeqanIayEs/EzjpPYUp3vvSK1j01wGATIifvlYCh0dKazFGPb+pulzU6C1U6I1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
.page-content{
   margin-left: 15%;
   width: 75%;
}
#icon_id{
   display: none;
}
#sa-success{
   display: none;
}
.input-group-text i.fa {
  font-size: 20px;
}
.project-list {
  display: block; 
}
</style>
<body>
<div class="page-content">
   <div class="container-fluid">
       <ul class="nav nav-tabs nav-tabs-custom justify-content-center pt-2" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="projectDetailFeed?id=ADMINTEST&pNum=6" role="tab">
                               	<i class="mdi mdi-timeline-text-outline"></i>
                                FEED
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="" id="ProjectDetailList" role="tab"
                            aria-selected="true">
                               	<i class="mdi mdi-playlist-check"></i>
                                LIST
                            </a>
                        </li>
                    </ul>
                    <br>
      <!-- start page title -->
      <!-- end page title -->
      <div class="row">
         <div class="col-lg-12">
            <div class="">
               <form method="get" action="/search">
               <div class="input-group">
                 <div class="input-group-prepend">
                   <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="dropdownButton">▼</button>
                   <div class="dropdown-menu" aria-labelledby="dropdownButton">
                     <a class="dropdown-item" href="#" data-filter="항목 1">내 업무</a>
                     <a class="dropdown-item" href="#" data-filter="항목 2">전체</a>
                   </div>
                 </div>
                 <input type="text" class="form-control" id="keyword" name="keyword" onkeyup="filterResults()" placeholder="업무명 또는 업무번호를 입력하세요">
               </div>
               </form>
               </div><br><br>
                           
               <div class="project-list">
               <div class="table-responsive">
               <div style="text-align:right">
               <a href="../project/add" class="btn btn-secondary waves-effect waves-light">업무 추가</a></div>
                  <table
                     class="table project-list-table table-nowrap align-middle table-borderless"
                     style="margin-top: -40px;">
                     <thead>
                        <tr>
                                    <th scope="col">업무명</th>
                                    <th scope="col">상태</th>
                                    <th scope="col">우선순위</th>
                                    <th scope="col">담당자</th>
                                    <th scope="col">시작일</th>
                                    <th scope="col">마감일</th>
                                    <th scope="col">등록일</th>
                                    <th scope="col">번호</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="p" items="${ProjectDetailList}">
                               <tr>
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-dark">
                                 <c:out value="${p.PRO_BOARD_SUBJECT }"/>
                              </a></h5>
                                        
                                    </td>
                                    <td>
                                    <c:if test="${p.PRO_BOARD_STATE eq '진행중'}">
                                     <h5 id="getState" aria-valuenow = "${PRO_BOARD_STATE }" class="text-truncate font-size-14 text-success" >
                                          <c:out value="${p.PRO_BOARD_STATE    }"/>
                              			</h5>
                                    </c:if>
                                    <c:if test="${p.PRO_BOARD_STATE eq '마감'}">
                                     <h5 id="getState" aria-valuenow = "${PRO_BOARD_STATE }" class="text-truncate font-size-14 text-secondary" >
                                          <c:out value="${p.PRO_BOARD_STATE    }"/>
                              		</h5>
                                    </c:if>
                                      
                                    </td>
                                    <td>
                                    <c:if test="${p.PRO_BOARD_PRIORITY eq 'LOW'}">
                                      <h5 class="text-truncate font-size-14"><a href="#" class="text-primary">
		                                 <c:out value="${p.PRO_BOARD_PRIORITY }"/>
		                              </a></h5>
                                    </c:if>
                                    <c:if test="${p.PRO_BOARD_PRIORITY eq 'HIGH'}">
                                 	    <h5 class="text-truncate font-size-14"><a href="#" class="text-danger">
	                                 		<c:out value="${p.PRO_BOARD_PRIORITY }"/>
	                              		</a></h5>
                                    </c:if>
                                    <c:if test="${p.PRO_BOARD_PRIORITY eq 'NONE'}">
                                     <h5 class="text-truncate font-size-14"><a href="#" class="text-secondary">
	                                 		<c:out value="${p.PRO_BOARD_PRIORITY }"/>
	                              		</a></h5>
                                    </c:if>
                                 
                                        
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-dark">
                                 <c:out value="${p.PRO_BOARD_CREATER_NAME }"/>
                              </a></h5>
                                        
                                    </td>
                               <c:if test="${p.PRO_BOARD_STATE eq '마감'}">
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-secondary">
                                 <c:out value="${p.PRO_BOARD_START }"/>
                              </a></h5>
                                        
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-secondary">
                                 <c:out value="${p.PRO_BOARD_END }"/>
                              </a></h5>
                                        
                                    </td>
                               
                               </c:if>
                               <c:if test="${p.PRO_BOARD_STATE ne '마감'}">
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-info">
                                 <c:out value="${p.PRO_BOARD_START }"/>
                              </a></h5>
                                        
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-danger">
                                 <c:out value="${p.PRO_BOARD_END }"/>
                              </a></h5>
                                        
                                    </td>
                               
                               </c:if>
             
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-dark">
                                 <c:out value="${p.PRO_BOARD_CREATE_DATE }"/>
                              </a></h5>
                                        
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-dark">
                                 <c:out value="${p.PRO_BOARD_NUM }"/>
                              </a></h5>
                                        
                                    </td></tr>
                                    
                               </c:forEach>
                               
                          

                     </tbody>
                  </table>
               </div>
            </div>
         </div>
      </div>
   </div>
      <!-- end row -->

      <div class="row">
         <div class="col-12">
            <div class="text-center my-3">
               <!--   
                  <a href="javascript:void(0);" class="text-success"><i class="bx bx-loader bx-spin font-size-18 align-middle me-2"></i> Load more </a>
               -->
            </div>
         </div>
         <!-- end col-->
      </div>
      <!-- end row -->
   </div>
   <!-- container-fluid -->
<!-- End Page-content -->
</body>
<script>


$(document).ready(function(){
     $(".dropdown-toggle").click(function(event){
       $(this).siblings(".dropdown-menu").toggle();
       console.log(".dropdown-toggle click");
       return false;   //버블링 때문에 false를 줘야함
     });
     
     
     //body > div.page-content > div.container-fluid > div > div > div:nth-child(1) > form > div > div
     $( 'body' ).click(function(event) {
        display = $(".input-group-prepend > .dropdown-menu").css("display")
        console.log( display)
        if ("block" == display  ) {           
           $(".dropdown-menu").hide();
            console.log("false")
        }
     })
     
     
    /*  window.onclick = function(event) {
        if(event.target == $("#dropdownButton")){
           console.log("사라지지않아요");
        }else{
           console.log("사라져요");
        $(".dropdown-menu").hide();
        }
      }; */
   });


function filterResults() {
    var input = document.getElementById("keyword");
    var filter = input.value.toUpperCase();
    var table = document.getElementsByTagName("table")[0];
    var tr = table.getElementsByTagName("tr");
    
    for (var i = 0; i < tr.length; i++) {
        var td1 = tr[i].getElementsByTagName("td")[0];
        var td2 = tr[i].getElementsByTagName("td")[7];
        if (td1 || td2) {
            var txtValue1 = td1.textContent || td1.innerText;
            var txtValue2 = td2.textContent || td2.innerText;
            if (txtValue1.toUpperCase().indexOf(filter) > -1 || txtValue2.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }       
    }
}

const dropdownButton = document.querySelector('#dropdownButton');
dropdownButton.addEventListener('click', (event) => {
  const filter = event.target.dataset.filter;
  if (filter === '항목 1') {
    const projects = getProjectsByCreatorId('HTA123');
    renderProjects(projects);
  } else if (filter === '항목 2') {
    const projects = getAllProjects();
    renderProjects(projects);
  }
});

function getProjectsByCreatorId(creatorId) {
  const projects = getAllProjects();
  return projects.filter((project) => project.PRO_BOARD_CREATER_ID === creatorId);
}

function getAllProjects() {
  $.ajax({
    url: "/projects/all",
    type: "GET",
    dataType: "json",
    success: function (data) {
      renderProjects(data);
    },
    error: function (xhr, status, error) {
      console.error(error);
    },
  });
}

function renderProjects(projects) {
  var tbody = $(".project-list tbody");
  tbody.empty();
  for (var i = 0; i < projects.length; i++) {
    var project = projects[i];
    var row = $("<tr>");
    row.append($("<td>").text(project.title));
    row.append($("<td>").text(project.status));
    row.append($("<td>").text(project.priority));
    row.append($("<td>").text(project.assignee));
    row.append($("<td>").text(project.start));
    row.append($("<td>").text(project.deadline));
    row.append($("<td>").text(project.create_date));
    row.append($("<td>").text(project.number));
    tbody.append(row);
  }
}

const myTasksButton = document.querySelector('#myTasksButton');
myTasksButton.addEventListener('click', (event) => {
  const creatorId = event.target.dataset.creatorId;
  const projects = getProjectsByCreatorId(creatorId);
  renderProjects(projects);
});




</script>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>