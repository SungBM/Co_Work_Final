<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/board_js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/mypage_js/mypage.js"></script>

<head>
    <title>결재상황 확인</title>
    <style>
 
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
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                    <h4 class="mb-sm-0 font-size-18">출장 신청서 &nbsp|&nbsp ${docNum }</h4>

                    <div class="page-title-right">	
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">전자결재</a></li>
                            <li class="breadcrumb-item active">출장 신청서 &nbsp|&nbsp ${docNum }</li><!-- ${DOCUMENT_FORM_CODE } -->
                        </ol>
                    </div>

                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-lg-16">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title mb-4">현재 문서 의견 </h4>

                        <div class="table-responsive">
                            <table class="table ">
	                            <thead>
	                            	<tr>
	                            		<td> </td>
	                            		<td style="font-weight: bold">결재자</td>
	                            		<td style="font-weight: bold">직위</td>
	                            		<td style="font-weight: bold">부서</td>
	                            		<td style="font-weight: bold" width="20%">등록일자</td>
	                            		<td style="font-weight: bold">상태</td>
	                            		<td style="font-weight: bold">결과</td>
	                            	</tr>
	                            </thead>
                                <tbody>
                                	<c:forEach var="e" items="${edmslist}" varStatus="stat">
	                                    <tr class="approvalRow">
	                                        <td style="width: 50px;">
	                                        <input type="hidden" value="${e.APPROVAL_NUM }" id="${stat.index }"> 
	                                        <img 
                                                             src="${pageContext.request.contextPath }/resources/assets/images/users${e.USER_CARD}"
	                                                class="rounded-circle avatar-xs" alt=""></td> <!-- alt="결재자 프로필 이미지"> -->
	                                        <td>
	                                            <h5 class="font-size-14 m-0"><a href="#" class="text-dark">${e.USER_NAME}</a> <!-- 결재자 클릭시 ajax호출하여 페이지 하단에 출력 -->
	                                            </h5>
	                                        </td>
	                                        <td>${e.USER_JOB}</td>
	                                        
	                                        <td>${e.USER_DEPT}</td>
	                                         <c:if test="${e.APPROVAL_STATE eq '0' }">
	                                         <td style="font-weight: bold">　　　　　- </td>
	                                         
	                                        </c:if>
	                                         <c:if test="${e.APPROVAL_STATE ne '0' }">
	                                         <td>${e.APPROVAL_DATE}</td>
	                                        </c:if>
	                                       
	                                        <c:if test="${e.APPROVAL_STATE eq '-1' }">
                                            	<td class="text-danger">반려</td>
                                            	<td><i class="mdi mdi-close-octagon-outline text-danger" style="font-size: 20px;"></i></td>
											</c:if>
                                            <c:if test="${e.APPROVAL_STATE eq '0' }">
                                                <td class="text-primary">대기</td>
                                                <td><i class="mdi mdi-minus-circle-outline text-primary" style="font-size: 20px;"></i></td>
                                            </c:if>
                                            <c:if test="${e.APPROVAL_STATE eq '1' }">
                                                <td class="text-success">승인</td>
                                                <td><i class="mdi mdi-check-circle-outline text-success" style="font-size: 20px;"></i></td>
                                            </c:if>
                                            
	                                    </tr>
									</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end col -->
        </div>
        <!-- end row -->

        <div class="row">
             <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex">            
                            <img id="apUserCard" src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-1.jpg" alt="" class="avatar-sm me-4" style="display: none;">

                            <div class="flex-grow-1 overflow-hidden">
                                <h5 class="text-truncate font-size-15">의견 내용</h5>
                                
                                <p id="apState" class="text-danger"></p>
                            </div>
                        </div>

                        <h5 class="font-size-15 mt-4" style="font-weight: bold">의견 내용 :</h5>

                        <p id="apOpinion" class="text-muted"></p>


                        <div class="row task-dates">
                            <div class="col-sm-4 col-6">
                                <div class="mt-4">
                                    <h5 class="font-size-14"><i class="bx bx-calendar me-1 text-primary" style="font-weight: bold"></i> 등록일
                                    </h5>
                                    <p id="apDate" class="text-muted mb-0"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end col -->
        </div>
        <!-- end row -->

    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->
</div>
</body>
<script src="${pageContext.request.contextPath }/resources/assets/libs/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/form-mask.init.js"></script>
<script>
$(function(){
	$(".approvalRow").click(function(){
		
		var apNum =  $(this).children().children().val();
		$.ajax({
			type:"get",
			url : "${pageContext.request.contextPath }/edms/approvalOpinion?apNum=" + apNum,
			success: function(edms){
				
				var splitEdms = edms.split("@");
				var apState = splitEdms[0];
				var apUserCard = splitEdms[1];
				var apOpinion = splitEdms[2];
				var apDate = splitEdms[3];
				var  src = '${pageContext.request.contextPath }/resources/assets/images/users' + apUserCard;
				$("#apUserCard").css('display','inline');
				$("#apUserCard").attr('src',src)
				if(apOpinion != 'null' ) {
					$("#apOpinion").empty();
					$("#apOpinion").text(apOpinion);
				} else if (apOpinion == 'null') {
					$("#apOpinion").empty();
					$("#apOpinion").text();
				}
				
				
				if(apDate != 'null' ){
					$("#apDate").empty();
					$("#apDate").text(apDate);
				} else if (apDate == 'null'){
					$("#apDate").empty();
					$("#apDate").text();
				}
			
				console.log(apState);
				
				if(apState == '-1'){
					$("#apState").removeClass();
					$("#apState").text("반려됨");
					$("#apState").addClass("text-danger");
				} else if ( apState == '0' ){
					$("#apState").removeClass();
					$("#apState").text("대기중");
					$("#apState").addClass("text-primary");
				} else if ( apState == '1' ){
					$("#apState").removeClass();
					$("#apState").text("승인됨");
					$("#apState").addClass("text-success");
				}
				
			
				
			}
		});
	});
});
</script>
</html>