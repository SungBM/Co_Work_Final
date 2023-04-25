$(document).ready(function(){
	//submit 버튼 클릭할 때 이벤트 부분
	$("form[name=freeboardform]").submit(function(){
		
		if($.trim($("#freeboard_subject").val())==""){
			alert("제목을 입력하세요");
			$("#freeboard_subject").focus();
			return false;
		}
		
		if($.trim($("#freeboard_content").val())==""){
			alert("내용을 입력하세요");
			$("#freeboard_content").focus();
			return false;
		}
		
		if($.trim($("input:password").val())==""){
			alert("비밀번호를 입력하세요");
			$("input:password").focus();
			return false;
		}
	}); //submit(); end
});//ready() end