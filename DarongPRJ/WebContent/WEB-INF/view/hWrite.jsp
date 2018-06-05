<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Write</title>

<!-- Bootstrap core CSS -->
<link href="bootstrap_gWritePage/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="bootstrap_gWritePage/css/shop-item.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<!-- CSS Files -->
<link href="bootstrap/assets/css/bootstrap.min.css" rel="stylesheet" />

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

<!-- CSS Just for demo purpose, don't include it in your project -->

<style>
.navbar .navbar-nav>a.btn {
	border-width: 2px;
	font-weight: 400;
	font-size: 0.8571em;
	line-height: 1.35em;
	margin: 5px 1px;
	border: none;
	border-radius: 0.1875rem;
	padding: 11px 22px;
	cursor: pointer;
	background-color: #888;
	color: #FFFFFF;
}

.navbar .navbar-nav>a.btn:hover, .navbar .navbar-nav>a.btn:focus,
	.navbar .navbar-nav>a.btn:active, .navbar .navbar-nav>a.btn.active,
	.navbar .navbar-nav>a.btn:active:focus, .navbar .navbar-nav>a.btn:active:hover,
	.navbar .navbar-nav>a.btn.active:focus, .navbar .navbar-nav>a.btn.active:hover,
	.show>.navbar .navbar-nav>a.btn.dropdown-toggle, .show>.navbar .navbar-nav>a.btn.dropdown-toggle:focus,
	.show>.navbar .navbar-nav>a.btn.dropdown-toggle:hover {
	background-color: #979797;
	color: #FFFFFF;
	box-shadow: none;
}

.btn:hover, .navbar .navbar-nav>a.btn:hover {
	box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.17);
}
</style>

<!-- daumEditor -->

</head>

<body style="padding-top:0;">
	<form name="tx_editor_form" id="tx_editor_form" action="hWriteProc.do"
		method="POST" accept-charset="utf-8">

		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg bg-primary">
    	
    	 <div class="container">
            <div class="navbar-translate">
                <a class="navbar-brand" href="main.do" rel="tooltip"  data-placement="bottom" >
                   Darong
                </a>
                <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-bar bar1"></span>
                    <span class="navbar-toggler-bar bar2"></span>
                    <span class="navbar-toggler-bar bar3"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse justify-content-end" id="navigation" data-nav-image="./assets/img/blurred-image-1.jpg">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="gBoard.do">
                            <i class="now-ui-icons arrows-1_cloud-download-93"></i>
                            <p>Gboard</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="hBoard.do">
                            <i class="now-ui-icons arrows-1_cloud-download-93"></i>
                            <p>Hboard</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="fChart.do">
                            <img src="image/computer.png">
                            <p>&nbsp;TunaChart</p>
                        </a>
                    </li>
                     <li class="nav-item">
                        <div class="dropdown button-dropdown">
                			<a href="#pablo" class="dropdown-toggle nav-link" id="navbarDropdown" data-toggle="dropdown" style="font-size:10pt">
                			<%=session.getAttribute("userId")%>님, 환영합니다.
                			</a>
                			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    			<a class="dropdown-item" href="myPage.do">MyPage</a> 
                    			<div class="dropdown-divider"></div>
                   				<a class="dropdown-item" href="logout.do">Log Out</a>
                			</div>
            			</div>
                    </li>
                </ul>
            </div>
        </div>
    	</nav>

		<!-- Page Content -->
		<div class="container">

			<div class="row">


				<!-- /.col-lg-3 -->

				<div class="col-lg-9" style="margin:0 auto;">

					<div class="card mt-4" style="text-align:left;">

						<div class="card-body">
							<div>
								<span> <label class="card-title"
									style="font-weight: bold; font-size: 14pt;">Main
										Title&nbsp;.&nbsp;</label> <input type="text" id="htitle"
									name="htitle" class="card-title"
									style="padding: 5px; width: 100%;" placeholder="*제목을 입력해주세요">
								</span>
							</div>
							<p class="card-text">please, Put conscience before profits.</p>

						</div>

					</div>

					<!-- /.card -->

					<div class="card card-outline-secondary my-4" style="text-align:left;">
						<div class="card-header">Item Review.</div>
						<div class="card-body">
							<div>

								<!-- 에디터프레임호출 영역 -->
								<div id="editor_frame"></div>
								<!-- 실제 값이 담겨져서 넘어갈 textarea 태그 -->
								<div name="daumeditor" id="daumeditor"
									style="width: 766px; height: 512px;"></div>
								
							</div>
						<input type="button" id="save" value="내용전송" />
								<a href="hBoard.do"><input type="button"  value="취소" /></a>
						</div>
					</div>

					<!-- /.card -->

				</div>
				<!-- /.col-lg-9 -->

			</div>


		</div>
		<!-- /.container -->

		<!-- Footer -->
		<footer class="py-5 bg-dark">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; By
					Darongee 2018.</p>
			</div>
			<!-- /.container -->
		</footer>
		<!-- Bootstrap core JavaScript -->

	</form>
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


<link rel="stylesheet" href="daumeditor/css/trex/editor/container.css" type="text/css"/>
<link rel="stylesheet" href="daumeditor/css/trex/editor/tool.css" type="text/css"/>
<link rel="stylesheet" href="daumeditor/css/trex/editor/fullscreen.css" type="text/css"/>
<link rel="stylesheet" href="daumeditor/css/trex/editor/extra_dropdown.css" type="text/css"/>
<link rel="stylesheet" href="daumeditor/css/trex/editor/advanced.css" type="text/css"/>
<link rel="stylesheet" href="daumeditor/css/trex/editor/richtextbox.css" type="text/css"/>
<link rel="stylesheet" href="daumeditor/css/trex/editor/attacher.css" type="text/css"/>
<link rel="stylesheet" href="daumeditor/css/trex/editor/plugin.css" type="text/css"/>
<link rel="stylesheet" href="daumeditor/css/trex/editor/attachbox.css" type="text/css"/>
<script src="daumeditor/js/editor_loader.js?environment=development"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
	function setConfig() {
		var config = {
			txHost : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
			txPath : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
			txService : 'sample', /* 수정필요없음. */
			txProject : 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
			initializedId : "", /* 대부분의 경우에 빈문자열 */
			wrapper : "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
			form : 'tx_editor_form' + "", /* 등록하기 위한 Form 이름 */
			txIconPath : "daumeditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
			txDecoPath : "daumeditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
			canvas : {
				styles : {
					color : "#123456", /* 기본 글자색 */
					fontFamily : "굴림", /* 기본 글자체 */
					fontSize : "10pt", /* 기본 글자크기 */
					backgroundColor : "#fff", /*기본 배경색 */
					lineHeight : "1.5", /*기본 줄간격 */
					padding : "8px" /* 위지윅 영역의 여백 */
				},
				showGuideArea : false
			},
			events : {
				preventUnload : false
			},
			sidebar : {
				attachbox : {
					show : true,
					confirmForDeleteAll : true
				},
				attacher:{ image:{ features:{left:250,top:65,width:400,height:190,scrollbars:0}, //팝업창 사이즈
					popPageUrl:'imagePopup.do' //팝업창 주소
					} }

			},
			
			capacity: {
				maximum : 5 * 1024 * 1024
			},
			size : {
				contentWidth : 700 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
			}
		};
		EditorJSLoader.ready(function(Editor) {
			editor = new Editor(config);
		});
	}

	$(function() {
		$.ajax({
			type : "POST",
			url : "daumeditor/editor_template.html",
			success : function(data) {
				$("#daumeditor").html(data); setConfig();
			},
			error : function(request, status, error) {
				alert("에러");
			}
		});
	})
	
	function validForm(editor) { var validator = new Trex.Validator(); var content = editor.getContent(); if (!validator.exists(content)) { alert('내용을 입력하세요'); return false; } return true; } //validForm 함수가 true로 return된 후에 동작하는 함수 
	function setForm(editor){ var form = editor.getForm(); 
	var content = editor.getContent();
	var textarea = document.createElement('textarea'); //textarea를 생성하여 해당태그에 에디터 입력값들을 신규생성 textarea에 담는다 
	textarea.name = 'content';
	textarea.value = content;
	form.createField(textarea); 
	return true; }
	
	$("#save").click(function(){ Editor.save(); })

</script>




</html>
