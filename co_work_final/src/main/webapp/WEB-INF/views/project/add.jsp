<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<jsp:include page="../main/header.jsp"/>

<link href="${pageContext.request.contextPath }/resources/assets/css/project_Css/project.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-JkdzVjKWBmSax7VulbL+jI2wVn4tj4i7Dm9Yz8NnI5P5Fb/a5r5hEJ5Z5W54M5LRz1osGKjvYzQZR/Uf93byRQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
                        <div style="text-align: center;">
						  <a href="/schedule" style="color: black; margin-right: 100px; display: inline-block; font-size: 15px;">
						    <i class="far fa-file-alt"></i> 글
						  </a> 
						  <a href="/schedule" style="color: black; margin-right: 100px; display: inline-block; font-size: 15px;">
						    <i class="fas fa-tasks"></i> 업무
						  </a> 
						  <a href="/schedule" style="color: black; margin-right: 100px; display: inline-block; font-size: 15px;">
						    <i class="far fa-calendar-alt"></i> 일정
						  </a> 
						  <a href="/schedule" style="color: black; margin-right: 100px; display: inline-block; font-size: 15px;">
						    <i class="fas fa-check-square"></i> 할 일
						  </a> 
						  <a href="/schedule" style="color: black; margin-right: 100px; display: inline-block; font-size: 15px;">
						    <i class="fas fa-vote-yea"></i> 투표
						  </a>
						</div>

                        <hr>
                        <form method="POST" action="/submit">
                        <div class="form-group">
						  <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" style="border:none; font-size:18px">
						</div>
						<div class="form-group">
						  <textarea class="form-control" id="content" name="content" rows="5" placeholder="내용을 입력하세요" style="border:none"></textarea>
						</div>
						
						<div style="display: inline-block; text-align: right; position: relative;">
						  <input type="text" class="form-control" id="filename" name="filename" readonly style="display: inline-block; width: 700px;">
						  <label for="file-upload" class="custom-file-upload" style="display: inline-block; position: absolute; right: 0; font-size: 20px;">
						    <i class="fa fa-file"></i>
						  </label>
						  <input id="file-upload" type="file" onchange="document.getElementById('filename').value = this.files[0].name;" multiple style="display: none;">
						</div>
						<div class="col-lg-2" style="display: inline-block;">
						 <button type="submit" class="btn btn-secondary waves-effect waves-light">등 록</button>
						</div></form>

                                    </div>
                            </div>

                    </div>
                </div>
            </div>
        <!-- end row -->

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