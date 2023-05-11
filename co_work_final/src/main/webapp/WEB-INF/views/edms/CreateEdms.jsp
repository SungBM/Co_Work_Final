<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/mypage_js/mypage.js"></script>

<head>
    <title>결재상황 확인</title>
 <link href="${pageContext.request.contextPath }/resources/assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <style>
 <!--
 /* Font Definitions */
 @font-face
	{font-family:Batang;
	panose-1:2 3 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:Gulim;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Arial Unicode MS";
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:"Malgun Gothic";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
@font-face
	{font-family:宋?;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"HCI Poppy";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:휴먼명조;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:BatangChe;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@Gulim";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"\@Malgun Gothic";}
@font-face
	{font-family:"\@Batang";
	panose-1:2 3 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"\@宋?";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@BatangChe";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@휴먼명조";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	text-autospace:none;
	word-break:break-all;
	font-size:11.0pt;
	font-family:"Malgun Gothic",sans-serif;}
p.a, li.a, div.a
	{mso-style-name:바탕글;
	margin:0in;
	text-align:justify;
	text-justify:inter-ideograph;
	line-height:103%;
	layout-grid-mode:char;
	text-autospace:none;
	word-break:break-all;
	font-size:10.0pt;
	font-family:Batang;
	color:black;}
p.a0, li.a0, div.a0
	{mso-style-name:지청일;
	margin:0in;
	text-align:justify;
	text-justify:inter-ideograph;
	line-height:103%;
	text-autospace:none;
	word-break:break-all;
	font-size:12.0pt;
	font-family:"HCI Poppy",serif;
	color:black;}
p.MsoFooter0, li.MsoFooter0, div.MsoFooter0
	{mso-style-name:MsoFooter;
	margin:0in;
	text-align:justify;
	text-justify:inter-ideograph;
	layout-grid-mode:char;
	text-autospace:none;
	word-break:break-all;
	font-size:10.0pt;
	font-family:"BatangChe",serif;
	color:black;}
.MsoChpDefault
	{font-family:"Malgun Gothic",sans-serif;}
 /* Page Definitions */
 @page WordSection1
	{size:595.25pt 841.85pt;
	margin:71.6pt 26.65pt 43.0pt 25.1pt;}
div.WordSection1
	{page:WordSection1;}
 /* List Definitions */
 ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
  #approval {
    border-collapse: collapse;
      float: right;
  }
  td {
    border: solid 1px;
    width: 90px;
    height: 60px;
    text-align: center;
  }
  .vertical-text {
    width: 20px;
    transform: rotate(-90deg);
    transform-origin: left top 0;
    white-space: nowrap;
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
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                    <h4 class="mb-sm-0 font-size-18">출장 신청서 ${docNum }</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">전자결재</a></li>
                            <li class="breadcrumb-item active">출장 신청서 ${docNum }</li>
                        </ol>
                    </div>

                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body col-lg-20">
                        <h4 class="card-title mb-4" >출장 신청서</h4>
                        <form class="outer-repeater" id="bsTripForm" action="${pageContext.request.contextPath }/edms/addBsTrip" method="post">
                            <div data-repeater-list="outer-group" class="outer">
                                <div data-repeater-item class="outer">
                                    <div class="form-group row mb-4">
                                        <label for="taskname" class="col-form-label col-lg-2">제  목</label>
                                        <div class="col-lg-10">
                                            <input id="DocumentName" name="taskname"  type="text" class="form-control"
                                                placeholder="양식 제목을 입력하세요..">
                                        </div>
                                    </div>
                                      <div class="inner-repeater mb-4">
                                        <div data-repeater-list="inner-group" class="inner form-group mb-0 row">
                                            <label class="col-form-label col-lg-2">결재자</label>
                                               <c:forEach begin="1" end="4" var="i">
                                            <div data-repeater-item class="inner col-lg-10 ms-md-auto">
                                                <div class="mb-3 row align-items-center">
                                                    <div class="col-md-6">
                                  
                                        <select class="form-control select2">
                                              <c:forEach items="${deptList }" var="dept">
                                               	<optgroup label="${dept.dept_name }">
                                               		<c:forEach items="${dept.deptUser }" var="member">
                                               			 <option value="${member.user_id }" style="font-size: 15px;">${member.user_name }/${member.dname }/${member.jname }</option>
                                               		</c:forEach>
                                            	</optgroup>
                                              </c:forEach>
                                        </select>
                                      
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mt-4 mt-md-0">
                                                            <input class="form-control approvalJobClass" id="jobClass${i }" type="text"  placeholder="부서 / 직급">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                      
                                                    </div>

                                                </div>
                                            </div>
                                            </c:forEach>
                                        </div>
                                        <div class="row justify-content-end">
                                            <div class="col-lg-10">
                                                <input type="button" class="btn btn-primary inner"
                                                    id="approvalConfirmBtn" value="결재자 확정" />
                                               
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group row mb-4">
                                        <label class="col-form-label col-lg-2">Task Description</label>
                                        <div class="col-lg-10">
                                         <div class="col-lg-10" style="">
											<h1 style="position: absolute; top: 83px; left:  -110px;">출장신청서</h1>
    										<br>
											<table id='approval' style="position: absolute; top: 36px; right:  -49px;">
											
											  <tr>
											    <td rowspan="2">결재</td>
											    <td id="job0"></td>
											    <td id="job1"></td>
											    <td id="job2"></td>
											    <td id="job3"></td>
											  </tr>
											  <tr>
											    <td id="name0"><font color="lightgray"></font></td>
											    <td id="name1"><font color="lightgray"></font></td>
											    <td id="name2"><font color="lightgray"></font></td>
											    <td id="name3"><font color="lightgray"></font></td>
											  </tr>
											</table>
											 </div>   
<br><br><br><br><br><br><br>
<table class='MsoNormalTable'
 style='border-collapse:collapse;border:none;margin-left: -120px;'>
 <tr style='height:20.55pt'>
  <td width=122 colspan=2 style='width:91.65pt;border-top:solid black 1.0pt;
  border-left:solid black 1.0pt;border-bottom:none;border-right:none;
  background:#BFBFFF;padding:8.5pt 8.5pt 8.5pt 8.5pt;height:20.55pt'>
     <p class=a align=center style='margin-top:4.8pt;margin-right:1.25pt;
  margin-bottom:.8pt;margin-left:1.25pt;text-align:center;line-height:normal;
  word-break:normal; font-weight: bold'> 출 장 기 간</p>
  </td>
  <td width=574 colspan=9 style='width:430.75pt;border:solid black 1.0pt;
  border-bottom:none;padding:8.5pt 8.5pt 8.5pt 8.5pt;height:20.55pt'>
	<div class="input-daterange input-group" id="datepicker6" data-date-format="dd M, yyyy"
       data-date-autoclose="true" data-provide="datepicker"
       data-date-container='#datepicker6'>
       <input type="text" class="form-control" id="start" name="start" placeholder="출발일자" />
       <input type="text" class="form-control" id="end" name="end" placeholder="복귀일자" />
      <input type="hidden" id="bstripDatefrp">
   </div>
     <!--    <input type="text" id="bstripDate" value="2023.04.01~2023.05.12" style="border: none; font-size: 15px;">
 		 -->
  </td>
 </tr>
 <tr style='height:55.8pt'>
  <td width=122 colspan=2 style='width:91.65pt;border-top:solid black 1.0pt;
  border-left:solid black 1.0pt;border-bottom:none;border-right:none;
  background:#BFBFFF;padding:8.5pt 8.5pt 8.5pt 8.5pt;height:20.55pt'>
     <p class=a align=center style='margin-top:4.8pt;margin-right:1.25pt;
  margin-bottom:.8pt;margin-left:1.25pt;text-align:center;line-height:normal;
  word-break:normal; font-weight: bold'> 출 장 지</p>
  </td>
  <td width=69 style='width:51.9pt;border-top:solid black 1.0pt;border-left:
  solid black 1.0pt;border-bottom:none;border-right:none;padding:8.5pt 8.5pt 8.5pt 8.5pt;
  height:55.8pt'>
 <div style=" display: flex;">
      <p
  style='width: 70px; font-size: 15px; margin-bottom: -10px; padding-bottom: 5px;'>목적지 : </p>
      <input type="text" id="bstripDestination" value="" style="border: none; font-size: 15px;">
 </div>       
      
  </td>
  <td width=187 colspan=3 style='width:140.25pt;border:none;border-top:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt;height:55.8pt'>
  <p class=a0 style='margin-top:4.8pt;margin-right:0in;margin-bottom:.8pt;
  margin-left:0in;line-height:normal;layout-grid-mode:char'><span
  style='font-size:9.0pt;font-family:"Gulim",sans-serif'>&nbsp;</span></p>
  </td>
  <td width=72 style='width:54.05pt;border:none;border-top:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt;height:55.8pt'>
  <div style=" display: flex;">
      
      <label for="bstripStopOver"
  style='width: 70px; font-size: 15px; margin-bottom: -10px; padding-bottom: 5px;'>경유지 : </label>
      <input type="text" id="bstripStopOver" value="" style="border: none; font-size: 15px; margin-bottom: 2px;">
 </div>    
  </td>
  <td width=246 colspan=4 style='width:184.45pt;border-top:solid black 1.0pt;
  border-left:none;border-bottom:none;border-right:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt;height:55.8pt'>
  <p class=a align=center style='margin-top:4.8pt;margin-right:0in;margin-bottom:
  .8pt;margin-left:0in;text-align:center;line-height:normal;word-break:normal'><span
  style='font-family:"Gulim",sans-serif;letter-spacing:.05pt'>&nbsp;</span></p>
  </td>
 </tr>
 <tr style='height:29.05pt'>
  <td width=122 colspan=2 style='width:91.65pt;border-top:solid black 1.0pt;
  border-left:solid black 1.0pt;border-bottom:none;border-right:none;
  background:#BFBFFF;padding:8.5pt 8.5pt 8.5pt 8.5pt;height:29.05pt'>
  <p class=a align=center style='margin-top:4.8pt;margin-right:1.25pt;
  margin-bottom:.8pt;margin-left:1.25pt;text-align:center;line-height:normal;
  word-break:normal; font-weight: bold'> 출 장 지</p>
  </td>
  <td width=574 colspan=9 style='width:430.75pt;border:solid black 1.0pt;
  border-bottom:none;padding:8.5pt 8.5pt 8.5pt 8.5pt;height:29.05pt'>
<input type="text" id="bstripLocation" value="" style="border: none;  font-size: 15px; width: 100%;">
  </td>
 </tr>
 <tr style='height:316.35pt'>
  <td width=122 colspan=2 style='width:91.65pt;border:solid black 1.0pt;
  border-right:none;background:#BFBFFF;padding:8.5pt 8.5pt 8.5pt 8.5pt;
  height:316.35pt'>
<p class=a align=center style='margin-top:4.8pt;margin-right:1.25pt;
  margin-bottom:.8pt;margin-left:1.25pt;text-align:center;line-height:normal;
  word-break:normal; font-weight: bold'>업무 진행</p>
<p class=a align=center style='margin-top:4.8pt;margin-right:1.25pt;
  margin-bottom:.8pt;margin-left:1.25pt;text-align:center;line-height:normal;
  word-break:normal; font-weight: bold'>예정 사항</p>
  </td>
  <td id="tdContent" width=574 colspan=9 style='width:430.75pt;border:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt;height:316.35pt'>
  <textarea id="bsContent" rows="30" cols="169" style="border: none;font-size: 15px;"></textarea>
  </td>
 </tr>      
 <tr style='height:27.0pt'>
  <td width=69 rowspan=2 style='width:51.95pt;border:solid black 1.0pt;
  border-top:none;padding:8.5pt 8.5pt 8.5pt 8.5pt;height:27.0pt'>
  <p class=a align=center style='margin-top:0in;margin-right:1.25pt;margin-bottom:
  0in;margin-left:1.25pt;margin-bottom:.0001pt;text-align:center;line-height:
  normal;word-break:normal'><b><span lang=ZH-CN style='font-family:"Gulim",sans-serif;
  letter-spacing:.05pt'>여비</span></b></p>
  <p class=a align=center style='margin-top:0in;margin-right:1.25pt;margin-bottom:
  0in;margin-left:1.25pt;margin-bottom:.0001pt;text-align:center;line-height:
  normal;word-break:normal'><b><span lang=ZH-CN style='font-family:"Gulim",sans-serif;
  letter-spacing:.05pt'>신청</span></b></p>
  </td>
  <td width=53 style='width:39.7pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:8.5pt 8.5pt 8.5pt 8.5pt;
  height:27.0pt'>
  <p class=a align=center style='margin-top:0in;margin-right:1.25pt;margin-bottom:
  0in;margin-left:1.25pt;margin-bottom:.0001pt;text-align:center;line-height:
  normal;word-break:normal'><b><span lang=ZH-CN style='font-family:"Gulim",sans-serif;
  letter-spacing:.05pt'>구분</span></b></p>
  </td>
  <td width=115 colspan=2 style='width:86.15pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt;height:27.0pt'>
  <p class=a align=center style='margin-top:0in;margin-right:1.25pt;margin-bottom:
  0in;margin-left:1.25pt;margin-bottom:.0001pt;text-align:center;line-height:
  normal;word-break:normal'><b><span lang=ZH-CN style='font-family:"Gulim",sans-serif;
  letter-spacing:.05pt'>일비</span></b></p>
  </td>
  <td width=115 style='width:86.15pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:8.5pt 8.5pt 8.5pt 8.5pt;
  height:27.0pt'>
  <p class=a align=center style='margin-top:0in;margin-right:1.25pt;margin-bottom:
  0in;margin-left:1.25pt;margin-bottom:.0001pt;text-align:center;line-height:
  normal;word-break:normal'><b><span lang=ZH-CN style='font-family:"Gulim",sans-serif;
  letter-spacing:.05pt'>숙박비</span></b></p>
  </td>
  <td width=115 colspan=2 style='width:86.15pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt;height:27.0pt'>
  <p class=a align=center style='margin-top:0in;margin-right:1.25pt;margin-bottom:
  0in;margin-left:1.25pt;margin-bottom:.0001pt;text-align:center;line-height:
  normal;word-break:normal'><b><span lang=ZH-CN style='font-family:"Gulim",sans-serif;
  letter-spacing:.05pt'>교통비</span></b></p>
  </td>
  <td width=115 colspan=2 style='width:86.15pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt;height:27.0pt'>
  <p class=a align=center style='margin-top:0in;margin-right:1.25pt;margin-bottom:
  0in;margin-left:1.25pt;margin-bottom:.0001pt;text-align:center;line-height:
  normal;word-break:normal'><b><span lang=ZH-CN style='font-family:"Gulim",sans-serif;
  letter-spacing:.05pt'>기타</span></b></p>
  </td>
  <td width=115 colspan=2 style='width:86.15pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt;height:27.0pt'>
  <p class=a align=center style='margin-top:0in;margin-right:1.25pt;margin-bottom:
  0in;margin-left:1.25pt;margin-bottom:.0001pt;text-align:center;line-height:
  normal;word-break:normal'><b><span lang=ZH-CN style='font-family:"Gulim",sans-serif;
  letter-spacing:.05pt'>합계</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=53 style='width:39.7pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;padding:8.5pt 8.5pt 8.5pt 8.5pt'>
  <p class=a align=left style='margin-top:0in;margin-right:1.25pt;margin-bottom:
  0in;margin-left:1.25pt;margin-bottom:.0001pt;text-align:left;line-height:
  normal;word-break:normal'><b><span lang=ZH-CN style='font-family:"Gulim",sans-serif;
  letter-spacing:.05pt'>금액</span></b></p>
  </td>
  <td width=115 colspan=2 style='width:86.15pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt'>
  <input type="text" class="cost" id="bstripPerDiem" value="" style="border: none; font-size: 15px; margin-bottom: 2px; text-align: center; width: 100%; text-align: center;">
  </td>
  <td width=115 style='width:86.15pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:8.5pt 8.5pt 8.5pt 8.5pt'>
 <input type="text" class="cost" id="bstripRoomCharge" value="" style="border: none; font-size: 15px; margin-bottom: 2px;width: 100%; text-align: center;">
  </td>
  <td width=115 colspan=2 style='width:86.15pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt'>
 <input type="text" class="cost" id="bstripTransportationCost" value="" style="border: none; font-size: 15px; margin-bottom: 2px;  width: 100%;text-align: center;">
  </td>
  <td width=115 colspan=2 style='width:86.15pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt'>
  <input type="text" class="cost" id="bstripExtraCost" value="" style="border: none; font-size: 15px; margin-bottom: 2px;width: 100%; text-align: center;">
  </td>
  <td width=115 colspan=2 style='width:86.15pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt'>
 <input type="text" class="cost" id="bstripAllCost" value="" style="border: none; font-size: 15px; margin-bottom: 2px;width: 100%; text-align: center;margin-left: 0px">
  </td>
 </tr>
 <tr style='height:31.8pt'>
  <td width=697 colspan=11 style='width:522.4pt;border-top:none;border-left:
  solid black 1.0pt;border-bottom:none;border-right:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt;height:31.8pt'>
  <p class=a align=center style='margin-top:4.8pt;margin-right:1.25pt;
  margin-bottom:.8pt;margin-left:1.25pt;text-align:center;line-height:normal;
  word-break:normal'><b><span lang=ZH-CN style='font-family:"Gulim",sans-serif;
  letter-spacing:.05pt'>위와</span></b><b><span style='font-family:"Arial Unicode MS",serif;
  letter-spacing:.05pt'> </span></b><b><span lang=ZH-CN style='font-family:
  "Gulim",sans-serif;letter-spacing:.05pt'>같이</span></b><b><span
  style='font-family:"Arial Unicode MS",serif;letter-spacing:.05pt'> </span></b><b><span
  lang=ZH-CN style='font-family:"Gulim",sans-serif;letter-spacing:.05pt'>출장을 신청합니다</span></b><b><span
  style='font-family:"Gulim",sans-serif;letter-spacing:.05pt'>.</span></b></p>
  </td>
 </tr>
 <tr style='height:27.0pt;width: 400px;'>
  <td width=100px colspan=6 style='width:339.95pt;border:none;border-left:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt;height:27.0pt;'>
  <p class=a align=center style='margin-top:0in;margin-right:1.25pt;margin-bottom:
  0in;margin-left:1.25pt;margin-bottom:.0001pt;text-align:center;line-height:
  normal;word-break:normal'><b><span lang=ZH-CN style='font-family:"Gulim",sans-serif;
  letter-spacing:.05pt'>신청자</span></b><b><span style='font-family:"Arial Unicode MS",serif;
  letter-spacing:.05pt'>   </span></b><b><span lang=ZH-CN style='font-family:
  "Gulim",sans-serif;letter-spacing:.05pt'>소속</span></b><b><span
  style='font-family:"Gulim",sans-serif;letter-spacing:.05pt'> :</span></b><b> <input type="text" id="bstripDept" value="${ loginUser.dname} / ${loginUser.jname}" style="border: none; font-size: 15px; margin-bottom: 2px; text-align: center;margin-left: 0px; font-weight: bold" readonly="readonly"></b></p>
  </td>
  <td width=79 colspan=2 style='width:59.4pt;border:none;padding:8.5pt 8.5pt 8.5pt 8.5pt;
  height:27.0pt'>
  <div style=" display: flex;">
      
      <label for="bstripName"
  style='width: 70px; font-size: 15px; font-weight: bold; margin-bottom: -10px;'>이름 : </label>
      <input type="text" id="bstripName" value="${loginUser.user_name }" style="border: none; font-size: 15px; margin-bottom: 2px; font-weight: bold" readonly="readonly">
 </div>  
  </td>
  <td width=95 colspan=2 style='width:71.6pt;border:none;padding:8.5pt 8.5pt 8.5pt 8.5pt;
  height:27.0pt'>
  <p class=a align=center style='margin-top:0in;margin-right:1.25pt;margin-bottom:
  0in;margin-left:1.25pt;margin-bottom:.0001pt;text-align:center;line-height:
  normal;word-break:normal'><b><span style='font-family:"Gulim",sans-serif;
  letter-spacing:.05pt'>&nbsp;</span></b></p>
  </td>
  <td width=69 style='width:51.4pt;border:none;border-right:solid black 1.0pt;
  padding:8.5pt 8.5pt 8.5pt 8.5pt;height:27.0pt'>
 <img src="${pageContext.request.contextPath }/resources/assets/images/stamp.jpg" style="width: 450px;height: 200px; margin-left: -200px">
  </td>
 </tr>
 <tr style='height:30.2pt'>
  <td width=697 colspan=11 style='width:522.4pt;border:solid black 1.0pt;
  border-top:none;padding:8.5pt 8.5pt 8.5pt 8.5pt;height:30.2pt'>
  <p class=a align=center style='margin-top:4.8pt;margin-right:1.25pt;
  margin-bottom:.8pt;margin-left:1.25pt;text-align:center;line-height:normal;
  word-break:normal'><b><span lang=ZH-CN style='font-size:13.0pt;font-family:
  "Gulim",sans-serif;letter-spacing:.05pt'>주식회사</span></b><b><span
  style='font-size:13.0pt;font-family:"Gulim",sans-serif;letter-spacing:.05pt'>
  COWORK Corp  <span lang=ZH-CN>대표 귀하</span></span></b></p>
  </td>
 </tr>
 <tr height=0>
  <td width=69 style='border:none'></td>
  <td width=53 style='border:none'></td>
  <td width=69 style='border:none'></td>
  <td width=46 style='border:none'></td>
  <td width=115 style='border:none'></td>
  <td width=26 style='border:none'></td>
  <td width=72 style='border:none'></td>
  <td width=3 style='border:none'></td>
  <td width=14 style='border:none'></td>
  <td width=66 style='border:none'></td>
  <td width=49 style='border:none'></td>
  <td width=46 style='border:none'></td>
  <td width=69 style='border:none'></td>
 </tr>
</table>
											
                                        </div>
                                    </div>
	<!-- 
                                    <div class="form-group row mb-4">
                                        <label class="col-form-label col-lg-2">결재 기간</label>
                                        <div class="col-lg-10">
                                            <div class="input-daterange input-group" data-provide="datepicker">
                                                <input type="text" class="form-control" placeholder="Start Date"
                                                    name="start" />
                                                <input type="text" class="form-control" placeholder="End Date"
                                                    name="end" />
                                            </div>
                                        </div>
                                    </div>
 -->
                                  <!-- 
                                    <div class="form-group row mb-4">
                                        <label for="taskbudget" class="col-form-label col-lg-2">Budget</label>
                                        <div class="col-lg-10">
                                            <input id="taskbudget" name="taskbudget" type="text"
                                                placeholder="Enter Task Budget..." class="form-control">
                                        </div>
                                    </div>
                                     -->
                                </div>
                            </div>
                         <input type="hidden" name="${_csrf.parameterName}"
                  		value="${_csrf.token}"> 
                  		 <input type="hidden" id="docNum" value=" ${docNum }">   
                            
                        </form>
                        <div class="row justify-content-end">
                        
                            <div class="col-lg-10">
                                <button type="submit" id="addBsTripBtn" class="btn btn-primary"
                                style="position: absolute; right: -50px; top:-70px;"
                                	>결재 신청</button>
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
</div>
</body>
<script src="${pageContext.request.contextPath }/resources/assets/libs/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/form-mask.init.js"></script>
<script src="assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

<!--tinymce js-->
<script src="${pageContext.request.contextPath }/resources/assets/libs/tinymce/tinymce.min.js"></script>

<!-- form repeater js -->
<script src="${pageContext.request.contextPath }/resources/assets/libs/jquery.repeater/jquery.repeater.min.js"></script>

<script src="${pageContext.request.contextPath }/resources/assets/libs/select2/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/form-advanced.init.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/task-create.init.js"></script>
<script type="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<script>
$(function(){
	var nameValues = [];
	var jobValues = [];
	$("#addBsTripBtn").click(function(){
		var data = {
				DOCUMENT_FORM_CODE : $("#docNum").val(),
				DocumentName : $("#DocumentName").val(),
				bstripDate : $("#bstripDatefrp").val(),
				bstripDestination : $("#bstripDestination").val(),
				bstripStopOver : $("#bstripStopOver").val(),
				bstripLocation : $("#bstripLocation").val(),
				bsContent : $("#bsContent").val(),
				bstripPerDiem : $("#bstripPerDiem").val(),
				bstripRoomCharge : $("#bstripRoomCharge").val(),
				bstripTransportationCost : $("#bstripTransportationCost").val(),
				bstripExtraCost : $("#bstripExtraCost").val(),
				bstripAllCost : $("#bstripAllCost").val(),
				bstripName : $("#bstripName").val(),
				bstripDept : $("#bstripDept").val(),
				nameValues : nameValues,
				jobValues : jobValues
		}
		console.log(data);
		
		$.ajax({
			type:"get",
			url : "${pageContext.request.contextPath }/edms/addBsTrip",
			data : data,
			contentType : "application/json",
			success: function(res){
				
				alert("등록완료!");
				history.go(-1);
			}
		});
		
		
		
	});
	
	$("#approvalConfirmBtn").click(function(){
	
		   $('select').each(function(index) {
		        // 선택한 옵션 텍스트 가져오기
		        var text = $(this).find('option:selected').text();
		        // 텍스트에서 user_name 추출하기
		        var userName = text.split('/')[0];
		        // 해당 td 요소의 텍스트 설정하기
		        $('#name' + index).children().text(userName);
		        
		        // 선택한 옵션 값 가져오기
		        var value = $(this).val();
		        // nameValues 배열에 값 추가하기
		        nameValues.push(value);
		    });
		$('.approvalJobClass').each(function(index){
			jobValues.push($(this).val());
			console.log($(this).val());
			var id = "#job"+index;
			$(id).text($(this).val());
			
		});
	});
	
	 function formatState(state) {
	      if (!state.id) {
	        return state.text;
	      }
	      var baseUrl = "./assets/images/flags/select2";
	      var $state = $(
	        '<span><img src="' + baseUrl + '/' + state.element.value.toLowerCase() + '.png" class="img-flag" /> ' + state.text + '</span>'
	      );
	      return $state;
	    };

	    $(".select2-templating").select2({
	      templateResult: formatState
	    });
	 // select 태그의 change 이벤트 핸들러
	    $('select').on('change', function() {
	        // 선택한 option 태그의 텍스트 가져오기
	        var text = $(this).find('option:selected').text();
	        // 텍스트에서 부서와 직급만 추출하기
	        var parts = text.split('/');
	        var dept = parts[1];
	        var job = parts[2];
	        // input 태그에 값 설정하기
	        $(this).closest('.inner').find('input.approvalJobClass').val(dept + '  /  ' + job);
	    });
	 // select 태그의 change 이벤트 핸들러
	    $('select').on('change', function() {
	        // 선택한 option 태그의 텍스트 가져오기
	        var text = $(this).find('option:selected').text();
	        // 텍스트에서 user_name만 추출하기
	        var userName = text.split('/')[0];
	        // Select2 플러그인의 선택된 항목 텍스트 변경하기
	        $(this).next('.select2').find('.select2-selection__rendered').text(userName);
	    });
	    $('#submitBtn').on('click', function() {
	        // Get the values of the date inputs
	        var date1 = $('#date1').val();
	        var date2 = $('#date2').val();
	        // Convert the dates to strings
	        var date1Str = new Date(date1).toLocaleDateString();
	        var date2Str = new Date(date2).toLocaleDateString();
	        // Output the dates as strings
	        $('#output').text('날짜 1: ' + date1Str + ', 날짜 2: ' + date2Str);
	    });
	    $('#datepicker6').datepicker({
	        format: 'yyyy-mm-dd',
	        autoclose: true,
	        startDate: new Date()
	    });
	    
	    $('input[name="end"]').datepicker({
	        format: 'yyyy-mm-dd',
	        autoclose: true,
	        startDate: new Date()
	    }).on('changeDate', function() {
	        // Get the values of the date inputs
	        var startDate = $('input[name="start"]').val();
	        var endDate = $('input[name="end"]').val();
	        // Set the value of the #bstripDate element
	        $('#bstripDate').val(startDate + ' ~ ' + endDate);
	        var datebs =  $('#bstripDate').val();
	        console.log(datebs);
	    });
	    
	    $('#end').on('changeDate', function() {
	        var startDate = $('#start').val();
	        var endDate = $('#end').val();
	        $('#bstripDatefrp').val(startDate + ' ~ ' + endDate);
	        datebs = $("#bstripDatefrp").val();
	    });
		
	    function calculateDateDifference() {
	        var startDate = $('#start').datepicker('getDate');
	        var endDate = $('#end').datepicker('getDate');
	        if (startDate && endDate) {
	            var timeDiff = Math.abs(endDate.getTime() - startDate.getTime());
	            var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
	            return diffDays;
	        }
	        return null;
	    }
	    
	    
	    $('.cost').on('input', function() {
	        var value = $(this).val();
	        value = value.replace(/,/g, '');
	        if (!$.isNumeric(value)) {
	            $(this).val('');
	        } else {
	            var formattedValue = Number(value).toLocaleString('en');
	            $(this).val(formattedValue);
	        }
	    	
	        var perDiem = Number($('#bstripPerDiem').val().replace(/,/g, ''));
	        var roomCharge = Number($('#bstripRoomCharge').val().replace(/,/g, ''));
	        var transportationCost = Number($('#bstripTransportationCost').val().replace(/,/g, ''));
	        var extraCost = Number($('#bstripExtraCost').val().replace(/,/g, ''));
	        var days = calculateDateDifference();
	        if (days !== null) {
	            var totalCost = (perDiem * days) + roomCharge + transportationCost + extraCost;
	            $('#bstripAllCost').val(totalCost.toLocaleString('en'));
	        }
	    });

});

</script>
</html>