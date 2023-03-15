$(function() {
	var full_url = $(location).attr('pathname');   // /가져 오기
	var url = full_url.substring(14, full_url.length);
	console.log(url);
	switch (url) {
		case "ProjectList.po":
			console.log("리스트 포");
			break;
		case "mypagecheck.my":
			var li = $('#side-menu').children('li:eq(6)');
			li.addClass("mm-active");
			break;
		case "mypage.my":
			var li = $('#side-menu').children('li:eq(6)');
			li.addClass("mm-active");
			break;
		case "notify.my":
			var li = $('#side-menu').children('li:eq(7)');
			li.addClass("mm-active");
			li.children("ul").addClass("mm-show");
			li.children("ul").children("li").removeClass();
			li.children("ul").children("li:eq(0)").addClass("mm-active");
			break;
		case "passwordchange.my":
			var li = $('#side-menu').children('li:eq(7)');
			li.addClass("mm-active");
			li.children("ul").addClass("mm-show");
			li.children("ul").children("li").removeClass();
			li.children("ul").children("li:eq(1)").addClass("mm-active");
			break;
		case "companyinfo.com" :
			var li = $('#side-menu').children('li:eq(9)');
			li.addClass("mm-active");
			li.children("ul").addClass("mm-show");
			li.children("ul").children("li").removeClass();
			li.children("ul").children("li:eq(0)").addClass("mm-active");
			break;
		case "membersInfo.com" :
			var li = $('#side-menu').children('li:eq(10)');
			li.addClass("mm-active");
			li.children("ul").addClass("mm-show");
			li.children("ul").children("li").removeClass();
			li.children("ul").children("li:eq(0)").addClass("mm-active");
			break;
		case "NoticeList.bon" :
			var li = $('#side-menu').children('li:eq(4)');
			li.addClass("mm-active");
			li.children("ul").addClass("mm-show");
			li.children("ul").children("li").removeClass();
			li.children("ul").children("li:eq(0)").addClass("mm-active");
			break;
		
		
	}
	
/*	$(".logo logo-light").click(function(){
		console.log("클릭");
		location.reload();
		window.location.href = "main.net";
		
	});
	/*
	var my_profile = $('ul').children('li:eq(6)');
	
	my_profile.click(function(){
		$(this).addClass("mm-active");
	})
	*/

});