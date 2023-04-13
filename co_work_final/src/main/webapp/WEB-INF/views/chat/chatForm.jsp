
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html lang="en">

<jsp:include page="../main/header.jsp"/>
    
		
        <meta charset="utf-8" />
        <title>Chat</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico">

        <!-- Bootstrap Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="${pageContext.request.contextPath }/resources/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath }/resources/assets/js/member/jquery-3.6.3.js"></script>
	<style>
	h5{font-weight:bold}
	
	.w-100 user-chat{
	margin-right: auto;
	}
	
	.form-control{
	background-color: #f3f3f9;
	}
	#btnImage{
	float:right;
	border: 0;
	}
	</style>

    </head>

  <!-- <body data-sidebar="dark" data-layout-mode="light"> -->   
	
    <!-- <body data-layout="horizontal" data-topbar="dark"> -->

            

            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->

            <div class="main-content">

                <div class="page-content">
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                    <h4 class="mb-sm-0 font-size-20">Chat</h4>



                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="d-lg-flex">
                            <div class="chat-leftsidebar me-lg-4">
                                <div class="w-100 user-chat">
                                    <div class="py-4 border-bottom">
                                        <div class="d-flex">
                                            <div class="flex-shrink-0 align-self-center me-3">
                                                <img src="../assets/images/users/${userimg }" class="rounded-circle avatar-xs" alt="">
                                            </div>
                                            <div class="flex-grow-1">
                                                 <h5 class="font-size-15 mb-1">내 이름</h5>
                                            </div>

                                            <div>
                                                <div class="dropdown chat-noti-dropdown active">
                                                    <button class="btn" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <i class="bx bx-bell bx-tada"></i>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-end">
                                                      <a class="dropdown-item" href="#">Action</a>
                                                      <a class="dropdown-item" href="#">Another action</a>
                                                      <a class="dropdown-item" href="#">Something else here</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="search-box chat-search-box py-4">
                                        <div class="position-relative">
                                            <input type="text" class="form-control" placeholder="이름을 입력하세요" id="search_word"}>
	                                          <i class="bx bx-search-alt search-icon">
	                                          </i>
                                        </div>
                                    </div>

                                    <div class="chat-leftsidebar-nav">
                                        <ul class="nav nav-pills nav-justified">
                                            <li class="nav-item">
                                                <a href="#chat" data-bs-toggle="tab" aria-expanded="true" class="nav-link active" type="submit">
                                                    <i class="bx bx-chat font-size-20 d-sm-none" ></i>
                                                    <span class="d-none d-sm-block" >검색</span>
                                                </a>
                                            </li>
                                           
                                        </ul>
                                        <div class="tab-content py-4">
                                            <div class="tab-pane show active" id="chat">
                                                <div>
                                                    <ul class="list-unstyled chat-list" data-simplebar style="max-height: 410px;">
 	                                                   <sec:authentication property="principal" var="pinfo" />
 	                                            		    <c:forEach var = "m" items="${deptNames }">    <!-- 컨트롤러에서 m로 담은애 적기 -->
                                                       <c:if test="${m.USER_ID == pinfo.username }">
                                                       <li class=myinfo>
                                                       <input type=hidden value=${m.USER_NAME } id=my_name>
                                                      </c:if>
                                                      <c:if test="${m.USER_ID != pinfo.username }">
                                                        <li>
                                                      </c:if>
                                                       
                                                            <a href="javascript: void(0);">
                                                                <div class="d-flex">
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                    </div>
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                    <input type=hidden id=user_name value=${m.USER_NAME }>
                                                                        <img src="../assets/images/users/${m.USER_IMG }" class="rounded-circle avatar-xs" alt="">
                                                                    </div>
                                                                    <input type=hidden id=user_id value=${m.USER_ID }>
																	<input type="hidden" id="user_img" value="${m.USER_IMG }">
																	<input type="hidden" id="user_name" value="${m.USER_NAME}">
                                                                    <div class="flex-grow-1 overflow-hidden">
                                                                        <h5 class="text-truncate font-size-14 mb-1" ><span>${m.USER_NAME}</span><span> <${m.DEPT_NAME }></span></h5>
                                                                       <!-- <input type="text" value="팝업창 호출" onclick="showPopup()"> -->
                                                                        <p class="text-truncate mb-0">${m.USER_EMAIL }</p>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </li>
                                                     </c:forEach> 

                                                        
                                                    </ul>
                                                </div>
                                            </div>

                                            

                                            
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="w-100 user-chat">
                                <div class="card">
                                    <div class="p-4 border-bottom ">
                                        <div class="row">
                                            <div class="col-md-4 col-9">
                                                <h5 class="font-size-15 mb-1">채팅</h5>
                                                
                                            </div>
                                            
                                                    
                                            <div class="col-md-8 col-3">
                                                <button type="button" id="btnImage" ><img src = "../assets/images/board/remove.png" alt="" width=15px height=15px style=border:0>
                                                            </button>
                                            </div>
                                        </div>
                                    </div>
    
                  <div class="w-100 user-chat">
                                <div class="card">
                                    <div>
                                        <div class="chat-conversation p-3" style="height:485px">
											<ul class="list-unstyled mb-0" data-simplebar style="height: 450px; overflow: scroll;" id="fix">
                                           <div class="simplebar-wrapper" style="margin: 0px;">
                                           <div class="simplebar-height-auto-observer-wrapper">
                                           <div class="simplebar-height-auto-observer"></div>
                                           </div>
                                           <div class="simplebar-mask">
                                           <div class="simplebar-offset" style="right: -18.8889px; bottom: 0px;">
                                           <div class="simplebar-content-wrapper" style="height: auto; overflow: hidden scroll;">
                                           <div class="simplebar-content" style="padding: 0px;">
                                           
                                                 <li> 
                                                    <div class="chat-day-title">
                                                        <span class="title">Today</span>
                                                    </div>
                                                </li>
                                                </div>
                                                </div>
                                                </div>
                                                </div>
                                                </div>
                                            </ul>   
                                        </div>  
                                        <div class="p-3 chat-input-section">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="position-relative">
                                                        <input type="text" class="form-control chat-input" placeholder="Enter Message...">
                                                        <div class="chat-input-links" id="tooltip-container">
                                                            <ul class="list-inline mb-0">
                                                                <li class="list-inline-item"><a href="javascript: void(0);" title="Emoji"><i class="mdi mdi-emoticon-happy-outline"></i></a></li>
                                                                <li class="list-inline-item"><a href="javascript: void(0);" title="Images"><i class="mdi mdi-file-image-outline"></i></a></li>
                                                                <li class="list-inline-item"><a href="javascript: void(0);" title="Add Files"><i class="mdi mdi-file-document-outline"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-auto">
                                                    <button type="button" class="btn btn-primary btn-rounded chat-send w-md waves-effect waves-light"><span class="d-none d-sm-inline-block me-2" id="btnSend">Send</span> <i class="mdi mdi-send"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div> <!-- container-fluid -->
                </div>

                                </div>
                            </div>

                        </div>
                        <!-- end row -->
                        
                    </div> <!-- container-fluid -->
                </div>
                <!-- End Page-content -->

                
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6">
                                <script>document.write(new Date().getFullYear())</script> © Skote.
                            </div>
                            <div class="col-sm-6">
                                <div class="text-sm-end d-none d-sm-block">
                                    Design & Develop by Themesbrand
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
            <!-- end main content-->

        </div>
        <!-- END layout-wrapper -->

        <!-- Right Sidebar -->
        <div class="right-bar">
            <div data-simplebar class="h-100">
                <div class="rightbar-title d-flex align-items-center px-3 py-4">
            
                    <h5 class="m-0 me-2">Settings</h5>

                    <a href="javascript:void(0);" class="right-bar-toggle ms-auto">
                        <i class="mdi mdi-close noti-icon"></i>
                    </a>
                </div>

                <!-- Settings -->
                <hr class="mt-0" />
                <h6 class="text-center mb-0">Choose Layouts</h6>

                <div class="p-4">
                    <div class="mb-2">
                        <img src="assets/images/layouts/layout-1.jpg" class="img-thumbnail" alt="layout images">
                    </div>

                    <div class="form-check form-switch mb-3">
                        <input class="form-check-input theme-choice" type="checkbox" id="light-mode-switch" checked>
                        <label class="form-check-label" for="light-mode-switch">Light Mode</label>
                    </div>
    
                    <div class="mb-2">
                        <img src="assets/images/layouts/layout-2.jpg" class="img-thumbnail" alt="layout images">
                    </div>
                    <div class="form-check form-switch mb-3">
                        <input class="form-check-input theme-choice" type="checkbox" id="dark-mode-switch">
                        <label class="form-check-label" for="dark-mode-switch">Dark Mode</label>
                    </div>
    
                    <div class="mb-2">
                        <img src="assets/images/layouts/layout-3.jpg" class="img-thumbnail" alt="layout images">
                    </div>
                    <div class="form-check form-switch mb-3">
                        <input class="form-check-input theme-choice" type="checkbox" id="rtl-mode-switch">
                        <label class="form-check-label" for="rtl-mode-switch">RTL Mode</label>
                    </div>

                    <div class="mb-2">
                        <img src="assets/images/layouts/layout-4.jpg" class="img-thumbnail" alt="layout images">
                    </div>
                    <div class="form-check form-switch mb-5">
                        <input class="form-check-input theme-choice" type="checkbox" id="dark-rtl-mode-switch">
                        <label class="form-check-label" for="dark-rtl-mode-switch">Dark RTL Mode</label>
                    </div>

            
                </div>

            </div> <!-- end slimscroll-menu-->
        </div>
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

        <!-- JAVASCRIPT -->
        <script src="${pageContext.request.contextPath }/resources/assets/js/chat_js/chat.js"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/libs/jquery/jquery.min.js"></script>
  	 	<script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
   		<script src="${pageContext.request.contextPath }/resources/assets/libs/metismenu/metisMenu.min.js"></script>
  		<script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
  		<script src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>
		<!-- owl.carousel js -->
   		 <script src="${pageContext.request.contextPath }/resources/assets/libs/owl.carousel/owl.carousel.min.js"></script>
   		 <!-- auth-2-carousel init -->
    	<script src="${pageContext.request.contextPath }/resources/assets/js/pages/auth-2-carousel.init.js"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>

    </body>
</html>