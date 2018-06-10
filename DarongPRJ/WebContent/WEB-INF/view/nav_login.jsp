<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent " color-on-scroll="400">
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
                            <p>Review</p>
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
                			<%=session.getAttribute("userId")%>님, 환영합니다.
                			</a>
                			<%if(session.getAttribute("userId").equals("admin")) {%>
                			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    			<a class="dropdown-item" href="memberAdmin.do">MemberAdmin</a> 
                    			<div class="dropdown-divider"></div>
                   				<a class="dropdown-item" href="logout.do">Log Out</a>
                			</div>
                			<%}else{ %>
                			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    			<a class="dropdown-item" href="myPage.do">MyPage</a> 
                    			<div class="dropdown-divider"></div>
                   				<a class="dropdown-item" href="logout.do">Log Out</a>
                			</div>
                			<%} %>
            			</div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>