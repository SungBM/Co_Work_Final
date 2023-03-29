<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='../assets/css/chatt.css'>
</head>
<body>
	<div id='chatt'>
		<h3>이름${memberinfo.USER_ID }</h3>
	  	<input type='text' id='mid' value='${memberinfo.USER_ID }'>  	
<!--  	<input type='button' value='로그인' id='btnLogin'> -->	
		<br/>
		<div id='talk'></div>
		<div id='sendZone'>
			<textarea id='msg' value='hi...' ></textarea>
			<input type='button' value='전송' id='btnSend'>
		</div>
	</div>
	<script src='${pageContext.request.contextPath}/resources/assets/js/chat_js/chat.js'></script>
</body>
</html>