<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../main/header.jsp"></jsp:include>
<title>구성원 관리</title>
<style>
    th, tr {
        text-align: center;
    }
</style>
</head>
<body>
<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0 font-size-18">구성원> 구성원 관리</h4>

                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item waves-effect waves-light" role="presentation"><a class="nav-link active"
                                                                                                 data-bs-toggle="tab"
                                                                                                 href="#home-1"
                                                                                                 role="tab"
                                                                                                 aria-selected="true">
                           <span class="d-block d-sm-none">
                              <i class="fas fa-home"></i>
                           </span>
                                <span class="d-none d-sm-block">전체</span>
                            </a></li>
                            <li class="nav-item waves-effect waves-light" role="presentation"><a class="nav-link"
                                                                                                 data-bs-toggle="tab"
                                                                                                 href="#profile-1"
                                                                                                 role="tab"
                                                                                                 aria-selected="false"
                                                                                                 tabindex="-1">
                           <span class="d-block d-sm-none">
                              <i class="far fa-user"></i>
                           </span>
                                <span class="d-none d-sm-block">승인</span>
                            </a></li>
                            <li class="nav-item waves-effect waves-light" role="presentation"><a class="nav-link"
                                                                                                 data-bs-toggle="tab"
                                                                                                 href="#messages-1"
                                                                                                 role="tab"
                                                                                                 aria-selected="false"
                                                                                                 tabindex="-1">
                           <span class="d-block d-sm-none">
                              <i class="far fa-envelope"></i>
                           </span>
                                <span class="d-none d-sm-block">승인 대기</span>
                            </a></li>
                            <li class="nav-item waves-effect waves-light" role="presentation"><a class="nav-link"
                                                                                                 data-bs-toggle="tab"
                                                                                                 href="#settings-1"
                                                                                                 role="tab"
                                                                                                 aria-selected="false"
                                                                                                 tabindex="-1">
                           <span class="d-block d-sm-none">
                              <i class="fas fa-cog"></i>
                           </span>
                                <span class="d-none d-sm-block">이용 중지</span>
                            </a></li>
                        </ul>

                        <!-- Tab panes -->

                        <div class="tab-content p-3 text-muted">
                            <div class="tab-pane active" id="home-1" role="tabpanel">
                                <div class="table-responsive">
                                    <table class="table mb-1 table-hover">
                                        <thead>
                                        <tr role="row">
                                            <th><input class="form-check-input" type="checkbox" id="formCheck1"></th>
                                            <th>이름</th>
                                            <th>부서</th>
                                            <th>직책</th>
                                            <th>이메일</th>
                                            <th>연락처</th>
                                            <th>가입일</th>
                                            <th>마지막 접속</th>
                                            <th>상태</th>
                                            <th>관리자</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="m" items="${list }">
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" id="formCheck2">
                                                </td>
                                                <td>
                                                    <a name="meminfo" href="mypage.my?user_id=${m.user_id }"
                                                       }">${m.user_name }</a>
                                                </td>
                                                <td>${m.user_dept }</td>
                                                <td>${m.user_job }</td>
                                                <td>
                                                    <a href="#">${m.user_email }</a>
                                                </td>
                                                <td>${m.user_phone }</td>
                                                <td>${m.user_join_date }</td>
                                                <c:if test="${!empty m.user_lasttime }">
                                                    <td>${m.user_lasttime }</td>
                                                </c:if>
                                                <c:if test="${empty m.user_lasttime }">
                                                    <td>미접속</td>
                                                </c:if>

                                                <!-- 상태 표시 -->
                                                <c:if test="${m.user_state eq 'WT'}">
                                                    <td style="color: green;">
                                                        <span>정상</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.user_id }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.user_state eq 'CP'}">
                                                    <td style="color: red;">
                                                        <span>중지</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.user_id }&state=0">[정상]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.user_state eq 'ST'}">
                                                    <td style="color: orange">
                                                        <span>승인 대기</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=0">[승인]</a>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>

                                                <!-- 관리자 표시 -->
                                                <c:if test="${m.user_auth eq 'ROLE_ADMIN'}">
                                                    <td>
                                                        관리자<br>
                                                        <a href="adminright.com?user_id=${m.user_id }&user_auth=0">[해제]</a>

                                                    </td>
                                                </c:if>
                                                <c:if test="${m.user_auth eq 'ROLE_USER'}">
                                                    <td>
                                                        <a href="adminright.com?user_id=${m.user_id }&user_auth=1">[지정]</a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane" id="profile-1" role="tabpanel">
                                <div class="table-responsive">
                                    <table class="table mb-1 table-hover">
                                        <thead>
                                        <tr role="row">
                                            <th><input class="form-check-input" type="checkbox" id="formCheck1"></th>
                                            <th>이름</th>
                                            <th>부서</th>
                                            <th>직책</th>
                                            <th>이메일</th>
                                            <th>연락처</th>
                                            <th>가입일</th>
                                            <th>마지막 접속</th>
                                            <th>상태</th>
                                            <th>관리자</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="m" items="${normal }">
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" id="formCheck2">
                                                </td>
                                                <td>
                                                    <a name="meminfo" href="mypage.my?user_id=${m.USER_ID }"
                                                       }">${m.USER_NAME }</a>
                                                </td>
                                                <td>${m.USER_DEPT }</td>
                                                <td>${m.USER_JOB }</td>
                                                <td>
                                                    <a href="#">${m.USER_EMAIL }</a>
                                                </td>
                                                <td>${m.USER_PHONE }</td>
                                                <td>${m.USER_JOIN_DATE }</td>
                                                <c:if test="${!empty m.USER_LASTTIME }">
                                                    <td>${m.USER_LASTTIME }</td>
                                                </c:if>
                                                <c:if test="${empty m.USER_LASTTIME }">
                                                    <td>미접속</td>
                                                </c:if>

                                                <!-- 상태 표시 -->
                                                <c:if test="${m.USER_STATE eq 0}">
                                                    <td style="color: green;">
                                                        <span>정상</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_STATE eq 1}">
                                                    <td style="color: red;">
                                                        <span>중지</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=0">[정상]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_STATE eq 2}">
                                                    <td style="color: orange">
                                                        <span>승인 대기</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=0">[승인]</a>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>

                                                <!-- 관리자 표시 -->
                                                <c:if test="${m.USER_IS_ADMIN eq 1}">
                                                    <td>
                                                        관리자<br>
                                                        <a href="adminright.com?user_id=${m.USER_ID }&user_is_admin=0">[해제]</a>

                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_IS_ADMIN eq 0}">
                                                    <td>
                                                        <a href="adminright.com?user_id=${m.USER_ID }&user_is_admin=1">[지정]</a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane" id="messages-1" role="tabpanel">
                                <div class="table-responsive">
                                    <table class="table mb-1 table-hover">
                                        <thead>
                                        <tr role="row">
                                            <th><input class="form-check-input" type="checkbox" id="formCheck1"></th>
                                            <th>이름</th>
                                            <th>부서</th>
                                            <th>직책</th>
                                            <th>이메일</th>
                                            <th>연락처</th>
                                            <th>가입일</th>
                                            <th>마지막 접속</th>
                                            <th>상태</th>
                                            <th>관리자</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="m" items="${wait }">
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" id="formCheck2">
                                                </td>
                                                <td>
                                                    <a name="meminfo" href="mypage.my?user_id=${m.USER_ID }"
                                                       }">${m.USER_NAME }</a>
                                                </td>
                                                <td>${m.USER_DEPT }</td>
                                                <td>${m.USER_JOB }</td>
                                                <td>
                                                    <a href="#">${m.USER_EMAIL }</a>
                                                </td>
                                                <td>${m.USER_PHONE }</td>
                                                <td>${m.USER_JOIN_DATE }</td>
                                                <c:if test="${!empty m.USER_LASTTIME }">
                                                    <td>${m.USER_LASTTIME }</td>
                                                </c:if>
                                                <c:if test="${empty m.USER_LASTTIME }">
                                                    <td>미접속</td>
                                                </c:if>

                                                <!-- 상태 표시 -->
                                                <c:if test="${m.USER_STATE eq 0}">
                                                    <td style="color: green;">
                                                        <span>정상</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_STATE eq 1}">
                                                    <td style="color: red;">
                                                        <span>중지</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=0">[정상]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_STATE eq 2}">
                                                    <td style="color: orange">
                                                        <span>승인 대기</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=0">[승인]</a>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>

                                                <!-- 관리자 표시 -->
                                                <c:if test="${m.USER_IS_ADMIN eq 1}">
                                                    <td>
                                                        관리자<br>
                                                        <a href="adminright.com?user_id=${m.USER_ID }&user_is_admin=0">[해제]</a>

                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_IS_ADMIN eq 0}">
                                                    <td>
                                                        <a href="adminright.com?user_id=${m.USER_ID }&user_is_admin=1">[지정]</a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane" id="settings-1" role="tabpanel">
                                <div class="table-responsive">
                                    <table class="table mb-1 table-hover">
                                        <thead>
                                        <tr role="row">
                                            <th><input class="form-check-input" type="checkbox" id="formCheck1"></th>
                                            <th>이름</th>
                                            <th>부서</th>
                                            <th>직책</th>
                                            <th>이메일</th>
                                            <th>연락처</th>
                                            <th>가입일</th>
                                            <th>마지막 접속</th>
                                            <th>상태</th>
                                            <th>관리자</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="m" items="${stop }">
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" id="formCheck2">
                                                </td>
                                                <td>
                                                    <a name="meminfo" href="mypage.my?user_id=${m.USER_ID }"
                                                       }">${m.USER_NAME }</a>
                                                </td>
                                                <td>${m.USER_DEPT }</td>
                                                <td>${m.USER_JOB }</td>
                                                <td>
                                                    <a href="#">${m.USER_EMAIL }</a>
                                                </td>
                                                <td>${m.USER_PHONE }</td>
                                                <td>${m.USER_JOIN_DATE }</td>
                                                <c:if test="${!empty m.USER_LASTTIME }">
                                                    <td>${m.USER_LASTTIME }</td>
                                                </c:if>
                                                <c:if test="${empty m.USER_LASTTIME }">
                                                    <td>미접속</td>
                                                </c:if>

                                                <!-- 상태 표시 -->
                                                <c:if test="${m.USER_STATE eq 0}">
                                                    <td style="color: green;">
                                                        <span>정상</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_STATE eq 1}">
                                                    <td style="color: red;">
                                                        <span>중지</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=0">[정상]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_STATE eq 2}">
                                                    <td style="color: orange">
                                                        <span>승인 대기</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=0">[승인]</a>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>

                                                <!-- 관리자 표시 -->
                                                <c:if test="${m.USER_IS_ADMIN eq 1}">
                                                    <td>
                                                        관리자<br>
                                                        <a href="adminright.com?user_id=${m.USER_ID }&user_is_admin=0">[해제]</a>

                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_IS_ADMIN eq 0}">
                                                    <td>
                                                        <a href="adminright.com?user_id=${m.USER_ID }&user_is_admin=1">[지정]</a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath }/resources/assets/js/admin_js/members.js"></script>
</html>