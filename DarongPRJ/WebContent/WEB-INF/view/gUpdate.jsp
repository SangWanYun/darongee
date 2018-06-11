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

<title>Darongee</title>

	<link rel="apple-touch-icon" sizes="76x76" href="bootstrap/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="bootstrap/assets/img/favicon.png">

    <!-- Bootstrap core CSS -->

    <!-- Custom styles for this template -->
    <link href="bootstrap_gDetailPage/css/blog-post.css" rel="stylesheet">
    
    <!-- CSS Files -->
    <link href="bootstrap/assets/css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
    
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

<script src="bootstrap_gWritePage/vendor/jquery/jquery.min.js"></script>
<!-- CSS Just for demo purpose, don't include it in your project -->
<script type="text/javascript">
	function getSubmit(){
		alert("131");
		var url = "gUpdateProc.do?";
		url += "gbrdSeq=" + $("#gbrdSeq").val();
		url += "&gtitle=" + $("#gtitle").val();
		url += "&gItem=" + $("#gItem").val();
		url += "&gPrice=" + $("#gPrice").val();
		url += "&gName=" + $("#gName").val();
		url += "&gPlace=" + $("#gPlace").val();
		url += "&content=" + "<p>2</p>";
		
		location.href = url;
	}
</script>
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
	<form name="tx_editor_form" id="tx_editor_form" action="gUpdateProc.do"
		method="POST" accept-charset="utf-8">
		<!-- 에디터 내용이 담길 hidden form -->
		<input id="editor-content" name="editor-content" type="hidden">

		<!-- Navigation -->
		<jsp:include page="blue_nav_login.jsp" flush="false"></jsp:include>

		<!-- Page Content -->
		<div class="container">

			<div class="row">


				<!-- /.col-lg-3 -->

				<div class="col-lg-9" style="margin:0 auto;">

					<div class="card mt-4" style="text-align: left;">

						<div class="card-body">
							<div>
								<span> <label class="card-title"
									style="font-weight: bold; font-size: 14pt;">Main
										Title&nbsp;.&nbsp;</label> <input type="text" id="gtitle"
									name="gtitle" class="card-title"
									style="padding: 5px; width: 100%;" placeholder="*제목을 입력해주세요"
									value="${gDetail.gbrdTitle}">
								</span>
							</div>

							<div>
								<span class="card-title"
									style="font-weight: bold; font-size: 13pt; display: inline-block; width: 40%;">Item
									Name&nbsp;.&nbsp;</span> <span class="card-title"
									style="font-weight: bold; font-size: 13pt; display: inline-block; width: 40%;">Item
									Price&nbsp;.&nbsp;</span>
							</div>

							<div>
								<span> <input type="text" id="gItem" name="gItem"
									class="card-title" style="padding: 5px; width: 38%;"
									placeholder="*상품명" value="${gDetail.gbrdItem}"> &nbsp;
									<input type="text" id="gPrice" name="gPrice" class="card-title"
									style="padding: 5px; width: 40%;" placeholder="*1마리 당 가격"
									value="${gDetail.gbrdPrice}">
								</span>
							</div>

							<div>
								<span class="card-title"
									style="font-weight: bold; font-size: 13pt; display: inline-block; width: 40%;">Item
									Seller&nbsp;.&nbsp;</span> <span class="card-title"
									style="font-weight: bold; font-size: 13pt; display: inline-block; width: 40%;">Item
									Origin Place&nbsp;.&nbsp;</span>
							</div>

							<div>
								<span> <input type="text" id="gName" name="gName"
									class="card-title" style="padding: 5px; width: 38%;"
									placeholder="*판매자" value="${gDetail.gbrdName}"> &nbsp;
									<input type="text" id="gPlace" name="gPlace" class="card-title"
									style="padding: 5px; width: 40%;" placeholder="*원산지"
									value="${gDetail.gbrdPlace}">
								</span>
							</div>

							<p class="card-text">please, Put conscience before profits.</p>

						</div>

					</div>

					<!-- /.card -->
					<input type="hidden" value="${gDetail.gbrdSeq}" name="gbrdSeq"
						id="gbrdSeq">
					<div class="card card-outline-secondary my-4" style="text-align: left;">
						<div class="card-header">Item Contents.</div>
						<div class="card-body">
							<div>
								<jsp:include page="editorForm.jsp"></jsp:include>
							</div>
							<input type="submit" id="save" value="Save"/> <a
								href="gBoard.do"><input type="button" value="Cancel" /></a>
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

<script
	src="bootstrap_gWritePage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
var up = '${gContents}';
$('#summernote').html(up);
</script>
</html>
