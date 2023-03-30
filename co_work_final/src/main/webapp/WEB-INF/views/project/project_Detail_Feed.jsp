<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<jsp:include page="../main/header.jsp"/>
<link href="${pageContext.request.contextPath }/resources/assets/css/project_Css/project.css" rel="stylesheet" type="text/css" />
<style>
.page-content{
	margin-left: 400px;
}
#icon_id{
	display: none;
}
#sa-success{
	display: none;
}
.page-content{
	width: 150vh;
}
.mdi-file-download-outline{
	font-size: 14px;
}

.mdi-file-download-outline:hover {
	color: blue;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#comment").hide();
		
		$("#commentToggle").on("click",function(){
			let clsName = $("#commentToggle").attr("class");
			if (clsName.includes('visible')) {
				$("#comment").hide();
				$("#commentToggle").removeClass("visible");
			}else {
				$("#comment").show();
				$("#commentToggle").addClass("visible");
			}
			
		});
	});
</script>
<div class="page-content">
    <div class="container-fluid">
        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                    <h4 class="mb-sm-0 font-size-18">${projectName }</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">${projectName }</a></li>
                            <li class="breadcrumb-item active">FEED</li>
                        </ol>
                    </div>

                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-xl-9 col-lg-8">
                <div class="card">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs nav-tabs-custom justify-content-center pt-2" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#all-post" role="tab">
                                All Post
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#archive" role="tab">
                                Archive
                            </a>
                        </li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content p-4">
                        <div class="tab-pane active" id="all-post" role="tabpanel">
                            <div>
                           <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="pt-3">
                            <div class="row justify-content-center">
                            <c:forEach var="pb" items="${pblist }">
                                <div class="col-xl-8">
                                    <div>
                                        <div class="text-center">
                                            <div class="mb-4">
                                                <a href="#" class="badge bg-light font-size-12">
                                                    <i class="bx bx-purchase-tag-alt align-middle text-muted me-1"></i>
                                                    ${pb.PRO_BOARD_CARTEGORY }
                                                </a>
                                            </div>
                                            <h4>${pb.PRO_BOARD_SUBJECT }</h4>
                                            <p class="text-muted mb-4"><i class="mdi mdi-calendar me-1"></i> ${pb.PRO_BOARD_CREATE_DATE }</p>
                                        </div>

                                        <hr>
                                        <div class="text-center">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div>
                                                        <p class="text-muted mb-2">Categories</p>
                                                        <h5 class="font-size-15">${pb.PRO_BOARD_CARTEGORY }</h5>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="mt-4 mt-sm-0">
                                                        <p class="text-muted mb-2">기간</p>
                                                        <h5 class="font-size-15">${pb.PRO_BOARD_START } ~ ${pb.PRO_BOARD_END }</h5>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="mt-4 mt-sm-0">
                                                        <p class="text-muted mb-2">작성자</p>
                                                        <h5 class="font-size-15">${pb.PRO_BOARD_CREATER_ID }</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 
                                        <hr>
 										   c:if img 구간  
                                        <div class="my-5">
                                    
                                            <img src="assets/images/small/img-2.jpg" alt=""
                                                class="img-thumbnail mx-auto d-block">
                                        </div>
										-->
                                        <hr>

                                        <div class="mt-4">
                                            <div class="text-muted font-size-14">
                                         		${pb.PRO_BOARD_CONTENT }
                                            </div>
                                            <br>
                                            <hr>
                                           
											 <c:if test="${!empty pb.PRO_BOARD_FILE }">
											 <form action="/project/projectFileDown" method="post">
										  		 	<i class="mdi mdi-file-download-outline">${pb.PRO_BOARD_FILE }</i>
										  			  <input type="hidden" value="${pb.PRO_BOARD_FILE}" name="filename" >
										  			  <input type="hidden" value="${boarddata.BOARD_ORIGINAL }" name="original" >
										  			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										  	 </form>
										  	</c:if>
                                            <hr>

                                            <div class="mt-5">
                                                <h5 class="font-size-15" id="commentToggle"><i
                                                        class="bx bx-message-dots text-muted align-middle me-1"></i>
                                                    Comments </h5>

                                                <div id="comment">
                                                    <div class="d-flex py-3">
                                                        <div class="flex-shrink-0 me-3">
                                                            <div class="avatar-xs">
                                                                <div
                                                                    class="avatar-title rounded-circle bg-light text-primary">
                                                                    <i class="bx bxs-user"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="flex-grow-1">
                                                            <h5 class="font-size-14 mb-1">Delores Williams <small
                                                                    class="text-muted float-end">1 hr Ago</small></h5>
                                                            <p class="text-muted">If several languages coalesce, the
                                                                grammar of the resulting language is more simple and
                                                                regular than that of the individual</p>
                                                            <div>
                                                                <a href="javascript: void(0);" class="text-success"><i
                                                                        class="mdi mdi-reply"></i> Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex py-3 border-top">
                                                        <div class="flex-shrink-0 me-3">
                                                            <div class="avatar-xs">
                                                                <img src="assets/images/users/avatar-2.jpg" alt=""
                                                                class="img-fluid d-block rounded-circle">
                                                            </div>
                                                        </div>
                                                        <div class="flex-grow-1">
                                                            <h5 class="font-size-14 mb-1">Clarence Smith <small
                                                                    class="text-muted float-end">2 hrs Ago</small></h5>
                                                            <p class="text-muted">Neque porro quisquam est, qui dolorem
                                                                ipsum quia dolor sit amet</p>
                                                            <div>
                                                                <a href="javascript: void(0);" class="text-success"><i
                                                                        class="mdi mdi-reply"></i> Reply</a>
                                                            </div>

                                                            <div class="d-flex pt-3">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <div class="avatar-xs">
                                                                        <div
                                                                            class="avatar-title rounded-circle bg-light text-primary">
                                                                            <i class="bx bxs-user"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="flex-grow-1">
                                                                    <h5 class="font-size-14 mb-1">Silvia Martinez <small
                                                                            class="text-muted float-end">2 hrs
                                                                            Ago</small></h5>
                                                                    <p class="text-muted">To take a trivial example,
                                                                        which of us ever undertakes laborious physical
                                                                        exercise</p>
                                                                    <div>
                                                                        <a href="javascript: void(0);"
                                                                            class="text-success"><i
                                                                                class="mdi mdi-reply"></i> Reply</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex py-3 border-top">
                                                        <div class="flex-shrink-0 me-3">
                                                            <div class="avatar-xs">
                                                                <div
                                                                    class="avatar-title rounded-circle bg-light text-primary">
                                                                    <i class="bx bxs-user"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="flex-grow-1">
                                                            <h5 class="font-size-14 mb-1">Keith McCoy <small
                                                                    class="text-muted float-end">12 Aug</small></h5>
                                                            <p class="text-muted">Donec posuere vulputate arcu.
                                                                phasellus accumsan cursus velit</p>
                                                            <div>
                                                                <a href="javascript: void(0);" class="text-success"><i
                                                                        class="mdi mdi-reply"></i> Reply</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="mt-4">
                                                <h5 class="font-size-16 mb-3">Leave a Message</h5>

                                                <form>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                            <a href="javascript: void(0);"
																class="d-inline-block"> <img
																src="../resources/assets/images/users/profile.png" alt=""
																class="rounded-circle avatar-xs">
															</a>
                                                                <label for="commentname-input"
                                                                    class="form-label">${id }</label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="commentmessage-input"
                                                            class="form-label">Message</label>
                                                        <textarea class="form-control" id="commentmessage-input"
                                                            placeholder="Your message..." rows="3"></textarea>
                                                    </div>

                                                    <div class="text-end">
                                                        <button type="submit"
                                                            class="btn btn-success w-sm">Submit</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
                            </div>
                        </div>
                    </div>
                    <!-- end card body -->
                </div>
                <!-- end card -->
            </div>
            <!-- end col -->
        </div>
        <!-- end row -->
   
        
                            </div>
                        </div>
                        
                    </div>

                </div>
            </div>

            <div class="col-xl-3 col-lg-4">
                <div class="card">
                    <div class="card-body p-4">
                        <div class="search-box">
                            <p class="text-muted">Search</p>
                            <div class="position-relative">
                                <input type="text" class="form-control rounded bg-light border-light"
                                    placeholder="Search...">
                                <i class="mdi mdi-magnify search-icon"></i>
                            </div>
                        </div>

                        <hr class="my-4">

                        <div>
                            <p class="text-muted">Categories</p>

                            <ul class="list-unstyled fw-medium">
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> Design</a></li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> Development <span
                                            class="badge badge-soft-success rounded-pill float-end ms-1 font-size-12">04</span></a>
                                </li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> Business</a></li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> Project</a></li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> Travel<span
                                            class="badge badge-soft-success rounded-pill ms-1 float-end font-size-12">12</span></a>
                                </li>
                            </ul>
                        </div>

                        <hr class="my-4">

                        <div>
                            <p class="text-muted">Archive</p>

                            <ul class="list-unstyled fw-medium">
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 2020 <span
                                            class="badge badge-soft-success rounded-pill float-end ms-1 font-size-12">03</span></a>
                                </li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 2019 <span
                                            class="badge badge-soft-success rounded-pill float-end ms-1 font-size-12">06</span></a>
                                </li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 2018 <span
                                            class="badge badge-soft-success rounded-pill float-end ms-1 font-size-12">05</span></a>
                                </li>
                            </ul>
                        </div>

                        <hr class="my-4">

                        <div>
                            <p class="text-muted mb-2">Popular Posts</p>

                            <div class="list-group list-group-flush">

                                <a href="#" class="list-group-item text-muted py-3 px-2">
                                    <div class="d-flex align-items-center">
                                        <div class="me-3">
                                            <img src="assets/images/small/img-7.jpg" alt=""
                                                class="avatar-md h-auto d-block rounded">
                                        </div>
                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="font-size-13 text-truncate">${pb.PRO_BOARD_SUBJECT }</h5>
                                            <p class="mb-0 text-truncate">10 Apr, 2020</p>
                                        </div>
                                    </div>
                                </a>

                                <a href="#" class="list-group-item text-muted py-3 px-2">
                                    <div class="d-flex align-items-center">
                                        <div class="me-3">
                                            <img src="assets/images/small/img-4.jpg" alt=""
                                                class="avatar-md h-auto d-block rounded">
                                        </div>
                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="font-size-13 text-truncate">Drawing a sketch</h5>
                                            <p class="mb-0 text-truncate">24 Mar, 2020</p>
                                        </div>
                                    </div>
                                </a>

                                <a href="#" class="list-group-item text-muted py-3 px-2">
                                    <div class="d-flex align-items-center">
                                        <div class="me-3">
                                            <img src="assets/images/small/img-6.jpg" alt=""
                                                class="avatar-md h-auto d-block rounded">
                                        </div>
                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="font-size-13 text-truncate">Project discussion with team</h5>
                                            <p class="mb-0 text-truncate">11 Mar, 2020</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>

                        <hr class="my-4">

                        <div>
                            <p class="text-muted">Tags</p>

                            <div class="d-flex flex-wrap gap-2 widget-tag">
                                <div><a href="#" class="badge bg-light font-size-12">Design</a></div>
                                <div><a href="#" class="badge bg-light font-size-12">Development</a></div>
                                <div><a href="#" class="badge bg-light font-size-12">Business</a></div>
                                <div><a href="#" class="badge bg-light font-size-12">Project</a></div>
                                <div><a href="#" class="badge bg-light font-size-12">Travel</a></div>
                                <div><a href="#" class="badge bg-light font-size-12">Lifestyle</a></div>
                                <div><a href="#" class="badge bg-light font-size-12">Photography</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end card -->
            </div>
        </div>
        <!-- end row -->

    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->
<!-- End Page-content -->
</body>
<script src="project_js/project_add.js"></script>
<script src="project_js/project_list_onload.js"></script>
<script type="text/javascript">
$(function(){
})
</script>
<jsp:include page="../main/footer.jsp"></jsp:include>
  <script src="${pageContext.request.contextPath }/resources/assets/js/project_js/project_add.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/project_js/project_list_onload.js"></script>
	<script type="text/javascript">
	$(function(){
		$(".team_icon").click(function(){
			$("#stateForm").submit(function(){
				
			});
			
			   console.log("들어옴");
			   var p = $(this).parent().attr("id");
			   var state = $("#state").val();
			   console.log(state);
			   console.log(p);
			   $.ajax({			
					url: "ProjectList.po",  
		 			type:"GET",
		 			success:function(response) {
		 				console.log(response);
		 			},
		 			error:function(xhr,status,msg){
		 				console.log("상태값 : " + status + " Http에러메시지 : "+msg);
		 			}
		 	   });
		});
	});
	</script>
</html>