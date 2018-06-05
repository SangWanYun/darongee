<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="bootstrap/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="bootstrap/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Darongee</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="bootstrap/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/assets/css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="bootstrap/assets/css/demo.css" rel="stylesheet" />
    <script>
    window.onload = function(){

        function submitButton(){
        	if (document.getElementById("userId").value == "" || document.getElementById("userEmail1").value == ""
        			|| document.getElementById("userBirth").value == "") {
        			alert("모두 입력해주세요");
        			return false;
        	}else{
        		document.sub1.submit();
        	}
        }
        var login = document.getElementById("login");
        login.onclick = submitButton;
    }
    </script>
</head>

<body class="login-page sidebar-collapse">
    <!-- Navbar -->
    
    <!-- End Navbar -->
    <div class="page-header" filter-color="orange">
        <div class="page-header-image" style="background-image:url(bootstrap/assets/img/login.jpg)"></div>
        <div class="container">
            <div class="col-md-4 content-center">
                <div class="card card-login card-plain">
                    <form class="form" method="POST" action="pwChgProc.do" name="sub1">
                        <div class="header header-primary text-center">
                            <div class="logo-container">
                                <img src="bootstrap/assets/img/now-logo.png" alt="">
                            </div>
                        </div>
                        <div class="content">
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons users_circle-08"></i>
                                </span>
                                <input type="text" class="form-control" placeholder="ID" name = "userId" id="userId">
                            </div>
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons text_caps-small"></i>
                                </span>
                                <input type="text" placeholder="Email" name="userEmail1"class="form-control" id="userEmail1"/>
                            </div>
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons text_caps-small"></i>
                                </span>
                                <input type="text" placeholder="Birth" name="userBirth"class="form-control" id="userBirth"/>
                            </div>
                        </div>
                        <div class="footer text-center">
                            <input type="button" class="btn btn-primary btn-round btn-lg btn-block" value="Find PW" id="login">
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container">
               
                <div class="copyright">
                    &copy;
                    <script>
                        document.write(new Date().getFullYear())
                    </script>, Copyright by
                    <a href="#" target="_blank">Darongee</a>.
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
<script src="../assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="bootstrap/assets/js/now-ui-kit.js?v=1.1.0" type="text/javascript"></script>

</html>