<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import ="bbs.BbsDAO" %>
	<%@page import ="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter"%>



<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<head>
<title>Purpose of my new life</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.5.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

#aside1:hover {
	background: #4d86f7;
	color: white;
}
</style>
</head>

<body>
	<%
		String userId = null;
	if (session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	
	BbsDAO bbsdao=new BbsDAO();
	int bbsid =Integer.parseInt(request.getParameter("bbsid"));
	Bbs bbs=bbsdao.getView(bbsid);
	
	%>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1>내 사랑하는 인생</h1>
		<p>사람향기를 그리워하는 고독한 나그네 한사람으로부터...</p>
	</div>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="main.jsp">홈</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="subHTML/myin.html" target="_blank">자서전</a></li>
				<li class="nav-item"><a class="nav-link"
					href="subHTML/poet.html" target="_blank">나의 시</a></li>
				<li class="nav-item"><a class="nav-link active" href="bbs.jsp">자유게시판</a>
				</li>
			</ul>
		</div>
		<%
			if (userId == null) {
		%>
		<div align="right">
			<a href="login.jsp">로그인</a> / <a href="join.jsp">회원가입</a>
		</div>
		<%
			} else {
		%>
		<div align="right">
			<a href="#">회원정보</a> / <a href="logoutAction.jsp">로그아웃</a>
		</div>
		<%
			}
		%>
	</nav>
	<br>

	<div class="container">
		<div class="table-responsive">

				<table class="table table-hover table-bordered"
					style="text-align: center; border: 1px solid #aaaaaa">
					<thead class="table-active">
						<tr>
							<th colspan="5">게시판 글</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
							<input type="text" class="form-control" placeholder="<%=bbs.getBbstitle() %>"
								id="bbstitle" maxlength="50" disabled>

							</td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="<%=bbs.getBbscontent() %>"
									id="bbscontent" style="height:360px" disabled></textarea></td>
						</tr>
					</tbody>
				</table>
				<button onclick="history.back()" class="btn btn-primary" >돌아가기</button>
				<% if (userId != null && userId.equals(bbs.getUserid())) {
				%>
				<button onclick="" class="btn btn-info" >수정(미구현)</button>
				<a href="delAction.jsp?bbsid=<%=bbsid %>" class="btn btn-danger" >삭제</a>
				<%} %>

		</div>

	</div>

<br>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Seong jong-hyeon's artist. Copyrights &copy; 2020 to ever.</p>
	</div>

</body>

</html>