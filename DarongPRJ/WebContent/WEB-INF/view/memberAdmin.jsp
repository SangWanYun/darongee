<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.lang.*"%>
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
    #center{
    	display:inline-block;
    	text-align:center;
    	margin:auto;
    	padding:auto;
    	float: left;
    }
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
	
	 <!-- page content -->
    <div class="wrapper">
    	 <div class="page-header clear-filter">
    		<div class="containor">
    			 <div class="content-center brand" style="width:100%">
    			 	 <blockquote class="blockquote" style="width:100%">
    			 	 <br>
    			 	 <h5 style="text-align:center;color:gray;">Member Administration</h5>
    			 	 <br>

    				<!-- <div class="col-lg-8" style="width:100%;hegiht:850px;display:inline-block;text-align:center;" align="center" >
    				<p style="color:black;">hi</p>
    				</div> -->
    				
    				
    				<div class="tab-content gallery content-center">
                       <div class="divTable blueTable display" id="attTable">
					
							<div class="divTableHeading" style="width:80%" >
								<div class="divTableRow">
									<div class="divTableHead" style="width:10%">No.</div>
									<div class="divTableHead" style="width:10%">Name.</div>
									<div class="divTableHead" style="width:10%">Id.</div>
									<div class="divTableHead" style="width:10%">Email.</div>
									<div class="divTableHead" style="width:10%">Phone.</div>
									<div class="divTableHead" style="width:10%">Birth.</div>
									<div class="divTableHead" style="width:10%">Join Date</div>
									<div class="divTableHead" style="width:10%">Delete?</div>
									
								</div>
							</div>
						
							<div class="divTableBody">
							<%int a = 1; %>
							<c:forEach items="${jsonList }" var="list" >
							<%a++; %>
						
							<div class="divTableRow"> 
						
							
								<div class="divTableCell" style="text-align:center;">${list.userNo}</div>
								<div class="divTableCell" style="text-align:center;">${list.userName}</div>
								<div class="divTableCell" style="text-align:center;">${list.userId}</div>
								<div class="divTableCell" style="text-align:center;">${list.userEmail1}</div>
								<div class="divTableCell" style="text-align:center;">${list.userTel1} - ${list.userTel2} - ${list.userTel3}</div>
								<div class="divTableCell" style="text-align:center;">${list.userBirth}</div>
								<div class="divTableCell" style="text-align:center;">${list.regDt}</div>
								<!-- <div class="divTableCell" style="text-align:center;"><button>이젠싫어</button></div> -->
								<div class="divTableCell" style="text-align:center;"><button class="btn btn-primary btn-icon btn-round" type="button" onclick="deleteU(${list.userNo});">
                                    <i class="now-ui-icons ui-2_favourite-28"></i>
                                	</button></div>
							</div>
							</c:forEach> 
							</div>
						
							   
						</div>
                    </div>
    				
    				
    				</blockquote>
    			 </div>
    		</div>
    	 </div>
    </div>
    
    
  
    
    
    
    		
    		
    		
    		
    		<br>
    		<br>
    		<br>
    		
    		
    		<footer class="footer" data-background-color="black">
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


<script>
function deleteU(userNo){
	
	
	$.ajax({
        url : 'deleteU.do',
        method : 'post',
        dataType : "json",
        data : { 
        	
        	'userNo': userNo
    
        },	
        success : function(data) {
        	var contents = ""; 
        	console.log(data);
        	var Ca = /\+/g;
         
        	contents += '<div class="divTableHeading" style="width:80%" >';
			contents += '<div class="divTableRow">';
			contents += '<div class="divTableHead" style="width:10%">No.</div>';
			contents += '<div class="divTableHead" style="width:10%">Name.</div>';
			contents += '<div class="divTableHead" style="width:10%">Id.</div>';
			contents += '<div class="divTableHead" style="width:10%">Email.</div>';
			contents += '<div class="divTableHead" style="width:10%">Phone.</div>';
			contents += '<div class="divTableHead" style="width:10%">Birth.</div>';
			contents += '<div class="divTableHead" style="width:10%">Join Date</div>';
			contents += '<div class="divTableHead" style="width:10%">Delete?</div>';
			contents += '</div>';
			contents += '</div>';
	
		    contents += '<div class="divTableBody">';
        	
        	
         $.each(data, function(key, value) {
  
            if(value != null){
            	
			
			contents += '<div class="divTableRow">'; 
			contents += '<div class="divTableCell" style="text-align:center;">' + value.userNo +'</div>';
			contents += '<div class="divTableCell" style="text-align:center;">'+ value.userName +'</div>';
			contents += '<div class="divTableCell" style="text-align:center;">'+ value.userId +'</div>';
			contents += '<div class="divTableCell" style="text-align:center;">'+ value.userEmail1 +'</div>';
			contents += '<div class="divTableCell" style="text-align:center;">'+ value.userTel1 +'-'+ value.userTel2 +'-'+ value.userTel3 +'</div>';
			contents += '<div class="divTableCell" style="text-align:center;">'+ value.userBirth +'</div>';
			contents += '<div class="divTableCell" style="text-align:center;">'+ value.regDt +'</div>';
			contents += '<div class="divTableCell" style="text-align:center;"><button class="btn btn-primary btn-icon btn-round" type="button" onclick="deleteU('+ value.userNo +');">';
			contents += '<i class="now-ui-icons ui-2_favourite-28"></i>';
			contents += '</button></div>';
			contents += '</div>';
			
               
          
            }else{
            	alert("이상합니다.");
            }
            
                  
                       }); 

           contents += '</div>';
           
           $('#attTable').html(contents);
           alert("Deleted!");
        }
	
     

     })
}
</script>
</html>