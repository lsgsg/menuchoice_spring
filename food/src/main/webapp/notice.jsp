<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">

<title>헬로키친 문의게시판</title>
<link href="css/list_img_style.css" rel="stylesheet" type="text/css">
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<style type="text/css">
.notice{
	width:1202px !important;
	height:611px !important;
}


</style>
<script>
$(document).ready(function(e) {
	var list_item = $('.list_item').width();
    $('.atag').css({'border': '1.4px solid #9ccd62'});
	$('.atag').css({'color': '#9ccd62'});	 
});
</script>
</head>

<body>
<div id="wrap">

	<header><%@ include file = "../../top_login.jsp"%></header>
	<%@ include file = "../../../menu.jsp"%>
    <div id="logo">
    <a href="main.jsp"><img src="img/helloonlygul.png" alt="로고"></a>
    </div>
    
    
    <section style="text-align: center; margin-top: 200px;">
    <!-- <article id="a1" style="text-align: center;">
    	<img src="img/foodtip.png" alt="Hello Kitchen story">
  	</article> -->
    <img class="notice" src="img/notice.JPG">
    
    <article id="a2">
    	<div id="colOut">
        	 
        </div>
    </article>
    </section>
     
    
     
	<footer>
    <p>ⓒCoding by LSG, Design by LMS, All Right Reserved</p>
    </footer>
</div>	
</body>
</html>