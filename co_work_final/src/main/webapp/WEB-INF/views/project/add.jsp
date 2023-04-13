<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<jsp:include page="../main/header.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-JkdzVjKWBmSax7VulbL+jI2wVn4tj4i7Dm9Yz8NnI5P5Fb/a5r5hEJ5Z5W54M5LRz1osGKjvYzQZR/Uf93byRQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
.page-content{

   margin-left: 100px;

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
.card-body {
        border: 1px solid black;
        padding: 10px;
        width: 70%;
		height: 70vh;
}
textarea {
  resize: none;
}
 .btn-group {
            display: inline-block;
        }
        .btn-group button {
            background-color: #ffffff; /* Green background */
            border: 1px solid #ffffff; /* Green border */
            color: block; /* White text */
            padding: 10px 24px; /* Some padding */
            cursor: pointer; /* Pointer/hand icon */
            float: left; /* Float the buttons side by side */
            margin-right: 5px;
        }
        .btn-group button:not(:last-child) {
            border-right: none; /* Prevent double borders */
        }
        .btn-group button.active {
            background-color: #3e8e41;
            border: 1px solid #3e8e41;
        }
         .btn-group button:nth-child(1) {
         color: #e83939;
        }
         .btn-group button:nth-child(2) {
         color: #6969e8;
        }
         .btn-group button:nth-child(3) {
         color: #ec8718fa;
        }
         .btn-group button:nth-child(4) {
         color: #69c869;
        }
         .btn-group button:nth-child(5) {
         color: #848484;
        }
        .form-control {
        border: 1px solid #ffffff;
        }
.btn-group button.active {
  background-color: #ccc;
  border-radius: 50%;
}
        

</style>

<!-- dropzone css -->
<link href="assets/libs/dropzone/min/dropzone.min.css" rel="stylesheet" type="text/css" />
<body>
<div class="main-content">
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

        	 <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title mb-4">업무 작성</h3>

                        <div style="text-align:center;">
                    <a href="#" style="color: black; margin-right: 100px; display: inline-block; font-size: 15px;">
                      <i class="far fa-file-alt"></i> 글
                    </a> 

                    <a href="#" style="color: black; margin-right: 100px; display: inline-block; font-size: 15px;">
                      <i class="fas fa-tasks"></i> 업무
                    </a> 
                    <a href="./project_vote" style="color: black; margin-right: 100px; display: inline-block; font-size: 15px;">

             
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

                        <form method="POST" action="../project/submit" enctype="multipart/form-data">
                        <div class="form-group">
                    <input type="text" class="form-control" id="PRO_BOARD_SUBJECT" name="PRO_BOARD_SUBJECT" placeholder="제목을 입력하세요" style="border:none; font-size:18px"><br>
                  </div>
                  <i class="bx bx-list-ol text-muted mb-2 font-size-15" style="font-weight: bold"></i>
			    <div class="btn-group">
				  <button type="button">요청</button>
				  <button onclick="event.preventDefault(); updateStatus('진행', 'PRO_BOARD_STATE')" class="${myEntity.status == '진행' ? 'active' : ''}" id="btn-progress">진행</button>
				  <button type="button">피드백</button>
				  <button onclick="event.preventDefault(); updateStatus('완료', 'PRO_BOARD_STATE')" class="${myEntity.status == '완료' ? 'active' : ''}" id="btn-complete">완료</button>
				  <button type="button">보류</button>
				</div>


	
			    
			    <div class="col-lg-11">
			        <div class="input-daterange input-group" id="project-date-inputgroup"
			                                        data-provide="datepicker" data-date-format="yyyy-mm-dd"
			                                        data-date-container='#project-date-inputgroup' data-date-autoclose="true">
			            <input type="text" class="form-control" placeholder="시작일" id="PRO_BOARD_START" name="PRO_BOARD_START" />
			        </div><br>
			        
			        <div class="input-group">
			        	<div class="input-daterange input-group" id="project-date-inputgroup"
			                                        data-provide="datepicker" data-date-format="yyyy-mm-dd"
			                                        data-date-container='#project-date-inputgroup' data-date-autoclose="true">
			            <input type="text" class="form-control" placeholder="종료일" id="PRO_BOARD_END" name="PRO_BOARD_END" />
			        </div>
			    </div>
			</div>
                  <div class="form-group">
                  	<br><textarea class="form-control" id="PRO_BOARD_CONTENT" name="PRO_BOARD_CONTENT" rows="5" placeholder="내용을 입력하세요" style="border:none"></textarea>
                    
                  </div>
                  
                  <br><br><br><br><br><br><br><br>
				 <div style="display: flex; align-items: center;">
				  <div style="flex: 1;">
				    <input type="file" class="form-control" id="PRO_BOARD_FILE" name="uploadfile" readonly style="width: 100%;">
				    <label for="PRO_BOARD_FILE_ORIGINAL" class="custom-file-upload" style="position: absolute; right: 0; font-size: 20px;">
				      <!-- <i class="fa fa-file"></i>-->
				    </label>
				    <input id="PRO_BOARD_FILE_ORIGINAL" type="file" onchange="document.getElementById('PRO_BOARD_FILE').value = this.files[0].name;" multiple style="display: none;">
				  </div>
				  <div style="margin-left: 10px;">
				    <button type="submit" class="btn btn-secondary waves-effect waves-light">등 록</button>
				  </div>
				</div>




<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


                  </form>
                                    </div>
                            </div>
						</div>
                    </div>
                </div>
            </div>
        <!-- end row -->

<!-- End Page-content -->
</div>
</body>
<!-- bootstrap datepicker -->
<script src="assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

<!-- dropzone plugin -->
<script src="assets/libs/dropzone/min/dropzone.min.js"></script>

<script>


function setActiveButton(btn) {
	  // 모든 버튼에서 active 클래스 제거
	  const buttons = document.querySelectorAll('.btn-group button');
	  buttons.forEach(button => {
	    button.classList.remove('active');
	  });

	  // 클릭한 버튼에 active 클래스 추가
	  btn.classList.add('active');
	}

</script>
<jsp:include page="../main/footer.jsp"></jsp:include>