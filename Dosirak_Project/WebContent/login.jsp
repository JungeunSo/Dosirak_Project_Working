<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link	href="css/bootstrap.min.css"	rel="stylesheet" id="bootstrap-css">
<script src="js/jquery-3.5.1.js"></script>
</head>

<style>
/* sign in FORM */
#logreg-forms {
	width: 412px;
	margin: 10vh auto;
	background-color: #f3f3f3;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
}

#logreg-forms form {
	width: 100%;
	max-width: 410px;
	padding: 15px;
	margin: auto;
}

#logreg-forms .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

#logreg-forms .form-control:focus {
	z-index: 2;
}

#logreg-forms .form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

#logreg-forms .form-signin input[type="password"] {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

#logreg-forms .social-login {
	width: 390px;
	margin: 0 auto;
	margin-bottom: 14px;
}

#logreg-forms .social-btn {
	font-weight: 100;
	color: white;
	width: 190px;
	font-size: 0.9rem;
}

#logreg-forms a {
	display: block;
	padding-top: 10px;
	color: lightseagreen;
}

#logreg-form .lines {
	width: 200px;
	border: 1px solid red;
}

#logreg-forms button[type="submit"] {
	margin-top: 10px;
}

#logreg-forms .facebook-btn {
	background-color: #3C589C;
}

#logreg-forms .naver-btn {
	background-color: #28A745;
}

#logreg-forms .form-reset, #logreg-forms .form-signup {
	display: none;
}

#logreg-forms .form-signup .social-btn {
	width: 210px;
}

#logreg-forms .form-signup input {
	margin-bottom: 2px;
}

.form-signup .social-login {
	width: 210px !important;
	margin: 0 auto;
}

/* Mobile */
@media screen and (max-width:500px) {
	#logreg-forms {
		width: 300px;
	}
	#logreg-forms .social-login {
		width: 200px;
		margin: 0 auto;
		margin-bottom: 10px;
	}
	#logreg-forms .social-btn {
		font-size: 1.3rem;
		font-weight: 100;
		color: white;
		width: 200px;
		height: 56px;
	}
	#logreg-forms .social-btn:nth-child(1) {
		margin-bottom: 5px;
	}
	#logreg-forms .social-btn span {
		display: none;
	}
	#logreg-forms .facebook-btn:after {
		content: 'Facebook';
	}
	#logreg-forms .naver-btn:after {
		content: 'Naver';
	}
}
</style>

<script>
    function toggleResetPswd(e) {
        e.preventDefault();
        $('#logreg-forms .form-signin').toggle() // display:block or none
        $('#logreg-forms .form-reset').toggle() // display:block or none
    }

    $(() => {
        // Login Register Form
        $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
        $('#logreg-forms #cancel_reset').click(toggleResetPswd);
    })
</script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.0/css/all.css">
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


	<div id="logreg-forms">
		<form class="form-signin" action="loginAction.jsp" method="POST">
			<h1 class="h3 mb-3 font-weight-normal" style="text-align: center">
				로그인</h1>
			<div class="social-login">
				<button class="btn facebook-btn social-btn" type="button">
					<span><i class="fab fa-facebook-f"></i> 페이스북 계정 로그인</span>
				</button>
				<button class="btn naver-btn social-btn" type="button">
					<span><i class="fab fa-neos"></i> 네이버 계정 로그인</span>
				</button>
 				<Sup>* 추후 제공 예정</Sup>
			</div>
			<p style="text-align: center">OR</p>
			<input type="text" id="inputEmail" class="form-control"
				placeholder="아이디" required="" autofocus="" name="id">
				<input
				type="password" id="inputPassword" class="form-control"
				placeholder="비밀번호" required="" name="pass">

			<button class="btn btn-info btn-block" type="submit">
				<i class="fas fa-sign-in-alt"></i> 로그인
			</button>
			<a href="#" id="forgot_pswd">패스워드 초기화</a>
			<hr>
			<!-- <p>Don't have an account!</p>  -->
			<button class="btn btn-primary btn-block" type="button"
				id="btn-signup" onclick="location.href='join.jsp'">
				<i class="fas fa-user-plus"></i> 회원 가입
			</button>
			<a href="main.jsp" ><i class="fas fa-angle-left"></i>
				돌아가기</a>
		</form>

		<form action="/reset/password/" class="form-reset">
			<h1 class="h3 mb-3 font-weight-normal" style="text-align: center">
				패스워드 찾기</h1>
			<input type="email" id="resetEmail" class="form-control"
				placeholder="이메일 주소" required="" autofocus="">
			<button class="btn btn-primary btn-block" type="submit">패스워드
				초기화</button>
				<Sup>* 추후 제공 예정</Sup>
			<a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i>
				돌아가기</a>
		</form>
		<br>
	</div>
	<p style="text-align: center">
		<a href="#" target="_blank" style="color: black">Copyright &copy;
			All right reserved.</a>
	</p>

</body>

</html>