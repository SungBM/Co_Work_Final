$(document).ready(function(){
	$("#user_id").val("co-work");
	
	$("#upfile").change(function(){
	console.log($(this).val())
	const inputfile = $(this).val().split('\\');//c:\facepath\upload.png
	$('#filevalue').text(inputfile[inputfile.length -1]);
	});
	
	$("form[action=add]").submit(function(){
		if($.trim($("#freeboard_pass").val())==""){
			alert("비밀번호를 입력하세요");
			$("#freeboard_pass").focus();
			return false;
		}
		
		if($.trim($("#freeboard_subject").val())==""){
			alert("제목을 입력하세요");
			$("#freeboard_subject").focus();
			return false;
		}
		
		if($.trim($("#freeboard_content").val())==""){
			alert("내용을 입력하세요");
			$("#freeboard_content").focus();
			console.log($("#freeboard_content") + ": freeboard");
			return false;
		}
	}); //submit
}); //ready