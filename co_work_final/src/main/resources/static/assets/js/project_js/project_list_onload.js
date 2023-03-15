$(function(){
	$(".avatar-group-item").click(function(){
		var id = $(this).children("#icon_id").text();
		console.log(id);
		location.href = "myPageDetail.my?id=" + id;
	});
	
	$(".card-drop").click(function (event) {
		   console.log("??");
		   x = event.clientX;
		   y = event.clientY; 
		   var win_x = $( window ).width();
		   var win_y = $( window ).height();
		   var rx = ( win_x - x )+ 50;
		   var ry = ( y  - 400);
		   console.log("윈 x : " + win_x + "윈 y" + win_y);
		   console.log('x좌표:' +x + ', y좌표:' + y);
		   console.log('차이 x:' + rx + ', 차이 y:' + ry);
		   $("#myModal").css('margin-left',rx);
		   $("#myModal").css('margin-top',ry);
	});
		var prog_arr = new Array();
		$(".progress-bar").each(function(){
			prog_arr.push($(this).attr("aria-valuenow"));
			var prog_num = $(this).attr("aria-valuenow");
			console.log("this의 속성값" + prog_num);
			if(prog_num >= 100 ) {
				$(this).removeClass("progress-bar progress-bar-striped progress-bar-animated");
			} else {
				if(prog_num >= 75) {
					console.log("if 들어옴");
					$(this).addClass('bg-danger');
				} else if( prog_num >= 50  ) {
					$(this).addClass('bg-warning');
				} else if ( prog_num >= 25 ) {
					$(this).addClass('bg-info');
				} else if (prog_num >= 0 ) {
					$(this).addClass('bg-success');
				} 
			}
			
		});
		
		$(".badge").each(function(){
			var state = $(this).attr("aria-valuenow");
			switch(state) {
				case "마감 임박" :
					$(this).addClass('bg-danger');
					break;
				case "진행중" :
					$(this).addClass('bg-info');
					break;
				case "마감" :
					$(this).css('background-color','darkgray');
					break;	
				case "요청 확인" :
					$(this).addClass('bg-danger');
					break;
			}
			
		});
		
		
		$(".text-truncate").each(function(){
			var state = $(this).attr("aria-valuenow");
			console.log("state의 속성값" + state);
			switch(state) {
				case "마감 임박" :
					$(this).css('color','#f46a6a');
					break;
				case "진행중" :
					$(this).css('color','#50a5f1');
					break;
				case "마감" :
					$(this).css('color','darkgray');
					break;	
				case "요청 확인" :
					$(this).css('color','#f1b44c');
					break;
			}
			
		});
		
		$(".team_a").click(function(){
			console.log("a 클릭");
			$(".team_btn").click();
			console.log("a 클릭 after");
		})
		
		
		
})
	