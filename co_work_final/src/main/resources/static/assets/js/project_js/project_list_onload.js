$(function(){
	$(".avatar-group-item").click(function(){
		var id = $(this).children("#icon_id").text();
		console.log(id);
		location.href = "../member/mypage?id=" + id;
	});
	
	$(".card-drop").click(function (event) {
		   console.log("??");
		   x = event.clientX;
		   y = event.clientY; 
		   var win_x = $( window ).width();
		   var win_y = $( window ).height();
		   var rx = ( win_x - x ) + 430;
		   var ry = ( y  )  -400;
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
				//100이 넘으면 마감속성으로 변경하는 로직 수행 db통신 필요 
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
			state = String(state).trim();
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
				case "1" :
					$(this).css('background-color','#556ee6');
					break;
			}
			
		});
		
		$(".state").each(function(){
			let state = $(this).text();
			state = state.trim();
			console.log("state의 속성값" + state);
				switch(state) {
				case "마감 임박" :
					$(this).css({'color':'#f46a6a'});
					break;
				case "진행중" :
					$(this).css({'color':'#50a5f1'});
					break;
				case "마감" :
					$(this).css({'color':'darkgray'});
					break;	
				case "요청 확인" :
					$(this).css({'color':'#f1b44c'});
					break;
				case "1" :
					$(this).addClass('text-success')
					$(this).text("진행전");
					break;
			}
			/*
				if(state == "마감 임박") {
					console.log("state if 들어옴");
					$(this).css({'color':'#f46a6a'});
				} 
				 if( state == "진행중"  ) {
					 console.log("state if 들어옴");
					$(this).css({'color':'#50a5f1'});
				} 
				 if ( state == "마감" ) {
					 console.log("state if 들어옴");
					$(this).css({'color':'darkgray'});
				} 
				 if (state == "요청 확인" ) {
					 console.log("state if 들어옴");
					$(this).css({'color':'#f1b44c'});
				} 
			*/
			
		});
		
		$(".team_a").click(function(){
			console.log("a 클릭");
			$(".team_btn").click();
			console.log("a 클릭 after");
		})
		
		$("#projectDetail").click(function(){
			let id = $("#loginId").text();
			let pNum = $(this).attr("aria-value");
			location.href="projectDetailFeed?id=" + id + "&pNum=" + pNum;
		});
		
		
		
})
	