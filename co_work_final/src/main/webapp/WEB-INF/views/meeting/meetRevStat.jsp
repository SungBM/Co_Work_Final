<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="../main/header.jsp"/>
    <script
            src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
    <script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
    <script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/resources/assets/js/meeting_js/meetRevStat.js"></script>

    <title>예약내역</title>
    <style>
        .page-content {
            width: 80%
        }
    </style>
    <script>

    </script>

</head>
<body>
<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div
                            class="page-title-box d-sm-flex align-items-center justify-content-center">
                        <h4 class="mb-sm-0" style="font-size: 24px !important;">예약
                            내역</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table align-middle table-nowrap table-hover">
                                    <thead class="table-light">
                                    <tr>
                                        <th scope="col">회의실 이름</th>
                                        <th scope="col">예약 날짜</th>
                                        <th scope="col">예약 내용</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="mr" items="${list }">
                                        <tr>
                                            <td>
                                                <h5 class="font-size-14 mb-1">${mr.meet_name }</h5>
                                            </td>
                                            <td>${mr.rev_start_time }~${mr.rev_end_time }</td>
                                            <td>
                                                <div>
                                                    <h5 class="font-size-14 mb-1">${mr.rev_content }</h5>
                                                </div>
                                            </td>
                                            <td>
                                                <ul class="list-inline font-size-20 contact-links mb-0">
                                                    <li class="list-inline-item px-2"><a
                                                            href="../meet/meetDelete/${mr.rev_no }"><i
                                                            class="bx bx-trash" style="color:red"></i></a></li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <ul class="pagination pagination-rounded justify-content-center mt-4">
                                        <c:if test="${pageMaker.getCri().pageNum > 1}">
                                            <li class="page-item"><a
                                                    href="../meet/revstat?pageNum=${pageMaker.getCri().pageNum-1 }"
                                                    class="page-link"><i class="mdi mdi-chevron-left"></i></a></li>
                                        </c:if>
                                        <c:if test="${pageMaker.getCri().pageNum == 1 }">
                                            <li class="page-item disabled"><a href=""
                                                                              class="page-link"><i
                                                    class="mdi mdi-chevron-left"></i></a></li>
                                        </c:if>

                                        <c:forEach begin="${pageMaker.getPageStart() }"
                                                   end="${pageMaker.getPageEnd() }" var="idx">
                                            <c:if test="${idx == pageMaker.getCri().pageNum }">
                                                <li class="page-item active"><a
                                                        href="../meet/revstat?pageNum=${idx }"
                                                        class="page-link">${idx }</a></li>
                                            </c:if>
                                            <c:if test="${idx != pageMaker.getCri().pageNum }">
                                                <li class="page-item"><a
                                                        href="../meet/revstat?pageNum=${idx }"
                                                        class="page-link">${idx }</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${pageMaker.next}">
                                            <li class="page-item"><a
                                                    href="../meet/revstat?pageNum=${pageMaker.getCri().pageNum+1 }"
                                                    class="page-link"><i class="mdi mdi-chevron-right"></i></a>
                                            </li>
                                        </c:if>
                                        <c:if test="${!pageMaker.next}">
                                            <li class="page-item disabled"><a
                                                    href=".."
                                                    class="page-link"><i class="mdi mdi-chevron-right"></i></a>
                                            </li>
                                        </c:if>
                                    </ul>
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
</html>