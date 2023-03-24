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

</head>
<body class="auth-body-bg">
    <div>
        <div class="container-fluid p-0">
            <div class="row g-0">
                <div class="col-xl-9">
                    <div class="auth-full-bg pt-lg-5 p-4">
                        <div class="w-100">
                            <div class="bg-overlay"></div>
                            <div class="d-flex h-100 flex-column">
                                <div class="p-4 mt-auto">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-7">
                                            <div class="text-center">
                                                <h4 class="mb-3"><i
                                                        class="bx bxs-quote-alt-left text-primary h1 align-middle me-3"></i><span
                                                        class="text-primary">CO-WORK</span> company</h4>
                                                <div dir="ltr">
                                                    <div class="owl-carousel owl-theme auth-review-carousel"
                                                        id="auth-review-carousel">
                                                        <div class="item">
                                                            <div class="py-3">
                                                                <p class="font-size-16 mb-4">" Be What's Next "</p>
                                                                <div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end col -->
                <div class="col-xl-3">
                    <div class="auth-full-page-content p-md-5 p-4">
                        <div class="w-100">
                            <div class="d-flex flex-column h-100">
                                <div class="mb-4 mb-md-5">
                                    <a href="main.net" class="d-block auth-logo">
                                        <img src="${pageContext.request.contextPath }/resources/assets/images/logo-light.png" alt="" height="18"
                                            class="auth-logo-light">
                                    </a>
                                </div>
                                <div class="my-auto">
                                    <div>
                                        <h5 class="text-primary">L2반 1조 CO-WORK</h5>
                                        <p class="text-muted">오늘도 행복한 하루 되세요!</p>
                                    </div>
                                    <div class="mt-4">
                                        <form name="loginform" action="../member/loginProcess" method="post">
                                            <div class="mb-3">
                                                <label for="username" class="form-label">아이디</label>
                                                <input type="text" class="form-control" id="id" name="id"
                                                    placeholder="Enter id" required>
                                            </div>
                                            <div class="mb-3">
                                              <!--  <div class="float-end">
                                                    <a href="auth-recoverpw-2.html" class="text-muted" >비밀번호찾기</a>
                                                </div> -->
                                                <label class="form-label">비밀번호</label>
                                                <div class="input-group auth-pass-inputgroup">
                                                    <input type="password" class="form-control" id="pass"
                                                        aria-label="Password" placeholder="Enter password"  name="pass" required
                                                        aria-describedby="password-addon">
                                                </div>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="remember-check" name="remember-check" value="store">
                                                <label class="form-check-label" for="remember-check">
                                                    아이디 기억하기
                                                </label>
                                            </div>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                            <div class="mt-3 d-grid">
                                                <button class="btn btn-primary waves-effect waves-light"
                                                    type="submit">로그인</button>
                                            </div>
                                            
                                        </form>
                                        <div class="mt-5 text-center">
                                            <p>Don't have an account ? <a href="../member/join"
                                                    class="fw-medium text-primary"> 회원가입 </a> </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container-fluid -->
    </div>
    <!-- JAVASCRIPT -->
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
      const id = '${id}';
      if(id){
         console.log(id);
         $("#id").val(id);
         $("#remember-check").prop('checked', true);
      }
</script>
</body>
</html>