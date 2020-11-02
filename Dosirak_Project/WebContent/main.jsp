<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>

    
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
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
String userId=null;
if (session.getAttribute("userId") != null) {
	userId=(String) session.getAttribute("userId");
}

%>

  <div class="jumbotron text-center" style="margin-bottom:0">
    <h1>내 사랑하는 인생</h1>
    <p>사람향기를 그리워하는 고독한 나그네 한사람으로부터...</p>
  </div>

  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="main.jsp">홈</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="subHTML/myin.html" target="_blank">자서전</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="subHTML/poet.html" target="_blank">나의 시</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="bbs.jsp" >자유게시판</a>
        </li>
      </ul>
    </div>
    <%
    if (userId == null){
      %>
       <div align="right"><a href="login.jsp">로그인</a> / <a href="join.jsp" >회원가입</a></div>
       <%} else { 
    %>
       <div align="right"><a href="#" >회원정보</a> / <a href="logoutAction.jsp">로그아웃</a></div>
       <%} %>
  </nav>

  <div class="container" style="margin-top:30px">
    <div class="row">
      <div class="col-sm-4">
        <h2>About Me</h2>
        <h5>Photo of me:</h5>
        <div class="fakeimg"><img src="img/in.jpg" width="100%" height="100%">
        </div>
        <p>하나의 새싹 같은 순간으로 하늘을 바라보리라..</p>
        <h3>Art Page</h3>
        <p>영혼의 깊은 곳으로부터 울림</p>
        <ul class="nav nav-pills flex-column">
          <li class="nav-item">
            <a class="nav-link" id="aside1" href="#">의뢰</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="aside1" href="#">작품</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="aside1" href="#">작업</a>
          </li>
        </ul>
        <hr class="d-sm-none">
      </div>
      <div class="col-sm-8">
        <h2>내 인생의 책</h2>
        <h5>베로니카,죽기로 결심하다. Dec 7, 2010</h5>
        <div class="fakeimg"><a href="https://m.blog.naver.com/ccl607/110182174607" target="_blank"><img src="img/vero.png"
              width="100%" height="100%"></a></div>
        <p>그녀의 선택..</p>
        <p>정신 병동에서의 진정한 자유. 세상으로부터 진정한 자아를 찾아가는 영혼의 신비한 발걸음.</p>
        <br>
      </div>
    </div>
  </div>

  <div class="jumbotron text-center" style="margin-bottom:0">
    <p>Seong jong-hyoeon's artist. Copyrights &copy; 2020 to ever.</p>
  </div>

</body>

</html>