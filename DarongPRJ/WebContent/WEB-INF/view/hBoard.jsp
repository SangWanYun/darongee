<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.lang.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HBoard</title>
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


<style>
div.blueTable {
  border: 1px solid #ADADAD;
  background-color: #FFFFFF;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
  
}
.divTable.blueTable .divTableCell, .divTable.blueTable .divTableHead {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
}
.divTable.blueTable .divTableBody .divTableCell {
  font-size: 13px;
  color:black;
  opacity:0.7;
}
.divTable.blueTable .divTableRow:nth-child(even) {
  background: #FFFFFF;
}
.divTable.blueTable .divTableHeading {
  background: #36629E;
  background: -moz-linear-gradient(top, #6889b6 0%, #4a71a7 66%, #36629E 100%);
  background: -webkit-linear-gradient(top, #6889b6 0%, #4a71a7 66%, #36629E 100%);
  background: linear-gradient(to bottom, #6889b6 0%, #4a71a7 66%, #36629E 100%);
  border-bottom: 2px solid #000000;
}
.divTable.blueTable .divTableHeading .divTableHead {
  font-size: 15px;
  font-weight: bold;
  color: #FFFFFF;
  text-align: center;
  border-left: 2px solid #000000;
  opacity:1;
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
  border-top: 2px solid #444444;
}
.blueTable .tableFootStyle {
  font-size: 14px;
}
.blueTable .tableFootStyle .links {
	 text-align: right;
}
.blueTable .tableFootStyle .links a{
  display: inline-block;
  background: #FFFFFF;
  color: #2498FF;
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
.divTable{ display: table; }
.divTableRow { display: table-row; }
.divTableHeading { display: table-header-group;}
.divTableCell, .divTableHead { display: table-cell;}
.divTableHeading { display: table-header-group;}
.divTableFoot { display: table-footer-group;}
.divTableBody { display: table-row-group;}

.btn1 {
  background: #36629E;
  background-image: -webkit-linear-gradient(top, #36629E, #2d67b3);
  background-image: -moz-linear-gradient(top, #36629E, #2d67b3);
  background-image: -ms-linear-gradient(top, #36629E, #2d67b3);
  background-image: -o-linear-gradient(top, #36629E, #2d67b3);
  background-image: linear-gradient(to bottom, #36629E, #2d67b3);
  -webkit-border-radius: 15;
  -moz-border-radius: 15;
  border-radius: 15px;
  font-family: Arial;
  color: #FFFFFF;
  font-size: 14px;
  padding: 7px 15px 7px 15px;
  text-decoration: none;
  border: solid #2d67b3 2px;
}

.btn1:hover {
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
}
</style>

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

<script>
var pageNumber = 1;
function showPages(pageName){
	//3 * 10 - 10 = 20
	//1 * 10 - 10 = 0
	//2 * 10 - 10 = 10
	if(pageNumber == pageName){
		return false;
	}
	
	$.ajax({
        url : 'hBoardPaging.do',
        method : 'post',
        dataType : "json",
        data : { 

           	'pageNum': pageName
    
        },	
        success : function(data) {
        	var contents = ""; 
        	console.log(data);
        	var Ca = /\+/g;
         

contents += '<div class="divTable blueTable display" >';
				
            	contents += '<div class="divTableHeading">';
				contents += '<div class="divTableRow">';
						contents += '<div class="divTableHead" style="width:10%">No.</div>';
						contents += '<div class="divTableHead" style="width:45%">Title.</div>';
						contents += '<div class="divTableHead" style="width:15%">Writer.</div>';
						contents += '<div class="divTableHead" style="width:25%">Date.</div>';
					contents += '</div>';
				contents += '</div>';
				
				contents += '<div class="divTableBody">';
				
				
				
         $.each(data, function(key, value) {
  
         
            	

				
            	contents += '<div class="divTableRow"> ';
					
					contents += '<div class="divTableCell" style="text-align:center;">'+ value.hbrdSeq +'</div>';
					contents += '<div class="divTableCell"><a href="gBoardDetail.do?gbrdSeq='+ value.hbrdSeq +'" style="color:black;">&nbsp;'+ value.hbrdTitle +'</a></div>';
					contents += '<div class="divTableCell" style="text-align:center;">'+ value.hbrdName+'</div>';
					contents += '<div class="divTableCell" style="text-align:center;">'+ value.regDt +'</div>';
					
				contents += '</div>';
					
                       });//each end
         
         
         	contents += '</div>';
			
		   
			contents += '</div>';
			
				
				
							
				contents += '<div class="blueTable outerTableFooter">';
					contents += '<div class="tableFootStyle">';
						contents += '<div class="links">';
							contents += '<a href="#">&laquo;</a> ';
							
							
							contents += '<%
							  String gcnt1 = request.getAttribute("hCount").toString();
							 int cnt1 = Integer.parseInt(gcnt1);
							  int mok1 = 0;
							 int nam1 = 0;
							
							mok1 = cnt1 / 10;
							  nam1 = cnt1 % 10;
							  
							  if(mok1 == 0 && nam1 != 0){
								  mok1 = mok1 + 1;
							  }else						  
							if(nam1 != 0){
								  mok1 = mok1 + 1;
							 }
							  
							for(int i = 1; i <= mok1; i++){
							%>';
							contents += '<a class="active" href="#" onclick="showPages(<%=i%>)">';
							contents += '<%=i %>';
							contents += '</a>';
							 contents += ' <%}%>';
							
							

							contents += '<a href="#">&raquo;</a>';
						contents += '</div>';
					contents += '</div>';
				contents += '</div>';
				
				
				contents += '<br>';
				contents += '<div class="divRight" style="display:inline-block;float:right;"><a href="hWriteCheck.do"><input type="button" value="Write" class="btn1"></a></div>';
       

			 	
         	

           $('.card-plain').html(contents);
        }

     

     })
     pageNumber = pageName;
}
</script>

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
					
					
					<div class="divTable blueTable display"">
					
						<div class="divTableHeading">
							<div class="divTableRow">
								<div class="divTableHead" style="width:10%">No.</div>
								<div class="divTableHead" style="width:45%">Title.</div>
								<div class="divTableHead" style="width:15%">Writer.</div>
								<div class="divTableHead" style="width:25%">Date.</div>
							</div>
						</div>
						
						<div class="divTableBody">
						<%int a = 1; %>
						<c:forEach items="${jsonList }" var="list" >
						<%a++; %>
						
						<div class="divTableRow"> 
						
							
							
							<div class="divTableCell" style="text-align:center;">${list.hbrdSeq}</div>
							<div class="divTableCell"><a href="hBoardDetail.do?hbrdSeq=${list.hbrdSeq}" style="color:black;">&nbsp;${list.hbrdTitle}</a></div>
							<div class="divTableCell" style="text-align:center;">${list.hbrdName}</div>
							<div class="divTableCell" style="text-align:center;">${list.regDt}</div>
							
						</div>
							</c:forEach> 
						</div>
						
							   
					</div>
					
						<!-- paging -->
						
									
						<div class="blueTable outerTableFooter">
							<div class="tableFootStyle">
								<div class="links">
									
									<a href="#">&laquo;</a>
									
									<%
									  String gcnt = request.getAttribute("hCount").toString();
									  int cnt = Integer.parseInt(gcnt);//gBoard count get 13
									  int mok = 0;
									  int nam = 0;
									
									  mok = cnt / 10;//1
									  nam = cnt % 10;//3
									  
									  if(mok == 0 && nam != 0){
										  mok = mok + 1;
									  }else							  
									  if(mok != 0 && nam != 0){
										  mok = mok + 1;
									  }
									  
									 for(int i = 1; i <= mok; i++){
									  %>
										  <a class="active" href="#" onclick="showPages(<%=i%>)"><%=i %></a> 
									  <%
									 }
									  
									%>
									
									<a href="#">&raquo;</a>

									
								</div>
							</div>
						</div>
						
						
						<br>
						<div class="divRight" style="display:inline-block;float:right;"><a href="hWriteCheck.do"><input type="button" value="Write" class="btn1"></a></div>
				</div>
			</div>
		</div>
	</div>
	
	<footer class="py-5 bg-dark">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; By
					Darongee 2018.</p>
			</div>
			<!-- /.container -->
		</footer>
</body>


</html>