<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
		
        <meta charset="utf-8" />
        <jsp:include page="../main/header.jsp"/>
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
	</style>
	
	<script>
		function showPopup (user_name){
			window.open("chat/chatting?user_name="+user_name, '_blank', "width=600, height=600, top=10, left=10");
		//	wondow.close();
		}
		
	</script>

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
                                                <img src="assets/images/users/avatar-1.jpg" class="avatar-xs rounded-circle" alt="">
                                            </div>
                                            <div class="flex-grow-1">
                                                <h5 class="font-size-15 mb-1">${loginid}</h5>
                                                <p class="text-muted mb-0"><i class="mdi mdi-circle text-success align-middle me-1"></i> Active</p>
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
                                            <input type="text" class="form-control" placeholder="이름 혹은 팀명을 입력하세요" name="search_word" value="${search_word}" }>
<!--                                             <button class="bx bx-search-alt search-icon" type="submit"></button>
 -->                                        </div>
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
	                                                   
                                                        <li>
	                                            		    <c:forEach var = "m" items="${members }">    <!-- 컨트롤러에서 m로 담은애 적기 -->
                                                            <a href="javascript: void(0);">
                                                                <div class="d-flex">
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                        <i class="mdi mdi-circle text-success font-size-10"></i>
                                                                    </div>
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                        <img src="assets/images/users/${m.user_img }" class="rounded-circle avatar-xs" alt="">
                                                                    </div>

                                                                    <div class="flex-grow-1 overflow-hidden">
                                                                        <h5 class="text-truncate font-size-14 mb-1" onclick="showPopup('${m.user_id}')">${m.user_name}, ${m.dept_name }</h5>
                                                                       <!-- <input type="text" value="팝업창 호출" onclick="showPopup()"> -->
                                                                        <p class="text-truncate mb-0">${m.user_email }</p>
                                                                    </div>
                                                                    <div class="font-size-11">12 min</div>
                                                                </div>
                                                            </a>
                                                     </c:forEach> 
                                                        </li>

                                                        
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
                                                <ul class="list-inline user-chat-nav text-end mb-0">
                                                    <li class="list-inline-item d-none d-sm-inline-block">
                                                        <div class="dropdown">
                                                            <button class="btn nav-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="bx bx-search-alt-2"></i>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-end dropdown-menu-md">
                                                                <form class="p-3">
                                                                    <div class="form-group m-0">
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                                                                            
                                                                            <button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
                                                                            
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-inline-item  d-none d-sm-inline-block">
                                                        <div class="dropdown">
                                                            <button class="btn nav-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="bx bx-cog"></i>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-end">
                                                                <a class="dropdown-item" href="#">View Profile</a>
                                                                <a class="dropdown-item" href="#">Clear chat</a>
                                                                <a class="dropdown-item" href="#">Muted</a>
                                                                <a class="dropdown-item" href="#">Delete</a>
                                                            </div>
                                                        </div>
                                                    </li>
    
                                                    <li class="list-inline-item">
                                                        <div class="dropdown">
                                                            <button class="btn nav-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="bx bx-dots-horizontal-rounded"></i>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-end">
                                                                <a class="dropdown-item" href="#">Action</a>
                                                                <a class="dropdown-item" href="#">Another action</a>
                                                                <a class="dropdown-item" href="#">Something else</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
    
                  <div class="w-100 user-chat">
                                <div class="card">
                                    <div class="p-4 border-bottom ">
                                        <div class="row">
                                            <div class="col-md-4 col-9">
                                                <h5 class="font-size-15 mb-1">${user_name}Steven Franklin</h5>
                                                <p class="text-muted mb-0"><i class="mdi mdi-circle text-success align-middle me-1"></i> Active now</p>
                                            </div>
                                            <div class="col-md-8 col-3">
                                                <ul class="list-inline user-chat-nav text-end mb-0">
                                                    <li class="list-inline-item d-none d-sm-inline-block">
                                                        <div class="dropdown">
                                                            <button class="btn nav-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="bx bx-search-alt-2"></i>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-end dropdown-menu-md">
                                                                <form class="p-3">
                                                                    <div class="form-group m-0">
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                                                                            
                                                                            <button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
                                                                            
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-inline-item  d-none d-sm-inline-block">
                                                        <div class="dropdown">
                                                            <button class="btn nav-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="bx bx-cog"></i>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-end">
                                                                <a class="dropdown-item" href="#">View Profile</a>
                                                                <a class="dropdown-item" href="#">Clear chat</a>
                                                                <a class="dropdown-item" href="#">Muted</a>
                                                                <a class="dropdown-item" href="#">Delete</a>
                                                            </div>
                                                        </div>
                                                    </li>
    
                                                    <li class="list-inline-item">
                                                        <div class="dropdown">
                                                            <button class="btn nav-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="bx bx-dots-horizontal-rounded"></i>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-end">
                                                                <a class="dropdown-item" href="#">Action</a>
                                                                <a class="dropdown-item" href="#">Another action</a>
                                                                <a class="dropdown-item" href="#">Something else</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
    
    
                                    <div>
                                        <div class="chat-conversation p-3">
                                            <ul class="list-unstyled mb-0" data-simplebar style="max-height: 486px;">
                                                <li> 
                                                    <div class="chat-day-title">
                                                        <span class="title">Today</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="conversation-list">
                                                        <div class="dropdown">
    
                                                            <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="bx bx-dots-vertical-rounded"></i>
                                                              </a>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="#">Copy</a>
                                                                <a class="dropdown-item" href="#">Save</a>
                                                                <a class="dropdown-item" href="#">Forward</a>
                                                                <a class="dropdown-item" href="#">Delete</a>
                                                            </div>
                                                        </div>
                                                        <div class="ctext-wrap">
                                                            <div class="conversation-name">Steven Franklin</div>
                                                            <p>
                                                                Hello!
                                                            </p>
                                                            <p class="chat-time mb-0"><i class="bx bx-time-five align-middle me-1"></i> 10:00</p>
                                                        </div>
                                                        
                                                    </div>
                                                </li>
    
                                                <li class="right">
                                                    <div class="conversation-list">
                                                        <div class="dropdown">
    
                                                            <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="bx bx-dots-vertical-rounded"></i>
                                                              </a>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="#">Copy</a>
                                                                <a class="dropdown-item" href="#">Save</a>
                                                                <a class="dropdown-item" href="#">Forward</a>
                                                                <a class="dropdown-item" href="#">Delete</a>
                                                            </div>
                                                        </div>
                                                        <div class="ctext-wrap">
                                                            <div class="conversation-name">Henry Wells</div>
                                                            <p>
                                                                Hi, How are you? What about our next meeting?
                                                            </p>
    
                                                            <p class="chat-time mb-0"><i class="bx bx-time-five align-middle me-1"></i> 10:02</p>
                                                        </div>
                                                    </div>
                                                </li>

                                                <li>
                                                    <div class="conversation-list">
                                                        <div class="dropdown">
    
                                                            <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="bx bx-dots-vertical-rounded"></i>
                                                              </a>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="#">Copy</a>
                                                                <a class="dropdown-item" href="#">Save</a>
                                                                <a class="dropdown-item" href="#">Forward</a>
                                                                <a class="dropdown-item" href="#">Delete</a>
                                                            </div>
                                                        </div>
                                                        <div class="ctext-wrap">
                                                            <div class="conversation-name">Steven Franklin</div>
                                                            <p>
                                                                Yeah everything is fine
                                                            </p>
                                                            
                                                            <p class="chat-time mb-0"><i class="bx bx-time-five align-middle me-1"></i> 10:06</p>
                                                        </div>
                                                        
                                                    </div>
                                                </li>
    
                                                <li class="last-chat">
                                                    <div class="conversation-list">
                                                        <div class="dropdown">
    
                                                            <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="bx bx-dots-vertical-rounded"></i>
                                                              </a>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="#">Copy</a>
                                                                <a class="dropdown-item" href="#">Save</a>
                                                                <a class="dropdown-item" href="#">Forward</a>
                                                                <a class="dropdown-item" href="#">Delete</a>
                                                            </div>
                                                        </div>
                                                        <div class="ctext-wrap">
                                                            <div class="conversation-name">Steven Franklin</div>
                                                            <p>& Next meeting tomorrow 10.00AM</p>
                                                            <p class="chat-time mb-0"><i class="bx bx-time-five align-middle me-1"></i> 10:06</p>
                                                        </div>
                                                        
                                                    </div>
                                                </li>
    
                                                <li class=" right">
                                                    <div class="conversation-list">
                                                        <div class="dropdown">
    
                                                            <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="bx bx-dots-vertical-rounded"></i>
                                                              </a>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="#">Copy</a>
                                                                <a class="dropdown-item" href="#">Save</a>
                                                                <a class="dropdown-item" href="#">Forward</a>
                                                                <a class="dropdown-item" href="#">Delete</a>
                                                            </div>
                                                        </div>
                                                        <div class="ctext-wrap">
                                                            <div class="conversation-name">Henry Wells</div>
                                                            <p>
                                                                Wow that's great
                                                            </p>
    
                                                            <p class="chat-time mb-0"><i class="bx bx-time-five align-middle me-1"></i> 10:07</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                
                                                
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
                                                    <button type="submit" class="btn btn-primary btn-rounded chat-send w-md waves-effect waves-light"><span class="d-none d-sm-inline-block me-2">Send</span> <i class="mdi mdi-send"></i></button>
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