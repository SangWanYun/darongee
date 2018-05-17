<%@page import="com.darong.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
	String msg = CmmUtil.nvl((String)request.getAttribute("msg"));
	String url = CmmUtil.nvl((String)request.getAttribute("url"));
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=url %>";
</script>