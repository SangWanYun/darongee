<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>GBoard</title>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="bootstrap/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="bootstrap/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>DARONG</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<!-- CSS Files -->
<link href="bootstrap/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/assets/css/now-ui-kit.css?v=1.1.0"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="bootstrap/assets/css/demo.css" rel="stylesheet" />

<style>
div.blueTable {
	border: 1px solid #1C6EA4;
	background-color: #EEEEEE;
	width: 100%;
	text-align: left;
	border-collapse: collapse;
}

.divTable.blueTable .divTableCell, .divTable.blueTable .divTableHead {
	border: 1px solid #A3A3A3;
	padding: 3px 2px;
}

.divTable.blueTable .divTableBody .divTableCell {
	font-size: 13px;
	color: #333333;
}

.divTable.blueTable .divTableRow:nth-child(even) {
	background: #D0E4F5;
}

.divTable.blueTable .divTableHeading {
	background: #1C6EA4;
	background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
	background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
	background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
	border-bottom: 2px solid #FFFFFF;
}

.divTable.blueTable .divTableHeading .divTableHead {
	font-size: 15px;
	font-weight: bold;
	color: #FFFFFF;
	border-left: 2px solid #D0E4F5;
}

.divTable.blueTable .divTableHeading .divTableHead:first-child {
	border-left: none;
}

.blueTable .tableFootStyle {
	font-size: 14px;
	font-weight: bold;
	color: #FFFFFF;
	background: #F5F5F5;
	background: -moz-linear-gradient(top, #f7f7f7 0%, #f6f6f6 66%, #F5F5F5 100%);
	background: -webkit-linear-gradient(top, #f7f7f7 0%, #f6f6f6 66%, #F5F5F5 100%);
	background: linear-gradient(to bottom, #f7f7f7 0%, #f6f6f6 66%, #F5F5F5 100%);
	border-top: 2px solid #FFFFFF;
}

.blueTable .tableFootStyle {
	font-size: 14px;
}

.blueTable .tableFootStyle .links {
	text-align: right;
}

.blueTable .tableFootStyle .links a {
	display: inline-block;
	background: #1C6EA4;
	color: #FFFFFF;
	padding: 2px 8px;
	border-radius: 5px;
}

.blueTable.outerTableFooter {
	border-top: none;
}

.blueTable.outerTableFooter .tableFootStyle {
	padding: 3px 5px;
}
/* DivTable.com */
.divTable {
	display: table;
}

.divTableRow {
	display: table-row;
}

.divTableHeading {
	display: table-header-group;
}

.divTableCell, .divTableHead {
	display: table-cell;
}

.divTableHeading {
	display: table-header-group;
}

.divTableFoot {
	display: table-footer-group;
}

.divTableBody {
	display: table-row-group;
}

.divTableHead{

	background-color:#000000;
	color:#FFFFFF;
	width:160;
	height:20;
	overflow-x:hidden;
	overflow-y:hidden;
}

.divRight{
	
}
</style>


</head>
<body>
	<!-- Navbar -->
	<%
		if (session.getAttribute("userId") == null || session.getAttribute("userId") == "") {
	%><jsp:include page="nav_not_login.jsp" flush="false"></jsp:include>
	<%
		} else {
	%>
	<jsp:include page="nav_login.jsp" flush="false"></jsp:include>
	<%
		}
	%>
	<!-- End Navbar -->
	<div class="page-header" filter-color="orange">
		<div class="page-header-image" data-parallax="true"
			style="background-image: url('bootstrap/assets/img/header.jpg');">
		</div>
		
		<div class="container">
		
			<div class="col-md-4 content-center">
			
				<div class="card card-login card-plain">
					<div class="divRight"><a href="gWriteCheck.do"><input type="button" value="Write"></a></div>
					<div class="divTable blueTable">
					
						<div class="divTableHeading">
							<div class="divTableRow">
								<div class="divTableHead">No.</div>
								<div class="divTableHead">Title.</div>
								<div class="divTableHead">Writer.</div>
								<div class="divTableHead">Date.</div>
							</div>
						</div>
						
						<div class="divTableBody">
						<c:forEach items="${jsonList }" var="list" >
						<div class="divTableRow"> 
							
							
							
							<div class="divTableCell">${list.gbrdSeq}</div>
							<div class="divTableCell"><a href="gBoardDetail.do?gbrdSeq=${list.gbrdSeq}">${list.gbrdTitle}</a></div>
							<div class="divTableCell">${list.gbrdName}</div>
							<div class="divTableCell">${list.regDate}</div>
							
						</div>
							</c:forEach> 
						</div>
						<!-- 
						<div class="divTableBody">
							<div class="divTableRow">
								<div class="divTableCell">20</div>
								<div class="divTableCell">참치123113213마리 잡았다.1231312321321312321321321321313132</div>
								<div class="divTableCell">윤상완</div>
								<div class="divTableCell">2018/04/30</div>
							</div>
						</div> -->
					</div>
					<div class="blueTable outerTableFooter">
						<div class="tableFootStyle">
							<div class="links">
								<a href="#">&laquo;</a> <a class="active" href="#">1</a> <a
									href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">&raquo;</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
<script src="bootstrap/assets/js/core/jquery.3.2.1.min.js"
	type="text/javascript"></script>
<script src="bootstrap/assets/js/core/popper.min.js"
	type="text/javascript"></script>
<script src="bootstrap/assets/js/core/bootstrap.min.js"
	type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="bootstrap/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="bootstrap/assets/js/plugins/nouislider.min.js"
	type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="bootstrap/assets/js/plugins/bootstrap-datepicker.js"
	type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="bootstrap/assets/js/now-ui-kit.js?v=1.1.0"
	type="text/javascript"></script>

</html>