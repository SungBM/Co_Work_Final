$(document).ready(function(){
	let check = 0;
	
	//submit 버튼을 클릭할 때 이벤트 부분
	$("form[name=freemodifyform]").submit(function(){
		
		if($.trim($("#freeboard_subject").val())==""){
			alert("제목을 입력하세요");
			$("#board_subject").focus();
			return flase;
		}
		
		if($.trim($("#freeboard_content").val())==""){
			alert("내용을 입력하세요");
			$("#freeboard_content").focus();
			return false;
		}
		
		if($.trim($("#freeboard_pass").val())==""){
			alert("비밀번호를 입력하세요");
			$("#freeboard_pass").focus();
			return false;
		}
		
		//파일첨부를 변경하지 않으면 $('#filevalue').text()의 파일명을
		//파라미터 'check'라는 이름으로 form에 추가하여 전송합니다.
		if(check == 0){
			const value = $('#filevalue').text();
			const html = "<input type='hidden' value='"+value+"' name='check'>";
			console.log(html);
			$(this).append(html);
		}
	}) //submit end
	
	function show(){
		//파일 이름이 있는 경우 remove 이미지를 보이게 하고
		//파일 이름이 없는 경우 remove 이미지 보이지 않게 합니다.
		if($('#filevalue').text()==''){
		   $(".remove").css('display', 'none');
		}else{
			$(".remove").css({'display': 'inline-block',
							  'position' : 'relative', 'top':'-5px'});
		}
	}
	
	show();
	
	$("#upfile").change(function(){
		check++;
		const inputfile = $(this).val().split('\\');
		
		$('#filevalue').text(inputfile[inputfile.length -1]);
		show();
		console.log(check);
	});
	
	//remove 이미지를 클릭하면 파일명을 ''으로 변경하고 remove 이미지를 보이지 않게 합니다.
	$(".remove").click(function(){
		$('#filevalue').text('');
		$(this).css('display', 'none');
		$('#upfile').val(''); //만약 파일을 선택하고 remove 이미지를 클릭하면 <input type=file>의 값도 빈문자열로 만들어요
	})
}); //ready() end