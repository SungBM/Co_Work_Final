<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<jsp:include page="../main/header.jsp"/>

<link href="${pageContext.request.contextPath }/resources/assets/css/project_Css/project.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">

<style>
.page-content{
	margin-left: 400px;
}
#icon_id{
	display: none;
}
#sa-success{
	display: none;
}
.input-group-text i.fa {
  font-size: 20px;
}
</style>

<!-- dropzone css -->
<link href="assets/libs/dropzone/min/dropzone.min.css" rel="stylesheet" type="text/css" />


<div class="page-content">
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">


                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title mb-4">글 작성</h4>
                        <form>
                            <div class="row mb-4">
                                <label for="projectname" class="col-form-label col-lg-2">Project Name</label>
                                <div class="col-lg-10">
                                    <input id="projectname" name="projectname" type="text" class="form-control"
                                        placeholder="Enter Project Name...">
                                </div>
                            </div>
                            <div class="row mb-4">
                                <label for="projectdesc" class="col-form-label col-lg-2">Project Description</label>
                                <div class="col-lg-10">
                                    <textarea class="form-control" id="projectdesc" rows="3"
                                        placeholder="Enter Project Description..."></textarea>
                                </div>
                            </div>

                            <div class="row mb-4">
                                <label class="col-form-label col-lg-2">Project Date</label>
                                <div class="col-lg-10">
                                    <div class="input-daterange input-group" id="project-date-inputgroup"
                                        data-provide="datepicker" data-date-format="dd M, yyyy"
                                        data-date-container='#project-date-inputgroup' data-date-autoclose="true">
                                        <input type="text" class="form-control" placeholder="Start Date" name="start" />
                                        <input type="text" class="form-control" placeholder="End Date" name="end" />
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-4">
                                <label for="projectbudget" class="col-form-label col-lg-2">Budget</label>
                                <div class="col-lg-10">
                                    <input id="projectbudget" name="projectbudget" type="text"
                                        placeholder="Enter Project Budget..." class="form-control">
                                </div>
                            </div>
                        </form>
                        <div class="row mb-4">
                            <label class="col-form-label col-lg-2">Attached Files</label>
                            <div class="col-lg-10">
                                <form action="/" method="post" class="dropzone">
                                    <div class="fallback">
                                        <input name="file" type="file" multiple />
                                    </div>

                                    <div class="dz-message needsclick">
                                        <div class="mb-3">
                                            <i class="display-4 text-muted bx bxs-cloud-upload"></i>
                                        </div>

                                        <h4>Drop files here or click to upload.</h4>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row justify-content-end">
                            <div class="col-lg-10">
                                <button type="submit" class="btn btn-primary">Create Project</button>
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


<!-- bootstrap datepicker -->
<script src="assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

<!-- dropzone plugin -->
<script src="assets/libs/dropzone/min/dropzone.min.js"></script>

<script>
    Dropzone.autoDiscover = false;
    $(document).ready(function () {
        $(".dropzone").dropzone();
    });
</script>
<jsp:include page="../main/footer.jsp"></jsp:include>