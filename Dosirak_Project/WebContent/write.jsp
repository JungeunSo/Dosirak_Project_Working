<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<form action="writeAction.jsp" method="post">
				<table class="table table-hover table-bordered"
					style="text-align: center; border: 1px solid #aaaaaa">
					<thead class="table-active">
						<tr>
							<th colspan="5">게시판 글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="제목"
								name="bbstitle" maxlength="50" required=""></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글내용 (2000자 미만)"
									maxlength="2000"  name="bbscontent" style="height:360px" required=""></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
		</div>

	</div>

<br>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Seong jong-hyoeon's artist. Copyrights &copy; 2020 to ever.</p>
	</div>

</body>

</html>