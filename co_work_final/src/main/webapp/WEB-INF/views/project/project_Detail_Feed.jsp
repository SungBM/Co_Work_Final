<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html lang="en">

<jsp:include page="../main/header.jsp"/>
<link href="${pageContext.request.contextPath }/resources/assets/css/project_Css/project.css" rel="stylesheet" type="text/css" />
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
.page-content{
	width: 150vh;
}
.mdi-file-download-outline{
	font-size: 14px;
}

.mdi-file-download-outline:hover {
	color: blue;
	cursor: pointer;
}

.bm{
	vertical-align : -1.0px;
}

.isize {
	font-size: 20px;
}

.isize>span {
	font-size: 18px;
	vertical-align : 1.5px;
}


.isize:hover  {
    color: #556ee6;
    -webkit-transform: scale(1.5);
    transform: scale(1.5);
    transition-duration : 0.2s;
}
.isize:not(:hover)  {
    color: black;
    -webkit-transform: scale(1.0);
    transform: scale(1.0);
    transition-duration : 0.2s;
}
.bx bxs-like {
	color: #556ee6;
}

.bxs-bookmark-star{
	color:  #556ee6;
}

#sticky {
	position : absolute;
	top :20%;
}

a:hover {
	cursor: pointer;	
}

.cmtFileDown:hover {
	color: blue;
}
.bx-edit-alt {
	font-size: 16px;
	color: skyblue;
}

.bx-trash{
	color: #FF5A5A;
	font-size: 16px;
}

.bx-trash:hover  {
    color: #EB0000;
    -webkit-transform: scale(1.1);
    transform: scale(1.1);
    transition-duration : 0.2s;
    cursor: pointer;
}
.bx-trash:not(:hover)  {
    color: #FF5A5A;
    -webkit-transform: scale(1.0);
    transform: scale(1.0);
    transition-duration : 0.2s;
}

.bx-edit-alt:hover  {
    color: #556ee6;
    -webkit-transform: scale(1.1);
    transform: scale(1.1);
    transition-duration : 0.2s;
    cursor: pointer;
}
.bx-edit-alt:not(:hover)  {
    color: skyblue;
    -webkit-transform: scale(1.0);
    transform: scale(1.0);
    transition-duration : 0.2s;
}
.replyAdd:hover  {
    -webkit-transform: scale(1.1);
    transform: scale(1.1);
    transition-duration : 0.2s;
    cursor: pointer;
}
.replyAdd:not(:hover)  {
    -webkit-transform: scale(1.0);
    transform: scale(1.0);
    transition-duration : 0.2s;
}
.page:hover  {
	color : #556ee6;
    -webkit-transform: scale(1.1);
    transform: scale(1.1);
    transition-duration : 0.2s;
    cursor: pointer;
}
.page:not(:hover)  {
    -webkit-transform: scale(1.0);
    transform: scale(1.0);
    transition-duration : 0.2s;
}
.skeleton {
    display: flex;
    justify-content: center;
    align-items: center;
}

.skeleton-spinner {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    border: 5px solid #e0e0e0;
    border-top-color: #9370DB;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}


</style>
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){
		function sendAjaxRequest(url, method, data, successCallback, errorCallback) {
		    $.ajax({
		        url: url,
		        method: method,
		        data: data,
		        dataType: 'json',
		        success: function(response) {
		            successCallback(response);
		        },
		        error: function(xhr, status, error) {
		            errorCallback(xhr, status, error);
		        }
		    });
		}
		
		
		
		var page = 1;
		var commentCount = 0;
	
		
		
		function getCommentList(pbNum,page,commentCount){
			$.ajax({
				type: "POST",
				url: '../project/getPjectCommentList?${_csrf.parameterName}=${_csrf.token}',	// form을 전송할 실제 파일경로
				data: {'pbNum':pbNum,
					   'page' : page},
				async : false,
				success: function (data) {
					$(".comment").empty();
					console.log(data);
					$.each(data, function(index, pbc){
		
		var commentString = '';
			commentString += '<div class="d-flex py-3">'
							if(pbc.pro_BO_COMMENT_RE_LEV > 0 ){
			commentString +='<div class="flex-shrink-0 me-3" style="padding-left:30px;">'	
						    + '<div class="avatar-xs">'
						    +	' <div class="avatar-title rounded-circle bg-light text-primary">' 
						  	+		'<i class="dripicons-skip"></i><i class="bx bxs-user"></i>'
							} else {
			commentString +='<div class="flex-shrink-0 me-3">'		
						 	+ '<div class="avatar-xs">'
						    +	' <div class="avatar-title rounded-circle bg-light text-primary">' 
						  	+		'<i class="bx bxs-user"></i>'
							}
			commentString +=	' </div>   </div>   </div>'
							+	'<div class="flex-grow-1">'		
							+		'<h5 class="font-size-14 mb-1">' + pbc.pro_BO_COMMENT_NAME
							+			'<small class="text-muted float-end">'+pbc.pro_BO_COMMENT_DATE+'</small></h5>'
							+		'<p class="text-muted"> '+ pbc.pro_BO_COMMENT_CONTENT +' </p>'
							+	'<div>'
							+	'</div>' ;
						if(pbc.pro_BO_COMMENT_ORIGINFILE != null){
							commentString 
								+= '<div style="float : right">'
								+	'<form action="../project/projectFileDown" id="fileForm'+index+'" method="post" class="fdform">'
								+	'<i class="mdi mdi-file-download-outline text-info cmtFileDown" id="fileDown">'+pbc.pro_BO_COMMENT_ORIGINFILE+'</i>'
	                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_FILE+'" name="filename" >'
	                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_ORIGINFILE+'" name="original" >'
	                           	+	'<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'
	                           	+	'</form>'
	                           	+	'<div class="text-success replyAdd" pbcNum="'+pbc.pro_BO_COMMENT_NUM+'"  pbNum="'+pbc.pro_BOARD_NUM+'" fileNull = "'+pbc.pro_BO_COMMENT_ORIGINFILE+'" style="float : right"><i class="mdi mdi-reply "></i> Reply</div></div></div>';
						} else {
							commentString
								+= '<div style="float : right">'
								+	'<form action="../project/projectFileDown" id="fileForm'+index+'" method="post" class="fdform">'
	                           	+	'<input type="hidden" value="" name="filename" >'
	                           	+	'<input type="hidden" value="" name="original" >'
	                           	+	'<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'
	                           	+	'</form>'
								+ 	'<div  class="text-success replyAdd" pbcNum="'+pbc.pro_BO_COMMENT_NUM+'"  pbNum="'+pbc.pro_BOARD_NUM+'" fileNull = "'+pbc.pro_BO_COMMENT_ORIGINFILE+'" style="float : right"><i class="mdi mdi-reply "></i> Reply</a></div></div></div>'
						}
						var loginId = $("#loginId").text();
						var writerId = pbc.pro_BO_COMMENT_ID;
						
						if(loginId == writerId ){
							commentString 	+=	'<i class="bx bx-edit-alt updateCmt" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i>'
											+	'<i class="bx bx-trash deleteCmt" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i></div><hr>'
						} else if (loginId == 'role_admin'){
							commentString 	+=	'<i class="bx bx-edit-alt updateCmt" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i>'
											+	'<i class="bx bx-trash deleteCmt" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i></div><hr>'
							} else {
							commentString 	+=	'<i class="" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right;">　</i>'
											+	'<i class="" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right;">　</i></div><hr>'
						}
					
						
					//	var thisComment = $(this).next().attr("id");
					//	console.log(thisComment);
						console.log("comment함수 실행");
						console.log(commentString);
						$(this).parent().parent().parent().parent().parent().append(commentString);
						$(".comment").append(commentString);
					});
				},
				error: function (e) {
					console.log("ERROR : ", e);
				}
			});
			var limit = 5; //한 화면에 출력할 로우 갯수
			
			var listcount  = Number(commentCount)// 총 리스트 수를 받아옴
			
			// 총 페이지 수
			var maxpage = (listcount + limit - 1) / limit;
			
			// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
			var startpage = ((page -1) / 10) * 10 + 1;
			
			// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
			var endpage = startpage + 10 - 1;
			
			if (endpage > maxpage)
				endpage = maxpage;
			var paginationString = '  <nav aria-label="...">'
				paginationString += ' <ul class="pagination">'
				paginationString += '  <li class="page-item disabled">'
				paginationString += '   <span class="page-link"><i class="mdi mdi-chevron-left"></i></span>'
				paginationString += '  </li>'
				
				
			for(var i=1 ; i <= maxpage ; i++){
				paginationString += '<li class="page-item"><p class="page-link page">'+i+'</p></li>'
			};
				paginationString += '<li class="page-item">'
				paginationString += ' <a class="page-link" href="#"><i class="mdi mdi-chevron-right"></i></a>'
				paginationString += '</li> </ul></nav>'
			$(".comment").append(paginationString);
		}
		
		$(".fileNamesCls").hide();
		
		$("#fileNames").hide();
		
		$("#fileNames").change(function(){
			var fileValue = $('#fileNames').val().split("\\");
			var fileName = fileValue[fileValue.length-1]; 
			$("#fileNameOrigin").text(fileName);
			
		});
		
		$(".proCommentBtnCls").click(function(){
			$(".comment").empty();
			var pbNum = $(this).next().val();
			console.log(pbNum +" ?");
			var formName = "#ProjectCommentForm" + pbNum
			var form = $(formName)[0];
			
			// Create an FormData object 
			var data = new FormData(form);
			
			console.log(data);
			
			$.ajax({
				type: "POST",
				enctype: 'multipart/form-data',
				url: '../project/ProjectCommentAdd?${_csrf.parameterName}=${_csrf.token}',	// form을 전송할 실제 파일경로
				data: data,
				processData: false,
				contentType: false,
				cache: false,
				success: function (data) {
					console.log(data);
					$.each(data, function(index, pbc){
						var commentString = '<div class="d-flex py-3">'
							+		'<div class="flex-shrink-0 me-3">'
							+			'<div class="avatar-xs">'
							+				' <div class="avatar-title rounded-circle bg-light text-primary">' 	
							+					'  <i class="bx bxs-user"></i>'
							+				' </div>   </div>   </div>'
							+	'<div class="flex-grow-1">'		
							+		'<h5 class="font-size-14 mb-1">' + pbc.pro_BO_COMMENT_NAME
							+			'<small class="text-muted float-end">'+pbc.pro_BO_COMMENT_DATE+'</small></h5>'
							+		'<p class="text-muted"> '+ pbc.pro_BO_COMMENT_CONTENT +' </p>'
							+	'<div>'
							+	'</div>' ;
						if(pbc.pro_BO_COMMENT_ORIGINFILE != null){
							commentString 
								+= '<div style="float : right">'
								+	'<form action="../project/projectFileDown" id="fileForm'+index+'" method="post" class="fdform">'
								+	'<i class="mdi mdi-file-download-outline text-info cmtFileDown" id="fileDown">'+pbc.pro_BO_COMMENT_ORIGINFILE+'</i>'
	                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_FILE+'" name="filename" >'
	                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_ORIGINFILE+'" name="original" >'
	                           	+	'<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'
	                           	+	'</form>'
	                           	+	'<div style="float : right"><a href="javascript: void(0);" class="text-success"><i class="mdi mdi-reply"></i> Reply</a></div></div></div>';
						} else {
							commentString
								+= '<div style="float : right"><a href="javascript: void(0);" class="text-success"><i class="mdi mdi-reply"></i> Reply</a></div></div>'
						}
						var loginId = $("#loginId").text();
						var writerId = pbc.pro_BO_COMMENT_ID;
						
						if(loginId == writerId ){
							commentString 	+=	'<i class="bx bx-edit-alt updateCmt" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i>'
											+	'<i class="bx bx-trash deleteCmt" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i></div><hr>'
						} else {
							commentString += '</div><hr>'
						}
						
						var thisComment = $(this).next().attr("id");
						console.log(thisComment);
						$(".comment").append(commentString);
					});
				},
				error: function (e) {
					console.log("ERROR : ", e);
				}
			});
		});
		
		$(".comment").hide();
		
		$(".commentToggle").on("click",function(){
			var page = 1;
			var pbNum = $(this).prev().val();
			let clsName = $(this).next().attr("id");
			
			
			$.ajax({
				type: "get",
				url: '../project/getPjectCommentCount',
				data: {'pbNum':pbNum},
				async : false,
				success: function (data) {
					commentCount = data;
				
				}
				
			});
		
			console.log(clsName);
			if (clsName.includes('visible')) {
				var commentId = 'comment ' + pbNum;
				$(this).next().hide();
				$(this).next().attr('id',commentId);
			}else {
				var commentId = 'comment ' + pbNum + ' visible';
				$(this).next().show();
				$(this).next().attr('id',commentId);
				$(this).next().empty();
				
				var pbNum = $(this).prev().val();
				console.log(pbNum +" ?");
				// Create an FormData object 
				
				$.ajax({
					type: "POST",
					url: '../project/getPjectCommentList?${_csrf.parameterName}=${_csrf.token}',	// form을 전송할 실제 파일경로
					data: {'pbNum':pbNum},
					async : false,
					success: function (data) {
						console.log(data);
						$.each(data, function(index, pbc){
			var commentString = '<div class="d-flex py-3">'
								if(pbc.pro_BO_COMMENT_RE_LEV > 0 ){
				commentString +='<div class="flex-shrink-0 me-3" style="padding-left:30px;">'	
							    + '<div class="avatar-xs">'
							    +	' <div class="avatar-title rounded-circle bg-light text-primary">' 
							  	+		'<i class="dripicons-skip"></i><i class="bx bxs-user"></i>'
								} else {
				commentString +='<div class="flex-shrink-0 me-3">'		
							 	+ '<div class="avatar-xs">'
							    +	' <div class="avatar-title rounded-circle bg-light text-primary">' 
							  	+		'<i class="bx bxs-user"></i>'
								}
				commentString +=	' </div>   </div>   </div>'
								+	'<div class="flex-grow-1">'		
								+		'<h5 class="font-size-14 mb-1">' + pbc.pro_BO_COMMENT_NAME
								+			'<small class="text-muted float-end">'+pbc.pro_BO_COMMENT_DATE+'</small></h5>'
								+		'<p class="text-muted"> '+ pbc.pro_BO_COMMENT_CONTENT +' </p>'
								+	'<div>'
								+	'</div>' ;
							if(pbc.pro_BO_COMMENT_ORIGINFILE != null){
								commentString 
									+= '<div style="float : right">'
									+	'<form action="../project/projectFileDown" id="fileForm'+index+'" method="post" class="fdform">'
									+	'<i class="mdi mdi-file-download-outline text-info cmtFileDown" id="fileDown">'+pbc.pro_BO_COMMENT_ORIGINFILE+'</i>'
		                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_FILE+'" name="filename" >'
		                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_ORIGINFILE+'" name="original" >'
		                           	+	'<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'
		                           	+	'</form>'
		                           	+	'<div class="text-success replyAdd" pbcNum="'+pbc.pro_BO_COMMENT_NUM+'"  pbNum="'+pbc.pro_BOARD_NUM+'" fileNull = "'+pbc.pro_BO_COMMENT_ORIGINFILE+'" style="float : right"><i class="mdi mdi-reply "></i> Reply</div></div></div>';
							} else {
								commentString
									+= '<div style="float : right">'
									+	'<form action="../project/projectFileDown" id="fileForm'+index+'" method="post" class="fdform">'
		                           	+	'<input type="hidden" value="" name="filename" >'
		                           	+	'<input type="hidden" value="" name="original" >'
		                           	+	'<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'
		                           	+	'</form>'
									+ 	'<div  class="text-success replyAdd" pbcNum="'+pbc.pro_BO_COMMENT_NUM+'"  pbNum="'+pbc.pro_BOARD_NUM+'" fileNull = "'+pbc.pro_BO_COMMENT_ORIGINFILE+'" style="float : right"><i class="mdi mdi-reply "></i> Reply</a></div></div></div>'
							}
							var loginId = $("#loginId").text();
							var writerId = pbc.pro_BO_COMMENT_ID;
							
							if(loginId == writerId ){
								commentString 	+=	'<i class="bx bx-edit-alt updateCmt" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i>'
												+	'<i class="bx bx-trash deleteCmt" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i></div><hr>'
							} else if (loginId == 'role_admin'){
								commentString 	+=	'<i class="bx bx-edit-alt updateCmt" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i>'
												+	'<i class="bx bx-trash deleteCmt" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i></div><hr>'
								} else {
								commentString 	+=	'<i class="" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right;">　</i>'
												+	'<i class="" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right;">　</i></div><hr>'
							}
						
							
							var thisComment = $(this).next().attr("id");
							console.log(thisComment);
							$(".comment").append(commentString);
						});
					},
					error: function (e) {
						console.log("ERROR : ", e);
					}
				});
				var limit = 5; //한 화면에 출력할 로우 갯수
				
				var listcount = Number(commentCount)// 총 리스트 수를 받아옴
				console.log(commentCount + "commentCount");
				console.log(listcount + "listcount");
				
				// 총 페이지 수
				var maxpage = (listcount + limit - 1) / limit;
				console.log(maxpage + "maxpage");
				
				// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
				var startpage = ((page -1) / 10) * 10 + 1;
				
				// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
				var endpage = startpage + 10 - 1;
				
				if (endpage > maxpage)
					endpage = maxpage;
				var paginationString = '  <nav aria-label="...">'
					paginationString += ' <ul class="pagination" id="pageUL'+pbNum+'">'
					paginationString += '  <li class="page-item disabled">'
					paginationString += '   <span class="page-link"><i class="mdi mdi-chevron-left"></i></span>'
					paginationString += '  </li>'
					
					
				for(var i=1 ; i <= maxpage ; i++){
					paginationString += '<li class="page-item"><p class="page-link page" id="pageid'+i+' ">'+i+'</p></li>'
				};
					paginationString += '<li class="page-item">'
					paginationString += ' <a class="page-link" href="#"><i class="mdi mdi-chevron-right"></i></a>'
					paginationString += '</li> </ul></nav>'
					
				$(".comment").append(paginationString);
			}
		});
		$('.comment').unbind('click',".page").bind('click','.page' ,function() {
			var limit = 5; //한 화면에 출력할 로우 갯수
			
				$('.page').click(function(e){
					$(".comment").empty();
					$(".page").css('color','black');
					$(".page").css('background-color','white');
					e.stopImmediatePropagation();
					
					var pbNum = $("#pbNum").val();
					var page = $(this).text();
					
					console.log(page + ": page");
					$(this).css('color','white');
					$(this).css('background-color','lightgray');
					getCommentList(pbNum,page,commentCount)
				
				});
		});
		
		
		$('.comment').on('click', '.fdform' ,function() {
			$('.fdform').click(function(){
			    var id = "#"+$(this).attr('id');
			    
			    console.log(id);
			    $(id).submit();
			
			});
		});
		
		
		$('.comment').unbind("click", ".deleteCmt").bind('click', '.deleteCmt' ,function() {
			$('.deleteCmt').click(function(e){
				e.stopImmediatePropagation();
			    var pbcNum = $(this).attr('ariaValue');
			    var pbNum = $(this).attr('pbNum');
			    
			    console.log(pbNum);
			    
			   	var deleteConfirm = confirm("정말 삭제하시겠습니까?");
			    
			   	if(deleteConfirm){
			   	  $.ajax({
				    	type: "get",
						url: '../project/commentDelete',	// form을 전송할 실제 파일경로
						data: {'pbcNum':pbcNum,
							   'pbNum':pbNum},
						success: function (data){
							console.log(data);
							$('.comment').empty();
							$.each(data, function(index, pbc){
								var commentString = '';
								commentString += '<div class="d-flex py-3">'
												if(pbc.pro_BO_COMMENT_RE_LEV > 0 ){
								commentString +='<div class="flex-shrink-0 me-3" style="padding-left:30px;">'	
											    + '<div class="avatar-xs">'
											    +	' <div class="avatar-title rounded-circle bg-light text-primary">' 
											  	+		'<i class="dripicons-skip"></i><i class="bx bxs-user"></i>'
												} else {
								commentString +='<div class="flex-shrink-0 me-3">'		
											 	+ '<div class="avatar-xs">'
											    +	' <div class="avatar-title rounded-circle bg-light text-primary">' 
											  	+		'<i class="bx bxs-user"></i>'
												}
								commentString +=	' </div>   </div>   </div>'
												+	'<div class="flex-grow-1">'		
												+		'<h5 class="font-size-14 mb-1">' + pbc.pro_BO_COMMENT_NAME
												+			'<small class="text-muted float-end">'+pbc.pro_BO_COMMENT_DATE+'</small></h5>'
												+		'<p class="text-muted"> '+ pbc.pro_BO_COMMENT_CONTENT +' </p>'
												+	'<div>'
												+	'</div>' ;
											if(pbc.pro_BO_COMMENT_ORIGINFILE != null){
												commentString 
													+= '<div style="float : right">'
													+	'<form action="../project/projectFileDown" id="fileForm'+index+'" method="post" class="fdform">'
													+	'<i class="mdi mdi-file-download-outline text-info cmtFileDown" id="fileDown">'+pbc.pro_BO_COMMENT_ORIGINFILE+'</i>'
						                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_FILE+'" name="filename" >'
						                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_ORIGINFILE+'" name="original" >'
						                           	+	'<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'
						                           	+	'</form>'
						                           	+	'<div class="text-success replyAdd" pbcNum="'+pbc.pro_BO_COMMENT_NUM+'"  pbNum="'+pbc.pro_BOARD_NUM+'" fileNull = "'+pbc.pro_BO_COMMENT_ORIGINFILE+'" style="float : right"><i class="mdi mdi-reply "></i> Reply</div></div></div>';
											} else {
												commentString
													+= '<div style="float : right">'
													+	'<form action="../project/projectFileDown" id="fileForm'+index+'" method="post" class="fdform">'
						                           	+	'<input type="hidden" value="" name="filename" >'
						                           	+	'<input type="hidden" value="" name="original" >'
						                           	+	'<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'
						                           	+	'</form>'
													+ 	'<div  class="text-success replyAdd" pbcNum="'+pbc.pro_BO_COMMENT_NUM+'"  pbNum="'+pbc.pro_BOARD_NUM+'" fileNull = "'+pbc.pro_BO_COMMENT_ORIGINFILE+'" style="float : right"><i class="mdi mdi-reply "></i> Reply</a></div></div></div>'
											}
											var loginId = $("#loginId").text();
											var writerId = pbc.pro_BO_COMMENT_ID;
											
											if(loginId == writerId ){
												commentString 	+=	'<i class="bx bx-edit-alt updateCmt" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i>'
																+	'<i class="bx bx-trash deleteCmt" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i></div><hr>'
											} else if (loginId == 'role_admin'){
												commentString 	+=	'<i class="bx bx-edit-alt updateCmt" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i>'
																+	'<i class="bx bx-trash deleteCmt" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i></div><hr>'
												} else {
												commentString 	+=	'<i class="" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right;">　</i>'
																+	'<i class="" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right;">　</i></div><hr>'
											}
										
											
										//	var thisComment = $(this).next().attr("id");
										//	console.log(thisComment);
											console.log("comment함수 실행");
											console.log(commentString);
											$(this).parent().parent().parent().parent().parent().append(commentString);
											$(".comment").append(commentString);
							});
						}
				    });
			   	var limit = 5; //한 화면에 출력할 로우 갯수
				
				var listcount  = Number(commentCount)// 총 리스트 수를 받아옴
				
				// 총 페이지 수
				var maxpage = (listcount + limit - 1) / limit;
				
				// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
				var startpage = ((page -1) / 10) * 10 + 1;
				
				// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
				var endpage = startpage + 10 - 1;
				
				if (endpage > maxpage)
					endpage = maxpage;
				var paginationString = '  <nav aria-label="...">'
					paginationString += ' <ul class="pagination">'
					paginationString += '  <li class="page-item disabled">'
					paginationString += '   <span class="page-link"><i class="mdi mdi-chevron-left"></i></span>'
					paginationString += '  </li>'
					
					
				for(var i=1 ; i <= maxpage ; i++){
					paginationString += '<li class="page-item"><p class="page-link page">'+i+'</p></li>'
				};
					paginationString += '<li class="page-item">'
					paginationString += ' <a class="page-link" href="#"><i class="mdi mdi-chevron-right"></i></a>'
					paginationString += '</li> </ul></nav>'
				$(".comment").append(paginationString);
			   	}
			 
			});
		});
		
		$('.comment').unbind("click", ".updateCmt").bind('click', '.updateCmt' ,function() {
			$('.updateCmt').click(function(e){
				$(".update").remove();
				e.stopImmediatePropagation();
			    var pbcNum = $(this).attr('ariaValue');
			    var pbNum = $(this).attr('pbNum');
			    var fileName = $(this).attr('fileValue');
			    var content = $(this).prev().find('p').text();
			    console.log("content : " + content );
			    if(fileName == 'null') {
			    	console.log("널널널");
			    }
			    
			    console.log(pbNum);
			    var updateFormString = 	'<div class="mt-4 update">'
			    					 +	' <h5 class="font-size-16 mb-3">댓글 수정</h5>'
			    					 +	'    <form class="updateComment" id="updateComment'+pbcNum+'" name="updateComment" method="post" enctype="multipart/form-data">'
                    				 +	' 		<div class="row">'	
                    				 +	'			<div class="col-md-6">'
                    				 +	'		<div class="mb-3">'		
                    				 +	'		<a href="javascript: void(0);"'
                    				 +	'		class="d-inline-block"> <img src="../resources/assets/images/users/profile.png" alt=""'
                    				 +	' 		class="rounded-circle avatar-xs"></a>'
                    				 +	'		<label for="commentname-input" class="form-label">${id }</label>'
			    					 +	'		<input type="hidden" id="PRO_BO_COMMENT_ID" name="PRO_BO_COMMENT_ID" value="${id }">'	
			    					 +	' </div></div></div>'
			    					 +	'   <div class="mb-3">'
			    					 +	'  <label for="commentmessage-input" class="form-label">Message</label>'
			    					 if(fileName != 'null' ){
			    	updateFormString +=  '<span id="fileNameOrigin" style="float: right">'+fileName+'</span>'
			    					 }else if(fileName == 'null'){
			    	updateFormString +=  '<span id="fileNameOrigin" style="float: right"></span>'	 				 
			    					 }
			    	updateFormString +=	' <label for="fileNames" class="bx bxs-file-plus isize" id="fileLabel" style="float: right;"></label>'
			    	 				 +	' <input type="file" class="fileNamesCls" id="fileNames" name="fileNames" style="display: none;">'
			  		 				 +	' <textarea class="form-control" id="PRO_BO_COMMENT_CONTENT" name="PRO_BO_COMMENT_CONTENT" placeholder="Your message..." rows="3">'+content+'</textarea> </div>'
                         			 +	'                    <div class="text-end">'
                         			 +	' <button type="button" id="updateCommentBtn"  class="btn btn-success w-sm proCommentBtnCls">등 록</button>'
                         			 +	' <input type="hidden" name = "PRO_BOARD_NUM" id="PRO_BOARD_NUM" value="'+ pbNum +'">'
               						 +	' </div></form></div>'
			    
			    $(this).parent().after(updateFormString);
				$(".fileNamesCls").change(function(){
					var fileValue = $('#fileNames').val().split("\\");
					var fileName = fileValue[fileValue.length-1]; 
					$("#fileNameOrigin").text(fileName);
				});
				
				$('.comment').unbind('click',"#updateCommentBtn").bind('click','#updateCommentBtn' ,function() {
					$("#updateCommentBtn").click(function(e){
						e.stopImmediatePropagation();
						console.log(pbcNum +" ?");
						var formName = "#updateComment" + pbcNum
						console.log(formName);
						
						var form = $(formName)[0];
					
						// Create an FormData object 
						var data = new FormData(form);
						
						data.append("PRO_BO_COMMENT_NUM", pbcNum);  
					
						// FormData의 값 확인
						for (var pair of data.entries()) {
						  console.log(pair[0]+ ', ' + pair[1]);
						}
						$.ajax({
							type: "POST",
							enctype: 'multipart/form-data',
							url: '../project/ProjectCommentUpdate?${_csrf.parameterName}=${_csrf.token}',	// form을 전송할 실제 파일경로
							data: data,
							processData: false,
							contentType: false,
							cache: false,
							success: function (data) {
								$(".comment").empty();
								console.log(data);
								$.each(data, function(index, pbc){
									var commentString = '';
									commentString += '<div class="d-flex py-3">'
													if(pbc.pro_BO_COMMENT_RE_LEV > 0 ){
									commentString +='<div class="flex-shrink-0 me-3" style="padding-left:30px;">'	
												    + '<div class="avatar-xs">'
												    +	' <div class="avatar-title rounded-circle bg-light text-primary">' 
												  	+		'<i class="dripicons-skip"></i><i class="bx bxs-user"></i>'
													} else {
									commentString +='<div class="flex-shrink-0 me-3">'		
												 	+ '<div class="avatar-xs">'
												    +	' <div class="avatar-title rounded-circle bg-light text-primary">' 
												  	+		'<i class="bx bxs-user"></i>'
													}
									commentString +=	' </div>   </div>   </div>'
													+	'<div class="flex-grow-1">'		
													+		'<h5 class="font-size-14 mb-1">' + pbc.pro_BO_COMMENT_NAME
													+			'<small class="text-muted float-end">'+pbc.pro_BO_COMMENT_DATE+'</small></h5>'
													+		'<p class="text-muted"> '+ pbc.pro_BO_COMMENT_CONTENT +' </p>'
													+	'<div>'
													+	'</div>' ;
												if(pbc.pro_BO_COMMENT_ORIGINFILE != null){
													commentString 
														+= '<div style="float : right">'
														+	'<form action="../project/projectFileDown" id="fileForm'+index+'" method="post" class="fdform">'
														+	'<i class="mdi mdi-file-download-outline text-info cmtFileDown" id="fileDown">'+pbc.pro_BO_COMMENT_ORIGINFILE+'</i>'
							                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_FILE+'" name="filename" >'
							                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_ORIGINFILE+'" name="original" >'
							                           	+	'<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'
							                           	+	'</form>'
							                           	+	'<div class="text-success replyAdd" pbcNum="'+pbc.pro_BO_COMMENT_NUM+'"  pbNum="'+pbc.pro_BOARD_NUM+'" fileNull = "'+pbc.pro_BO_COMMENT_ORIGINFILE+'" style="float : right"><i class="mdi mdi-reply "></i> Reply</div></div></div>';
												} else {
													commentString
														+= '<div style="float : right">'
														+	'<form action="../project/projectFileDown" id="fileForm'+index+'" method="post" class="fdform">'
							                           	+	'<input type="hidden" value="" name="filename" >'
							                           	+	'<input type="hidden" value="" name="original" >'
							                           	+	'<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'
							                           	+	'</form>'
														+ 	'<div  class="text-success replyAdd" pbcNum="'+pbc.pro_BO_COMMENT_NUM+'"  pbNum="'+pbc.pro_BOARD_NUM+'" fileNull = "'+pbc.pro_BO_COMMENT_ORIGINFILE+'" style="float : right"><i class="mdi mdi-reply "></i> Reply</a></div></div></div>'
												}
												var loginId = $("#loginId").text();
												var writerId = pbc.pro_BO_COMMENT_ID;
												
												if(loginId == writerId ){
													commentString 	+=	'<i class="bx bx-edit-alt updateCmt" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i>'
																	+	'<i class="bx bx-trash deleteCmt" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i></div><hr>'
												} else if (loginId == 'role_admin'){
													commentString 	+=	'<i class="bx bx-edit-alt updateCmt" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i>'
																	+	'<i class="bx bx-trash deleteCmt" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i></div><hr>'
													} else {
													commentString 	+=	'<i class="" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right;">　</i>'
																	+	'<i class="" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right;">　</i></div><hr>'
												}
											
												
											//	var thisComment = $(this).next().attr("id");
											//	console.log(thisComment);
												console.log("comment함수 실행");
												console.log(commentString);
												$(this).parent().parent().parent().parent().parent().append(commentString);
												$(".comment").append(commentString);
								});
							},
							error: function (e) {
								console.log("ERROR : ", e);
							}
						});
						var limit = 5; //한 화면에 출력할 로우 갯수
						
						var listcount  = Number(commentCount)// 총 리스트 수를 받아옴
						
						// 총 페이지 수
						var maxpage = (listcount + limit - 1) / limit;
						
						// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
						var startpage = ((page -1) / 10) * 10 + 1;
						
						// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
						var endpage = startpage + 10 - 1;
						
						if (endpage > maxpage)
							endpage = maxpage;
						var paginationString = '  <nav aria-label="...">'
							paginationString += ' <ul class="pagination">'
							paginationString += '  <li class="page-item disabled">'
							paginationString += '   <span class="page-link"><i class="mdi mdi-chevron-left"></i></span>'
							paginationString += '  </li>'
							
							
						for(var i=1 ; i <= maxpage ; i++){
							paginationString += '<li class="page-item"><p class="page-link page">'+i+'</p></li>'
						};
							paginationString += '<li class="page-item">'
							paginationString += ' <a class="page-link" href="#"><i class="mdi mdi-chevron-right"></i></a>'
							paginationString += '</li> </ul></nav>'
						$(".comment").append(paginationString);
					});
			
				});ㅣ
			 
			});
		});
		
		
		$('.comment').unbind("click", ".replyAdd").bind('click', '.replyAdd' ,function() {
			$('.replyAdd').click(function(e){
				$(".replyDiv").remove();
				console.log("클릭")
				e.stopImmediatePropagation();
			    var pbNum = $(this).attr('pbNum');
			    var pbcNum = $(this).attr('pbcNum');
			    var fileNull = $(this).attr('fileNull');
			    console.log("pbNum : " + pbNum);
			    console.log("pbcNum : " + pbcNum);
			    var replyFormString  = 	'<br><br><div class="mt-4 replyDiv">'
			    					 +	' <h5 class="font-size-16 mb-3 text-success"><i class="dripicons-skip"></i>답글 작성</h5>'
			    					 +	'    <form class="replyComment" id="replyComment'+pbcNum+'" name="replyComment" method="post" enctype="multipart/form-data">'
                    				 +	' 		<div class="row">'	
                    				 +	'			<div class="col-md-6">'
                    				 +	'		<div class="mb-3">'		
                    				 +	'		<a href="javascript: void(0);"'
                    				 +	'		class="d-inline-block"> <img src="../resources/assets/images/users/profile.png" alt=""'
                    				 +	' 		class="rounded-circle avatar-xs"></a>'
                    				 +	'		<label for="commentname-input" class="form-label">${id }</label>'
			    					 +	'		<input type="hidden" id="PRO_BO_COMMENT_ID" name="PRO_BO_COMMENT_ID" value="${id }">'	
			    					 +	' </div></div></div>'
			    					 +	'   <div class="mb-3">'
			    					 +	'  <label for="commentmessage-input" class="form-label">Message</label>'
									 +  '<span id="fileNameOrigin" style="float: right"></span>'	 				 
			    					 +	' <label for="fileNames" class="bx bxs-file-plus isize" id="fileLabel" style="float: right;"></label>'
			    	 				 +	' <input type="file" class="fileNamesCls" id="fileNames" name="fileNames" style="display: none;">'
			  		 				 +	' <textarea class="form-control" id="PRO_BO_COMMENT_CONTENT" name="PRO_BO_COMMENT_CONTENT" placeholder="Your message..." rows="3"></textarea> </div>'
                         			 +	'                    <div class="text-end">'
                         			 +	' <button type="button" id="replyCommentBtn"  class="btn btn-success w-sm proCommentBtnCls">등 록</button>'
                         			 +	' <input type="hidden" name = "PRO_BOARD_NUM" id="PRO_BOARD_NUM" value="'+ pbNum +'">'
               						 +	' </div></form></div>'
              			
               	console.log(fileNull + " : fileNull");
               	if (fileNull=='null'){
               	  	$(this).parent().after(replyFormString);
               	} else {
               		$(this).parent().after(replyFormString);
               	}
				$(".fileNamesCls").change(function(){
					var fileValue = $('#fileNames').val().split("\\");
					var fileName = fileValue[fileValue.length-1]; 
					$("#fileNameOrigin").text(fileName);
				});
				
				$('.comment').unbind('click',"#replyCommentBtn").bind('click','#replyCommentBtn' ,function() {
					$("#replyCommentBtn").click(function(e){
						e.stopImmediatePropagation();
						console.log(pbcNum +" ?");
						var formName = "#replyComment" + pbcNum
						console.log(formName);
						
						
						
						var form = $(formName)[0];
					
						// Create an FormData object 
						var data = new FormData(form);
						
						data.append("PRO_BO_COMMENT_NUM", pbcNum);  
					
						// FormData의 값 확인
						for (var pair of data.entries()) {
						  console.log(pair[0]+ ', ' + pair[1]);
						}
						$.ajax({
							type: "POST",
							enctype: 'multipart/form-data',
							url: '../project/ProjectCommentReply?${_csrf.parameterName}=${_csrf.token}',	// form을 전송할 실제 파일경로
							data: data,
							processData: false,
							contentType: false,
							cache: false,
							success: function (data) {
								$(".comment").empty();
								console.log(data);
								$.each(data, function(index, pbc){
									var commentString = '';
									commentString += '<div class="d-flex py-3">'
													if(pbc.pro_BO_COMMENT_RE_LEV > 0 ){
									commentString +='<div class="flex-shrink-0 me-3" style="padding-left:30px;">'	
												    + '<div class="avatar-xs">'
												    +	' <div class="avatar-title rounded-circle bg-light text-primary">' 
												  	+		'<i class="dripicons-skip"></i><i class="bx bxs-user"></i>'
													} else {
									commentString +='<div class="flex-shrink-0 me-3">'		
												 	+ '<div class="avatar-xs">'
												    +	' <div class="avatar-title rounded-circle bg-light text-primary">' 
												  	+		'<i class="bx bxs-user"></i>'
													}
									commentString +=	' </div>   </div>   </div>'
													+	'<div class="flex-grow-1">'		
													+		'<h5 class="font-size-14 mb-1">' + pbc.pro_BO_COMMENT_NAME
													+			'<small class="text-muted float-end">'+pbc.pro_BO_COMMENT_DATE+'</small></h5>'
													+		'<p class="text-muted"> '+ pbc.pro_BO_COMMENT_CONTENT +' </p>'
													+	'<div>'
													+	'</div>' ;
												if(pbc.pro_BO_COMMENT_ORIGINFILE != null){
													commentString 
														+= '<div style="float : right">'
														+	'<form action="../project/projectFileDown" id="fileForm'+index+'" method="post" class="fdform">'
														+	'<i class="mdi mdi-file-download-outline text-info cmtFileDown" id="fileDown">'+pbc.pro_BO_COMMENT_ORIGINFILE+'</i>'
							                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_FILE+'" name="filename" >'
							                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_ORIGINFILE+'" name="original" >'
							                           	+	'<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'
							                           	+	'</form>'
							                           	+	'<div class="text-success replyAdd" pbcNum="'+pbc.pro_BO_COMMENT_NUM+'"  pbNum="'+pbc.pro_BOARD_NUM+'" fileNull = "'+pbc.pro_BO_COMMENT_ORIGINFILE+'" style="float : right"><i class="mdi mdi-reply "></i> Reply</div></div></div>';
												} else {
													commentString
														+= '<div style="float : right">'
														+	'<form action="../project/projectFileDown" id="fileForm'+index+'" method="post" class="fdform">'
							                           	+	'<input type="hidden" value="" name="filename" >'
							                           	+	'<input type="hidden" value="" name="original" >'
							                           	+	'<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'
							                           	+	'</form>'
														+ 	'<div  class="text-success replyAdd" pbcNum="'+pbc.pro_BO_COMMENT_NUM+'"  pbNum="'+pbc.pro_BOARD_NUM+'" fileNull = "'+pbc.pro_BO_COMMENT_ORIGINFILE+'" style="float : right"><i class="mdi mdi-reply "></i> Reply</a></div></div></div>'
												}
												var loginId = $("#loginId").text();
												var writerId = pbc.pro_BO_COMMENT_ID;
												
												if(loginId == writerId ){
													commentString 	+=	'<i class="bx bx-edit-alt updateCmt" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i>'
																	+	'<i class="bx bx-trash deleteCmt" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i></div><hr>'
												} else if (loginId == 'role_admin'){
													commentString 	+=	'<i class="bx bx-edit-alt updateCmt" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i>'
																	+	'<i class="bx bx-trash deleteCmt" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i></div><hr>'
													} else {
													commentString 	+=	'<i class="" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right;">　</i>'
																	+	'<i class="" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right;">　</i></div><hr>'
												}
											
												
											//	var thisComment = $(this).next().attr("id");
											//	console.log(thisComment);
												console.log("comment함수 실행");
												console.log(commentString);
												$(this).parent().parent().parent().parent().parent().append(commentString);
												$(".comment").append(commentString);
								});
							},
							error: function (e) {
								console.log("ERROR : ", e);
							}
						});
						var limit = 5; //한 화면에 출력할 로우 갯수
						
						var listcount  = Number(commentCount)// 총 리스트 수를 받아옴
						
						// 총 페이지 수
						var maxpage = (listcount + limit - 1) / limit;
						
						// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
						var startpage = ((page -1) / 10) * 10 + 1;
						
						// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
						var endpage = startpage + 10 - 1;
						
						if (endpage > maxpage)
							endpage = maxpage;
						var paginationString = '  <nav aria-label="...">'
							paginationString += ' <ul class="pagination">'
							paginationString += '  <li class="page-item disabled">'
							paginationString += '   <span class="page-link"><i class="mdi mdi-chevron-left"></i></span>'
							paginationString += '  </li>'
							
							
						for(var i=1 ; i <= maxpage ; i++){
							paginationString += '<li class="page-item"><p class="page-link page">'+i+'</p></li>'
						};
							paginationString += '<li class="page-item">'
							paginationString += ' <a class="page-link" href="#"><i class="mdi mdi-chevron-right"></i></a>'
							paginationString += '</li> </ul></nav>'
						$(".comment").append(paginationString);
					});
			
				});
			 
			});
		});
		
	
		
		$("#fileDown").click(function(){
			$("#fileForm").submit();
			$("#fileDown").css({'color':'#945050'});
		});
		$(".like").click(function(){
			let clsName = $(this).attr("class");
			let pbNum = $(this).children().next().val();
			let id = $("#loginId").text();
			if (clsName.includes('checked')) {
				$(this).removeClass();
				$(this).addClass("bx bx-check-circle isize");
				$(this).css({'color':'black'});
				
				var count = 0;
				$.ajax({
					type : 'get',
					url : '../project/ProjectLikeDecrease',  // 상대경로. 타입을 따로 주지 않아서 get 방식. id값을 컨트롤러로 보내고
					async:false,
					data : {"pbNum" : pbNum ,
							"id" : id},  // "id"는 컨트롤러에 param으로 가는 id임.
					success : function(resp){
						count = resp;
					}
				});
				$(this).children().text(count);	
				
			} else {
				$(this).removeClass();
				$(this).addClass("bx bx-check-double isize checked");
				$(this).css({'color':'#556ee6'});
				var count = 0;
				$.ajax({
					type : 'get',
					url : '../project/ProjectLikeIncrease',  // 상대경로. 타입을 따로 주지 않아서 get 방식. id값을 컨트롤러로 보내고
					async:false,
					data : {"pbNum" : pbNum ,
							"id" : id},  // "id"는 컨트롤러에 param으로 가는 id임.
					success : function(resp){
						count = resp;
					} 
				});
				$(this).children().text(count);	
			}
		
		});
		
		$(".bm").click(function(){
			let clsName = $(this).attr("class");
			let pNum = $(".pNum").val();
			let pbNum = $(this).children().val();
			console.log(pbNum);
			if (clsName.includes('checked')) {
				$(this).removeClass();
				$(this).addClass("bx bx-bookmark-plus bm isize");
				$(this).css({'color':'black'});
				$.ajax({
					type : 'get',
					url : '../project/ProjectBookmarkCheckedClear',  // 상대경로. 타입을 따로 주지 않아서 get 방식. id값을 컨트롤러로 보내고
					async: false,
					data : {"pbNum" : pbNum},  // "id"는 컨트롤러에 param으로 가는 id임.
					success : function(resp){
						count = resp;
						var tList = [];
						var bookmarkList = [];
						
						
						 $('.pbSfor').each(function(index,item){
							  tList.push($(this).find('.pbSubject').text());
							  bookmarkList.push($(this).find('.pbSubject'));
						 });
						console.log(tList);
						
						var clickTitle = $(this).text();
						console.log("clickTitle" + clickTitle);
						
						for(var i = 0 ; i < tList.length ; i++ ) {
							console.log("반복문");
							console.log("titleList" + tList[i]);
							if ( resp == tList[i]){
								console.log(tList[i] + " 와 일치");
								$('.bmUl li').eq(i).remove();
							}
						}
					}
				});
				
			} else {
				$(this).removeClass();
				$(this).addClass("bx bxs-bookmark-star bm isize checked");
				$(this).css({'color':'#556ee6'});
				$.ajax({
					type : 'get',
					url : '../project/ProjectBookmarkChecked',  // 상대경로. 타입을 따로 주지 않아서 get 방식. id값을 컨트롤러로 보내고
					async: false,
					data : {"pbNum" : pbNum},  // "id"는 컨트롤러에 param으로 가는 id임.
					success : function(resp){
						count = resp;
						var tList = [];
						var bookmarkList = [];
						
						 $('.pbSfor').each(function(index,item){
							  tList.push($(this).find('.pbSubject').text());
							  bookmarkList.push($(this).find('.pbSubject'));
						 });
						console.log(tList);
						
						var clickTitle = $(this).text();
						console.log("clickTitle" + clickTitle);
						
						for(var i = 0 ; i < tList.length ; i++ ) {
							console.log("반복문");
							console.log("titleList" + tList[i]);
							if ( resp == tList[i]){
								console.log(tList[i] + " 와 일치");
								$('.bmUl').append('<li><a class="text-muted py-2 d-block"><i  class="mdi mdi-chevron-right me-1"></i>  <span class="badge badge-soft-success rounded-pill ms-1 font-size-12 linkTitle">'+resp+'</span></a> </li>');
								pag
							}
						}
					}
				});
			}
		
		});
		
		$(".linkTitle").click(function(){
			console.log("타이틀 클릭")
			var titleList = $(".pbSfor").get();
			var tList = [];
			var moveList = [];
			
			
			 $('.pbSfor').each(function(index,item){
				  tList.push($(this).find('.pbSubject').text());
				  moveList.push($(this).find('.pbSubject').offset());
			 });
			
		
			console.log(tList);
			
			var clickTitle = $(this).text();
			console.log("clickTitle" + clickTitle);
			
			for(var i = 0 ; i < tList.length ; i++ ) {
				console.log("반복문");
				console.log("titleList" + tList[i]);
				if ( clickTitle == tList[i]){
					console.log(tList[i] + " 와 일치");
					console.log(moveList[i] + "moveList");
					$("html, body").animate({scrollTop: moveList[i].top - 200 },300);
				}
			}
		});
		var currentPosition = parseInt($("#sticky").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop(); 
		    $("#sticky").stop().animate({"top":position+currentPosition+"px"},500);
		  });
		$("#ProjectDetailList").click(function(){
			var id = $(this).attr('idVal');
			var pNum = $(this).attr('pNum');
			console.log(id);
			console.log(pNum);
			location.href = "../project/ProjectDetailList?id="+id+"&pNum="+pNum+"";
		});
		
		$(".search").click(function(){
			var titleList = $(".pbSfor").get();
			var tList = [];
			var moveList = [];
			
			
			 $('.pbSfor').each(function(index,item){
				  tList.push($(this).find('.pbSubject').text());
				  moveList.push($(this).find('.pbSubject').offset());
			 });
			
		
			console.log(tList);
			
			var clickTitle = $("#searchBar").val();
			console.log("clickTitle" + clickTitle);
			
			for(var i = 0 ; i < tList.length ; i++ ) {
				if ( clickTitle == tList[i]){
					console.log(tList[i] + " 와 일치");
					console.log(moveList[i] + "moveList");
					$("html, body").animate({scrollTop: moveList[i].top - 200 },300);
				}
			}
		});
		
	
		var count = 2;
		$(window).scroll(function() {
		    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		        if (count < 10) {
		            // show skeleton loading screen
		            $('.skeleton').show();
		            // get current scroll position
		            var currentScroll = $(window).scrollTop();
		            // disable scrolling
		            $('body').css('overflow', 'hidden');
		            setTimeout(function(){
		                for(var i = count; i < count + 2; i++){
		                    var idval = '#' + i;
		                    $(idval).show();
		                }
		                count += 2;
		                // hide skeleton loading screen
		                $('.skeleton').hide();
		                // re-enable scrolling
		                $('body').css('overflow', 'auto');
		                // set scroll position back to original value
		                $(window).scrollTop(currentScroll);
		            }, 1000);
		        }
		    }
		});
		
		$(".voteResultView").hide();
		
		$(".voteBtn").click(function(){
			$(this).parent().hide();
			$(this).parent().next().show();
		});
		
		for(var i = 2; i<11; i++){
			var id = "#"+i;
			$(id).hide();
		}
		
		$(window).scroll(function() {
			   if($(window).scrollTop() + $(window).height() == $(document).height()) {
			       // 여기에 새로운 콘텐츠를 로드하는 코드를 추가합니다.
			   }
		});
	

		
	});
</script>
<div class="page-content">
    <div class="container-fluid">
        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                    <h4 class="mb-sm-0 font-size-18">${projectName }</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">${projectName }</a></li>
                            <li class="breadcrumb-item active">FEED</li>
                        </ol>
                    </div>

                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-xl-9 col-lg-8">
                <div class="card">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs nav-tabs-custom justify-content-center pt-2" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#all-post" role="tab">
                               	<i class="mdi mdi-timeline-text-outline"></i>
                                FEED
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="" id="ProjectDetailList" idVal="${id }" pNum="${pNum }" role="tab">
                               	<i class="mdi mdi-playlist-check"></i>
                                LIST
                            </a>
                        </li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content p-4">
                        <div class="tab-pane active" id="all-post" role="tabpanel">
                            <div>
                           <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-bo dy">
                        <div class="pt-3">
                            <div class="row justify-content-center">
                            <c:forEach var="pb" items="${pblist }" varStatus="index">
                                <div class="col-xl-8" id="${index.index }" style="  width: 80%">
                                <br>
                                    <div>
                                        <div class="text-center">
                                            <div class="mb-4">
                                            <input type="hidden" id="pbNum" value="${pb.PRO_BOARD_NUM }">
                                            <c:if test="${pb.PRO_BOARD_CARTEGORY eq 'WRITE' }">
                                                <div class="badge bg-light font-size-15 text-primary">
                                                    <i class="bx bx-file align-left  me-1"></i>
                                                    ${pb.PRO_BOARD_CARTEGORY }
                                                </div>
                                             </c:if>
                                            <c:if test="${pb.PRO_BOARD_CARTEGORY eq 'TASK' }">
                                                <div class="badge bg-light font-size-15 text-danger">
                                                    <i class="bx bx-briefcase align-left  me-1"></i>
                                                    ${pb.PRO_BOARD_CARTEGORY }
                                                </div>
                                             </c:if>
                                            <c:if test="${pb.PRO_BOARD_CARTEGORY eq 'VOTE' }">
                                                <div class="badge bg-light font-size-15 text-warning">
                                                    <i class="bx bx-box align-left  me-1"></i>
                                                    ${pb.PRO_BOARD_CARTEGORY }
                                                </div>
                                             </c:if>
                                            </div>
                                            <div class="pbSfor">
                                            <h4 class="pbSubject">${pb.PRO_BOARD_SUBJECT }</h4>
                                            </div>
                                            <p class="text-muted mb-4"><i class="bx bx-purchase-tag me-1">등록일</i> <br>${pb.PRO_BOARD_CREATE_DATE }</p>
                                        </div>

                                        <hr>
                                        <div class="text-center">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div>
                                                    	<i class="bx bx-list-ol text-muted mb-2 font-size-15" style="font-weight: bold;">상태 </i>
                                                  	<c:if test="${pb.PRO_BOARD_STATE eq '진행중'}">
                                                        <h5 class="font-size-15 text-success" style="font-weight: bold;">${pb.PRO_BOARD_STATE }</h5>
                                                  	</c:if>
                                                  	<c:if test="${pb.PRO_BOARD_STATE eq '마감'}">
                                                        <h5 class="font-size-15 text-secondary" style="font-weight: bold;">${pb.PRO_BOARD_STATE }</h5>
                                                  	</c:if>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="mt-4 mt-sm-0">
                                                        <i class="bx bx-calendar-event text-muted mb-2 font-size-15" style="font-weight: bold">기간 </i>
                                                        <h5 class="font-size-15 text-primary">${pb.PRO_BOARD_START }<br> ~ ${pb.PRO_BOARD_END }</h5>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="mt-4 mt-sm-0">
                                                        <i class="bx bx-user-voice text-muted mb-2 font-size-15" style="font-weight: bold">작성자	 </i>
                                                        <h5 class="font-size-15">${pb.PRO_BOARD_CREATER_ID }</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 
                                        <hr>
 										   c:if img 구간  
                                        <div class="my-5">
                                    
                                            <img src="assets/images/small/img-2.jpg" alt=""
                                                class="img-thumbnail mx-auto d-block">
                                        </div>
										-->

                                        <div class="mt-4">
                                            <div class="text-muted font-size-14">
                                          	<c:choose>
											    <c:when test="${pb.PRO_BOARD_CARTEGORY eq 'VOTE'}">
											        <div class="voteView">
											        <c:set var="splitContent" value="${fn:split(pb.PRO_BOARD_CONTENT, '#')}" />
											        <c:forEach var="item" items="${splitContent}" varStatus="index">
											        			 <c:if test="${index.index eq 0}">
											        			 	<h5>${item }</h5><br>
											        			 </c:if>
											        	         <c:if test="${index.index ne 0}">
											        	         <div class="form-check form-radio-success mb-3">
														               <input class="form-check-input" type="radio" name="vote" value="${item}">${item} <br/>
														        </div>
														         </c:if>
											        </c:forEach>
											        <br>
											         <button class="btn btn-outline-primary waves-effect waves-light voteBtn" style="height: 35px; width: 70px;">제출</button>
											    	</div>
											   	  <div class="voteResultView" id="voteResultViewid">
											   	  	 <p>현재진행중인 파트 마무리후 전자결재 파트로 넘어가기</p>
	                                      		     <div class="progress animated-progess mb-4">
						                                <div class="progress-bar" role="progressbar" style="width: 30%" aria-valuenow="10"
						                                    aria-valuemin="0" aria-valuemax="100"></div>
						                            </div>
						                             <p>일단 MERGE진행 후에 검토</p>
	                                      		     <div class="progress animated-progess mb-4">
						                                <div class="progress-bar" role="progressbar" style="width: 40%" aria-valuenow="10"
						                                    aria-valuemin="0" aria-valuemax="100"></div>
						                            </div>
						                             <p>전자결재 진행인원 현프로젝트 진행인원분리</p>
	                                      		     <div class="progress animated-progess mb-4">
						                                <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="10"
						                                    aria-valuemin="0" aria-valuemax="100"></div>
						                            </div>
						                             <p>프로젝트 마무리후에도 계속해서 유지보수 및 기능개발</p>
	                                      		     <div class="progress animated-progess mb-4">
						                                <div class="progress-bar" role="progressbar" style="width: 10%" aria-valuenow="10"
						                                    aria-valuemin="0" aria-valuemax="100"></div>
						                            </div>
	                                      		    
			                                      </div>
											    </c:when>
											    <c:otherwise>
													${pb.PRO_BOARD_CONTENT }
											    </c:otherwise>
											    
											    
											</c:choose>
			                                    
                                            </div>
                                            <br>
											 <c:if test="${!empty pb.PRO_BOARD_FILE }">
											 <br>
											 <form action="../project/projectFileDown" id="fileForm" method="post">
										  		 	<i class="mdi mdi-file-download-outline" id="fileDown">${pb.PRO_BOARD_FILE_ORIGINAL }</i>
										  			  <input type="hidden" value="${pb.PRO_BOARD_FILE}" name="filename" >
										  			  <input type="hidden" value="${pb.PRO_BOARD_FILE_ORIGINAL }" name="original" >
										  			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										  	 </form>
										  	</c:if>
                                            <br>
                                            <c:forEach var="users" items="${pb.PROBOARD_CHECK_USERS }">
                                            	<c:if test="${ users.PRO_BOARD_NUM == pb.PRO_BOARD_NUM}">
                                            		<c:if test="${users.IS_CHECKED == 0 }">
                                            			<i class="bx bx-check-circle isize like">
                                            		</c:if>
                                            		<c:if test="${users.IS_CHECKED == 1 }">
                                            			<i class="bx bx-check-double isize checked like" style="color: #556ee6">
                                            		</c:if>
                                            	</c:if>
											</c:forEach>
													<span class="likeNum" id="lnum">${ pb.PRO_BOARD_LIKE}</span>
													<input type="hidden" class="pbNum" id="getPbNum" value="${pb.PRO_BOARD_NUM }">
												</i>
											
											 &nbsp;&nbsp;
											<c:if test="${pb.PRO_BOARD_BOOKMARK == 1 }">
												<i class="bx bxs-bookmark-star bm isize checked"  id="bookmark" style="color: #556ee6">
											</c:if>
											<c:if test="${pb.PRO_BOARD_BOOKMARK == 0 }">
												<i class="bx bx-bookmark-plus bm isize"  id="bookmark">
											</c:if>
													<input type="hidden" class="pbNum" value="${pb.PRO_BOARD_NUM }">
												</i>
											
											<hr>
                                            <div class="mt-5">
                                            	<input type="hidden" name = "PRO_BOARD_NUM" id="PRO_BOARD_NUM" value="${pb.PRO_BOARD_NUM }">
                                                <h5 class="font-size-15 commentToggle" id="commentToggle"><i
                                                        class="bx bx-message-dots text-muted align-middle me-1"></i>
                                                    Comments </h5>
                                                <div class="comment" id="comment${pb.PRO_BOARD_NUM}">
                                                    <div class="d-flex py-3">
                                                        <div class="flex-shrink-0 me-3">
                                                            <div class="avatar-xs">
                                                                <div
                                                                    class="avatar-title rounded-circle bg-light text-primary">
                                                                    <i class="bx bxs-user"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="flex-grow-1">
                                                            <h5 class="font-size-14 mb-1 writer">Delores Williams <small
                                                                    class="text-muted float-end writeTime">1 hr Ago</small></h5>
                                                            <p class="text-muted commentContent">If several languages coalesce, the
                                                                grammar of the resulting language is more simple and
                                                                regular than that of the individual</p>
                                                            <div>
                                                                <a href="javascript: void(0);" class="text-success"><i
                                                                        class="mdi mdi-reply"></i> Reply</a>
                                                            </div>
                                                            <div>
                                                                <a href="javascript: void(0);" class="text-info" style="float: right;">
                                                                <i class="mdi mdi-file-download-outline"></i>파일이름!</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>

                                            <div class="mt-4">
                                                <h5 class="font-size-16 mb-3">Leave a Message</h5>
                                                <form class="pcmf" id="ProjectCommentForm${pb.PRO_BOARD_NUM }" name="ProjectCommentForm" method="post" enctype="multipart/form-data">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                            <a href="javascript: void(0);"
																class="d-inline-block"> <img
																src="../resources/assets/images/users/profile.png" alt=""
																class="rounded-circle avatar-xs">
															</a>
                                                                <label for="commentname-input"
                                                                    class="form-label">${id }</label>
                                                                <input type="hidden" id="PRO_BO_COMMENT_ID" name="PRO_BO_COMMENT_ID" value="${id }">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="commentmessage-input"
                                                            class="form-label">Message</label>
                                                            <span id="fileNameOrigin" style="float: right"></span>
                                                            <label for="fileNames" class="bx bxs-file-plus isize" id="fileLabel" style="float: right;">
                                                            </label>
                                                               <input type="file" class="fileNamesCls" id="fileNames" name="fileNames">
                                                        <textarea class="form-control" id="PRO_BO_COMMENT_CONTENT" name="PRO_BO_COMMENT_CONTENT"
                                                            placeholder="Your message..." rows="3"></textarea>
                                                    </div>

                                                    <div class="text-end">
                                                        <button type="button" id="proCommentBtn"
                                                            class="btn btn-success w-sm proCommentBtnCls">등 록</button>
                                                            <input type="hidden" name = "PRO_BOARD_NUM" id="PRO_BOARD_NUM" value="${pb.PRO_BOARD_NUM }">
                                                    </div>
                                                    
                                                </form>
                                                <br>
                                            </div>
                                        </div>
										<br><br><br><br><hr><br><br><br><br>
                                    </div>
                                </div>
                                 
                            </c:forEach>
                          <div class="skeleton">
						    <div class="skeleton-spinner"></div>
						  </div>
                            </div>
                        </div>
                    </div>
                    <!-- end card body -->
                </div>
                <!-- end card -->
            </div>
            <!-- end col -->
        </div>
        <!-- end row -->
   
        
                            </div>
                        </div>
                        
                    </div>

                </div>
            </div>

            <div class="col-xl-3 col-lg-4">
                <div class="card">
                    <div class="card-body p-4" id="sticky">
                        <div class="search-box">
                            <p class="text-muted">키워드 검색</p>
                            <div class="position-relative">
                                <input type="text" class="form-control rounded bg-light border-light"
                                 id="searchBar"   placeholder="Search...">
                                       <button class="btn btn-primary btn-rounded waves-effect waves-light search"
                                       style="width: 40px; height: 35px; float: right; "><i class="mdi mdi-magnify search-icon" >　</i>　</button>
                                <i class="mdi mdi-magnify search-icon"></i>
                            </div>
                           
                        </div>

                        <hr class="my-4">

                        <div>
                            <p class="text-muted">카테고리</p>

                            <ul class="list-unstyled fw-medium">
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 즐겨찾기</a></li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 요청</a></li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 진행 <span
                                            class="badge badge-soft-success rounded-pill float-end ms-1 font-size-12">06</span></a>
                                </li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 피드백</a></li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 보류</a></li>
                                <li><a href="#" class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i> 마감<span
                                            class="badge badge-soft-success rounded-pill ms-1 float-end font-size-12">04</span></a>
                                </li>
                            </ul>
                        </div>

                        <hr class="my-4">

                        <div>
                            <p class="text-muted">최근 즐겨찾기</p>

                            <ul class="list-unstyled fw-medium bmUl" >
                            <c:forEach var="title" items="${bmBoard }" >
                                <li><a class="text-muted py-2 d-block"><i
                                            class="mdi mdi-chevron-right me-1"></i>
                                            <span class="badge badge-soft-success rounded-pill ms-1 font-size-12 linkTitle">${title }</span></a>
                                </li>
                            </c:forEach>
                            </ul>
                        </div>

                    </div>
                </div>
                <!-- end card -->
            </div>
        </div>
        <!-- end row -->

    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->
<!-- End Page-content -->
</body>
<script src="project_js/project_add.js"></script>
<script src="project_js/project_list_onload.js"></script>
<script type="text/javascript">
$(function(){
})
</script>
<jsp:include page="../main/footer.jsp"></jsp:include>
  <script src="${pageContext.request.contextPath }/resources/assets/js/project_js/project_add.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/project_js/project_list_onload.js"></script>
	<script type="text/javascript">
	$(function(){
		$(".team_icon").click(function(){
			$("#stateForm").submit(function(){
				
			});
			
			   console.log("들어옴");
			   var p = $(this).parent().attr("id");
			   var state = $("#state").val();
			   console.log(state);
			   console.log(p);
			   $.ajax({			
					url: "ProjectList.po",  
		 			type:"GET",
		 			success:function(response) {
		 				console.log(response);
		 			},
		 			error:function(xhr,status,msg){
		 				console.log("상태값 : " + status + " Http에러메시지 : "+msg);
		 			}
		 	   });
		});
	});
	</script>
</html>