
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 가입</title>
  <!--    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"
        id="bootstrap-css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  
    <script src="../js/jquery-3.5.1.js"></script>
   -->
  <script src="js/jquery-3.5.1.js"></script>
  <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="js/bootstrap.min.js"></script>

  <!--<script src="js/jquery.min.js"></script>-->

</head>
<style>
  .divider-text {
    position: relative;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 15px;
  }

  .divider-text span {
    padding: 7px;
    font-size: 12px;
    position: relative;
    z-index: 2;
  }

  .divider-text:after {
    content: "";
    position: absolute;
    width: 100%;
    border-bottom: 1px solid #ddd;
    top: 55%;
    left: 0;
    z-index: 1;
  }

  .btn-facebook {
    background-color: #405D9D;
    color: #fff;
  }

  .btn-naver {
    background-color: #28A745;
    color: #fff;
  }
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css">
<script>
  function check_val() {
    let alpha_num = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    let id = document.getElementById("join_id").value;
    let pass = document.getElementById("join_pass").value;
    let same = document.getElementById("same_pass").value;
    /*  
    if (id.length < 4 || id.length > 15) {
        alert("ID는 4자리 이상 15자리 이하 여야 합니다.");
        return false;
    }
    */
    for (i = 0; i < id.length; i++) {
      if (alpha_num.indexOf(id.charAt(i)) == -1) {
        alert("ID에는 알파벳과 숫자만 사용가능합니다.");
        $("#join_id").focus();
        return false;
      }
    }
    /*       
    if (pass.length < 4) {
        alert("비밀번호는 최소 4자리 이상 입력해 주십시오.");
        $("#join_pass").focus();
        return false;
    }
        */
  
  if (pass.indexOf(" ") != -1) {
    alert("비밀번호에 공백이 존재합니다.");
    $("#join_pass").focus();
    return false;
  }
        
  if (pass != same) {
    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    $("#same_pass").focus();
    return false;
  }
/*
  	document.join_form.action = "joinAction.jsp";
  	document.join_form.submit();
*/
 }
  </script>


<body>
	<%
	String userId=null;
	if (session.getAttribute("userId") != null) {
		userId=(String) session.getAttribute("userId");
	}
	if (userId != null) { %>
		<script>
		alert('이미 로그인이 되어 있습니다.');
		location.href='main.jsp';
		</script>
		<%
	}
	%>
  <div class="container">
    <br>
    <p class="text-center">회원 가입하러 오셨군요! 환영합니다! :D</p>
    <hr>

    <div class="card bg-light">
      <article class="card-body mx-auto" style="max-width: 400px;">
        <h4 class="card-title mt-3 text-center">회원 가입</h4>
        <p class="text-center">무료로 회원 가입이 가능합니다.</p>
        <p>
          <a href="" class="btn btn-block btn-naver"> <i class="fab fa-neos"></i>   네이버 계정으로 가입
          </a> <a href="" class="btn btn-block btn-facebook"> <i class="fab fa-facebook-f"></i>   페이스북 계정으로 가입
          </a> <Sup> * 추후 제공 예정 </Sup>
        <p class="divider-text">
          <span class="bg-light">OR</span>
        </p>
   
        <form onsubmit="return check_val()" method="POST" name="join_form"  action="joinAction.jsp">
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-user"></i>
              </span>
            </div>
            <input id="join_id" name="join_id" class="form-control" placeholder="계정 이름(영문+숫자만)" type="text" required="">
          </div>
          <!-- form-group// -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fas fa-user-circle"></i>
              </span>
            </div>
            <input name="join_name" class="form-control" placeholder="성명" type="text" required="">
          </div>
          <!-- form-group// -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-envelope"></i>
              </span>
            </div>
            <input name="join_mail" class="form-control" placeholder="메일 주소" type="email" required="">
          </div>
          <!-- form-group// -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-phone"></i>
              </span>
            </div>
            <select class="custom-select" style="max-width: 120px;" name="join_phone1">
              <option selected="" value="010">010</option>
              <option value="011">011</option>
            </select> <input name="join_phone2" class="form-control" placeholder="번호" type="text">
          </div>
          <!-- form-group// -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-venus-mars"></i> </span>
            </div>
            <select class="form-control" name="join_gender">
              <option selected="" value="N">성별</option>
              <option value="M">남자</option>
              <option value="F">여자</option>
            </select>
          </div>
          <!-- form-group end.// -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-lock"></i>
              </span>
            </div>
            <input class="form-control" placeholder="사용할 패스워드 입력" type="password" id="join_pass" name="join_pass"
              required="">
          </div>
          <!-- form-group// -->
          <div class="form-group input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"> <i class="fa fa-lock"></i>
              </span>
            </div>
            <input class="form-control" placeholder="동일한 패스워드 입력" type="password" required="" id="same_pass">
          </div>
          <!-- form-group// -->
          <div class="form-group">
         <button class="btn btn-primary btn-block" type="submit">계정 생성</button> 
          </div>
          <!-- form-group// -->
          <p class="text-center">
            이미 계정이 있으세요? <a href="login.jsp">로그인</a>
          </p>
        </form>
      </article>
    </div>
    <!-- card.// -->

  </div>
  <!--container end.//-->

  <br>
  <br>
  <article class="bg-secondary mb-3">
    <div class="card-body text-center">
      <h3 class="text-white mt-3">Seong Jong-Hyeon</h3>
      <p class="h5 text-white">
        가입해 주셔서 감사합니다! <br> 어떠한 의뢰든 최선을 다해서 지원하겠습니다.
      </p>
      <br>
      <p>
        <a class="btn btn-warning" href="main.jsp"> 처음으로 돌아가기 
        <i class="fa fa-window-restore "></i></a>
      </p>
    </div>
    <br> <br>
  </article>
</body>

</html>