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

.bm{
	vertical-align : -1.0px;
}

.isize {
	font-size: 20px;
}

.isize>span {
	font-size: 18px;
	vertical-align : 1.5px;
}


.isize:hover  {
    color: #556ee6;
    -webkit-transform: scale(1.5);
    transform: scale(1.5);
    transition-duration : 0.2s;
}
.isize:not(:hover)  {
    color: black;
    -webkit-transform: scale(1.0);
    transform: scale(1.0);
    transition-duration : 0.2s;
}
.bx bxs-like {
	color: #556ee6;
}

.bxs-bookmark-star{
	color:  #556ee6;
}

#sticky {
	position : absolute;
	top :20%;
}

a:hover {
	cursor: pointer;	
}

</style>
<script type="text/javascript">
	$(function(){
		$(".comment").hide();
		
		$(".commentToggle").on("click",function(){
			let clsName = $(this).next().attr("class");
			if (clsName.includes('visible')) {
				$(this).next().hide();
				$(this).next().removeClass("visible");
			}else {
				$(this).next().show();
				$(this).next().addClass("visible");
			}
		});
		$("#fileDown").click(function(){
			$("#fileForm").submit();
			$("#fileDown").css({'color':'#945050'});
		});
		$(".like").click(function(){
			let clsName = $(this).attr("class");
			let pbNum = $(this).children().next().val();
			let id = $("#loginId").text();
			if (clsName.includes('checked')) {
				$(this).removeClass();
				$(this).addClass("bx bx-check-circle isize");
				$(this).css({'color':'black'});
				
				var count = 0;
				$.ajax({
					type : 'get',
					url : '../project/ProjectLikeDecrease',  // 상대경로. 타입을 따로 주지 않아서 get 방식. id값을 컨트롤러로 보내고
					async:false,
					data : {"pbNum" : pbNum ,
							"id" : id},  // "id"는 컨트롤러에 param으로 가는 id임.
					success : function(resp){
						count = resp;
					}
				});
				$(this).children().text(count);	
				
			} else {
				$(this).removeClass();
				$(this).addClass("bx bx-check-double isize checked");
				$(this).css({'color':'#556ee6'});
				var count = 0;
				$.ajax({
					type : 'get',
					url : '../project/ProjectLikeIncrease',  // 상대경로. 타입을 따로 주지 않아서 get 방식. id값을 컨트롤러로 보내고
					async:false,
					data : {"pbNum" : pbNum ,
							"id" : id},  // "id"는 컨트롤러에 param으로 가는 id임.
					success : function(resp){
						count = resp;
					}
				});
				$(this).children().text(count);	
			}
		
		});
		
		$(".bm").click(function(){
			let clsName = $(this).attr("class");
			let pNum = $(".pNum").val();
			let pbNum = $(this).children().val();
			console.log(pbNum);
			if (clsName.includes('checked')) {
				$(this).removeClass();
				$(this).addClass("bx bx-bookmark-plus bm isize");
				$(this).css({'color':'black'});
				$.ajax({
					type : 'get',
					url : '../project/ProjectBookmarkCheckedClear',  // 상대경로. 타입을 따로 주지 않아서 get 방식. id값을 컨트롤러로 보내고
					async: false,
					data : {"pbNum" : pbNum},  // "id"는 컨트롤러에 param으로 가는 id임.
					success : function(resp){
						count = resp;
						var tList = [];
						var bookmarkList = [];
						
						
						 $('.pbSfor').each(function(index,item){
							  tList.push($(this).find('.pbSubject').text());
							  bookmarkList.push($(this).find('.pbSubject'));
						 });
						console.log(tList);
						
						var clickTitle = $(this).text();
						console.log("clickTitle" + clickTitle);
						
						for(var i = 0 ; i < tList.length ; i++ ) {
							console.log("반복문");
							console.log("titleList" + tList[i]);
							if ( resp == tList[i]){
								console.log(tList[i] + " 와 일치");
								$('.bmUl li').eq(i).remove();
							}
						}
					}
				});
				
			} else {
				$(this).removeClass();
				$(this).addClass("bx bxs-bookmark-star bm isize checked");
				$(this).css({'color':'#556ee6'});
				$.ajax({
					type : 'get',
					url : '../project/ProjectBookmarkChecked',  // 상대경로. 타입을 따로 주지 않아서 get 방식. id값을 컨트롤러로 보내고
					async: false,
					data : {"pbNum" : pbNum},  // "id"는 컨트롤러에 param으로 가는 id임.
					success : function(resp){
						count = resp;
						var tList = [];
						var bookmarkList = [];
						
						 $('.pbSfor').each(function(index,item){
							  tList.push($(this).find('.pbSubject').text());
							  bookmarkList.push($(this).find('.pbSubject'));
						 });
						console.log(tList);
						
						var clickTitle = $(this).text();
						console.log("clickTitle" + clickTitle);
						
						for(var i = 0 ; i < tList.length ; i++ ) {
							console.log("반복문");
							console.log("titleList" + tList[i]);
							if ( resp == tList[i]){
								console.log(tList[i] + " 와 일치");
								$('.bmUl').append('<li><a class="text-muted py-2 d-block"><i  class="mdi mdi-chevron-right me-1"></i>  <span class="badge badge-soft-success rounded-pill ms-1 font-size-12 linkTitle">'+resp+'</span></a> </li>');
								pag
							}
						}
					}
				});
			}
		
		});
		
		$(".linkTitle").click(function(){
			console.log("타이틀 클릭")
			var titleList = $(".pbSfor").get();
			var tList = [];
			var moveList = [];
			
			
			 $('.pbSfor').each(function(index,item){
				  tList.push($(this).find('.pbSubject').text());
				  moveList.push($(this).find('.pbSubject').offset());
			 });
			
		
			console.log(tList);
			
			var clickTitle = $(this).text();
			console.log("clickTitle" + clickTitle);
			
			for(var i = 0 ; i < tList.length ; i++ ) {
				console.log("반복문");
				console.log("titleList" + tList[i]);
				if ( clickTitle == tList[i]){
					console.log(tList[i] + " 와 일치");
					console.log(moveList[i] + "moveList");
					$("html, body").animate({scrollTop: moveList[i].top - 200 },300);
				}
			}
		});
		var currentPosition = parseInt($("#sticky").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop(); 
		    $("#sticky").stop().animate({"top":position+currentPosition+"px"},500);
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
                                            <div class="pbSfor">
                                            <h4 class="pbSubject">${pb.PRO_BOARD_SUBJECT }</h4>
                                            </div>
                                            <p class="text-muted mb-4"><i class="mdi mdi-calendar me-1"></i> ${pb.PRO_BOARD_CREATE_DATE }</p>
                                        </div>

                                        <hr>
                                        <div class="text-center">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div>
                                                        <p class="text-muted mb-2">카테고리</p>
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
                                            
                                           
											 <c:if test="${!empty pb.PRO_BOARD_FILE }">
											 <hr>
											 <form action="../project/projectFileDown" id="fileForm" method="post">
										  		 	<i class="mdi mdi-file-download-outline" id="fileDown">${pb.PRO_BOARD_FILE_ORIGINAL }</i>
										  			  <input type="hidden" value="${pb.PRO_BOARD_FILE}" name="filename" >
										  			  <input type="hidden" value="${pb.PRO_BOARD_FILE_ORIGINAL }" name="original" >
										  			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										  	 </form>
										  	</c:if>
                                            <hr>
                                            <c:forEach var="users" items="${pb.PROBOARD_CHECK_USERS }">
                                            	<c:if test="${ users.PRO_BOARD_NUM == pb.PRO_BOARD_NUM}">
                                            		<c:if test="${users.IS_CHECKED == 0 }">
                                            			<i class="bx bx-check-circle isize like">
                                            		</c:if>
                                            		<c:if test="${users.IS_CHECKED == 1 }">
                                            			<i class="bx bx-check-double isize checked like" style="color: #556ee6">
                                            		</c:if>
                                            	</c:if>
											</c:forEach>
													<span class="likeNum" id="lnum">${ pb.PRO_BOARD_LIKE}</span>
													<input type="hidden" class="pbNum" value="${pb.PRO_BOARD_NUM }">
												</i>
											
											 &nbsp;&nbsp;
											<c:if test="${pb.PRO_BOARD_BOOKMARK == 1 }">
												<i class="bx bxs-bookmark-star bm isize checked"  id="bookmark" style="color: #556ee6">
											</c:if>
											<c:if test="${pb.PRO_BOARD_BOOKMARK == 0 }">
												<i class="bx bx-bookmark-plus bm isize"  id="bookmark">
											</c:if>
													<input type="hidden" class="pbNum" value="${pb.PRO_BOARD_NUM }">
												</i>
											
											<hr>
                                            <div class="mt-5">
                                                <h5 class="font-size-15 commentToggle" id="commentToggle"><i
                                                        class="bx bx-message-dots text-muted align-middle me-1"></i>
                                                    Comments </h5>

                                                <div class="comment">
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
                                                 <br><br><br><br><hr><br><br><br><br>
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
                    <div class="card-body p-4" id="sticky">
                        <div class="search-box">
                            <p class="text-muted">키워드 검색</p>
                            <div class="position-relative">
                                <input type="text" class="form-control rounded bg-light border-light"
                                    placeholder="Search...">
                                <i class="mdi mdi-magnify search-icon"></i>
                            </div>
                        </div>

                        <hr class="my-4">

                        <div>
                            <p class="text-muted">카테고리</p>

                            <ul class="list-unstyled fw-medium">
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 즐겨찾기</a></li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 요청</a></li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 진행 <span
                                            class="badge badge-soft-success rounded-pill float-end ms-1 font-size-12">04</span></a>
                                </li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 피드백</a></li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 완료</a></li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 보류<span
                                            class="badge badge-soft-success rounded-pill ms-1 float-end font-size-12">12</span></a>
                                </li>
                            </ul>
                        </div>

                        <hr class="my-4">

                        <div>
                            <p class="text-muted">최근 즐겨찾기</p>

                            <ul class="list-unstyled fw-medium bmUl" >
                            <c:forEach var="title" items="${bmBoard }" >
                                <li><a class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i>
                                            <span class="badge badge-soft-success rounded-pill ms-1 font-size-12 linkTitle">${title }</span></a>
                                </li>
                            </c:forEach>
                            </ul>
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