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
<div class="page-content">
	<div class="container-fluid">
		
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
					      <a class="dropdown-item" href="#" data-filter="항목 2">요청한 업무</a>
					      <a class="dropdown-item" href="#" data-filter="항목 3">전체</a>
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
							class="table project-list-table table-nowrap align-middle table-borderless">
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
                                    	<h5 id="getState" aria-valuenow = "${PRO_BOARD_STATE }" class="text-truncate font-size-14" >
                                    		<c:out value="${p.PRO_BOARD_STATE	 }"/>
										</h5>
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-dark">
											<c:out value="${p.PRO_BOARD_PRIORITY }"/>
										</a></h5>
                                        
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-dark">
											<c:out value="${p.PRO_BOARD_CREATER_NAME }"/>
										</a></h5>
                                        
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-dark">
											<c:out value="${p.PRO_BOARD_START }"/>
										</a></h5>
                                        
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-dark">
											<c:out value="${p.PRO_BOARD_END }"/>
										</a></h5>
                                        
                                    </td>
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
<body>
</body>
<script>


$(document).ready(function(){
	  $(".dropdown-toggle").click(function(event){
	    $(this).siblings(".dropdown-menu").toggle();
	    console.log(".dropdown-toggle click");
	    return false;	//버블링 때문에 false를 줘야함
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
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("keyword");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  
	  var dropdownMenu = document.querySelector('.dropdown-menu');
	  dropdownMenu.addEventListener('click', function (e) {
	    var filterValue = e.target.dataset.filter.toUpperCase();
	    for (i = 0; i < tr.length; i++) {
	      td = tr[i].getElementsByTagName("td")[0];
	      if (td) {
	        txtValue = td.textContent || td.innerText;
	        if (txtValue.toUpperCase().indexOf(filterValue) > -1 && txtValue.toUpperCase().indexOf(filter) > -1) {
	          tr[i].style.display = "";
	        } else {
	          tr[i].style.display = "none";
	        }
	      }
	    }
	  });
	}


</script>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>