<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<title>join</title>
<script>
    window.onload = function(){

        function submitButton(){
        	if (document.getElementById("userId").value == "" || document.getElementById("userPw").value == "" || 
        			document.getElementById("userId").value == null || document.getElementById("userPw").value == null ||
        			document.getElementById("userName").value == null || document.getElementById("userName").value == "" ||
        			document.getElementById("userEmail1").value == null || document.getElementById("userEmail1").value == "" ||
        			document.getElementById("userTel1").value == null || document.getElementById("userTel1").value == "" ||
        			document.getElementById("userTel2").value == null || document.getElementById("userTel2").value == "" ||
        			document.getElementById("userTel3").value == null || document.getElementById("userTel3").value == "" ||
        			document.getElementById("userBirth").value == null || document.getElementById("userBirth").value == "" ) {
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
<body>
<!-- Navbar -->
    <jsp:include page="nav_not_login.jsp" flush="false"></jsp:include>
    <!-- End Navbar -->
<div class="section section-signup" style="background-image:url(bootstrap/assets/img/login.jpg);background-size: cover; background-position: top center; min-height: 700px;">
                <div class="container">
                    <div class="row">
                        <div class="card card-signup" data-background-color="orange">
                            <form class="form" method="POST" action="joinProc.do" name="sub1">
                                <div class="header text-center">
                                    <h4 class="title title-up">Sign Up</h4>
                                    <div class="social-line">
                                       
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="input-group form-group-no-border">
                                        <input type="text" onkeyup = "engNumCheck();" class="form-control" name="userName" maxlength = "3" placeholder="Name..." id="userName">
                                    </div>
                                     <div class="input-group form-group-no-border">
                                        <input type="text" onkeyup = "idCheck(this);" class="form-control" name="userId" maxlength = "11" placeholder="ID..." id="userId">
                                    </div>
                                    <p id="idCheck"></p>
                                    <div class="input-group form-group-no-border">
                                        <input type="password" placeholder="PassWord..." name="userPw" maxlength = "15" class="form-control" id="userPw"/>
                                    </div>
                                    <div class="input-group form-group-no-border">
                                        <input type="email" onkeyup = "hanCheck(this);" class="form-control" name="userEmail1" maxlength = "25" placeholder="Email.." id="userEmail1">
                                    </div>
                                    <p id="emailCheck"></p>
                                    <div class="input-group form-group-no-border">
                                        <input type="text" onkeyup = "numCheck('userTel1');" class="form-control" name="userTel1" maxlength = "3" placeholder="Tel..1" id="userTel1">
                                        -
                                        <input type="text" onkeyup = "numCheck('userTel2');" class="form-control" name="userTel2" maxlength = "4" placeholder="Tel..2" id="userTel2">
                                        -
                                        <input type="text" onkeyup = "numCheck('userTel3');" class="form-control" name="userTel3" maxlength = "4" placeholder="Tel..3" id="userTel3">
                                    </div>
                                  
                                    <div class="input-group form-group-no-border">
                                        <input type="text" onkeyup = "numCheck('userBirth');" class="form-control" name="userBirth" maxlength = "6" placeholder="BirthDay.. ex)981225" id="userBirth">
                                    </div>
                                    <!-- If you want to add a checkbox to this form, uncomment this code -->
                                    <!-- <div class="checkbox">
	  								<input id="checkboxSignup" type="checkbox">
	  									<label for="checkboxSignup">
	  									Unchecked
	  									</label>
	  						  		</div> -->
                                </div>
                                <div class="footer text-center">
                                    <input type="button" class="btn btn-round btn-lg btn-block" style="background-color:rgba(255, 255, 255, 0.2)"value="Sign Up" id="login">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col text-center">
                        <a href="main.do" class="btn btn-simple btn-round btn-white btn-lg">I don't need it.</a>
                    </div>
                </div>
            </div>
</body>
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
<script>
function engNumCheck(){
	$('#userName').val( $('#userName').val().replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"\\]/g,""));
}
</script>
<script>
function idCheck(obj){
	obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
	obj.value = obj.value.replace(' ', '');
	var prdId = $('#userId').val();
	if(prdId == " " || prdId == null || prdId == ""){
		$('#idCheck').html("");
		return false;
	}
	
	$.ajax({
        url : 'dIdCheck.do',
        method : 'post',
        dataType : "text",
        data : { 
        	
        	'prdId': prdId,
    
        },	
        success : function(data) {
        	var contents = ""; 
        	console.log(data);
        	var Ca = /\+/g;
         
			if(data >= 1 ){
				$('#idCheck').html("Duplicate ID");
			}else{
				$('#idCheck').html("Available ID");
			}
        
           
        }
	
     

     })
	
}
</script>
<script>
function numCheck(nid){
	$('#' + nid).val( $('#' + nid).val().replace(/[^0-9]/gi,"") );
}
</script>
<script>
function hanCheck(obj){
	if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
	        || event.keyCode == 46 ) return;
	        //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
	        obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
}
</script>
</html>