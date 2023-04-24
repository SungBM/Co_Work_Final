$(function() {
    $('#submitOpinion').on('click', function() {
        var opinion = $('#approvalOpinion').val();
        $.ajax({
            url: '/insertOpinion',
            type: 'POST',
            data: {opinion: opinion},
            beforeSend : function(xhr)
	        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
	        	xhr.setRequestHeader(header, token);			
	        },
            success: function(response) {
                // insert 성공 처리
            },
            error: function() {
                // insert 실패 처리
            }
        });
    });
});
