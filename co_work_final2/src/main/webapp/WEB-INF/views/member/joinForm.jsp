
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>

    <meta charset="utf-8" />
    <title>로그인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico">

    <!-- owl.carousel css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/owl.carousel/assets/owl.carousel.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/owl.carousel/assets/owl.theme.default.min.css">

    <!-- Bootstrap Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="${pageContext.request.contextPath }/resources/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

  <script src="${pageContext.request.contextPath }/resources/assets/libs/jquery/jquery.min.js"></script>
<script>
$(function(){
	let checkid=false;
	let checkemail=false;
	let checkpass=false;
	let checkCode=false;
	
	$("input[name=user_id]").on('keyup', function(){
		$("#message").empty(); //처음에 pattern에 적합하지 않은 경우 메시지 출력 후 적합한 데이터를 입력해도
							   //계속 같은 데이터 출력하므로 이벤트 시작할 때마다 비워둡니다.
		//[A-Za-z0-9_]의 의미는 \w
		const pattern = /^\w{6,15}$/;
		const id = $("input:eq(0)").val();
		if(!pattern.test(id)){
			$("#message").css('color','red').html("영어 숫자 _로 6~15자 가능합니다.");
			checkid=false;
			return;
		}
	
		
		$.ajax({
			url : "../member/idcheck",  //id값을 컨트롤러로 보내고
			data : {"user_id" : id},
			success : function(resp){
				if(resp == -1){ //db에 해당 id가 없는 경우
					$("#message").css('color','green').html("사용 가능한 아이디입니다.")
					checkid=true;
				}else{ //db에 해당 id가 있는 경우(0)
					$("#message").css('color', 'blue').html("사용중인 아이디입니다.")
					checkid=false;
					}
				}
			
			})//ajax end
		});//id keyup end
		
		$("input[name=user_email]").on('keyup', function(){
			//$("#email_message").empty();
			//[A-Za-z0-9_]와 동일한 것이 \w입니다.
			//+는 1회 이상 반복을 의미하고 {1,}와 동일합니다.
			//\w+는 [A-Za-z0-9_]를 1개이상 사용하라는 의미입니다.
			const pattern = /^\w+@\w+[.]\w{3}$/;
			const email_value = $(this).val();
			console.log(email_value)
			if(!pattern.test(email_value)){
				$("#email_message").css('color', 'red').html("이메일 형식이 맞지 않습니다.");
				checkemail=false;
			}else{
				$("#email_message").css('color', 'green').html("이메일 형식에 맞습니다.")
				checkemail=true;
			}
		}); //on
		
        $(".form-control").focusout(function() { // 아이디를 입력할때 마다 중복검사 실행
            checkPw($(this).val())
        })
        function checkPw(pw){
          if(pw==""){
              $("#checkId").text("");
              return; // 아직 입력된 상태가 아니라면 아무런 문구를 출력하지 않는다
          }

          if($('#user_password').val()!=$('#pw2').val()){
              // 만약 pw1과 pw2가 알치하지 않는다면
              $("#checkPw").html('비밀번호가 일치하지 않습니다'); // 문구 출력
              $("#checkPw").attr('color', 'red');
              $('#pw2').val(''); // 값을 비움
              $('#pw2').focus(); // 포인터를 pw2 로 맞춘다
              checkpass=false;
          }
          else{
              $("#checkPw").html('비밀번호가 일치합니다'); // 문구 출력
              $("#checkPw").attr('color', 'green');
              checkpass=true;
          }
        }
        
        $('form').submit(function(){
        	if(!checkid){
				alert("사용 가능한 아이디로 입력하세요.");
				$("input[name=user_id]").val('').focus();
				return false;
			}
        	
        	if(!checkpass){
        		alert("사용 가능한 비밀번호로 입력하세요.");
        		$("input[name=user_password]").val('').focus();
        		return false;
        	}
			
			if(!checkemail){
				alert("email 형식을 확인하세요.");
				$("input[name=user_email]").focus();
				return false;
			}
			if(!checkCode){
				alert("인증번호를 확인하세요")
				$("#code").focus();
				return false;
			}
		});//submit
		
  	  let re="";
	  $("#mail_submit").click(function(){
	     let receiver=$("#user_email").val();   //이메일 주소 작성할때마다 확인
		  if(receiver===""){
			  alert("이메일을 입력하세요.")
			  $("input[name=user_email]").val('').focus();
		  }else{
		  let receiver = $("#user_email").val();
		  console.log(receiver);
			$.ajax({
				url		: "../member/sendMail", //요청 경로
				data  : {"user_email" : receiver }, //요청 시 포함되어질 데이터
				success : function(resp){
					alert("인증번호 전송 되었습니다.")
					$("#code_num_check").text(resp);
					console.log(resp);
				}
			})//ajax end
	
		  }
	  })
	  
		            $("#code_submit").click(function(){
		            	let code_num_check = $("#code_num_check").text();
		            	console.log(code_num_check + "cnc");
		        	if(code_num_check === $("#code").val()){  //이건 값을 보내는 경우 . 확인을 누르면 검사할 수 있도록. 버튼 만들어야해
		        		$("#code_message").text("인증번호 일치합니다.").css("color", "green");
		        		checkCode = true;
		        	}else{
		        		$("#code_message").text("인증번호 일치하지않습니다.").css("color", "red");
		        	}
		        	//시점확인. 문장을 다 적었을 때 검사하도록.
		       });
})//ready
</script>
<Style>
 .mail_check_wrap{weith: 50px}
 #mail_submit, #code_submit{background-color : transparent; border: none;}
</Style>
</head>

<body>
	<form name="joinform" action="../member/joinProcess" method="post">
    <div class="account-pages my-5 pt-sm-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card overflow-hidden">
                        <div class="bg-primary bg-soft">
                            <div class="row">
                                <div class="col-7">
                                    <div class="text-primary p-4">
                                        <h4 class="text-primary">회원가입</h4>
                                    </div>
                                </div>
                                <div class="col-5 align-self-end">
                                    <img src="assets/images/profile-img.png" alt="" class="img-fluid">
                                </div>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <div>
                                <a href="index.html">
                                    <div class="avatar-md profile-user-wid mb-4">
                                        <span class="avatar-title rounded-circle bg-light">
                                            <img src="${pageContext.request.contextPath }/resources/assets/images/logo.svg" alt="" class="rounded-circle" height="34">
                                        </span>
                                    </div>
                                </a>
                            </div>
                            <div class="p-2">
                                <form class="needs-validation" novalidate action="index.html">
                                
                                	<div class="mb-3">
                                        <label for="user_id" class="form-label">아이디</label>
                                        <input type="text" class="form-control" id="user_id" name="user_id"
                                            placeholder="아이디(6~15자 영문, 숫자, _로 가능합니다.)" required>
                                            <span id="message"></span>
                                    </div>
                                    	
                                    <div class="mb-3">
                                        <label for="user_password" class="form-label">비밀번호</label>
                                        <input type="password" class="form-control" id="user_password" name="user_password"
                                            placeholder="비밀번호(6~15자 영문, 숫자, _로 가능합니다.)" required>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="userpassword_ch" class="form-label">비밀번호 확인</label>
                                        <input type="password" class="form-control" id="pw2" name="password_ch"
                                            placeholder="비밀번호를 다시 입력하세요" required>
                                             <td><font id="checkPw"></font></td>
                                    </div>
									
                                    <div class="mb-3">
                                    <div class="float-end">
                                          <input id="mail_submit" type="button" value="인증번호발송">
                                          <input type="hidden" readonly="readonly" name="code_check" id="code_check">
                                          <span id="code_check_message"></span>
                                   	</div>
                                    </div>
                                                
                                                
                                        <label for="user_email" class="form-label">이메일</label>
                                        <input type="email" class="form-control" id="user_email" name="user_email"
                                            placeholder="e-mail@naver.com" required>
                                            <span id="email_message"></span>
                                    </div>
                                    
                                    <div class="mb-3">
                                    <div class="float-end">
                                    
                                                    <input id="code_submit" type="button" value="인증번호확인">
                                                    <input type="hidden" readonly="readonly" name="code_num_check" id="code_num_check">
                                   </div>
                                    </div>
                                   
                                   <div class="mb-3">
                                        <label for="code" class="mail_check_wrap">인증번호</label>
                                        <input type="text" class="form-control" id="code" name="code"
                                            placeholder="이메일로 전송된 인증번호를 입력하세요" required>
                                            <span id="code_message"></span>
                                    </div>

                                    <div class="mb-3">
                                        <label for="name" class="form-label">이름</label>



                                        <input type="text" class="form-control" id="user_name" name="user_name"


                                            placeholder="이름을 입력하세요" required>
                                    </div>

                                    <div class="mt-4 d-grid">
                                        <button class="btn btn-primary waves-effect waves-light"
                                            type="submit">회원가입</button>
                                    </div>
                                    
                                    <div class="mt-4 d-grid">
                                        <button class="btn btn-danger waves-effect waves-light"
                                            type="reset" onClick="history.back();">취소</button>
                                    </div>

                                    <!-- <div class="mt-4 text-center">
                                        <h5 class="font-size-14 mb-3">Sign up using</h5>

                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <a href="javascript::void()"
                                                    class="social-list-item bg-primary text-white border-primary">
                                                    <i class="mdi mdi-facebook"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="javascript::void()"
                                                    class="social-list-item bg-info text-white border-info">
                                                    <i class="mdi mdi-twitter"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="javascript::void()"
                                                    class="social-list-item bg-danger text-white border-danger">
                                                    <i class="mdi mdi-google"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="mt-4 text-center">
                                        <p class="mb-0">By registering you agree to the Skote <a href="#"
                                                class="text-primary">Terms of Use</a></p>
                                    </div> -->
                            </div>

                        </div>
                    </div>
  <!-- 
                    <div class="mt-5 text-center">

                        <div>
                            <p>Already have an account ? <a href="login.net" class="fw-medium text-primary">
                                    Login</a> </p>
                            <p>©
                                <script>document.write(new Date().getFullYear())</script> Skote. Crafted with <i
                                    class="mdi mdi-heart text-danger"></i> by Themesbrand
                            </p>
                        </div> -->
                    </div>

                </div>
            </div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

	</form>
	<script src="${pageContext.request.contextPath }/resources/assets/libs/jquery/jquery.min.js"></script>
   	<script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/metismenu/metisMenu.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>
    <!-- owl.carousel js -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/owl.carousel/owl.carousel.min.js"></script>
    <!-- auth-2-carousel init -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/pages/auth-2-carousel.init.js"></script>
    <!-- App js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>
	<script>

	</script>
</body>

</html>