<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<html xmlns:th="http://www.thymeleaf.org">

<jsp:include page="../main/header.jsp"/>

<link href="${pageContext.request.contextPath }/resources/assets/css/project_Css/project.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
.page-content{
   margin-left: 15%;
   width: 75%;
}
#icon_id{
   display: none;
}
#sa-success{
   display: none;
}
textarea::-webkit-resizer {
    display: none;
}

textarea::-moz-resizer {
    display: none;
}

textarea::-o-resizer {
    display: none;
}

textarea::-ms-resizer {
    display: none;
}
.text-muted {
    --bs-text-opacity: 1;
    color: #000000!important;
}
body {
	font-size:15;
}
table {
		border: 1px solid black;
	}
	td {
		border: 1px solid black;
	}
.edms {
  margin-right: 0px; /* 가운데 정렬 */
  width: 80%; /* 크기 조정 */
  text-align: center; /* 가운데 정렬 */
}
h5 {
  text-align: center;
}
table {
	margin: auto; /* 가운데 정렬 */
  	width: 100%; /* 크기 조정 */
  text-align: center; /* 가운데 정렬 */
}



</style>
<body>
<div class="page-content">
    <div class="container-fluid">
        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                        </ol>
                    </div>

                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="pt-3">
                        	<h5>출장 신청서</h5><hr>
                                <div class="row">
								   <div class="col-xl-4">
									  <p class="text-muted mb-2">문서 번호 : <span><c:out value="${documents.DOCUMENT_FORM_CODE}"/></span></p>
									  <p class="text-muted mb-2">기안 일자 : <span><c:out value="${documents.DOCUMENT_FORM_DATE}"/></span></p>
									  <p class="text-muted mb-2">기안 부서 : <span><c:out value="${users.DEPT_NAME}"/></span></p>
									  <p class="text-muted mb-2">기 안 자 : <span><c:out value="${users.USER_NAME}"/></span></p>
									  <p class="text-muted mb-2">결재 상태 : <span><c:out value="${documents.DOCUMENT_STATE_STR}"/></span></p>
									  
									</div>
								   <div class="col-xl-8">
								        <table class="edms">
										  <tr>
										    <td rowspan="3"><p class="text-muted mb-2">결<br>재 </p></td>
										  <c:forEach items="${approval }" var="list">
										    <td><p class="text-muted mb-2">${list.JOB_NAME } </p></td>
										  </c:forEach>
										  </tr>
										  <tr>
										  <c:forEach items="${approval }" var="list">
										    <td><p class="text-muted mb-2">${list.USER_NAME } </p></td>
										  </c:forEach>
										  </tr>
										   <tr>
										   <c:forEach items="${approval }" var="list">
										   	 <c:if test="${list.APPROVAL_STATE == 1}">
										    <td><p class="mb-2" style="color:blue;">${list.USER_NAME } ${list.JOB_NAME }<br>${list.APPROVAL_DATE }</p></td>
										     </c:if>
										     <c:if test="${list.APPROVAL_STATE == 0}">
										    <td><p class="text-muted mb-2">  　  </p></td>
										     </c:if>
										   </c:forEach>
										  </tr>
										</table>
								    </div>
								</div>

										<div class=WordSection1>

											<div
												style="width: 1148px; display: flex; justify-content: space-center;">
											</div>
											<p class=MsoNormal>
												<span style='font-size: 1.0pt'>&nbsp;</span>
											</p>

											<table class=MsoNormalTable border=1 cellspacing=0
												cellpadding=0 align=left
												style='border-collapse: collapse; border: none; margin-left: -2.25pt; margin-right: -2.25pt'>
												<tr style='height: 20.55pt'>
													<td width=122 colspan=2
														style='width: 91.65pt; border-top: solid black 1.0pt; border-left: solid black 1.0pt; border-bottom: none; border-right: none; background: #BFBFFF; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 20.55pt'>
														<p class=a align=center style='margin-top: 4.8pt; margin-right: 1.25pt; margin-bottom: .8pt; margin-left: 1.25pt; text-align: center; line-height: normal; word-break: normal'>
													    <b><span lang=ZH-CN style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>출 장 기 간 </span></b>
													</p>
													</td>
													<td width=574 colspan=11
														style='width: 430.75pt; border: solid black 1.0pt; border-bottom: none; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 20.55pt'>
														<p class=a
															style='margin-top: 4.8pt; margin-right: 0in; margin-bottom: .8pt; margin-left: 0in; line-height: normal'>
															<span
																style='float: left;font-family: "Gulim", sans-serif; letter-spacing: .05pt'>&nbsp; ${bstrip.BSTRIPDATE}</span>
														</p>
													</td>
												</tr>
												<tr style='height: 55.8pt'>
													<td width=122 colspan=2
														style='width: 91.65pt; border-top: solid black 1.0pt; border-left: solid black 1.0pt; border-bottom: none; border-right: none; background: #BFBFFF; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 55.8pt'>
														<p class=a align=center
															style='margin-top: 4.8pt; margin-right: 1.25pt; margin-bottom: .8pt; margin-left: 1.25pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>출 장 지</span></b><b><span
																style='font-family: "Arial Unicode MS", serif; letter-spacing: .05pt'>
															</span></b>
														</p>
													</td>
													<td width=69
														style='width: 51.9pt; border-top: solid black 1.0pt; border-left: solid black 1.0pt; border-bottom: none; border-right: none; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 55.8pt'>
														 <div style=" display: flex;">
													      <p
													  style='float: left;width: 250px; font-size: 15px; margin-bottom: -10px;margin-left:-62px; padding-bottom: 5px;'>목적지 : ${bstrip.BSTRIPDESTINATION }</p>
													 </div>  
													</td>
													<td width=187 colspan=3
														style='width: 140.25pt; border: none; border-top: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 55.8pt'>
														<p class=a0
															style='margin-top: 4.8pt; margin-right: 0in; margin-bottom: .8pt; margin-left: 0in; line-height: normal; layout-grid-mode: char'>
															<span
																style='font-size: 9.0pt; font-family: "Gulim", sans-serif'>&nbsp;</span>
														</p>
													</td>
													<td width=72
														style='width: 54.05pt; border: none; border-top: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 55.8pt'>
															 <div style=" display: flex;">
													      <p
													  style='float: left;width: 250px; font-size: 15px; margin-bottom: -10px;margin-left:-48px; padding-bottom: 5px;'>경유지 : ${bstrip.BSTRIPSTOPOVER}</p>
													 </div>
													</td>
													<td width=246 colspan=6
														style='width: 184.45pt; border-top: solid black 1.0pt; border-left: none; border-bottom: none; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 55.8pt'>
														<p class=a align=center
															style='margin-top: 4.8pt; margin-right: 0in; margin-bottom: .8pt; margin-left: 0in; text-align: center; line-height: normal; word-break: normal'>
															<span
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'> &nbsp;</span>
														</p>
													</td>
												</tr>
												<tr style='height: 29.05pt'>
													<td width=122 colspan=2
														style='width: 91.65pt; border-top: solid black 1.0pt; border-left: solid black 1.0pt; border-bottom: none; border-right: none; background: #BFBFFF; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 29.05pt'>
														<p class=a align=center
															style='margin-top: 4.8pt; margin-right: 1.25pt; margin-bottom: .8pt; margin-left: 1.25pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>출 장 용 무 </span></b>
														</p>
													</td>
													<td width=574 colspan=11
														style='width: 430.75pt; border: solid black 1.0pt; border-bottom: none; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 29.05pt'>
														<p class=MsoFooter0 style='layout-grid-mode: both'>
															<span 
																style='float:left; font-size: 11.0pt; text-align:left; font-family: "Gulim", sans-serif'>&nbsp;${bstrip.BSTRIPLOCATION }</span>
																
														</p>
													</td>
												</tr>
												<tr style='height: 316.35pt'>
													<td width=122 colspan=2
														style='width: 91.65pt; border: solid black 1.0pt; border-right: none; background: #BFBFFF; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 316.35pt'>
														<p class=a align=center
															style='margin-top: 4.8pt; margin-right: 1.25pt; margin-bottom: .8pt; margin-left: 1.25pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>업무진행<br>예정사항</span></b>
														</p>
													</td>
													<td width=574 colspan=11
														style='width: 430.75pt; border: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 316.35pt'>
														<p class=a0
															style='margin-top: 4.8pt; margin-right: 0in; margin-bottom: .8pt; margin-left: 5.1pt; line-height: normal; layout-grid-mode: char'>
															<span
																style='font-size: 10.0pt; font-family: "Gulim", sans-serif; letter-spacing: .05pt'>&nbsp;${bstrip.BSTRIPLOCATIONBSCONTENT}</span>
														</p>
													</td>
												</tr>
												<tr style='height: 27.0pt'>
													<td width=69 rowspan=2
														style='width: 51.95pt; border: solid black 1.0pt; border-top: none; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 27.0pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>여비<br>신청</span></b>
														</p>
													</td>
													<td width=53
														style='width: 39.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 27.0pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>구분</span></b>
														</p>
													</td>
													<td width=115 colspan=2
														style='width: 86.15pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 27.0pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>일비</span></b>
														</p>
													</td>
													<td width=115
														style='width: 86.15pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 27.0pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>숙박비</span></b>
														</p>
													</td>
													<td width=115 colspan=4
														style='width: 86.15pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 27.0pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>교통비</span></b>
														</p>
													</td>
													<td width=115 colspan=2
														style='width: 86.15pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 27.0pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>기타</span></b>
														</p>
													</td>
													<td width=115 colspan=2
														style='width: 86.15pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 27.0pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>합계</span></b>
														</p>
													</td>
												</tr>
												<tr>
													<td width=53
														style='width: 39.7pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt'>
														<p class=a align=left
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: left; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>금액</span></b>
														</p>
													</td>
													<td width=115 colspan=2
														style='width: 86.15pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>&nbsp; ${bstrip.BSTRIPPERDIEM}</span></b>
														</p>
													</td>
													<td width=115
														style='width: 86.15pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>&nbsp; ${bstrip.BSTRIPROOMCHARGE }</span></b>
														</p>
													</td>
													<td width=115 colspan=4
														style='width: 86.15pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>&nbsp; ${bstrip.BSTRIPTRANSPORTATIONCOST }</span></b>
														</p>
													</td>
													<td width=115 colspan=2
														style='width: 86.15pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>&nbsp; ${bstrip.BSTRIPEXTRACOST }</span></b>
														</p>
													</td>
													<td width=115 colspan=2
														style='width: 86.15pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>&nbsp; ${bstrip.BSTRIPALLCOST }</span></b>
														</p>
													</td>
												</tr>
												<tr style='height: 31.8pt'>
													<td width=697 colspan=13
														style='width: 522.4pt; border-top: none; border-left: solid black 1.0pt; border-bottom: none; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 31.8pt'>
														<p class=a align=center
															style='margin-top: 4.8pt; margin-right: 1.25pt; margin-bottom: .8pt; margin-left: 1.25pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>위와 같이 출장을 신청합니다.</span></b><b><span
																style='font-family: "Arial Unicode MS", serif; letter-spacing: .05pt'>
															</span></b>
														</p>
													</td>
												</tr>
												<tr style='height: 27.0pt'>
													<td width=453 colspan=7
														style='width: 339.95pt; border: none; border-left: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 27.0pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>신청자 소속 : ${users.DEPT_NAME}</span></b><b><span
																style='font-family: "Arial Unicode MS", serif; letter-spacing: .05pt'>
															</span></b>
														</p>
													</td>
													<td width=79 colspan=3
														style='width: 59.4pt; border: none; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 27.0pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt;margin-left: -300px;'>성명 : ${users.USER_NAME}</span></b>
														</p>
													</td>
													<td width=95 colspan=2
														style='width: 71.6pt; border: none; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 27.0pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span
																style='font-family: "Gulim", sans-serif; letter-spacing: .05pt'>&nbsp;</span></b>
														</p>
													</td>
													<td width=69
														style='width: 51.4pt; border: none; border-right: solid black 1.0pt; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 27.0pt'>
														<p class=a align=center
															style='margin-top: 0in; margin-right: 1.25pt; margin-bottom: 0in; margin-left: 1.25pt; margin-bottom: .0001pt; text-align: center; line-height: normal; word-break: normal'>
															<b> <img src="${pageContext.request.contextPath }/resources/assets/images/stamp.jpg" style="width: 450px;height: 200px; margin-left: -100px">
															</b>
														</p>
													</td>
												</tr>
												<tr style='height: 30.2pt'>
													<td width=697 colspan=13
														style='width: 522.4pt; border: solid black 1.0pt; border-top: none; padding: 8.5pt 8.5pt 8.5pt 8.5pt; height: 30.2pt'>
														<p class=a align=center
															style='margin-top: 4.8pt; margin-right: 1.25pt; margin-bottom: .8pt; margin-left: 1.25pt; text-align: center; line-height: normal; word-break: normal'>
															<b><span lang=ZH-CN
																style='font-size: 13.0pt; font-family: "Gulim", sans-serif; letter-spacing: .05pt'>주식회사</span></b><b><span
																style='font-size: 13.0pt; font-family: "Gulim", sans-serif; letter-spacing: .05pt'>
																	00000  <span lang=ZH-CN>대표 귀하</span>
															</span></b>
														</p>
													</td>
												</tr>
												<tr height=0>
													<td width=69 style='border: none'></td>
													<td width=53 style='border: none'></td>
													<td width=69 style='border: none'></td>
													<td width=46 style='border: none'></td>
													<td width=115 style='border: none'></td>
													<td width=26 style='border: none'></td>
													<td width=72 style='border: none'></td>
													<td width=3 style='border: none'></td>
													<td width=14 style='border: none'></td>
													<td width=66 style='border: none'></td>
													<td width=49 style='border: none'></td>
													<td width=46 style='border: none'></td>
													<td width=69 style='border: none'></td>
												</tr>
											</table>




											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>

											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>
											
											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>
											
											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>
											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>
											<p class=a>
												<span style='letter-spacing: .05pt'>&nbsp;</span>
											</p>
										</div>
                                            </div>


											<hr>
											<c:forEach items="${approval }" var="list">
											<c:if test="${userId == list.USER_ID }">
                                           <div class="row">
             <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex">            
                            <img id="apUserCard" src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-1.jpg" alt="" class="avatar-sm me-4">
                            <div class="flex-grow-1 overflow-hidden">
                                <h5 class="text-truncate font-size-15" style="margin-left: -1160px;font-weight: bold;">승인상태</h5>
                                
                              <div>
                                        <div class="form-check form-checkbox-outline form-check-primary mb-3">
                                            <input class="form-check-input" type="checkbox" id="wait" value="0"
                                                checked>
                                            <label class="form-check-label" for="wait">
                                                대기중
                                            </label>
                                        </div>

                                        <div class="form-check form-checkbox-outline form-check-success mb-3">
                                            <input class="form-check-input" type="checkbox" id="approved" value="1"
                                                >
                                            <label class="form-check-label" for="approved">
                                                승인
                                            </label>
                                        </div>

                                        <div class="form-check form-checkbox-outline form-check-danger mb-3">
                                            <input class="form-check-input" type="checkbox" id="rejected" value="-1"
                                                >
                                            <label class="form-check-label" for="rejected">
                                                반려
                                            </label>
                                        </div>

                                    </div>
                                <p id="apState" class="text-danger"></p>
                            </div>
                        </div>
                        <h5 class="font-size-15 mt-4" style="font-weight: bold; margin-left: -1230px; margin-top: -80px;" >의견 내용 </h5>

                        <p id="apOpinion" class="text-muted"></p>
						  <form action="${pageContext.request.contextPath }/edms/edmsdetail" method="post">
						    <div class="flex-grow-1">
						        <textarea id="approvalOpinion" class="form-control" rows="3" cols="200" name="approvalOpinion"></textarea>
						        <input type="hidden" name="DOCUMENT_FORM_CODE" value="${documents.DOCUMENT_FORM_CODE}">
						        <input type="hidden" name="APPROVAL_USER_ID" value="${users.APPROVAL_USER_ID}">
						    	<input type="hidden" name="APPROVAL_STATE" value="0">
						    </div>
						    <button id="submitOpinion" class="btn btn-light" style="float: right;">의견 달기</button>
						    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form> 
                   
                    </div>
                </div>
            </div>
            <!-- end col -->
        </div>
        <!-- end row -->
											</c:if>
											</c:forEach>

                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    <!-- end card body -->
             </body>
             <script>
             $(function(){
            	 $('input[type="checkbox"]').on('click', function() {
            		    $('input[type="checkbox"]').not(this).prop('checked', false);
            		    $('input[name="APPROVAL_STATE"]').val($(this).val());
            	});
            	 $('#submitOpinion').on('click', function(e) {
            		    e.preventDefault();
            		    $('form').submit();
            	});
            	 
             })
             
             
             </script>
        <!-- end row -->
<!-- End Page-content -->