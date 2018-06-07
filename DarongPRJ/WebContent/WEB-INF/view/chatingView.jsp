<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="bootstrap/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="bootstrap/assets/img/favicon.png">
<!-- Bootstrap core CSS -->
<link href="bootstrap_gDetailPage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="bootstrap_gDetailPage/css/blog-post.css" rel="stylesheet">
    
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<!-- CSS Files -->
<link href="bootstrap/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/assets/css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="bootstrap/assets/css/demo.css" rel="stylesheet" />


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Darongee</title>
</head>
<body style="padding-top:0;">
	<%
		if (session.getAttribute("userId") == null || session.getAttribute("userId") == "" || session.getAttribute("userId") == "null") {
	%><jsp:include page="blue_nav_not_login.jsp" flush="false"></jsp:include>
	<%
		} else {
	%>
	<jsp:include page="blue_nav_login.jsp" flush="false"></jsp:include>
	<%
		}
	%>
	<input type="text" id="message" />

    <input type="button" id="sendBtn" value="전송" />

    <div id="data"></div>



	<footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Darongee 2018</p>
      </div>
      <!-- /.container -->
    </footer>
    
</body>
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

<!-- Sock js -->
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>


<script type="text/javascript">

    $(document).ready(function() {

        $("#sendBtn").click(function() {

            sendMessage();

        });

    });

    var sock;

    //웸소켓을 지정한 url로 연결한다.

    sock = new SockJS("<c:url value="/echo"/>");


    //자바스크립트 안에 function을 집어넣을 수 있음.

    //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function

    sock.onmessage = onMessage;


    //데이터를 끊고싶을때 실행하는 메소드

    sock.onclose = onClose;


    /* sock.onopen = function(){

        sock.send($("#message").val());

    }; */

    function sendMessage() {

        /*소켓으로 보내겠다.  */

        sock.send($("#message").val());

    }

    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)

    function onMessage(evt) {

        var data = evt.data;

        $("#data").append(data + "<br/>");

        //sock.close();

    }


    function onClose(evt) {

        $("#data").append("연결 끊김");

    }

</script>

</html>