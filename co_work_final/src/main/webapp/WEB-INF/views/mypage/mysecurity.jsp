<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"/>
<head>
    <title>보안</title>
</head>

<body>
<div class="main-content">
    <div class="page-content ">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex">
                        <h4 class="mb-sm-0 font-size-18">설정> 보안</h4>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">내 기기 목록</h4>
                    <div class="table-responsive">
                        <table class="table table-dark mb-0">
                            <tbody>
                            <tr>
                                <td>Windows</td>
                                <td>Chrome</td>
                                <td>
                                    <div>
                                        로그인 일시:2023-03-23 15:30(IP:192.168.0.232)
                                    </div>
                                    <div>
                                        자동로그인
                                    </div>
                                </td>
                                <td>접속중</td>
                            </tr>
                            <tr>
                                <td>Windows</td>
                                <td>While</td>
                                <td>
                                    <div>
                                        로그인 일시:2023-03-22 15:30(IP:192.168.0.232)
                                    </div>
                                    <div>

                                    </div>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger waves-effect waves-light">로그아웃</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

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