<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.lang.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

 	<link rel="apple-touch-icon" sizes="76x76" href="bootstrap/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="bootstrap/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>DARONG</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="bootstrap/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/assets/css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
    
    <!-- sidebar Css -->
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
<title>Darongee</title>
</head>
<body style="padding-top:0;">
<%
    if(session.getAttribute("userId") == null || session.getAttribute("userId") == ""){
    	%> <nav class="navbar navbar-expand-lg bg-primary">
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
                        <a class="nav-link" href="login.do">
                            <i class="now-ui-icons files_paper"></i>
                            <p>로그인</p>
                        </a>
                    </li>
                   
                                   </ul>
            </div>
        </div>
                            </nav>
    <%}else{%>
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
    <%}
    %>
    
    
    <div class="wrapper">
    	 <div class="page-header clear-filter">
    		<div class="containor">
    			 <div class="content-center brand" style="width:100%">
    			 	 <blockquote class="blockquote">
    			 	 <br>
    			 	 <h5 style="text-align:center;color:gray;">Tuna Chart</h5>
    			 	 <br>

    				<div style="width:70%;hegiht:850px;display:inline-block;" class="col-lg-8"><canvas id="myChart"  ></canvas></div>
    				
    				<div class="col-md-4" style="display:inline-block;width:30%;height:550px;">
    					<div class="card my-4" style="display:table">
				           <h5 class="card-header" style="background-color:gray;">Get Fish</h5>
				            <div class="card-body">
				              <div class="input-group" style="width:100%;text-align:center;">
				              
				              
				               <select name="eiName" id="eiName" onchange="getDataIEList()"
				               style="margin:7px;border-radius:5px;width:95%;height:50px;position:relative;left:10px;">
				               		<option value = "I">수입</option>
				               		<option value = "E">수출</option>
				               </select>
				             
				              <select name="cName" id="cName" onchange="getDataPList()" 
				              style="margin:7px;border-radius:5px;width:95%;height:50px;position:relative;left:10px;">
				              		 <c:forEach items="${jsonSList1 }" var="list" >

									 <option value = "${list.datPUCode}">${list.datPUCode }</option>
									 
									 </c:forEach>
				              </select>
				              	<br>
				              	
				              <select name="pName" id="pName" style="margin:7px;border-radius:5px;width:95%;height:50px;position:relative;left:10px;">
				              		 <c:forEach items="${jsonSList2 }" var="list" >

									 <option value = "${list.datTCode}">${list.datTCode }</option>
									 
									 </c:forEach>
				              </select>
				              	
				              	
				                <br>
				                  <br>
				                  <div style="display:block;text-align:center;width:100%"><input class="btn btn-secondary" type="button" style="text-align:center;width:30%" value="Find" onclick="getFish();"></div>
				               
				              </div>
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

<script src="jqmoj/Chart.bundle.js"></script>
<script src="jqmoj/utils.js"></script>
 <%int a = 0; %>
 <c:forEach items="${jsonList }" var="list" >

 <input type="hidden" value = "${list.datTCName}" id="jp<%=a %>">
 <%a++; %>
 </c:forEach>
  <script>var ctx = document.getElementById("myChart");
  
 console.log($('#jp0').val());
 
  var jp0 = $('#jp0').val() * 1;
  var jp1 = $('#jp1').val() * 1;
  var jp2 = $('#jp2').val() * 1;
  
  console.log(jp0);
  console.log(jp1);
  console.log(jp0);
  
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["2017.11", "2018.01", "2018.02"],
        datasets: [{
            label: '일본  눈다랑어(냉동)',
            data: [jp2, jp1, jp0],
            backgroundColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(255, 99, 132, 1)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(255, 99, 132, 1)'
                ,'rgba(255, 99, 132, 1)'
            ],
            
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
<script>
function getDataIEList(){
	var sbIEName = $('#eiName').val();
	$.ajax({
        url : 'dataIEList.do',
        method : 'post',
        dataType : "json",
        data : { 
        	
        	'datFCode': sbIEName
    
        },	
        success : function(data) {
        	var contents = ""; 
        	console.log(data);
        	var Ca = /\+/g;
         
           
         $.each(data, function(key, value) {
  
            if(value != null){
            	
            	
            	contents +=  '<option value = "'+ value.datPUCode + '">' + value.datPUCode +'</option>';
			 	
               
          
            }else{
            	alert("다른 명을 선택해주세요.");
            }
            
                  
                       }); 

        
           $('#cName').html(contents);
        }
	
     

     })
}

</script>
<script>
function getDataPList(){
	var cName = $('#cName').val();
	var IEName = $('#eiName').val();
	$.ajax({
        url : 'dataPList.do',
        method : 'post',
        dataType : "json",
        data : { 
        	
        	'datPUCode': cName,
        	'datFCode': IEName
    
        },	
        success : function(data) {
        	var contents = ""; 
        	console.log(data);
        	var Ca = /\+/g;
         
           
         $.each(data, function(key, value) {
  
            if(value != null){
            	
            	contents +=  '<option value = "'+ value.datTCode + '">' + value.datTCode +'</option>';
			 	
               
          
            }else{
            	alert("다른 명을 선택해주세요.");
            }
            
                  
                       }); 

        
           $('#pName').html(contents);
        }
	
     

     })
}

</script>

<script>
function getFish(){
	var prodName = $('#pName').val();
	var counName = $('#cName').val();
	var IEportName = $('#eiName').val();
	
	var fishData = [];
	
	$.ajax({
        url : 'fishDataList.do',
        method : 'post',
        dataType : "json",
        data : { 
        	
        	'datPUCode': counName,
        	'datFCode': IEportName,
        	'datTCode' : prodName
    
        },	
        success : function(data) {
        	var contents = ""; 
        	console.log(data);
        	var Ca = /\+/g;
         
           
         $.each(data, function(key, value) {
  
            if(value != null){
            	console.log(value.datTCName);
            	fishData[key] = value.datTCName;
				      
          
            }else{
            	alert("다른 명을 선택해주세요.");
            }
            
                  
                       }); 
			
         var ctx = document.getElementById("myChart");
         var myChart = new Chart(ctx, {
        	    type: 'bar',
        	    data: {
        	        labels: ["2017.11", "2018.01", "2018.02"],
        	        datasets: [{
        	            label: counName + " "+ prodName,
        	            data: [fishData[2], fishData[1], fishData[0]],
        	            backgroundColor: [
        	                'rgba(255, 99, 132, 1)',
        	                'rgba(255, 99, 132, 1)',
        	                'rgba(255, 99, 132, 1)'
        	            ],
        	            borderColor: [
        	                'rgba(255,99,132,1)',
        	                'rgba(255, 99, 132, 1)',
        	                'rgba(255, 99, 132, 1)'
        	            ],
        	            
        	            borderWidth: 1
        	        }]
        	    },
        	    options: {
        	        scales: {
        	            yAxes: [{
        	                ticks: {
        	                    beginAtZero:true
        	                }
        	            }]
        	        }
        	    }
        	});
        
        }
	
     

     })
     
   
	
}
</script>
</html>