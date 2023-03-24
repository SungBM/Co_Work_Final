<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"/>
<head>
    <title>내 프로필</title>
    <style>
    input[type=file] {
        display: none;
    }

    #showImage1 > img {
        width: 200px;
        height: 200px;
    }

    #showImage2 > img {
        width: 200px;
        height: 111px;
    }

    .form-control {
        border: none;
        border-bottom: 1px solid #CCC;
        border-radius: 0;
    }

    .form-control:read-write:focus {
        border-bottom: 2px solid blue;
    }

    </style>
</head>

<body>
<div class="main-content">
    <div class="page-content ">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex">
                        <h4 class="mb-sm-0 font-size-18">내 프로필> 수정</h4>
                    </div>
                </div>
            </div>

            <form name="update" action="../member/updateProcess" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-12">
                        <div class="row d-flex justify-content-center mb-5">
                            <div class="col-3">
                                <div>
                                    <img class="card-img-top img-fluid" src="${pageContext.request.contextPath }/resources/upload${path}">
                                    <div class="d-flex justify-content-center mt-3 filebox">
                                        <input class="form-control" type="file" id="imgupload" name="imgupload">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-6">
                        <div class="col-10  align-items-center container-fluid">
                            <label class="form-label" for="user_id"><b>아이디</b></label>
                            <div class="input-group" id="user_id">
                                <input type="text" class="form-control" name="user_id" value="${memberinfo.user_id}"
                                       readonly>
                            </div>
                        </div>

                        <div class="col-10 mt-5  align-items-center container-fluid">
                            <label class="form-label" for="user_dept"><b>부서</b></label>
                            <div class="input-group" id="user_dept">
                                <input type="text" class="form-control" name="user_dept"
                                       value="${memberinfo.user_dept}" readonly>
                            </div>
                        </div>

                        <div class="col-10 mt-5  align-items-center container-fluid">
                            <label class="form-label" for="user_phone"><b>연락처</b></label>
                            <div class="input-group" id="user_phone">
                                <input type="text" class="form-control" name="user_phone"
                                       value="${memberinfo.user_phone}">
                            </div>
                        </div>

                        <div class="col-10 mt-5  align-items-center container-fluid">
                            <label class="form-label" for="user_email"><b>이메일</b></label>
                            <div class="input-group" id="user_email">
                                <input type="text" class="form-control" name="user_email"
                                       value="${memberinfo.user_email}" readonly>
                            </div>
                        </div>

                    </div>

                    <div class="col-6" style="">
                        <div class="col-10  align-items-center container-fluid">
                            <label class="form-label" for="user_name"><b>이름</b></label>
                            <div class="input-group" id="user_name">
                                <input type="text" class="form-control" name="user_name" value="${memberinfo.user_name}"
                                       readonly>
                            </div>
                        </div>

                        <div class="col-10 mt-5  align-items-center container-fluid">
                            <label class="form-label" for="user_job"><b>직급</b></label>
                            <div class="input-group" id="user_job">
                                <input type="text" class="form-control" name="user_job" value="${memberinfo.user_job}"
                                       readonly>
                            </div>
                        </div>

                        <div class="col-10 mt-5  align-items-center container-fluid">
                            <label class="form-label" for="user_fax"><b>팩스번호</b></label>
                            <div class="input-group" id="user_fax">
                                <input type="text" class="form-control" name="user_fax" value="${memberinfo.user_fax}">
                            </div>
                        </div>

                        <div class="col-10 mt-5  align-items-center container-fluid">
                            <label class="form-label" for="user_join_date"><b>입사일</b></label>
                            <div class="input-group" id="user_join_date">
                                <input type="text" class="form-control" name="user_join_date"
                                       value="${memberinfo.user_join_date}" readonly>
                            </div>
                        </div>


                    </div>

                    <div class="col-xl-12 mt-5 d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary waves-effect waves-light m-1" disabled>정보변경
                        </button>
                    </div>
                </div>
            </form>

        </div>
    </div>
    <!-- End Page-content -->
</div>
</body>
<script>
    $(function () {

        // 정보 변경 시 버튼 활성화
        $("input[name=user_phone], input[name=user_fax], input[type=file]").on('keyup change', function () {
            const phone = $("input[name=user_phone]").val();
            const fax = $("input[name=user_fax]").val();
            const id = $("input[name=user_id]").val();
            const img = $("input[type=file]").val();

            $.ajax({
                url: "updateCheck",
                type: "post",
                contentType: 'application/json',
                data: JSON.stringify({
                    "user_phone": phone,
                    "user_fax": fax,
                    "user_id": id
                }),
                success: function (resp) {
                    console.log("ajax = " + phone, fax, img);
                    if (resp == 'success' || img) {
                        $("button[type=submit]").attr("disabled", false);
                    } else if (resp == 'fail' || !img) {
                        $("button[type=submit]").attr("disabled", true);
                    }
                }
            })
        }) // 연락처, 팩스번호 바뀌면 정보변경 버튼 활성화 end


    })
</script>
</html>