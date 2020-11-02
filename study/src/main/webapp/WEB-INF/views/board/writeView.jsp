<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	 	<title>게시판</title>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<script type="text/javascript">

		$(document).ready(function(){
			var formObj = $("form[name='writeForm']"); 
			// formObj는 form 네임이 writeForm 인 것을 말한다. 
			$(".write_btn").on("click", function(){ // jquery on 함수, 이벤트 바인딩. 클릭하면 이벤트로 된다~
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		
		function fn_valiChk(){ // 유효성 검사 체크 함수 
			var regForm = $("form[name='writeForm'] .chk").length; // writeForm.chk 클래스 의 길이 확인 
			for(var i = 0; i<regForm; i++){ // eq 는 배열이다. 
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){ // .chk의 배열 i 값의 value 값을 가져온다. 그게 공백이거나 널값이라면
					alert($(".chk").eq(i).attr("title")); // alert 창으로 알린다. 
					return true;
				}
			}
		}
	</script>
	<body>
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			<section id="container">
			<form name="writeForm" method="post" action="/board/write">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content" class="chk" title="내용을 입력하세요."></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" class="chk" title="작성자를 입력하세요." />
								</td>
							<tr>
								<td>						
									<button type="button" class="write_btn">작성</button>
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>