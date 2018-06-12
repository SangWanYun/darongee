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
<style>
.container1 {
    border: 2px solid #dedede;
    background-color: #f1f1f1;
    border-radius: 5px;
    padding: 10px;
    margin: 10px 0;
}
.container1::after {
    content: "";
    clear: both;
    display: table;
}
</style>
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
	
<div id="main-content" class="container" style="width:100%">
    <div class="row" style="text-align:center;">
        <div class="col-md-6" style="text-align:center;width:100%">
             <h5 style="color:gray;">Free QnA, Question Anything. </h5>
        </div>
        
    </div>
    <div class="row" style="width:100%">
        <div class="col-md-12" style="text-align:center;height:730px;width:100%;">
		    <div style="height:450px;text-align:center;">
			<div id="messageTextArea" style="overflow:hidden;height:500px;"></div>
			</div>
			<br>
			<div style="text-align:center;width:100%;">
			<form align="center" style="text-align:center;">
				<pre><textarea class="form-control" rows="3" onkeyup="enterkey();" id = "textMessage" style="width:70%;height:100px;margin-left:auto;margin-right:auto;display:block;"></textarea></pre>
				<input onclick = "sendMessage()" class="btn btn-primary" value="Send" type="button">
				<input onclick = "disconnect()"  class="btn btn-primary" value="Disconnect" type="button">
			</form>
			</div>
        </div>
    </div>
</div>





	<footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Darongee 2018</p>
      </div>
      <!-- /.container -->
    </footer>
    
</body>
<script src="bootstrap/assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	<% String id1 = (String)session.getAttribute("userId");%>
	var id = "<%=id1%>";
	var ami = 0;
	var iam = 0;
	var webSocket = new WebSocket("ws://192.168.175.16:8080/ws");
	var messageTextArea = document.getElementById("messageTextArea");
	webSocket.onopen = function(message){processOpen(message)};
	webSocket.onclose = function(message){processClose(message)};
	webSocket.onerror = function(message){processError(message)};
	webSocket.onmessage = function(message){processMessage(message)};
	function processOpen(message){
		messageTextArea.value += "Server Connected.\n";
	}
	function processClose(message){
		var tnow = new Date();
		var contents = "";
		contents += '<div class="container1" style="text-align:left;width:50%;display:inline-block;">';
		contents += '<p>- Connection Terminated -</p>';
		contents += '<span class="time-right">'+ tnow.getHours() +':'+ tnow.getMinutes() +'</span>';
		contents += '</div><br>';
		$('#messageTextArea').append(contents);
	}
	function processError(message){
		messageTextArea.value += "error..\n";
	}
	function processMessage(message){
		var tnow = new Date();
		var contents = "";
		contents += '<div class="container1" style="text-align:left;width:50%;display:inline-block;">';
		contents += '<p>'+ message.data +'</p>';
		contents += '<span class="time-right">'+ tnow.getHours() +':'+ tnow.getMinutes() +'</span>';
		contents += '</div><br>';
		$('#messageTextArea').append(contents);
		
	}
	function sendMessage(){
		var message = document.getElementById("textMessage");
		if(id == "null"){
			alert("채팅을 원하시면 로그인 해주세요.");
			message.value = "";
			return false;
		}
		if(message.value == ""){
			alert("내용을 입력해주세요.");
			message.focus();
			return false;
		}
		webSocket.send(id+ " : " +message.value);
		ami++;
		message.value = "";
	}
	function enterkey() {
        if (window.event.keyCode == 13) {
 			sendMessage();
        }
}

	function disconnect(){
		webSocket.close();
	}
</script>

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