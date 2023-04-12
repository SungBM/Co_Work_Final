$(function(){
			$(".proCommentBtnCls").click(function(){
			$(".comment").empty();
			var pbNum = $(this).next().val();
			console.log(pbNum +" ?");
			var formName = "#ProjectCommentForm" + pbNum
			var form = $(formName)[0];
			
			// Create an FormData object 
			var data = new FormData(form);
			
			console.log(data);
			
			$.ajax({
				type: "POST",
				enctype: 'multipart/form-data',
				url: '../project/ProjectCommentAdd?${_csrf.parameterName}=${_csrf.token}',	// form을 전송할 실제 파일경로
				data: data,
				processData: false,
				contentType: false,
				cache: false,
				success: function (data) {
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
});
	