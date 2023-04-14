$(function(){
		$(".fileNamesCls").hide();
		
		$("#fileNames").hide();
		
		$("#fileNames").change(function(){
			var fileValue = $('#fileNames').val().split("\\");
			var fileName = fileValue[fileValue.length-1]; 
			$("#fileNameOrigin").text(fileName);
			
		});
		
		$('.comment').on('click', '.fdform' ,function() {
			$('.fdform').click(function(){
			    var id = "#"+$(this).attr('id');
			    
			    console.log(id);
			    $(id).submit();
			
			});
		});
		
		$("#fileDown").click(function(){
			$("#fileForm").submit();
			$("#fileDown").css({'color':'#945050'});
		});
});
	