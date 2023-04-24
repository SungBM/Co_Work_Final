<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../main/header.jsp"/>
    <title>회의실 관리</title>
    <style>

    </style>
    <script>
        $(document).ready(function(){
            $(document).on("click","#delButton", function(e){
                var result = confirm("삭제하시겠습니까?")
                if(!result)
                    return false;
            })
        })


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
                        <h3 class="mb-sm-0 font-size-24">회의실 관리</h3>
                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <a class="btn btn-info mb-3" id="meetRoomAdd" href="../admin/meetAdd">등록</a>
                                <table class="table align-middle table-nowrap table-hover text-center">
                                    <thead class="table-light">
                                    <tr>
                                        <th scope="col">이름</th>
                                        <th scope="col">최대 인원</th>
                                        <th scope="col">정보</th>
                                        <th scope="col">상태</th>
                                        <th scope="col">수정</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="mr" items="${list}" varStatus="status">
                                        <tr>
                                            <td>
                                                <h5 class="font-size-14 mb-1">${mr.meet_name }</h5>
                                            </td>
                                            <td>${mr.meet_max_people } 명</td>
                                            <td>${mr.meet_info }</td>
                                            <c:if test="${mr.meet_status == 'CP' }">
                                                <td>예약가능</td>
                                            </c:if>
                                            <c:if test="${mr.meet_status == 'ST' }">
                                                <td style="color:red">예약불가</td>
                                            </c:if>
                                            <td><a type="button" class="btn btn-light waves-effect"
                                                   href="../admin/meetRoomModify?meet_no=${mr.meet_no }">수정</a>
                                                <a type="button" class="btn btn-danger waves-effect" id="delButton"
                                                   href="../admin/meetRoomDelete?meet_no=${mr.meet_no }">삭제</a>

                                            </td>
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
</body>
</html>