<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Logout Action</title>
</head>
<body>
<%
session.invalidate();
%>
<script>
location.href='main.jsp'
</script>

</body>
</html>