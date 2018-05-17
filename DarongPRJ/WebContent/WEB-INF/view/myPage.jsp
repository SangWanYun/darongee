<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="bootstrap/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="bootstrap/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>My Page</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="bootstrap/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/assets/css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="bootstrap/assets/css/demo.css" rel="stylesheet" />
    
    <style>
    #center{
    	display:inline-block;
    	text-align:center;
    	margin:auto;
    	padding:auto;
    	float: left;
    }
    </style>
</head>

<body class="profile-page sidebar-collapse">
    <!-- Navbar -->
   <jsp:include page="nav_login.jsp" flush="false"></jsp:include>
    <!-- End Navbar -->
    <div class="wrapper">
        <div class="page-header page-header-small" filter-color="orange">
            <div class="page-header-image" data-parallax="true" style="background-image: url('bootstrap/assets/img/bg5.jpg');">
            </div>
            <div class="container">
                <div class="content-center">
                    <div class="photo-container">
                        <img src="bootstrap/assets/img/ryan.jpg" alt="">
                    </div>
                    <h3 class="title">${udto.userName}</h3>
                    <p class="category"><span class="category">YOUR OWN ID:&nbsp;&nbsp;</span>${udto.userId}</p>
                    <div class="content">
                        <div class="social-description">
                            <h2>26</h2><!-- 게시글수 -->
                            <p>Contents</p>
                        </div>
                        <div class="social-description">
                            <h2>26</h2><!-- 좋아요수 -->
                            <p>Comments</p>
                        </div>
                        <div class="social-description">
                            <h2>48</h2><!-- 관심글수 -->
                            <p>Interested</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="container">
                <div class="button-container">
                    <a href="#button" class="btn btn-primary btn-round btn-lg">Follow</a>
                    <a href="#button" class="btn btn-default btn-round btn-lg btn-icon" rel="tooltip" title="Follow me on Twitter">
                        <i class="fa fa-twitter"></i>
                    </a>
                    <a href="#button" class="btn btn-default btn-round btn-lg btn-icon" rel="tooltip" title="Follow me on Instagram">
                        <i class="fa fa-instagram"></i>
                    </a>
                </div>
                <h3 class="title">About My Info</h3>
                <h5 class="description">수정하실 정보를 수정 후 SAVE버튼을 눌러주세요.<br>주의-SAVE버튼을 누르지 않으면 저장되지 않습니다.</h5>
                
                <div class="col-md-4 content-center">
                <div class="card card-login card-plain">
                    <form class="form" method="POST" action="myInfoChg.do" name="sub1">
                     
                        <div class="content">
                            <div class="input-group form-group-no-border input-lg" >
                                <span class="input-group-addon">
                                   <i class="now-ui-icons users_circle-08"></i>-Email 
                                </span>
                                                               
                                <input type="email" class="form-control" name = "userEmail1" id="userEamil1" value=${udto.userEmail1}>
                            </div>
                            
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons text_caps-small"></i>-Birth&nbsp;
                                </span>
                                <input type="text"  name="userBirth"class="form-control" id="userBirth" value=${udto.userBirth}>
                            </div>
                            
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons text_caps-small"></i>-Phone
                                </span>
                                <input type="text"  name="userTel1"class="form-control" id="userTel1" value=${udto.userTel1}>
                                <input type="text"  name="userTel2"class="form-control" id="userTel2" value=${udto.userTel2}>
                                <input type="text"  name="userTel3"class="form-control" id="userTel3" value=${udto.userTel3}>
                            </div>
                            
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons text_caps-small"></i>-PASSWORD
                                </span>
                                <input type="password"  name="userPw"class="form-control" id="userPw" placeholder="New Password">
                            </div>
                        </div>
                        <div class="footer text-center">
                            <input type="submit" class="btn btn-primary btn-round btn-lg btn-block" value="SAVE" id="login">
                        </div>
                        
                    </form>
                </div>
            	</div>
            	
                <div class="row">
                    <div class="col-md-6 ml-auto mr-auto" >
                    
                        <h4 class="title text-center">My Portfolio</h4>
                        <div class="nav-align-center">
                            <ul class="nav nav-pills nav-pills-primary" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#profile" role="tablist">
                                        <i class="now-ui-icons design_image"></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home" role="tablist">
                                        <i class="now-ui-icons location_world"></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#messages" role="tablist">
                                        <i class="now-ui-icons sport_user-run"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- Tab panes -->
                    <div class="tab-content gallery">
                        <div class="tab-pane active" id="home" role="tabpanel">
                            <div class="col-md-10 ml-auto mr-auto">
                                <div class="row collections">
                                    <div class="col-md-6">
                                        <img src="bootstrap/assets/img/bg1.jpg" alt="" class="img-raised">
                                        <img src="bootstrap/assets/img/bg3.jpg" alt="" class="img-raised">
                                    </div>
                                    <div class="col-md-6">
                                        <img src="bootstrap/assets/img/bg8.jpg" alt="" class="img-raised">
                                        <img src="bootstrap/assets/img/bg7.jpg" alt="" class="img-raised">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="profile" role="tabpanel">
                            <div class="col-md-10 ml-auto mr-auto">
                                <div class="row collections">
                                    <div class="col-md-6">
                                        <img src="bootstrap/assets/img/bg6.jpg" class="img-raised">
                                        <img src="bootstrap/assets/img/bg11.jpg" alt="" class="img-raised">
                                    </div>
                                    <div class="col-md-6">
                                        <img src="bootstrap/assets/img/bg7.jpg" alt="" class="img-raised">
                                        <img src="bootstrap/assets/img/bg8.jpg" alt="" class="img-raised">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="messages" role="tabpanel">
                            <div class="col-md-10 ml-auto mr-auto">
                                <div class="row collections">
                                    <div class="col-md-6">
                                        <img src="bootstrap/assets/img/bg3.jpg" alt="" class="img-raised">
                                        <img src="bootstrap/assets/img/bg8.jpg" alt="" class="img-raised">
                                    </div>
                                    <div class="col-md-6">
                                        <img src="bootstrap/assets/img/bg7.jpg" alt="" class="img-raised">
                                        <img src="bootstrap/assets/img/bg6.jpg" class="img-raised">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer footer-default">
            <div class="container">
                <nav>
                    <ul>
                        <li>
                            <a href="https://www.creative-tim.com">
                                Creative Tim
                            </a>
                        </li>
                        <li>
                            <a href="http://presentation.creative-tim.com">
                                About Us
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                                Blog
                            </a>
                        </li>
                        <li>
                            <a href="https://github.com/creativetimofficial/now-ui-kit/blob/master/LICENSE.md">
                                MIT License
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="copyright">
                    &copy;
                    <script>
                        document.write(new Date().getFullYear())
                    </script>, Designed by
                    <a href="http://www.invisionapp.com" target="_blank">Invision</a>. Coded by
                    <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
                </div>
            </div>
        </footer>
    </div>
</body>
<!--   Core JS Files   -->
<script src="bootstrap/assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="bootstrap/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="bootstrap/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="bootstrap/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="bootstrap/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="bootstrap/assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="bootstrap/assets/js/now-ui-kit.js?v=1.1.0" type="text/javascript"></script>

</html>