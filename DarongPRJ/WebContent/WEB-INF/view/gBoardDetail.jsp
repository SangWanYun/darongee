<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Darongee</title>

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
	
	<script>
	function commentInsert(){//ajax�� ��ġ��.
		<% String id1 = (String)session.getAttribute("userId");%>
		
		var id = "<%=id1%>";
		if(id == "null"){
			alert("��� �ۼ� �� �α��� ���ּ���.");
			return false;
		}
		
		var url = "commentInsert.do?";
		url += "gbrdSeq=" + $("#gbrdSeq");
		url += "&userId=" + id;
		url += "&comment=" + $("#comment").val();
		
		$.ajax({
            url : 'commentInsert.do',
            method : 'post',
            dataType : "json",
            data : { 
            	
            	'gbrdSeq': $('#gbrdSeq').val(),
            	'comment': $('#comment').val(),
               	'userId': id
        
            },	
            success : function(data) {
            	var contents = ""; 
            	console.log(data);
            	var Ca = /\+/g;
             
               
             $.each(data, function(key, value) {
      
                if(value != null){
                	
                	
                	contents +=  '<div class="media mb-4" >';
				 	contents +=  '<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">';
				 	contents +=  '<div class="media-body">';
				 	contents +=  '<span><h5 class="mt-0" style="display:inline-block;">'+ value.regUserNo + '&nbsp;&nbsp;</h5><img src="image/modify.png" onclick=modifyC('+ value.comSeq+',"'+ value.regUserNo +'")>&nbsp;<img src="image/delte.png" onclick=deleteC('+ value.comSeq+',"'+ value.regUserNo +'")></span>';
				 	contents +=  '<pre id = "com'+ value.comSeq +'">'+value.comContents+'</pre>';
				 	contents +=  '</div>';
				 	contents +=  '<input type="hidden" value="'+ value.comSeq +'">'; 
				 	contents +=  '</div>';
                   
              
                }else{
                	alert("����� �̻��մϴ�.");
                }
                
                      
                           }); 

            
               $('#commentList').html(contents);
               $('#comment').val('');
            }
		
         

         })
	}
	</script>
	
	<script>
	function deleteC(cid, cname){
		var id = "<%=id1%>";

		var name = ""+cname;

		
		if(id != name){
			alert("���θ� ������ �� �ֽ��ϴ�.");
			return false;
		}
		
		$.ajax({
            url : 'commentDelete.do',
            method : 'post',
            dataType : "json",
            data : { 
            	
            	'gbrdSeq': $('#gbrdSeq').val(),
            	'comSeq': cid,
               	'userId': id
        
            },	
            success : function(data) {
            	var contents = ""; 
            	console.log(data);
            	var Ca = /\+/g;
             
               
             $.each(data, function(key, value) {
      
                if(value != null){
                	
                	contents +=  '<div class="media mb-4" >';
				 	contents +=  '<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">';
				 	contents +=  '<div class="media-body">';
				 	contents +=  '<span><h5 class="mt-0" style="display:inline-block;">'+ value.regUserNo + '&nbsp;&nbsp;</h5><img src="image/modify.png" onclick=modifyC('+ value.comSeq+',"'+ value.regUserNo +'")>&nbsp;<img src="image/delte.png" onclick=deleteC('+ value.comSeq+',"'+ value.regUserNo +'")></span>';
				 	contents +=  '<pre id = "com'+ value.comSeq +'">'+value.comContents+'</pre>';
				 	contents +=  '</div>';
				 	contents +=  '<input type="hidden" value="'+ value.comSeq +'">'; 
				 	contents +=  '</div>';
                   
              
                }
            
                      
                           }); 

	   
               $('#commentList').html(contents);
               $('#comment').val('');
            }

         

         })
	}
	</script>
	
	<script>
	var checkin = 1;
	var checkId = "";
	function modifyC(cid, cname){
		var id = "<%=id1%>";
		var name = ""+cname;
		var ccid = "com"+cid;
		

		if(id != name){
			alert("���θ� ������ �� �ֽ��ϴ�.");
			return false;
		}
		
		
		if(checkin % 2 == 0 && checkId == ccid){
			cancelModify();
			checkin = 1;
			return false;
			
		}else if(checkin % 2 == 0 && checkId != ccid){
			cancelModify();
			checkin = 0;
		
		}
		
		
		
		
		
		
		var chtml = $("#com"+cid).html();
		var cont = "<pre><textarea class='form-control' style='width:50%' id='comtml"+ cid +"'>"+ chtml + "</textarea></pre>";
		cont += "<input type='button' class='btn btn-primary' onclick=modifyProC("+ cid +") value='Save'>";
		cont += "<input type='button' class='btn btn-primary' onclick=cancelModify() value='Cancel'>";
		$("#com"+cid).html(cont);
		checkId = ccid;
		checkin += 1;
	}
	</script>
	<script>
	function cancelModify(){
		
		var contents = "";
		$.ajax({
            url : 'commentRefresh.do',
            method : 'post',
            dataType : "json",
            data : { 
                   	'gbrdSeq': $('#gbrdSeq').val(),
            },	
            success : function(data) {
            	var contents = ""; 
            	console.log(data);
            	var Ca = /\+/g;
             
               
             $.each(data, function(key, value) {
      
                if(value != null){
                	
                	contents +=  '<div class="media mb-4" >';
				 	contents +=  '<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">';
				 	contents +=  '<div class="media-body">';
				 	contents +=  '<span><h5 class="mt-0" style="display:inline-block;">'+ value.regUserNo + '&nbsp;&nbsp;</h5><img src="image/modify.png" onclick=modifyC('+ value.comSeq+',"'+ value.regUserNo +'")>&nbsp;<img src="image/delte.png" onclick=deleteC('+ value.comSeq+',"'+ value.regUserNo +'")></span>';
				 	contents +=  '<pre id = "com'+ value.comSeq +'">'+value.comContents+'</pre>';
				 	contents +=  '</div>';
				 	contents +=  '<input type="hidden" value="'+ value.comSeq +'">'; 
				 	contents +=  '</div>';
                   
              
                }
            
                      
                           }); 

	   
               $('#commentList').html(contents);
               $('#comment').val('');
            }

         

         })
         
	}
	</script>
	
	<script>
	function modifyProC(cid){
		
		var contents = "";
		
		var commenthtml = $("#comtml"+cid).val();
		$.ajax({
            url : 'modifyProcC.do',
            method : 'post',
            dataType : "json",
            data : { 
                   	'gbrdSeq': $('#gbrdSeq').val(),
                   	'cid': cid,
                   	'commentHtml': commenthtml,
            },	
            success : function(data) {
            	var contents = ""; 
            	console.log(data);
            	var Ca = /\+/g;
             
               
             $.each(data, function(key, value) {
      
                if(value != null){
                	
				    contents +=  '<div class="media mb-4" >';
				 	contents +=  '<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">';
				 	contents +=  '<div class="media-body">';
				 	contents +=  '<span><h5 class="mt-0" style="display:inline-block;">'+ value.regUserNo + '&nbsp;&nbsp;</h5><img src="image/modify.png" onclick=modifyC('+ value.comSeq+',"'+ value.regUserNo +'")>&nbsp;<img src="image/delte.png" onclick=deleteC('+ value.comSeq+',"'+ value.regUserNo +'")></span>';
				 	contents +=  '<pre id = "com'+ value.comSeq +'">'+value.comContents+'</pre>';
				 	contents +=  '</div>';
				 	contents +=  '<input type="hidden" value="'+ value.comSeq +'">'; 
				 	contents +=  '</div>';
                   
              
                }
            
                      
                           }); 

	   
               $('#commentList').html(contents);
               $('#comment').val('');
            }

         

         })
	}
	</script>
	
	<script>
	function attentionInsert(){//ajax�� ��ġ��.
		
		var id = "<%=id1%>";
		if(id == "null"){
			alert("���������� �α��� ���ּ���.");
			return false;
		}
		
		$.ajax({
            url : 'attentionInsert.do',
            method : 'post',
            dataType : "text",
            data : { 
            	
            	'gbrdSeq': $('#gbrdSeq').val(),
               	'userId': id
        
            },	
            success : function(data) {
            	var contents = ""; 
            	console.log(data);
            	var Ca = /\+/g;
             
               	contents += '<span id="aCountNum"><a href="javascript:attentionInsert()">�����־��&nbsp;</a>'+ data +'</span>';
                   
              

            
               $('#aCountNum').html(contents);
            }
		
         

         })
	}
	</script>
  </head>

  <body style="padding-top:0;">

    <!-- Navigation -->
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
                        <a class="nav-link" href="chatting.do">
                            <img src="image/computer.png">
                            <p>&nbsp;QnA</p>
                        </a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="login.do">
                            <i class="now-ui-icons files_paper"></i>
                            <p>�α���</p>
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
                        <a class="nav-link" href="chatting.do">
                            <img src="image/computer.png">
                            <p>&nbsp;QnA</p>
                        </a>
                    </li>
                     <li class="nav-item">
                        <div class="dropdown button-dropdown">
                			<a href="#pablo" class="dropdown-toggle nav-link" id="navbarDropdown" data-toggle="dropdown" style="font-size:10pt">
                			<%=session.getAttribute("userId")%>��, ȯ���մϴ�.
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

    <!-- Page Content -->
    <div class="container">
	<input type="hidden" value="${gDetail.gbrdSeq}" name="gbrdSeq"
						id="gbrdSeq">
      <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8">
			<span id="aCountNum"><a href="javascript:attentionInsert()">�����־��&nbsp;</a>${aCount}</span>
          <!-- Title -->
          <h1 class="mt-4">${gDetail.gbrdTitle}</h1>

          <!-- Author -->
          <p class="lead">
            by&nbsp;
            <a href="#">${gDetail.regUserNo}</a>
            
          </p>
		<div id="hiddenMine"></div>
          <hr>

          <!-- Date/Time -->
          <p>Posted on ${gDetail.regDate}</p>

          <hr>

          <!-- Preview Image -->
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
									placeholder="*��ǰ��" value="${gDetail.gbrdItem}" readonly>  <input type="text"
									id="gPrice" name="gPrice" class="card-title"
									style="padding: 5px; width: 40%;" placeholder="*1���� �� ����" value="${gDetail.gbrdPrice}" readonly>
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
									placeholder="*�Ǹ���" value=" ${gDetail.gbrdName}" readonly> <input type="text"
									id="gPlace" name="gPlace" class="card-title"
									style="padding: 5px; width: 40%;" placeholder="*������" value="${gDetail.gbrdPlace}" readonly>
								</span>
							</div>

          <hr>

          <!-- Post Content -->



          <blockquote class="blockquote">
            <p class="mb-0" id="gbrdContents">${gContents}</p>
      
          </blockquote>



          <hr>

          <!-- Comments Form -->
          <div class="card my-4">
            <h5 class="card-header">Leave a Comment:</h5>
            <div class="card-body">
              <form>
                <div class="form-group">
                  <pre><textarea class="form-control" rows="3" name="comment" id="comment"></textarea></pre>
                </div>
                <input type="button" class="btn btn-primary" onclick="commentInsert()" value="Submit">
              </form>
            </div>
          </div>
		<div id="commentList">
          <!-- Single Comment -->
          <c:forEach items="${jsonList}" var="list" >
          <div class="media mb-4" >
            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
            <div class="media-body">
              <span><h5 class="mt-0" style="display:inline-block;">${list.regUserNo }&nbsp;&nbsp;</h5><img src="image/modify.png" onclick="modifyC(${list.comSeq },'${list.regUserNo }')">&nbsp;<img src="image/delte.png" onclick="deleteC(${list.comSeq },'${list.regUserNo }')"></span>
				<pre id = "com${list.comSeq }">${list.comContents}</pre>
            </div>
            <input type="hidden" value="${list.comSeq }">
          </div>
			</c:forEach>
		</div>
        </div>

        <!-- Sidebar Widgets Column ���̵�� ����
        <div class="col-md-4">

          <!-- Search Widget soft�� ����.
          <div class="card my-4">
            <h5 class="card-header">Search</h5>
            <div class="card-body">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for...">
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button">Go!</button>
                </span>
              </div>
            </div>
          </div>

          <!-- Categories Widget
          <div class="card my-4">
            <h5 class="card-header">Categories</h5>
            <div class="card-body">
              <div class="row">
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">Web Design</a>
                    </li>
                    <li>
                      <a href="#">HTML</a>
                    </li>
                    <li>
                      <a href="#">Freebies</a>
                    </li>
                  </ul>
                </div>
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">JavaScript</a>
                    </li>
                    <li>
                      <a href="#">CSS</a>
                    </li>
                    <li>
                      <a href="#">Tutorials</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <!--Side Widget 
          <div class="card my-4">
            <h5 class="card-header">Side Widget</h5>
            <div class="card-body">
              You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
            </div>
          </div>
			
        </div> �� ���̵� �� ��-->

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Darongee 2018</p>
      </div>
      <!-- /.container -->
    </footer>

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
<% String id = (String)session.getAttribute("userId");%>
var id = "<%=id%>";
var regNo = "${gDetail.regUserNo}";
var gbrdSeq = "${gDetail.gbrdSeq}";
var del = "deleteG.do?gbrdSeq=" + gbrdSeq;
var up = "updateG.do?gbrdSeq=" + gbrdSeq;
var str = "";
if(id == regNo){
	str = "<a href=\""+ up +"\">����</a>&nbsp;&nbsp;<a href=\""+ del +"\">����</a>";
	$("#hiddenMine").html(str);
}

</script>
</html>