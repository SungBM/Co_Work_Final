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

    </head>

    <body data-sidebar="dark" data-layout-mode="light">
	
    <!-- <body data-layout="horizontal" data-topbar="dark"> -->

        <!-- Begin page -->
        <div id="layout-wrapper">

            
           <%--  <header id="page-topbar">
                <div class="navbar-header">
                    <div class="d-flex">
                        <!-- LOGO -->
                        <div class="navbar-brand-box">
                    		<a href="../member/main" class="logo logo-light">
                                <span class="logo-sm">
                                    <img src="${pageContext.request.contextPath }/resources/assets/images/logo-light.svg"
                                         alt="" height="22" >
                                </span>
                        		<span class="logo-lg">
                            		<img src="../resources/image/logo.png" style="width:200px;">
                                </span>
                    		</a>
                        </div>

                        <button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect" id="vertical-menu-btn">
                            <i class="fa fa-fw fa-bars"></i>
                        </button>

                        <!-- App Search-->
                        <form class="app-search d-none d-lg-block">
                            <div class="position-relative">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="bx bx-search-alt"></span>
                            </div>
                        </form>

                        <div class="dropdown dropdown-mega d-none d-lg-block ms-2">
                            <button type="button" class="btn header-item waves-effect" data-bs-toggle="dropdown" aria-haspopup="false" aria-expanded="false">
                                <span key="t-megamenu">Mega Menu</span>
                                <i class="mdi mdi-chevron-down"></i> 
                            </button>
                            <div class="dropdown-menu dropdown-megamenu">
                                <div class="row">
                                    <div class="col-sm-8">
    
                                        <div class="row">
                                            <div class="col-md-4">
                                                <h5 class="font-size-14" key="t-ui-components">UI Components</h5>
                                                <ul class="list-unstyled megamenu-list">
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-lightbox">Lightbox</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-range-slider">Range Slider</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-sweet-alert">Sweet Alert</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-rating">Rating</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-forms">Forms</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-tables">Tables</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-charts">Charts</a>
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="col-md-4">
                                                <h5 class="font-size-14" key="t-applications">Applications</h5>
                                                <ul class="list-unstyled megamenu-list">
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-ecommerce">Ecommerce</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-calendar">Calendar</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-email">Email</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-projects">Projects</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-tasks">Tasks</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-contacts">Contacts</a>
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="col-md-4">
                                                <h5 class="font-size-14" key="t-extra-pages">Extra Pages</h5>
                                                <ul class="list-unstyled megamenu-list">
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-light-sidebar">Light Sidebar</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-compact-sidebar">Compact Sidebar</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-horizontal">Horizontal layout</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-maintenance">Maintenance</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-coming-soon">Coming Soon</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-timeline">Timeline</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-faqs">FAQs</a>
                                                    </li>
                            
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h5 class="font-size-14" key="t-ui-components">UI Components</h5>
                                                <ul class="list-unstyled megamenu-list">
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-lightbox">Lightbox</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-range-slider">Range Slider</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-sweet-alert">Sweet Alert</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-rating">Rating</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-forms">Forms</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-tables">Tables</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" key="t-charts">Charts</a>
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="col-sm-5">
                                                <div>
                                                    <img src="assets/images/megamenu-img.png" alt="" class="img-fluid mx-auto d-block">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="d-flex">

                        <div class="dropdown d-inline-block d-lg-none ms-2">
                            <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="mdi mdi-magnify"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                                aria-labelledby="page-header-search-dropdown">
        
                                <form class="p-3">
                                    <div class="form-group m-0">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="dropdown d-inline-block">
                            <button type="button" class="btn header-item waves-effect"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img id="header-lang-img" src="assets/images/flags/us.jpg" alt="Header Language" height="16">
                            </button>
                            <div class="dropdown-menu dropdown-menu-end">

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="en">
                                    <img src="assets/images/flags/us.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">English</span>
                                </a>
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="sp">
                                    <img src="assets/images/flags/spain.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">Spanish</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="gr">
                                    <img src="assets/images/flags/germany.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">German</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="it">
                                    <img src="assets/images/flags/italy.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">Italian</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="ru">
                                    <img src="assets/images/flags/russia.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">Russian</span>
                                </a>
                            </div>
                        </div>

                        <div class="dropdown d-none d-lg-inline-block ms-1">
                            <button type="button" class="btn header-item noti-icon waves-effect"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="bx bx-customize"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
                                <div class="px-lg-2">
                                    <div class="row g-0">
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="assets/images/brands/github.png" alt="Github">
                                                <span>GitHub</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="assets/images/brands/bitbucket.png" alt="bitbucket">
                                                <span>Bitbucket</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="assets/images/brands/dribbble.png" alt="dribbble">
                                                <span>Dribbble</span>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="row g-0">
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="assets/images/brands/dropbox.png" alt="dropbox">
                                                <span>Dropbox</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="assets/images/brands/mail_chimp.png" alt="mail_chimp">
                                                <span>Mail Chimp</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="assets/images/brands/slack.png" alt="slack">
                                                <span>Slack</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="dropdown d-none d-lg-inline-block ms-1">
                            <button type="button" class="btn header-item noti-icon waves-effect" data-bs-toggle="fullscreen">
                                <i class="bx bx-fullscreen"></i>
                            </button>
                        </div>

                        <div class="dropdown d-inline-block">
                            <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-notifications-dropdown"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="bx bx-bell bx-tada"></i>
                                <span class="badge bg-danger rounded-pill">3</span>
                            </button>
                            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                                aria-labelledby="page-header-notifications-dropdown">
                                <div class="p-3">
                                    <div class="row align-items-center">
                                        <div class="col">
                                            <h6 class="m-0" key="t-notifications"> Notifications </h6>
                                        </div>
                                        <div class="col-auto">
                                            <a href="#!" class="small" key="t-view-all"> View All</a>
                                        </div>
                                    </div>
                                </div>
                                <div data-simplebar style="max-height: 230px;">
                                    <a href="javascript: void(0);" class="text-reset notification-item">
                                        <div class="d-flex">
                                            <div class="avatar-xs me-3">
                                                <span class="avatar-title bg-primary rounded-circle font-size-16">
                                                    <i class="bx bx-cart"></i>
                                                </span>
                                            </div>
                                            <div class="flex-grow-1">
                                                <h6 class="mb-1" key="t-your-order">Your order is placed</h6>
                                                <div class="font-size-12 text-muted">
                                                    <p class="mb-1" key="t-grammer">If several languages coalesce the grammar</p>
                                                    <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span key="t-min-ago">3 min ago</span></p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="javascript: void(0);" class="text-reset notification-item">
                                        <div class="d-flex">
                                            <img src="assets/images/users/avatar-3.jpg"
                                                class="me-3 rounded-circle avatar-xs" alt="user-pic">
                                            <div class="flex-grow-1">
                                                <h6 class="mb-1">James Lemire</h6>
                                                <div class="font-size-12 text-muted">
                                                    <p class="mb-1" key="t-simplified">It will seem like simplified English.</p>
                                                    <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span key="t-hours-ago">1 hours ago</span></p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="javascript: void(0);" class="text-reset notification-item">
                                        <div class="d-flex">
                                            <div class="avatar-xs me-3">
                                                <span class="avatar-title bg-success rounded-circle font-size-16">
                                                    <i class="bx bx-badge-check"></i>
                                                </span>
                                            </div>
                                            <div class="flex-grow-1">
                                                <h6 class="mb-1" key="t-shipped">Your item is shipped</h6>
                                                <div class="font-size-12 text-muted">
                                                    <p class="mb-1" key="t-grammer">If several languages coalesce the grammar</p>
                                                    <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span key="t-min-ago">3 min ago</span></p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>

                                    <a href="javascript: void(0);" class="text-reset notification-item">
                                        <div class="d-flex">
                                            <img src="assets/images/users/avatar-4.jpg"
                                                class="me-3 rounded-circle avatar-xs" alt="user-pic">
                                            <div class="flex-grow-1">
                                                <h6 class="mb-1">Salena Layfield</h6>
                                                <div class="font-size-12 text-muted">
                                                    <p class="mb-1" key="t-occidental">As a skeptical Cambridge friend of mine occidental.</p>
                                                    <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span key="t-hours-ago">1 hours ago</span></p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="p-2 border-top d-grid">
                                    <a class="btn btn-sm btn-link font-size-14 text-center" href="javascript:void(0)">
                                        <i class="mdi mdi-arrow-right-circle me-1"></i> <span key="t-view-more">View More..</span> 
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="dropdown d-inline-block">
                            <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="rounded-circle header-profile-user" src="assets/images/users/avatar-1.jpg"
                                    alt="Header Avatar">
                                <span class="d-none d-xl-inline-block ms-1" key="t-henry">Henry</span>
                                <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-end">
                                <!-- item-->
                                <a class="dropdown-item" href="#"><i class="bx bx-user font-size-16 align-middle me-1"></i> <span key="t-profile">Profile</span></a>
                                <a class="dropdown-item" href="#"><i class="bx bx-wallet font-size-16 align-middle me-1"></i> <span key="t-my-wallet">My Wallet</span></a>
                                <a class="dropdown-item d-block" href="#"><span class="badge bg-success float-end">11</span><i class="bx bx-wrench font-size-16 align-middle me-1"></i> <span key="t-settings">Settings</span></a>
                                <a class="dropdown-item" href="#"><i class="bx bx-lock-open font-size-16 align-middle me-1"></i> <span key="t-lock-screen">Lock screen</span></a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item text-danger" href="#"><i class="bx bx-power-off font-size-16 align-middle me-1 text-danger"></i> <span key="t-logout">Logout</span></a>
                            </div>
                        </div>

                        <div class="dropdown d-inline-block">
                            <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">
                                <i class="bx bx-cog bx-spin"></i>
                            </button>
                        </div>

                    </div>
                </div>
            </header> --%>

           

            

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
                                    <h4 class="mb-sm-0 font-size-18">Chat</h4>

                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Skote</a></li>
                                            <li class="breadcrumb-item active">Chat</li>
                                        </ol>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="d-lg-flex">
                            <div class="chat-leftsidebar me-lg-4">
                                <div class="">
                                    <div class="py-4 border-bottom">
                                        <div class="d-flex">
                                            <div class="flex-shrink-0 align-self-center me-3">
                                                <img src="assets/images/users/avatar-1.jpg" class="avatar-xs rounded-circle" alt="">
                                            </div>
                                            <div class="flex-grow-1">
                                                <h5 class="font-size-15 mb-1">Henry Wells</h5>
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
                                            <input type="text" class="form-control" placeholder="Search...">
                                            <i class="bx bx-search-alt search-icon"></i>
                                        </div>
                                    </div>

                                    <div class="chat-leftsidebar-nav">
                                    <
                                        <ul class="nav nav-pills nav-justified">
                                            <li class="nav-item">
                                                <a href="#chat" data-bs-toggle="tab" aria-expanded="true" class="nav-link active">
                                                    <i class="bx bx-chat font-size-20 d-sm-none"></i>
                                                    <span class="d-none d-sm-block">Chat</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#groups" data-bs-toggle="tab" aria-expanded="false" class="nav-link">
                                                    <i class="bx bx-group font-size-20 d-sm-none"></i>
                                                    <span class="d-none d-sm-block">Groups</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#contacts" data-bs-toggle="tab" aria-expanded="false" class="nav-link">
                                                    <i class="bx bx-book-content font-size-20 d-sm-none"></i>
                                                    <span class="d-none d-sm-block">Contacts</span>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="tab-content py-4">
                                            <div class="tab-pane show active" id="chat">
                                                <div>
                                                    <h5 class="font-size-14 mb-3">Recent</h5>
                                                    <ul class="list-unstyled chat-list" data-simplebar style="max-height: 410px;">
	                                                    <c:forEach var = "m" items="${userinfo }">
	                                                        <li class="active">
	                                                            <a href="javascript: void(0);">
	                                                                <div class="d-flex">
	                                                                    <div class="flex-shrink-0 align-self-center me-3">
	                                                                        <i class="mdi mdi-circle font-size-10"></i>
	                                                                    </div>
	                                                                    <div class="flex-shrink-0 align-self-center me-3">
	                                                                        <img src="assets/images/users/avatar-2.jpg" class="rounded-circle avatar-xs" alt="">
	                                                                    </div>
	                                                                    
	                                                                    <div class="flex-grow-1 overflow-hidden">
	                                                                    
	                                                                        <h5 class="text-truncate font-size-14 mb-1">${m.USER_NAME }</h5>
	                                                                        <p class="text-truncate mb-0">Hey! there I'm available</p>
	                                                                       
	                                                                    </div>
	                                                                    <div class="font-size-11">05 min</div>
	                                                                </div>
	                                                            </a>
	                                                        </li>
	 													</c:forEach>
                                                        <li>
                                                            <a href="javascript: void(0);">
                                                                <div class="d-flex">
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                        <i class="mdi mdi-circle text-success font-size-10"></i>
                                                                    </div>
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                        <img src="assets/images/users/avatar-3.jpg" class="rounded-circle avatar-xs" alt="">
                                                                    </div>

                                                                    <div class="flex-grow-1 overflow-hidden">
                                                                        <h5 class="text-truncate font-size-14 mb-1">Adam Miller</h5>
                                                                        <p class="text-truncate mb-0">I've finished it! See you so</p>
                                                                    </div>
                                                                    <div class="font-size-11">12 min</div>
                                                                </div>
                                                            </a>
                                                        </li>

                                                        <li>
                                                            <a href="javascript: void(0);">
                                                                <div class="d-flex">
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                        <i class="mdi mdi-circle text-success font-size-10"></i>
                                                                    </div>
                                                                    <div class="avatar-xs align-self-center me-3">
                                                                        <span class="avatar-title rounded-circle bg-primary bg-soft text-primary">
                                                                            K
                                                                        </span>
                                                                    </div>
                                                                    <div class="flex-grow-1 overflow-hidden">
                                                                        <h5 class="text-truncate font-size-14 mb-1">Keith Gonzales</h5>
                                                                        <p class="text-truncate mb-0">This theme is awesome!</p>
                                                                    </div>
                                                                    <div class="font-size-11">24 min</div>
                                                                </div>
                                                            </a>
                                                        </li>

                                                        <li>
                                                            <a href="javascript: void(0);">
                                                                <div class="d-flex">
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                        <i class="mdi mdi-circle text-warning font-size-10"></i>
                                                                    </div>
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                        <img src="assets/images/users/avatar-4.jpg" class="rounded-circle avatar-xs" alt="">
                                                                    </div>
                                                                    <div class="flex-grow-1 overflow-hidden">
                                                                        <h5 class="text-truncate font-size-14 mb-1">Jose Vickery</h5>
                                                                        <p class="text-truncate mb-0">Nice to meet you</p>
                                                                    </div>
                                                                    <div class="font-size-11">1 hr</div>
                                                                </div>
                                                            </a>
                                                        </li>

                                                        <li>
                                                            <a href="javascript: void(0);">
                                                                <div class="d-flex">
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                        <i class="mdi mdi-circle font-size-10"></i>
                                                                    </div>

                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                        <div class="avatar-xs">
                                                                            <span class="avatar-title rounded-circle bg-primary bg-soft text-primary">
                                                                                M
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="flex-grow-1 overflow-hidden">
                                                                        <h5 class="text-truncate font-size-14 mb-1">Mitchel Givens</h5>
                                                                        <p class="text-truncate mb-0">Hey! there I'm available</p>
                                                                    </div>
                                                                    <div class="font-size-11">3 hrs</div>
                                                                </div>
                                                            </a>
                                                        </li>

                                                        <li>
                                                            <a href="javascript: void(0);">
                                                                <div class="d-flex">
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                        <i class="mdi mdi-circle text-success font-size-10"></i>
                                                                    </div>
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                        <img src="assets/images/users/avatar-6.jpg" class="rounded-circle avatar-xs" alt="">
                                                                    </div>
                                                                    <div class="flex-grow-1 overflow-hidden">
                                                                        <h5 class="text-truncate font-size-14 mb-1">Stephen Hadley</h5>
                                                                        <p class="text-truncate mb-0">I've finished it! See you so</p>
                                                                    </div>
                                                                    <div class="font-size-11">5hrs</div>
                                                                </div>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript: void(0);">
                                                                <div class="d-flex">
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                        <i class="mdi mdi-circle text-success font-size-10"></i>
                                                                    </div>
                                                                    <div class="flex-shrink-0 align-self-center me-3">
                                                                        <div class="avatar-xs">
                                                                            <span class="avatar-title rounded-circle bg-primary bg-soft text-primary">
                                                                                K
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="flex-grow-1 overflow-hidden">
                                                                        <h5 class="text-truncate font-size-14 mb-1">Keith Gonzales</h5>
                                                                        <p class="text-truncate mb-0">This theme is awesome!</p>
                                                                    </div>
                                                                    <div class="font-size-11">24 min</div>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <div class="tab-pane" id="groups">
                                                <h5 class="font-size-14 mb-3">Groups</h5>
                                                <ul class="list-unstyled chat-list" data-simplebar style="max-height: 410px;">
                                                    <li>
                                                        <a href="javascript: void(0);">
                                                            <div class="d-flex align-items-center">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <div class="avatar-xs">
                                                                        <span class="avatar-title rounded-circle bg-primary bg-soft text-primary">
                                                                            G
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="flex-grow-1">
                                                                    <h5 class="font-size-14 mb-0">General</h5>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="javascript: void(0);">
                                                            <div class="d-flex align-items-center">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <div class="avatar-xs">
                                                                        <span class="avatar-title rounded-circle bg-primary bg-soft text-primary">
                                                                            R
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="flex-grow-1">
                                                                    <h5 class="font-size-14 mb-0">Reporting</h5>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="javascript: void(0);">
                                                            <div class="d-flex align-items-center">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <div class="avatar-xs">
                                                                        <span class="avatar-title rounded-circle bg-primary bg-soft text-primary">
                                                                            M
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="flex-grow-1">
                                                                    <h5 class="font-size-14 mb-0">Meeting</h5>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="javascript: void(0);">
                                                            <div class="d-flex align-items-center">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <div class="avatar-xs">
                                                                        <span class="avatar-title rounded-circle bg-primary bg-soft text-primary">
                                                                            A
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="flex-grow-1">
                                                                    <h5 class="font-size-14 mb-0">Project A</h5>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="javascript: void(0);">
                                                            <div class="d-flex align-items-center">
                                                                <div class="flex-shrink-0 me-3">
                                                                    <div class="avatar-xs">
                                                                        <span class="avatar-title rounded-circle bg-primary bg-soft text-primary">
                                                                            B
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="flex-grow-1">
                                                                    <h5 class="font-size-14 mb-0">Project B</h5>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="tab-pane" id="contacts">
                                                <h5 class="font-size-14 mb-3">Contacts</h5>

                                                <div  data-simplebar style="max-height: 410px;">
                                                    <div>
                                                        <div class="avatar-xs mb-3">
                                                            <span class="avatar-title rounded-circle bg-primary bg-soft text-primary">
                                                                A
                                                            </span>
                                                        </div>
    
                                                        <ul class="list-unstyled chat-list">
                                                            <li>
                                                                <a href="javascript: void(0);">
                                                                    <h5 class="font-size-14 mb-0">Adam Miller</h5>
                                                                </a>
                                                            </li>
        
                                                            <li>
                                                                <a href="javascript: void(0);">
                                                                    <h5 class="font-size-14 mb-0">Alfonso Fisher</h5>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>

                                                    <div class="mt-4">
                                                        <div class="avatar-xs mb-3">
                                                            <span class="avatar-title rounded-circle bg-primary bg-soft text-primary">
                                                                B
                                                            </span>
                                                        </div>
    
                                                        <ul class="list-unstyled chat-list">
                                                            <li>
                                                                <a href="javascript: void(0);">
                                                                    <h5 class="font-size-14 mb-0">Bonnie Harney</h5>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>

                                                    <div class="mt-4">
                                                        <div class="avatar-xs mb-3">
                                                            <span class="avatar-title rounded-circle bg-primary bg-soft text-primary">
                                                                C
                                                            </span>
                                                        </div>
    
                                                        <ul class="list-unstyled chat-list">
                                                            <li>
                                                                <a href="javascript: void(0);">
                                                                    <h5 class="font-size-14 mb-0">Charles Brown</h5>
                                                                </a>
                                                                <a href="javascript: void(0);">
                                                                    <h5 class="font-size-14 mb-0">Carmella Jones</h5>
                                                                </a>
                                                                <a href="javascript: void(0);">
                                                                    <h5 class="font-size-14 mb-0">Carrie Williams</h5>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>

                                                    <div class="mt-4">
                                                        <div class="avatar-xs mb-3">
                                                            <span class="avatar-title rounded-circle bg-primary bg-soft text-primary">
                                                                D
                                                            </span>
                                                        </div>
    
                                                        <ul class="list-unstyled chat-list">
                                                            <li>
                                                                <a href="javascript: void(0);">
                                                                    <h5 class="font-size-14 mb-0">Dolores Minter</h5>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
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
                                                <h5 class="font-size-15 mb-1">Steven Franklin</h5>
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