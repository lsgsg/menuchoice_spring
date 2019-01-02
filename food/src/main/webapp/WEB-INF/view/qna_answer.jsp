<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>

<c:if test="${userid == null}">
	<script>
		window.alert('로그인 후 이용해 주세요.')
		history.go(-1)
	</script>
</c:if>

<html>
<head>

<title>문의게시판</title>
<link href="css/write_form_imgcss.css" rel="stylesheet" type="text/css">
<script
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>

<script>
	function check_input() {
		if (!document.board_form.title.value) {
			alert("제목을 입력하세요!");
			document.board_form.subject.focus();
			return;
		}
		if (!document.board_form.content.value) {
			alert("내용을 입력하세요");
			document.board_form.content.focus();
			return;
		}
		document.board_form.submit();
	}
	$(document).ready(function(e) {
		$('.atag').css({
			'border' : '1.4px solid #9ccd62'
		})
		$('.atag').css({
			'color' : '#9ccd62'
		})

	});
</script>
</head>

<body>
	<div id="wrap">
		<header>
			<%@ include file="../../top_login.jsp"%>
		</header>
		<%@ include file="../../menu.jsp"%>

		<div id="logo">
			<a href="index.jsp"><img src="img/helloonlygul.png" alt="로고"></a>
		</div>


		<section>
			<div id="bonmun">

				<form name="board_form" method="post" action="qna_answer">
					<input type="hidden" name="no" value="${dto.no}">
					<div class="col1">
						<input type="text" name="title" value="[RE]: ${dto.title}" placeholder="Title">
					</div>


					<div class="col2"></div>

					<div class="col3">
						<textarea rows="30" cols="102" name="content" 
						placeholder="Content">[RE]: ${dto.title}에 대한 답글
						${dto.content}</textarea>
					</div>

					<div class="clear"></div>
					<div id="write_button">
						<a href="#"> <input type="button" onClick="check_input()" value="저장"></a>
						<a href="qna"> 목록 </a>
					</div>
					<div class="clear"></div>
				</form>
			</div>
			<!--bonmun end-->
		</section>
		<footer> ⓒCoding by LSG, Design by LMS, All Right Reserved </footer>
	</div>
</body>
</html>