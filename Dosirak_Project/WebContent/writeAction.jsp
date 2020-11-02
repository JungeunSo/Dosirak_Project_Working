<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가입시도</title>
</head>
<body>
	<%
	PrintWriter pw = response.getWriter();
	String userId = null;

	if (session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	if (userId == null) {
		pw.println("<script>");
		pw.println("alert('로그인이 필요합니다.')");
		pw.println("location.href='login.jsp'");
		pw.println("</script>");
	} else {

		String bbstitle = request.getParameter("bbstitle");
		String bbscontent = request.getParameter("bbscontent");

		BbsDAO bbsdao = new BbsDAO();
		int result = bbsdao.write(bbstitle, bbscontent, userId);
		if (result == -1) {
			pw.println("<script>");
			pw.println("alert('글이 등록되지 않았습니다.')");
			pw.println("history.back()");
			pw.println("</script>");
		} else {
			pw.println("<script>");
			pw.println("alert('등록 완료')");
			pw.println("location.href='bbs.jsp'");
			pw.println("</script>");
		}
	}
	%>
</body>

</html>
