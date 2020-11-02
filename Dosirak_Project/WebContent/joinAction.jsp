<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<% 
String id = request.getParameter("join_id");
String pass = request.getParameter("join_pass");
String email = request.getParameter("join_mail");
String phone = request.getParameter("join_phone1")+"-"+request.getParameter("join_phone2");
String gender = request.getParameter("join_gender");
String name = request.getParameter("join_name");

User user=new User();
user.setId(id);
user.setPassword(pass);
user.setName(name);
user.setPhone(phone);
user.setGender(gender);
user.setEmail(email);

%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가입시도</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="js/jquery-3.5.1.js"></script>
</head>
<body>
		<%
		UserDAO userdao = new UserDAO();
	int result = userdao.join(user);
	if (result == -1) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('아이디가 존재함.')");
		pw.println("history.back()");
		pw.println("</script>");
	} else {
		PrintWriter pw = response.getWriter();
		session.setAttribute("userId", user.getId());
		pw.println("<script>");
		pw.println("alert('가입 성공')");
		pw.println("location.href='main.jsp'");
		pw.println("</script>");
	} 
	%>
</body>

</html>
