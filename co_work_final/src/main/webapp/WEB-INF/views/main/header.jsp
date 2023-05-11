<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>
<html>
<head>

    <meta charset="utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico">
    <link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" id="bootstrap-style"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath }/resources/assets/css/app.min.css" id="app-style" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/resources/assets/css/project_Css/project.css" rel="stylesheet"
          type="text/css"/>
    <meta name="_csrf" content="${_csrf.token }">
    <meta name="_csrf_header" content="${_csrf.headerName}">
    <style>
        html, .main-content {
            background-color: #FFFFFF;
        }

        .page-content {
            width: 90%;
        }

        .warning {
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 0 100px 50px 100px;
            border-color: transparent transparent yellow transparent;
            position: relative;
        }

        .warning::after {
            content: "!";
            color: black;
            font-size: 40px;
            font-weight: bold;
            position: absolute;
            top: 15px;
            left: -5px;
        }

        .warning-text {
            text-align: center;
            margin-top: 10px;
        }

        html, .main-content {
            background-color: #FFFFFF;
        }

    </style>

</head>
<body data-sidebar="dark">
<div id="layout-wrapper">
    <header id="page-topbar">
        <div class="navbar-header">
            <div class="d-flex">
                <!-- LOGO -->
                <div class="navbar-brand-box">

                    <a href="${pageContext.request.contextPath }/main/main" class="logo logo-light"> <span
                            class="logo-sm"> <img
                            src="${pageContext.request.contextPath }/resources/assets/images/logo-light.svg"
                            alt="" height="22">
                  </span> <span class="logo-lg"> <img
                            src="${pageContext.request.contextPath }/resources/image/logo1.png"
                            style="width: 200px; margin-top: 20px;">
                  </span>
                    </a>
                </div>

                <button type="button"
                        class="btn btn-sm px-3 font-size-16 header-item waves-effect"
                        id="vertical-menu-btn">
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
                    <button type="button" class="btn header-item waves-effect"
                            data-bs-toggle="dropdown" aria-haspopup="false"
                            aria-expanded="false">
                        <span key="t-megamenu">Mega Menu</span> <i
                            class="mdi mdi-chevron-down"></i>
                    </button>
                    <div class="dropdown-menu dropdown-megamenu">
                        <div class="row">
                            <div class="col-sm-8">

                                <div class="row">
                                    <div class="col-md-4">
                                        <h5 class="font-size-14" key="t-ui-components">UI
                                            Components</h5>
                                        <ul class="list-unstyled megamenu-list">
                                            <li><a href="javascript:void(0);" key="t-lightbox">Lightbox</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-range-slider">Range
                                                Slider</a></li>
                                            <li><a href="javascript:void(0);" key="t-sweet-alert">Sweet
                                                Alert</a></li>
                                            <li><a href="javascript:void(0);" key="t-rating">Rating</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-forms">Forms</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-tables">Tables</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-charts">Charts</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="col-md-4">
                                        <h5 class="font-size-14" key="t-applications">Applications</h5>
                                        <ul class="list-unstyled megamenu-list">
                                            <li><a href="javascript:void(0);" key="t-ecommerce">Ecommerce</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-calendar">Calendar</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-email">Email</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-projects">Projects</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-tasks">Tasks</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-contacts">Contacts</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="col-md-4">
                                        <h5 class="font-size-14" key="t-extra-pages">Extra Pages</h5>
                                        <ul class="list-unstyled megamenu-list">
                                            <li><a href="javascript:void(0);" key="t-light-sidebar">Light
                                                Sidebar</a></li>
                                            <li><a href="javascript:void(0);"
                                                   key="t-compact-sidebar">Compact Sidebar</a></li>
                                            <li><a href="javascript:void(0);" key="t-horizontal">Horizontal
                                                layout</a></li>
                                            <li><a href="javascript:void(0);" key="t-maintenance">Maintenance</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-coming-soon">Coming
                                                Soon</a></li>
                                            <li><a href="javascript:void(0);" key="t-timeline">Timeline</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-faqs">FAQs</a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h5 class="font-size-14" key="t-ui-components">UI
                                            Components</h5>
                                        <ul class="list-unstyled megamenu-list">
                                            <li><a href="javascript:void(0);" key="t-lightbox">Lightbox</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-range-slider">Range
                                                Slider</a></li>
                                            <li><a href="javascript:void(0);" key="t-sweet-alert">Sweet
                                                Alert</a></li>
                                            <li><a href="javascript:void(0);" key="t-rating">Rating</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-forms">Forms</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-tables">Tables</a>
                                            </li>
                                            <li><a href="javascript:void(0);" key="t-charts">Charts</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="col-sm-5">
                                        <div>
                                            <img
                                                    src="${pageContext.request.contextPath }/resources/assets/images/megamenu-img.png"
                                                    alt="" class="img-fluid mx-auto d-block">
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
                    <button type="button"
                            class="btn header-item noti-icon waves-effect"
                            id="page-header-search-dropdown" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                        <i class="mdi mdi-magnify"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                         aria-labelledby="page-header-search-dropdown">

                        <form class="p-3">
                            <div class="form-group m-0">
                                <div class="input-group">
                                    <input type="text" class="form-control"
                                           placeholder="Search ..." aria-label="Recipient's username">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="submit">
                                            <i class="mdi mdi-magnify"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="dropdown d-inline-block">
                    <button type="button" class="btn header-item waves-effect"
                            data-bs-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                        <img id="header-lang-img"
                             src="${pageContext.request.contextPath }/resources/assets/images/flags/us.jpg"
                             alt="Header Language" height="16">
                    </button>
                    <div class="dropdown-menu dropdown-menu-end">

                        <!-- item-->
                        <a href="javascript:void(0);"
                           class="dropdown-item notify-item language" data-lang="en"> <img
                                src="${pageContext.request.contextPath }/resources/assets/images/flags/us.jpg"
                                alt="user-image" class="me-1" height="12"> <span
                                class="align-middle">English</span>
                        </a>
                        <!-- item-->
                        <a href="javascript:void(0);"
                           class="dropdown-item notify-item language" data-lang="sp"> <img
                                src="${pageContext.request.contextPath }/resources/assets/images/flags/spain.jpg"
                                alt="user-image" class="me-1" height="12"> <span
                                class="align-middle">Spanish</span>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);"
                           class="dropdown-item notify-item language" data-lang="gr"> <img
                                src="${pageContext.request.contextPath }/resources/assets/images/flags/germany.jpg"
                                alt="user-image" class="me-1" height="12"> <span
                                class="align-middle">German</span>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);"
                           class="dropdown-item notify-item language" data-lang="it"> <img
                                src="${pageContext.request.contextPath }/resources/assets/images/flags/italy.jpg"
                                alt="user-image" class="me-1" height="12"> <span
                                class="align-middle">Italian</span>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);"
                           class="dropdown-item notify-item language" data-lang="ru"> <img
                                src="${pageContext.request.contextPath }/resources/assets/images/flags/russia.jpg"
                                alt="user-image" class="me-1" height="12"> <span
                                class="align-middle">Russian</span>
                        </a>
                    </div>
                </div>

                <div class="dropdown d-none d-lg-inline-block ms-1">
                    <button type="button"
                            class="btn header-item noti-icon waves-effect"
                            data-bs-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                        <i class="bx bx-customize"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
                        <div class="px-lg-2">
                            <div class="row g-0">
                                <div class="col">
                                    <a class="dropdown-icon-item" href="#"> <img
                                            src="${pageContext.request.contextPath }/resources/assets/images/brands/github.png"
                                            alt="Github"> <span>GitHub</span>
                                    </a>
                                </div>
                                <div class="col">
                                    <a class="dropdown-icon-item" href="#"> <img
                                            src="${pageContext.request.contextPath }/resources/assets/images/brands/bitbucket.png"
                                            alt="bitbucket"> <span>Bitbucket</span>
                                    </a>
                                </div>
                                <div class="col">
                                    <a class="dropdown-icon-item" href="#"> <img
                                            src="${pageContext.request.contextPath }/resources/assets/images/brands/dribbble.png"
                                            alt="dribbble"> <span>Dribbble</span>
                                    </a>
                                </div>
                            </div>

                            <div class="row g-0">
                                <div class="col">
                                    <a class="dropdown-icon-item" href="#"> <img
                                            src="${pageContext.request.contextPath }/resources/assets/images/brands/dropbox.png"
                                            alt="dropbox"> <span>Dropbox</span>
                                    </a>
                                </div>
                                <div class="col">
                                    <a class="dropdown-icon-item" href="#"> <img
                                            src="${pageContext.request.contextPath }/resources/assets/images/brands/mail_chimp.png"
                                            alt="mail_chimp"> <span>Mail Chimp</span>
                                    </a>
                                </div>
                                <div class="col">
                                    <a class="dropdown-icon-item" href="#"> <img
                                            src="${pageContext.request.contextPath }/resources/assets/images/brands/slack.png"
                                            alt="slack"> <span>Slack</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="dropdown d-none d-lg-inline-block ms-1">
                    <button type="button"
                            class="btn header-item noti-icon waves-effect"
                            data-bs-toggle="fullscreen">
                        <i class="bx bx-fullscreen"></i>
                    </button>
                </div>

                <div class="dropdown d-inline-block">
                    <button type="button"
                            class="btn header-item noti-icon waves-effect"
                            id="page-header-notifications-dropdown" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                        <i class="bx bx-bell bx-tada"></i> <span
                            class="badge bg-danger rounded-pill">3</span>
                    </button>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                         aria-labelledby="page-header-notifications-dropdown">
                        <div class="p-3">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h6 class="m-0" key="t-notifications">Notifications</h6>
                                </div>
                                <div class="col-auto">
                                    <a href="#!" class="small" key="t-view-all"> View All</a>
                                </div>
                            </div>
                        </div>
                        <div data-simplebar="init" style="max-height: 230px;">
                            <div class="simplebar-wrapper" style="margin: 0px;">
                                <div class="simplebar-height-auto-observer-wrapper">
                                    <div class="simplebar-height-auto-observer"></div>
                                </div>
                                <div class="simplebar-mask">
                                    <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                                        <div class="simplebar-content-wrapper"
                                             style="height: auto; padding-right: 0px; padding-bottom: 0px; overflow: hidden;">
                                            <div class="simplebar-content" style="padding: 0px;">
                                                <a href="javascript: void(0);"
                                                   class="text-reset notification-item">
                                                    <div class="d-flex">
                                                        <div class="avatar-xs me-3">
                                                <span
                                                                        class="avatar-title bg-primary rounded-circle font-size-16">
                                                   <i class="bx bx-cart"></i>
                                                </span>
                                                        </div>
                                                        <div class="flex-grow-1">
                                                            <h6 class="mb-1" key="t-your-order">Your order is
                                                                placed</h6>
                                                            <div class="font-size-12 text-muted">
                                                                <p class="mb-1" key="t-grammer">If several
                                                                    languages coalesce the grammar</p>
                                                                <p class="mb-0">
                                                                    <i class="mdi mdi-clock-outline"></i> <span
                                                                        key="t-min-ago">3 min ago</span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a> <a href="javascript: void(0);"
                                                        class="text-reset notification-item">
                                                <div class="d-flex">
                                                    <img
                                                            src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-3.jpg"
                                                            class="me-3 rounded-circle avatar-xs" alt="user-pic">
                                                    <div class="flex-grow-1">
                                                        <h6 class="mb-1">James Lemire</h6>
                                                        <div class="font-size-12 text-muted">
                                                            <p class="mb-1" key="t-simplified">It will seem
                                                                like simplified English.</p>
                                                            <p class="mb-0">
                                                                <i class="mdi mdi-clock-outline"></i> <span
                                                                    key="t-hours-ago">1 hours ago</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a> <a href="javascript: void(0);"
                                                    class="text-reset notification-item">
                                                <div class="d-flex">
                                                    <div class="avatar-xs me-3">
                                                <span
                                                                        class="avatar-title bg-success rounded-circle font-size-16">
                                                   <i class="bx bx-badge-check"></i>
                                                </span>
                                                    </div>
                                                    <div class="flex-grow-1">
                                                        <h6 class="mb-1" key="t-shipped">Your item is
                                                            shipped</h6>
                                                        <div class="font-size-12 text-muted">
                                                            <p class="mb-1" key="t-grammer">If several
                                                                languages coalesce the grammar</p>
                                                            <p class="mb-0">
                                                                <i class="mdi mdi-clock-outline"></i> <span
                                                                    key="t-min-ago">3 min ago</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a> <a href="javascript: void(0);"
                                                    class="text-reset notification-item">
                                                <div class="d-flex">
                                                    <img
                                                            src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-4.jpg"
                                                            class="me-3 rounded-circle avatar-xs" alt="user-pic">
                                                    <div class="flex-grow-1">
                                                        <h6 class="mb-1">Salena Layfield</h6>
                                                        <div class="font-size-12 text-muted">
                                                            <p class="mb-1" key="t-occidental">As a skeptical
                                                                Cambridge friend of mine occidental.</p>
                                                            <p class="mb-0">
                                                                <i class="mdi mdi-clock-outline"></i> <span
                                                                    key="t-hours-ago">1 hours ago</span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="simplebar-placeholder"
                                     style="width: 0px; height: 0px;"></div>
                            </div>
                            <div class="simplebar-track simplebar-horizontal"
                                 style="visibility: hidden;">
                                <div class="simplebar-scrollbar"
                                     style="transform: translate3d(0px, 0px, 0px); display: none;"></div>
                            </div>
                            <div class="simplebar-track simplebar-vertical"
                                 style="visibility: hidden;">
                                <div class="simplebar-scrollbar"
                                     style="transform: translate3d(0px, 0px, 0px); display: none;"></div>
                            </div>
                        </div>
                        <div class="p-2 border-top d-grid">
                            <a class="btn btn-sm btn-link font-size-14 text-center"
                               href="javascript:void(0)"> <i
                                    class="mdi mdi-arrow-right-circle me-1"></i> <span
                                    key="t-view-more">View More..</span>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="dropdown d-inline-block">
                    <button type="button" class="btn header-item waves-effect"
                            id="page-header-user-dropdown" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                        <img class="rounded-circle header-profile-user"
                             src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-4.jpg"
                             alt="Header Avatar">
                        <sec:authorize access="isAuthenticated()">
                            <sec:authentication property="principal" var="pinfo"/>

                            <span class="d-none d-xl-inline-block ms-1" key="t-henry"
                                  id="loginId">${pinfo.username }</span>

                        </sec:authorize>
                        <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end">
                        <!-- item-->
                        <a class="dropdown-item" href="#"><i
                                class="bx bx-user font-size-16 align-middle me-1"></i> <span
                                key="t-profile">Profile</span></a> <a class="dropdown-item" href="#"><i
                            class="bx bx-wallet font-size-16 align-middle me-1"></i> <span
                            key="t-my-wallet">My Wallet</span></a> <a
                            class="dropdown-item d-block" href="#"><span
                            class="badge bg-success float-end">11</span><i
                            class="bx bx-wrench font-size-16 align-middle me-1"></i> <span
                            key="t-settings">Settings</span></a> <a class="dropdown-item"
                                                                    href="#"><i
                            class="bx bx-lock-open font-size-16 align-middle me-1"></i> <span
                            key="t-lock-screen">Lock screen</span></a>
                        <div class="dropdown-divider"></div>
                        <form action="${pageContext.request.contextPath }/member/logout"
                              id="logout" method="post"><a class="dropdown-item text-danger">
                            <i class="bx bx-power-off font-size-16 align-middle me-1 text-danger"></i>
                            <span key="t-logout" id="submit">Logout</span></a> <input
                                type="hidden" name="${_csrf.parameterName}"
                                value="${_csrf.token}">
                        </form>

                    </div>
                </div>

                <div class="dropdown d-inline-block">
                    <button type="button"
                            class="btn header-item noti-icon right-bar-toggle waves-effect">
                        <i class="bx bx-cog bx-spin"></i>
                    </button>
                </div>

            </div>
        </div>
    </header>

    <div class="vertical-menu">

        <div data-simplebar="init" class="h-100">
            <div class="simplebar-wrapper" style="margin: 0px;">
                <div class="simplebar-height-auto-observer-wrapper">
                    <div class="simplebar-height-auto-observer"></div>
                </div>
                <div class="simplebar-mask">
                    <div class="simplebar-offset" style="right: -20px; bottom: 0px;">
                        <div class="simplebar-content-wrapper"
                             style="height: 100%; padding-right: 20px; padding-bottom: 0px; overflow: hidden scroll;">
                            <div class="simplebar-content" style="padding: 0px;">

                                <!--- Sidemenu -->
                                <div id="sidebar-menu" class="mm-active">
                                    <!-- Left Menu Start -->
                                    <ul class="metismenu list-unstyled" id="side-menu">
                                        <li><a href="javascript: void(0);"
                                               class="has-arrow waves-effect"> <i
                                                class="bx bx-briefcase-alt-2"></i> <span key="t-ecommerce">프로젝트</span>
                                        </a>
                                            <ul class="sub-menu" aria-expanded="false">
                                                <li><a target="_self"
                                                       href="${pageContext.request.contextPath }/project/ProjectList?id=ADMINTEST"
                                                       id="project_list">전체</a>
                                                </li>

                                                <!--    <li><a>진행</a></li>
                                                    <li><a>마감</a></li>
                                                    <li><a>즐겨찾기</a></li> -->
                                            </ul>
                                        </li>

                                        <li><a href="${pageContext.request.contextPath }/member/calendar"
                                               class="waves-effect">
                                            <i class="bx bx-calendar"></i> <span>일정</span>
                                        </a>
                                        <li><a href="../chat/chatForm" class="waves-effect"><i
                                                class="bx bx-chat"></i> <span>채팅</span>
                                        </a></li>

                                        <!-- <li><a href="javascript: void(0);" class="waves-effect">
                                                    <i class="bx bx-envelope"></i> <span>이메일</span>
                                            </a></li> -->

                                     		<li><a href="javascript: void(0);"
                                        class="has-arrow waves-effect"> <i class="bx bx-detail"></i>
                                          <span>커뮤니티</span>
                                      </a>
                                        <ul class="sub-menu" aria-expanded="false">
                                          <li><a id="notice_List"
                                            href="${pageContext.request.contextPath }/notice/noticeList">공지사항
                                              게시판</a></li>
                                          <li><a id="freeBoard" href="${pageContext.request.contextPath}/freeBoard/freeBoardList" >자유 게시판</a></li>
                                        </ul></li>

                                        <li><a href="javascript: void(0);"
                                               class="has-arrow waves-effect"> <i class="bx bx-list-check"></i>
                                            <span>전자결재</span>
                                        </a>
                                            <ul class="sub-menu" aria-expanded="false">
                                                <li><a id="EDMS_List"
                                                       href="${pageContext.request.contextPath }/edms/approvalList">대쉬보드</a>
                                                </li>
                                                <li><a id="EDMS_myDoc"
                                                       href="${pageContext.request.contextPath }/edms/myDoc">기안함</a>
                                                </li>
                                                <li><a id="EDMS_myDocApp"
                                                       href="${pageContext.request.contextPath }/edms/myDocApp">결재함</a>
                                                </li>
                                            </ul>

                                        </li>

                                        <li><a href="javascript: void(0);"
                                               class="has-arrow waves-effect"> <i class="bx bx-list-ul"></i>
                                            <span>부가서비스</span>
                                        </a>
                                            <ul class="sub-menu" aria-expanded="false">
                                                <!--    <li><a>전자 결재</a></li> -->
                                                <li><a href="${pageContext.request.contextPath }/meet/rev">예약</a></li>
                                                <li><a href="${pageContext.request.contextPath }/meet/revstat">예약내역</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li><a id="mypage" class="waves-effect"
                                               href="${pageContext.request.contextPath }/member/mypage"> <i
                                                class="bx bx-user"></i> <span
                                                key="t-chat">내 프로필</span>
                                        </a></li>

                                        <li><a href="javascript: void(0);"
                                               class="has-arrow waves-effect"> <i class="bx bx-cog"></i>
                                            <span>설정</span>
                                        </a>
                                            <ul class="sub-menu" aria-expanded="false">
                                                <li><a id="passwordchange"
                                                       href="${pageContext.request.contextPath }/member/modifyPassword">비밀번호
                                                    변경</a></li>
                                                <!-- <li><a id="mysecurity" href="${pageContext.request.contextPath }/member/mysecurity">보안(미구현)</a></li>
                                       <li><a>알림(미구현)</a></li>
                                       <li><a>접속기기(미구현)</a></li>
                                        -->
                                            </ul>
                                        </li>

                                        <sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
                                            <li style="text-align: center"><a>👇 관리자 메뉴 👇</a></li>
                                            <li><a href="javascript: void(0);"
                                                   class="has-arrow waves-effect"> <i class="bx bx-cog"></i>
                                                <span>회사 & 회의실</span>
                                            </a>
                                                <ul class="sub-menu" aria-expanded="false">
                                                    <li><a id="companyinfo"
                                                           href="${pageContext.request.contextPath }/admin/company">회사정보</a>
                                                    </li>
                                                    <li><a id="meetinfo"
                                                           href="${pageContext.request.contextPath }/admin/meetManage">회의실</a>
                                                    </li>
                                                    <!--     <li><a>조직도 관리(미구현)</a></li>
                                                        <li><a>회의실 예약 현황(미구현)</a></li>-->
                                                </ul>
                                            </li>
                                            <li><a href="javascript: void(0);"
                                                   class="has-arrow waves-effect"> <i class="bx bx-cog"></i>
                                                <span>구성원</span>
                                            </a>
                                                <ul class="sub-menu" aria-expanded="false">
                                                    <li><a id="membersinfo"
                                                           href="${pageContext.request.contextPath }/admin/members">구성원
                                                        관리</a></li>
                                                    <!--    <li><a>구성원 초대(미구현)</a></li> -->
                                                </ul>
                                            </li>

                                            <!-- <li><a href="javascript: void(0);"
                                            class="has-arrow waves-effect"> <i class="bx bx-cog"></i>
                                            <span>전자결재</span>
                                            </a>
                                            <ul class="sub-menu" aria-expanded="false">
                                            <li><a>서식관리(미구현)</a></li>
                                            <li><a>조직도 관리(미구현)</a></li>
                                            <li><a>회의실 예약 현황(미구현)</a></li>

                                            </ul></li>
                                            -->
                                        </sec:authorize>
                                    </ul>
                                </div>
                                <!-- Sidebar -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="simplebar-placeholder"
                     style="width: auto; height: 1560px;"></div>
            </div>
            <div class="simplebar-track simplebar-horizontal"
                 style="visibility: hidden;">
                <div class="simplebar-scrollbar"
                     style="transform: translate3d(0px, 0px, 0px); display: none;"></div>
            </div>
            <div class="simplebar-track simplebar-vertical"
                 style="visibility: visible;">
                <div class="simplebar-scrollbar"
                     style="height: 950px; transform: translate3d(0px, 260px, 0px); display: block;"></div>
            </div>
        </div>
    </div>

</div>

<!-- footer -->
<footer class="footer text-center">
    <p>
        ©
        <script>
            document.write(new Date().getFullYear())
        </script>
        CO-WORK. <i class="mdi mdi-heart text-danger"></i> by Final Project
    </p>
</footer>
</body>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/jquery/jquery.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/metismenu/metismenu.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.all.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/js/pages/sweet-alerts.init.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/@chenfengyuan/datepicker/datepicker.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-datepicker/locales/bootstrap-datepicker.ko.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/TableDnD/0.9.1/jquery.tablednd.js"
        integrity="sha256-d3rtug+Hg1GZPB7Y/yTcRixO/wlI78+2m08tosoRn7A="
        crossorigin="anonymous"></script>


<script>
    $(function () {
        $('#submit').click(function () {
            $("#logout").submit();
        });
    })
</script>

</html>