<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.6.3.js"></script>
<%-- <script src='${pageContext.request.contextPath}/resources/assets/js/chat_js/chat.js'></script>
 --%><link rel='stylesheet' type='text/css' href='../assets/css/chatt.css'>
<meta name="_csrf_header" content="${_csrf.headerName}">

</head>
<body>
	
	<div id='chatt'>
		<h3>이름${members.user_name}</h3>
	  	<input type='text' id='mid' value='${user_name }'>  	
<!--  	<input type='button' value='로그인' id='btnLogin'> 	-->	
		<br/>
		<div id='talk'></div>
		<div id='sendZone'>
			<textarea id='msg' value='hi...' ></textarea>
			<input type='button' value='전송' id='btnSend'>
		</div>
	</div>

</body>
</html>