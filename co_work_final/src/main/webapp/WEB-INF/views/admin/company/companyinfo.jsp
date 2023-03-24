<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../main/header.jsp"></jsp:include>
<title>회사정보</title>
<style>
    input[type=file] {
        display: none;
    }

    #showImage1 > img, #showImage2 > img {
        width: 200px;
        height: 200px;
    }

    .tDnD_whileDrag, table.tablednd tbody tr:hover {
        background-color: #eee;
    }
</style>

</style>
<script>
    function deptAllCheck() {
        var dac = document.dept.deptallcheck;
        var drc = document.dept.dept_no;

        if (dac.checked == true) {
            console.log(drc.length)
            for (i = 0; i < drc.length; i++) {
                drc[i].checked = true;
            }
        } else if (dac.checked == false) {
            for (i = 0; i < drc.length; i++) {
                drc[i].checked = false;
            }
        }
    } // deptAllCheck() end

    function jobAllCheck() {
        var jac = document.job.joballcheck;
        var jrc = document.job.job_no;

        if (jac.checked == true) {
            for (i = 0; i < jrc.length; i++) {
                jrc[i].checked = true;
            }
        } else if (jac.checked == false) {
            for (i = 0; i < jrc.length; i++) {
                jrc[i].checked = false;
            }
        }
    } // deptAllCheck() end

    $(document).ready(function () {
        // $(function () {
        //     var ordered_items;
        //     onDragClass: "drag",
        //     $('#depttable').tableDnD({
        //         onDrop: function (table, row) {
        //             ordered_items = $.tableDnD.serialize('id');
        //         }
        //     });
        // })

        $("input[type=checkbox]").click(function () {
            var dd = $("[name='dept_no']:checked").length;
            var jj = $("[name='job_no']:checked").length;

            if (dd > 0 && jj == 0) {
                $("#deptdel").prop("disabled", false);
                $("#jobdel").prop("disabled", true);
            } else if (dd > 0 && jj > 0) {
                $("#deptdel").prop("disabled", false);
                $("#jobdel").prop("disabled", false);
            } else if (dd == 0 && jj > 0) {
                $("#deptdel").prop("disabled", true);
                $("#jobdel").prop("disabled", false);
            } else if (dd == 0 && jj == 0) {
                $("#deptdel").prop("disabled", true);
                $("#jobdel").prop("disabled", true);
            }
        })  // checkbox에 따른 삭제버튼 활성화


    })

</script>
</head>
<body>
<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0 font-size-18">회사> 회사정보</h4>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="companyimgupdateprocess.com" method="post" enctype="multipart/form-data">
                                <div class="mb-2 row">
                                    <label for="example-text-input" class="col-md-2 col-form-label">로고 설정</label>
                                    <div class="col-md-8">
                                        <label>
											<span id="showImage1">
												<c:set var='src' value='${"image/" }${companyinfo.company_logo }'/>
												<input type="hidden" name="check" value=${companyinfo.company_logo }>
												<img src="${src }" alt="company_logo"
                                                     style="width: 312px; height:100px;">
											</span>
                                            <input class="form-control" type="file" value="${companyinfo.company_logo }"
                                                   name="company_logo" id="formFile1">
                                            <input type="hidden" name="company_name" value=${companyinfo.company_name }>
                                            <input type="hidden" name="value" value="company_logo">
                                        </label>
                                    </div>
                                    <div class="col-md-2">
                                        <button class="btn btn-success waves-effect waves-light" type="submit"
                                                name="sub">수정
                                        </button>
                                        <span></span>
                                        <input class='btn btn-warning waves-effect waves-light' type="reset" id="second"
                                               style="display: none" value="취소">
                                    </div>
                                </div>
                            </form>
                            <div class="row">
                                <div class="col-2">
                                </div>
                                <div class="col-md-6">권장크기 : 300px x 100px</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- end row -->

            <!-- list1 -->
            <div class="row">
                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-body">
                            <form name="dept" action="../admin/deleteDept" method="post"
                                  onsubmit="return confirm('정말 삭제하시겠습니까?')">
                                <div class="row text-center justify-content-end">
                                    <h4 class="col-md-4 font-size-18">부서</h4>
                                    <button type="button"
                                            class="col-md-2 btn btn-sm btn-primary waves-effect waves-light bx bx-plus  "
                                            data-bs-toggle="modal" data-bs-target="#deptadd">추가
                                    </button>
                                    <button type="submit"
                                            class="col-md-2 mx-2 btn btn-sm btn-danger waves-effect waves-light bx bx-x"
                                            id="deptdel" disabled>삭제
                                    </button>
                                </div>
                                <table class="table table-bordered mt-4" id="depttable">
                                    <th><input type="checkbox" name="deptallcheck" onclick="deptAllCheck()"></th>
                                    <th>부서명</th>
                                    <th>부서코드</th>
                                    <tr>
                                        <c:forEach var="d" items="${dept}">
                                        <td><input type="checkbox" name="dept_no" value="${d.dept_no}"></td>
                                        <td>${d.dept_name}</td>
                                        <td>
                                                ${d.dept_no}
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </form>

                        </div>
                    </div>
                </div>

                <!-- list 2 -->
                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-body">
                            <form name="job" action="../admin/deleteJob" method="post"
                                  onsubmit="return confirm('정말 삭제하시겠습니까?')">
                                <div class="row text-center justify-content-end">
                                    <h4 class="col-md-4 font-size-18">직급</h4>
                                    <button type="button"
                                            class="col-md-2 btn btn-sm btn-primary waves-effect waves-light bx bx-plus  "
                                            data-bs-toggle="modal" data-bs-target="#jobadd">추가
                                    </button>
                                    <button type="submit"
                                            class="col-md-2 mx-2 btn btn-sm btn-danger waves-effect waves-light bx bx-x"
                                            id="jobdel" disabled>삭제
                                    </button>
                                </div>
                                <table class="table table-bordered mt-4" id="jobtable">
                                    <th><input type="checkbox" name="joballcheck" onclick="jobAllCheck()"></th>
                                    <th>직급명</th>
                                    <th>직급코드</th>
                                    <tr>
                                        <c:forEach var="d" items="${job}">
                                        <td><input type="checkbox" name="job_no" value="${d.job_no}"></td>
                                        <td>${d.job_name}</td>
                                        <td>
                                                ${d.job_no}
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <!-- 부서 Modal -->
                <div class="modal fade" id="deptadd" data-bs-backdrop="static" data-bs-keyboard="false"
                     tabindex="-1" aria-labelledby="staticBackdropLabel" style="display: none;" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">부서 추가</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="../admin/deptadd" method="post">
                                    <div class="row mb-4">
                                        <label for="horizontal-code-input"
                                               class="col-sm-3 col-form-label">코드(숫자)</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="dept_no"
                                                   id="horizontal-code-input"
                                                   placeholder="부서코드" value="${dmaxno}" readonly>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <label for="horizontal-job-input"
                                               class="col-sm-3 col-form-label">명칭(한글)</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="dept_name"
                                                   id="horizontal-job-input"
                                                   placeholder="추가할 부서명을 입력하세요.">
                                        </div>

                                    </div>
                                    <div class="row justify-content-end">
                                        <div class="col-sm-7">
                                            <div>
                                                <button type="submit" class="btn btn-primary">저장</button>
                                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                                                    닫기
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 직급 Modal -->
                <div class="modal fade" id="jobadd" data-bs-backdrop="static" data-bs-keyboard="false"
                     tabindex="-1" aria-labelledby="staticBackdropLabel" style="display: none;" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">직급 추가</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="../admin/jobadd" method="post">
                                    <div class="row mb-4">
                                        <label for="horizontal-code-input"
                                               class="col-sm-3 col-form-label">코드(숫자)</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="job_no"
                                                   id="horizontal-code-input"
                                                   placeholder="직급코드" value="${jmaxno}" readonly>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <label for="horizontal-job-input"
                                               class="col-sm-3 col-form-label">명칭(한글)</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="job_name"
                                                   id="horizontal-job-input"
                                                   placeholder="추가할 직급명을 입력하세요.">
                                        </div>

                                    </div>
                                    <div class="row justify-content-end">
                                        <div class="col-sm-7">
                                            <div>
                                                <button type="submit" class="btn btn-primary">저장</button>
                                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                                                    닫기
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->
    </div>
    <!-- end main content-->
</div>
</div>
</body>

<script src="${pageContext.request.contextPath }/resources/assets/js/admin_js/company.js"></script>
</html>