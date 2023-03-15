$(document).ready(function() {
	
		$("#upfile").change(function(){
		console.log($(this).val())		//c:\fakepath\upload.png
		const inputfile = $(this).val().split('\\');
		$('#filevalue').text(inputfile[inputfile.length - 1]);
	});
	
	// submit 버튼 클릭할 때 이벤트 부분
	$("form[name=noticeform]").submit(function() {
		
		if ($.trim($("#autoSizingInputGroup").val()) == "") {
			 alert("제목을 입력하세요");
			 $("#autoSizingInputGroup").focus();
			 return false;		
		}
		
		if ($.trim($("#notice_content").val()) == "") {
			 alert("내용을 입력하세요");
			 $("#notice_content").focus();
			 return false;		
		}
	});//submit end
});//ready() end