<%@page import="bbs.Bbs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>delete</title>
</head>
<body>
	<% 
BbsDAO bbsdao=new BbsDAO();
bbsdao.delete(Integer.parseInt(request.getParameter("bbsid")));
%>
<script>
location.href='bbs.jsp'
</script>

</body>
</html>