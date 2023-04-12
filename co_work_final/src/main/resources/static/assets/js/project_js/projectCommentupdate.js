$(function(){
			$('.comment').unbind("click", ".updateCmt").bind('click', '.updateCmt' ,function() {
			$('.updateCmt').click(function(e){
				$(".update").remove();
				e.stopImmediatePropagation();
			    var pbcNum = $(this).attr('ariaValue');
			    var pbNum = $(this).attr('pbNum');
			    var fileName = $(this).attr('fileValue');
			    var content = $(this).prev().find('p').text();
			    console.log("content : " + content );
			    if(fileName == 'null') {
			    	console.log("널널널");
			    }
			    
			    console.log(pbNum);
			    var updateFormString = 	'<div class="mt-4 update">'
			    					 +	' <h5 class="font-size-16 mb-3">댓글 수정</h5>'
			    					 +	'    <form class="updateComment" id="updateComment'+pbcNum+'" name="updateComment" method="post" enctype="multipart/form-data">'
                    				 +	' 		<div class="row">'	
                    				 +	'			<div class="col-md-6">'
                    				 +	'		<div class="mb-3">'		
                    				 +	'		<a href="javascript: void(0);"'
                    				 +	'		class="d-inline-block"> <img src="../resources/assets/images/users/profile.png" alt=""'
                    				 +	' 		class="rounded-circle avatar-xs"></a>'
                    				 +	'		<label for="commentname-input" class="form-label">${id }</label>'
			    					 +	'		<input type="hidden" id="PRO_BO_COMMENT_ID" name="PRO_BO_COMMENT_ID" value="${id }">'	
			    					 +	' </div></div></div>'
			    					 +	'   <div class="mb-3">'
			    					 +	'  <label for="commentmessage-input" class="form-label">Message</label>'
			    					 if(fileName != 'null' ){
			    	updateFormString +=  '<span id="fileNameOrigin" style="float: right">'+fileName+'</span>'
			    					 }else if(fileName == 'null'){
			    	updateFormString +=  '<span id="fileNameOrigin" style="float: right"></span>'	 				 
			    					 }
			    	updateFormString +=	' <label for="fileNames" class="bx bxs-file-plus isize" id="fileLabel" style="float: right;"></label>'
			    	 				 +	' <input type="file" class="fileNamesCls" id="fileNames" name="fileNames" style="display: none;">'
			  		 				 +	' <textarea class="form-control" id="PRO_BO_COMMENT_CONTENT" name="PRO_BO_COMMENT_CONTENT" placeholder="Your message..." rows="3">'+content+'</textarea> </div>'
                         			 +	'                    <div class="text-end">'
                         			 +	' <button type="button" id="updateCommentBtn"  class="btn btn-success w-sm proCommentBtnCls">등 록</button>'
                         			 +	' <input type="hidden" name = "PRO_BOARD_NUM" id="PRO_BOARD_NUM" value="'+ pbNum +'">'
               						 +	' </div></form></div>'
			    
			    $(this).parent().after(updateFormString);
				$(".fileNamesCls").change(function(){
					var fileValue = $('#fileNames').val().split("\\");
					var fileName = fileValue[fileValue.length-1]; 
					$("#fileNameOrigin").text(fileName);
				});
				
				$('.comment').unbind('click',"#updateCommentBtn").bind('click','#updateCommentBtn' ,function() {
					$("#updateCommentBtn").click(function(e){
						e.stopImmediatePropagation();
						console.log(pbcNum +" ?");
						var formName = "#updateComment" + pbcNum
						console.log(formName);
						
						var form = $(formName)[0];
					
						// Create an FormData object 
						var data = new FormData(form);
						
						data.append("PRO_BO_COMMENT_NUM", pbcNum);  
					
						// FormData의 값 확인
						for (var pair of data.entries()) {
						  console.log(pair[0]+ ', ' + pair[1]);
						}
						alert(pbcNum);
						$.ajax({
							type: "POST",
							enctype: 'multipart/form-data',
							url: '../project/ProjectCommentUpdate?${_csrf.parameterName}=${_csrf.token}',	// form을 전송할 실제 파일경로
							data: data,
							processData: false,
							contentType: false,
							cache: false,
							success: function (data) {
								$(".comment").empty();
								console.log(data);
								$.each(data, function(index, pbc){
									var commentString = '<div class="d-flex py-3">'
										+		'<div class="flex-shrink-0 me-3">'
										+			'<div class="avatar-xs">'
										+				' <div class="avatar-title rounded-circle bg-light text-primary">' 	
										+					'  <i class="bx bxs-user"></i>'
										+				' </div>   </div>   </div>'
										+	'<div class="flex-grow-1">'	
										+		'<h5 class="font-size-14 mb-1">' + pbc.pro_BO_COMMENT_NAME
										+			'<small class="text-muted float-end">'+pbc.pro_BO_COMMENT_DATE+'</small></h5>'
										+		'<p class="text-muted"> '+ pbc.pro_BO_COMMENT_CONTENT +' </p>'
										+	'<div>'
										+	'</div>' ;
									if(pbc.pro_BO_COMMENT_ORIGINFILE != null){
										commentString 
											+= '<div style="float : right">'
											+	'<form action="../project/projectFileDown" id="fileForm'+index+'" method="post" class="fdform">'
											+	'<i class="mdi mdi-file-download-outline text-info cmtFileDown" id="fileDown">'+pbc.pro_BO_COMMENT_ORIGINFILE+'</i>'
				                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_FILE+'" name="filename" >'
				                           	+	'<input type="hidden" value="'+pbc.pro_BO_COMMENT_ORIGINFILE+'" name="original" >'
				                           	+	'<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">'
				                           	+	'</form>'
				                           	+	'<div style="float : right"><a href="javascript: void(0);" class="text-success"><i class="mdi mdi-reply"></i> Reply</a></div></div></div>';
									} else {
										commentString
											+= '<div style="float : right"><a href="javascript: void(0);" class="text-success"><i class="mdi mdi-reply"></i> Reply</a></div></div>'
									}
									var loginId = $("#loginId").text();
									var writerId = pbc.pro_BO_COMMENT_ID;
									
									if(loginId == writerId ){
										commentString 	+=	'<i class="bx bx-edit-alt updateCmt" fileValue ="'+pbc.pro_BO_COMMENT_ORIGINFILE+'"  pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i>'
														+	'<i class="bx bx-trash deleteCmt" pbNum="'+pbc.pro_BOARD_NUM+'" ariaValue="'+pbc.pro_BO_COMMENT_NUM+'" style="float : right"></i></div><hr>'
									} else {
										commentString += '</div><hr>'
									}
									
									var thisComment = $(this).next().attr("id");
									console.log(thisComment);
									$(".comment").append(commentString);
								});
							},
							error: function (e) {
								console.log("ERROR : ", e);
							}
						});
						
					});
			
				});ㅣ
			 
			});
		});
	
});
	