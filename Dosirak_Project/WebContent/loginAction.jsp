<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<% 
String id = request.getParameter("id");
String pass = request.getParameter("pass");
User user=new User();
user.setId(id);
user.setPassword(pass);

/*
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="name" property="id" />
<jsp:setProperty name="password" property="pass" />
 */
 
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로긴시도</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="js/jquery-3.5.1.js"></script>
</head>
<body>
	<%

		UserDAO userdao = new UserDAO();
	int result = userdao.login(user.getId(), user.getPassword());
	if (result == 1) {
		session.setAttribute("userId", user.getId());
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('로긴 성공')");
		pw.println("location.href='main.jsp'");
		pw.println("</script>");
	} else if (result == 0) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('패스워드 틀림.')");
		pw.println("history.back()");
		pw.println("</script>");
	} else if (result == -1) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('아이디 없음')");
		pw.println("history.back()");
		pw.println("</script>");
	} else if (result == -2) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('연결실패')");
		pw.println("history.back()");
		pw.println("</script>");
	}
	%>
</body>

</html>
