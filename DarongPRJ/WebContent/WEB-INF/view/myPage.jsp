<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.lang.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <img src="image/human.png" alt="">
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
                
                <h3 class="title">About My Info</h3>
                <h5 class="description">수정하실 정보를 수정 후 SAVE버튼을 눌러주세요.<br>주의-SAVE버튼을 누르지 않으면 저장되지 않습니다.</h5>
                
                <div class="col-md-4" style="display:table;margin: 0 auto;">
                <div class="card card-login card-plain text-center">
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
                    
                        <h4 class="title text-center">My Attention List</h4>
                        <div class="nav-align-center">
                            <ul class="nav nav-pills nav-pills-primary" role="tablist">
                              <!--   <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#profile" role="tablist">
                                        <i class="now-ui-icons design_image"></i>
                                    </a>
                                </li> -->
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home" role="tablist">
                                        <i class="now-ui-icons location_world"></i>
                                    </a>
                                </li>
                                <!-- <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#messages" role="tablist">
                                        <i class="now-ui-icons sport_user-run"></i>
                                    </a>
                                </li> -->
                            </ul> 
                        </div>
                    </div>
                    <!-- Tab panes -->
                    <div class="tab-content gallery content-center">
                       <div class="divTable blueTable display" id="attTable">
					
							<div class="divTableHeading" style="width:80%" >
								<div class="divTableRow">
									<div class="divTableHead" style="width:10%">No.</div>
									<div class="divTableHead" style="width:45%">Title.</div>
									<div class="divTableHead" style="width:15%">Seller.</div>
									<div class="divTableHead" style="width:25%">Date.</div>
									<div class="divTableHead" style="width:25%">Attention.</div>
									
								</div>
							</div>
						
							<div class="divTableBody">
							<%int a = 1; %>
							<c:forEach items="${jsonList }" var="list" >
							<%a++; %>
						
							<div class="divTableRow"> 
						
							
							
								<div class="divTableCell" style="text-align:center;">${list.attNSeq}</div>
								<div class="divTableCell"><a href="gBoardDetail.do?gbrdSeq=${list.attNSeq}" style="color:black;">&nbsp;${list.attTitle}</a></div>
								<div class="divTableCell" style="text-align:center;">${list.attName}</div>
								<div class="divTableCell" style="text-align:center;">${list.attDate}</div>
								<!-- <div class="divTableCell" style="text-align:center;"><button>이젠싫어</button></div> -->
								<div class="divTableCell" style="text-align:center;"><button class="btn btn-primary btn-icon btn-round" type="button" onclick="deleteA(${list.attSeq});">
                                    <i class="now-ui-icons ui-2_favourite-28"></i>
                                	</button></div>
							</div>
							</c:forEach> 
							</div>
						
							   
						</div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer footer-default">
            <div class="container">
                
                <div class="copyright">
                    &copy;
                    <script>
                        document.write(new Date().getFullYear())
                    </script>,  by Darongee
                    .
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

<script>
function deleteA(attSeq){
	
	
	$.ajax({
        url : 'deleteA.do',
        method : 'post',
        dataType : "json",
        data : { 
        	
        	'attSeq': attSeq
    
        },	
        success : function(data) {
        	var contents = ""; 
        	console.log(data);
        	var Ca = /\+/g;
         
        	contents += '<div class="divTableHeading" style="width:80%" >';
			contents += '<div class="divTableRow">';
			contents += '<div class="divTableHead" style="width:10%">No.</div>';
			contents += '<div class="divTableHead" style="width:45%">Title.</div>';
			contents += '<div class="divTableHead" style="width:15%">Writer.</div>';
			contents += '<div class="divTableHead" style="width:25%">Date.</div>';
			contents += '<div class="divTableHead" style="width:25%">Attention.</div>';
			contents += '</div>';
			contents += '</div>';
	
		    contents += '<div class="divTableBody">';
        	
        	
         $.each(data, function(key, value) {
  
            if(value != null){
            	
			
			contents += '<div class="divTableRow">'; 
			contents += '<div class="divTableCell" style="text-align:center;">'+ value.attNSeq + '</div>';
			contents += '<div class="divTableCell"><a href="gBoardDetail.do?gbrdSeq='+ value.attNSeq + '" style="color:black;">&nbsp;' + value.attTitle + '</a></div>';
			contents += '<div class="divTableCell" style="text-align:center;">'+ value.attName + '</div>';
			contents += '<div class="divTableCell" style="text-align:center;">'+ value.attDate + '</div>';
			contents += '<div class="divTableCell" style="text-align:center;"><button class="btn btn-primary btn-icon btn-round" type="button" onclick="deleteA('+ value.attSeq +');">';
			contents += '<i class="now-ui-icons ui-2_favourite-28"></i>';
			contents += '</button></div>';
			contents += '</div>';
			
               
          
            }else{
            	alert("이상합니다.");
            }
            
                  
                       }); 

           contents += '</div>';
           
           $('#attTable').html(contents);
           alert("ByeBye");
        }
	
     

     })
}
</script>
</html>