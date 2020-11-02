<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.util.LinkedList"%>

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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.0/css/all.css">
<body>
	<%
		String userId = null;
	if (session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}

	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
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
		<div class="row">
			<table class="table table-hover table-bordered"
				style="text-align: center">
				<thead class="table-active">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsdao = new BbsDAO();
					LinkedList<Bbs> list = bbsdao.getList(pageNumber);
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getBbsid()%></td>
						<td><a href="view.jsp?bbsid=<%=list.get(i).getBbsid()%>"><%=list.get(i).getBbstitle()%></a></td>
						<td><%=list.get(i).getUserid()%></td>
						<td><%=list.get(i).getBbsdate()%></td>
						<td><%=list.get(i).getBbscount()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<div>
				<%
					if (pageNumber != 1) {
				%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
					class="btn btn-success"><i class="fas fa-angle-left"></i>이전</a>
				<%
					}
				if (bbsdao.nextPage(pageNumber + 1)) {
				%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
					class="btn btn-success">다음<i class="fas fa-angle-right"></i></a>
				<%
					}
				if (userId != null) {%>
				<a href="write.jsp" class="btn btn-primary">글쓰기</a>
				<%} else { %>
				<Sup>* 글을 작성하시려면 로그인이 필요합니다.</Sup>
				<%} %>
			</div>
		</div>

	</div>
	<br>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Seong jong-hyoeon's artist. Copyrights &copy; 2020 to ever.</p>
	</div>

</body>

</html>