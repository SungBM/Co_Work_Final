$(function(){
					$(".like").click(function(){
			let clsName = $(this).attr("class");
			let pbNum = $(this).children().next().val();
			let id = $("#loginId").text();
			if (clsName.includes('checked')) {
				$(this).removeClass();
				$(this).addClass("bx bx-check-circle isize");
				$(this).css({'color':'black'});
				
				var count = 0;
				$.ajax({
					type : 'get',
					url : '../project/ProjectLikeDecrease',  // 상대경로. 타입을 따로 주지 않아서 get 방식. id값을 컨트롤러로 보내고
					async:false,
					data : {"pbNum" : pbNum ,
							"id" : id},  // "id"는 컨트롤러에 param으로 가는 id임.
					success : function(resp){
						count = resp;
					}
				});
				$(this).children().text(count);	
				
			} else {
				$(this).removeClass();
				$(this).addClass("bx bx-check-double isize checked");
				$(this).css({'color':'#556ee6'});
				var count = 0;
				$.ajax({
					type : 'get',
					url : '../project/ProjectLikeIncrease',  // 상대경로. 타입을 따로 주지 않아서 get 방식. id값을 컨트롤러로 보내고
					async:false,
					data : {"pbNum" : pbNum ,
							"id" : id},  // "id"는 컨트롤러에 param으로 가는 id임.
					success : function(resp){
						count = resp;
					} 
				});
				$(this).children().text(count);	
			}
		
		});
		
		$(".bm").click(function(){
			let clsName = $(this).attr("class");
			let pNum = $(".pNum").val();
			let pbNum = $(this).children().val();
			console.log(pbNum);
			if (clsName.includes('checked')) {
				$(this).removeClass();
				$(this).addClass("bx bx-bookmark-plus bm isize");
				$(this).css({'color':'black'});
				$.ajax({
					type : 'get',
					url : '../project/ProjectBookmarkCheckedClear',  // 상대경로. 타입을 따로 주지 않아서 get 방식. id값을 컨트롤러로 보내고
					async: false,
					data : {"pbNum" : pbNum},  // "id"는 컨트롤러에 param으로 가는 id임.
					success : function(resp){
						count = resp;
						var tList = [];
						var bookmarkList = [];
						
						
						 $('.pbSfor').each(function(index,item){
							  tList.push($(this).find('.pbSubject').text());
							  bookmarkList.push($(this).find('.pbSubject'));
						 });
						console.log(tList);
						
						var clickTitle = $(this).text();
						console.log("clickTitle" + clickTitle);
						
						for(var i = 0 ; i < tList.length ; i++ ) {
							console.log("반복문");
							console.log("titleList" + tList[i]);
							if ( resp == tList[i]){
								console.log(tList[i] + " 와 일치");
								$('.bmUl li').eq(i).remove();
							}
						}
					}
				});
				
			} else {
				$(this).removeClass();
				$(this).addClass("bx bxs-bookmark-star bm isize checked");
				$(this).css({'color':'#556ee6'});
				$.ajax({
					type : 'get',
					url : '../project/ProjectBookmarkChecked',  // 상대경로. 타입을 따로 주지 않아서 get 방식. id값을 컨트롤러로 보내고
					async: false,
					data : {"pbNum" : pbNum},  // "id"는 컨트롤러에 param으로 가는 id임.
					success : function(resp){
						count = resp;
						var tList = [];
						var bookmarkList = [];
						
						 $('.pbSfor').each(function(index,item){
							  tList.push($(this).find('.pbSubject').text());
							  bookmarkList.push($(this).find('.pbSubject'));
						 });
						console.log(tList);
						
						var clickTitle = $(this).text();
						console.log("clickTitle" + clickTitle);
						
						for(var i = 0 ; i < tList.length ; i++ ) {
							console.log("반복문");
							console.log("titleList" + tList[i]);
							if ( resp == tList[i]){
								console.log(tList[i] + " 와 일치");
								$('.bmUl').append('<li><a class="text-muted py-2 d-block"><i  class="mdi mdi-chevron-right me-1"></i>  <span class="badge badge-soft-success rounded-pill ms-1 font-size-12 linkTitle">'+resp+'</span></a> </li>');
								pag
							}
						}
					}
				});
			}
		
		});
});
	