<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>


<script type="text/javascript">
$(function (){
$(".login-form").validate({
	  rules: {
	    username: {
	      required: true,
	      minlength: 4
	    },            
	    password: {
	      required: true,
	      minlength: 5
	    }
	  },
	  //For custom messages
	  messages: {
	    username:{
	      required: "Enter a username",
	      minlength: "Enter at least 4 characters"
	    }
	  },
	  errorElement : 'div',
	  errorPlacement: function(error, element) {
	    var placement = $(element).data('error');
	    if (placement) {
	      $(placement).append(error)
	    } else {
	      error.insertAfter(element);
	    }
	  }
	});
});
</script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css" type="text/css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" type="text/css"/>
<link rel="stylesheet" href="resources/css/login.css?after" type="text/css"/>
	<title>Login</title>
</head>
<body>
<video autoplay muted loop id="myVideo">
  <source src="resources/a.mp4" type="video/mp4">
</video>
<div id="login-page" class="row">
    <div class="col s12 z-depth-4 card-panel">
        <div class="row">
          <div class="input-field col s12 center">
            <!-- <img src="images/login-logo.png" alt="" class="circle responsive-img valign profile-image-login"/> -->
            <p class="center login-form-text">${LOGIN.username}</p>
          </div>
        </div>

        <form class="logout" action="logout" method="post">
	        <div class="row">
	         <div class="input-field col s12">
	           <button type="submit" class="btn waves-effect waves-light col s12">LOGOUT</button>
	         </div>
	         <div class="input-field col s12">
	           <a href="board/list" class="btn waves-effect waves-light col s12 light-blue darken-4">게시판</a>
	         </div>
             <div class="input-field col s12">
	            <a href="diet/" class="btn waves-effect waves-light col s12 light-blue darken-4">식단</a>
	          </div>
	       </div>
        </form>
        
        

    </div>
  </div>
  
</body>
</html>