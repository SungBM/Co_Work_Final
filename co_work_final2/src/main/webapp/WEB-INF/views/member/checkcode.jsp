<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>
	function checkCode(){
		var v1 = form2.code_check.value;
		var v2 = form2.code.value;
		if(v1 != v2){
			document.getElementById('checkCode').style.color = "red";
			document.getElementById('checkCode').innerHTML = "잘못된 인증번호";
			makeNull();
		}else{
			document.getElementById('checkCode').style.color = "blue";
			document.getElementById('checkCode').innerHTML = "인증되었습니다.";
			
			makeReal();
		}
	}
</script>
</head>
<body>
	<form id="form2" action="javascript:getPassword()">
		<table>
			<tr>
				<td><span>인증번호</span></td>
				<td><input type="text" name="code" id="code"
					 onkeyup="checkCode()" placeholder="인증번호를 입력하세요" />
					 
				<div id="checkCode"></div></td>
				<td><input type="hidden" readonly="readonly" name="code_check"
				     id="code_check" value='<%=request.getAttribute("code") %>' /></td>
				     value="&{code}" %>
			</tr>
		</table>
	</form>
</body>
</html>