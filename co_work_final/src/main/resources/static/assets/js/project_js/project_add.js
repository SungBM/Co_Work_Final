
$(function(){
      $("#submit_add").click(function(){
		console.log("add Click");
		var queryString = $("#project_Add").serialize();
		console.log(queryString);
			$.ajax({
            url: "ProjectAddProcess.po" , //매개변수로 넘겨받은 url주소
            data : queryString ,
            cache: false,
            type: "GET",
            success: function(data) {
	           if(data==1){  //리스트 호출
		 
	             }
	           $("#exampleModal").removeClass("show");
	           setTimeout(function(){
   				window.location.reload();
				}, 1000);
               $("#result").empty();
               $("#result").html(data);
              // window.location.hash = page;
               $(window).scrollTop(0);
            
            },
            error : function() {
			alert("error");
			}
         });
		});
   
      
});
   