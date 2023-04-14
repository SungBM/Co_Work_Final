$(function(){
					$(".linkTitle").click(function(){
			console.log("타이틀 클릭")
			var titleList = $(".pbSfor").get();
			var tList = [];
			var moveList = [];
			
			
			 $('.pbSfor').each(function(index,item){
				  tList.push($(this).find('.pbSubject').text());
				  moveList.push($(this).find('.pbSubject').offset());
			 });
			
		
			console.log(tList);
			
			var clickTitle = $(this).text();
			console.log("clickTitle" + clickTitle);
			
			for(var i = 0 ; i < tList.length ; i++ ) {
				console.log("반복문");
				console.log("titleList" + tList[i]);
				if ( clickTitle == tList[i]){
					console.log(tList[i] + " 와 일치");
					console.log(moveList[i] + "moveList");
					$("html, body").animate({scrollTop: moveList[i].top - 200 },300);
				}
			}
		});
		var currentPosition = parseInt($("#sticky").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop(); 
		    $("#sticky").stop().animate({"top":position+currentPosition+"px"},500);
		  });
		$("#ProjectDetailList").click(function(){
			location.href = "../project/ProjectDetailList"
		});
});
	