<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
<title>당신의 헬로키친</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="css/style_index.css">
<link rel="stylesheet" href="css/maincss.css" type="text/css">
<style>
@import url('https://fonts.googleapis.com/css?family=Raleway');
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
#footer { color:#eee; position:fixed; bottom:1vh; z-index:99; font-size:10px; width:100%; height:1.5vh; text-align:center; }
</style>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="js/jquery.easing.1.3.js"></script>
<script>
$(document).ready(function(e) {

	$('.right').click(function(e){
		window.location.href="main.jsp";
	})
	
	$('.left').click(function(e){
		window.location.href="survey.jsp";
	})
})
</script>
</head>

<body>
<div id="wrap">
<header>
<%@ include file="top_login.jsp" %>
<%@ include file="menu.jsp" %>
</header>



	<div class="container">
		 <div class="one-half left">
		   <h1>메뉴추천받기</h1>
		   <a href="survey.jsp" class="cta">Let's Go</a>
		 </div>
		 <div class="one-half right">
		   <h1>헬로키친구경하기</h1>
		   <a href="main.jsp" class="cta">Let's Go</a>
		 </div>
	</div>


<div id="footer">
ⓒCoding by LSG, Design by LMS, All Right Reserved

</div>
</div>
<script  src="js/index_index.js"></script>
</body>
</html>