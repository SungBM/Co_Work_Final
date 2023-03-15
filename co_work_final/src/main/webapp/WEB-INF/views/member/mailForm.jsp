<%-- 메일보내기, 인증하기기능 등 --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
	.container{width:50%}
	label{font-weight:bold}
	fieldset{border:1px solid #9e9e9e; padding:50px}
	legend{text-align:center; width:auto; padding:10px;}
</style>
<title>메일 보내기 폼 작성</title>
</head>
<body>
	<div class="container mt-5">
		<form class="form-horizontal" method="post" action="mailSend.jsp">
		  <fieldset>
		  	<legend>
		  		<strong>메일작성</strong>
		  	</legend>
		  	
		  	<div class="form-group">
		  		<label class="control-label" for="sender">보내는주소 <font color='red'>*</font></label>
		  		  <input type="text" name="sender" id="sender" class="form-control"
		  		  			placeholder="보내는 분의 이메일 주소를 입력하세요."
		  		  			value="<%=net.member.action.Myinfo.naverid %>@naver.com" required>
		  	</div>
		  	
		  	<div class="form-group">
		  		<label class="control-label" for="receiver">받는 주소 <font color='red'>*</font></label>
		  		  <input type="email" name="receiver" id="receiver" class="form-control"
		  		  			placeholder="받는 분의 이메일 주소를 입력하세요." required>
		  	</div>
		  	
		  	<div class="form-group">
		  	<label class="control-label" for="subject">메일 제목 <font color='red'>*</font></label>
		  	  <input type="text" name="subject" id="subject" class="form-control"
		  	  			placeholder="이메일의 제목을 입력하세요." required>
		  	</div>
		  	
		  	<div class="form-group">
		  	<label class="control-label" for="content">내용 입력 <font color='red'>*</font></label>
		  	  <textarea name="content" id="content" class="form-control" rows="5" required></textarea>
		  	</div>
		  	
		  	<!-- 버튼 영역 -->
		  	<div class="form-actions">
		  		<input type="submit" class="btn btn-primary" value="메일보내기">
		  		<input type="reset" class="btn btn-danger" value="다시 작성">
		  	</div>
		  </fieldset>
		</form>
	</div>
</body>
</html>