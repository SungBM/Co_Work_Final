function preventClick(e) {
	e.preventDefault()
}
function onClickUpload() {
	$("#file").click();
}
function onClickUpload1() {
	$("#file1").click();
}

$(function() {
	$(".update").on("click", function(e) {
		e.preventDefault();

		var val = $(this).parent().prev().children().eq(0).val()
		var val2 = $(this).parent().prev().children().eq(1).val()
		var val3 = $(this).parent().prev().children().eq(2).val()

		if ($(this).text() == "수정") {
			$(this).parent().prev().children().first().attr("readOnly", false)
			$(this).parent().prev().children().first().attr("disabled", false)
			$(this).parent().prev().children().first().focus()
			$(this).parent().prev().children().first().val('')
			$(this).parent().prev().children().first().val(val)
			$("button[type=submit]").not(this).hide();
			$(this).text('확인')
			$(this).next().show();

		} else if ($(this).text() == "확인") {
			var answer = confirm(val + " 변경 하시겠어요?");
			if (answer) {
				// 수정 완료 시
				$.ajax({
					type: "post",
					url: "updateProcess.my",
					data: {
						"value": val3,
						"user_id": val2,
						"val3": val
					},
					success: function(rdata) {
						history.go(0);
					}
				})

			} else {
				$(this).parent().prev().children().first().focus()
				$(this).parent().prev().children().first().val('')
				$(this).parent().prev().children().first().val(val)
			}
		}
		e.stopPropagation();
	}) // 수정 버튼 클릭

	$(document).on("click", "#second", function() {
		$(this).parent().prev().children().first().attr("readOnly", true)
		$(this).parent().prev().children().first().attr("disabled", true)
		$(this).prev().text('수정')
		$(".update").not(this).show();
		$(this).hide()
	}) // 취소 버튼 클릭


	$('#formFile1').change(function(event) {

		const inputfile = $(this).val().split('\\');
		const filename1 = inputfile[inputfile.length - 1]; // inputfile.length - 1 = 2
		const pattern = /(gif|jpg|jpeg|png)$/i; //i(ignore case)는 대소문자 무시를 의미

		if (pattern.test(filename1)) {

			const reader = new FileReader(); // 파일을 읽기 위한 객체 생성

			// DataURL 형식(접두사 data:가 붙은 URL이며 바잉너리 파일을 Base64로 인코딩하여 ASCII 문자열 형식으로 변환 것)
			// 파일을 읽어옵니다. (참고-Base64 인코딩은 바이너리 데이터를 Text로 변경하는 Encoding 입니다.)
			// 읽어온 결과는 reader객체의 result  속성에 저장됩니다.
			// event.target.filed[0] : 파일리스트에서 첫번째 객체를 가져옵니다.
			reader.readAsDataURL(event.target.files[0]);

			reader.onload = function() { // 읽기에  성공했을 때
			
				$("#profile").submit();
				$('#showImage1 > img').attr('src', this.result).css({ "width": "200px", "height": "200px" });
				$('#showImage1 > img').css({ "width": "200px", "height": "200px" });
				
			};
		} else {
			alert('이미지 파일(gif, jpg, jpeg, png)이 아닌 경우는 무시됩니다.');
			$('#filename1').text('');
			$('#showImage1 > img').attr('src', 'image/profile.png');
			$(this).val('')
			$('input[name=check]').val('');
		}
	}) // change() end

	$('#formFile2').change(function(event) {

		const inputfile = $(this).val().split('\\');
		const filename2 = inputfile[inputfile.length - 1]; // inputfile.length - 1 = 2
		const pattern = /(gif|jpg|jpeg|png)$/i; //i(ignore case)는 대소문자 무시를 의미

		if (pattern.test(filename2)) {

			const reader = new FileReader(); // 파일을 읽기 위한 객체 생성

			// DataURL 형식(접두사 data:가 붙은 URL이며 바잉너리 파일을 Base64로 인코딩하여 ASCII 문자열 형식으로 변환 것)
			// 파일을 읽어옵니다. (참고-Base64 인코딩은 바이너리 데이터를 Text로 변경하는 Encoding 입니다.)
			// 읽어온 결과는 reader객체의 result  속성에 저장됩니다.
			// event.target.filed[0] : 파일리스트에서 첫번째 객체를 가져옵니다.
			reader.readAsDataURL(event.target.files[0]);

			reader.onload = function() { // 읽기에  성공했을 때
				$("#card").submit();
				$('#showImage2 > img').attr('src', this.result).css({ "width": "200px", "height": "200px" });
				$('#showImage2 > img').css({ "width": "200px", "height": "200px" });
			};
		} else {
			alert('이미지 파일(gif, jpg, jpeg, png)이 아닌 경우는 무시됩니다.');
			$('#filename2').text('');
			$('#showImage2 > img').attr('src', 'image/card.png');
			$(this).val('')
			$('input[name=check]').val('');
		}
	}) // change() end           

})