<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
	color: #333;
}

img {
	width: 100%;
	height: 100%;
}

@import url('https://fonts.googleapis.com/css?family=Raleway');

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

html, body {
	font-family: "Nanum Gothic", sans-serif;
	height: 100%;
	width: 100%;
	overflow-x: hidden
}

body {
	background-color: #333;
	/*display:flex;*/
	/*flex-direction:column;
		justify-content:center;
	align-items:center;*/
	background: url(img/intro_index1.jpg) no-repeat;
	background-size: cover;
}

#logo {
	width: 15vh;
	position: fixed;
	top: 3.4vh;
	left: 5.8vw;
	z-index: 99
}

#logo>a {
	width: 100%;
	height: 100%;
	display: block;
}

#member {
	width: 26.041666666666668vw;
	height: 60vh;
	position: absolute;
	left: 50%;
	margin-left: -13.02vw;
	top: 47.5%;
	margin-top: -30vh;
}

#hline {
	width: 100%;
}

#hline>a {
	width: 10.42vw;
	margin: 0 auto;
	display: block;
}

label {
	color: rgba(255, 255, 255, 0.8);
}

#signup {
	width: 55vw;
	max-height: 80vh;
	position: absolute;
	left: 50%;
	margin-left: -250px;
	top: 47.5%;
	margin-top: -30vh;
	background-color: rgba(255, 255, 255, 1);
	box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.3);
	border-radius: 10px; 
	padding: 2.5vw;
}

#Sul {
	float: left;
	width: 55vw;
	margin: 0 auto;
	position: relative;
}

#SulL {
 	width: 100%;
	border-right: 1px solid #fba3b3;;
	box-sizing: border-box;
	float: left;
}

#SulR {
	width: 50%;
	box-sizing: border-box;
	float: left;
	position: relative;
}

input[type=text] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 2px solid #fba3b3;
	border-radius: 2px;
	color: #666 !important;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

input[type=password] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 2px solid #fba3b3;
	border-radius: 2px;
	color: #666 !important;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

input {
	padding: 5px 5px;
	margin: 10px 0px;
	border: none;
	color: #666;
	width: 250px;
	height: 30px;
/* 	background: transparent; */
	border: 2px solid #fba3b3;
	border-radius: 2px;
}

p {
	color: #333;
	font-size: 1vw;
}

span {
	color: #9ccd62;
}

#SulR>ul>li {
	margin-left: 2.5vw;
}

select {
	width: 5vw;
	height: 30px;
	padding: 5px 5px;
}

input.hp {
	width: 5vw;
}

input.email {
	width: 8vw;
}

#button {
	box-sizing: border-box;
	width: 90%;
	margin: 0 auto;
}

.clear {
	width: 100%;
	height: 7.5vh;
}

button {
	background-color: #9ccd62;
	width: 250px;
	height: 40px;
	margin-left: 30px;
	font-size: 0.9vw;
	color: #fff;
	font-weight: bold;
	border: 0 solid;
	box-shadow: inset 0 0 20px rgba(255, 255, 255, 0);
	outline: 1px solid;
	outline-color: rgba(255, 255, 255, 0);
	outline-offset: 0px;
	text-shadow: none;
	-webkit-transition: all 1250ms cubic-bezier(0.19, 1, 0.22, 1);
	transition: all 1250ms cubic-bezier(0.19, 1, 0.22, 1);
	outline-color: rgba(255, 255, 255, 0.5);
	outline-offset: 0px;
	cursor:pointer;
}

button:hover {
	border: 1px solid;
	box-shadow: inset 0 0 20px rgba(255, 255, 255, 0.5), 0 0 20px
		rgba(255, 255, 255, 0.2);
	outline-offset: 15px;
	outline-color: rgba(255, 255, 255, 0);
	text-shadow: 1px 1px 2px #427388;
}

.Sull {
	color: #fff;
}

a.double {
	padding: 1.3vh 1.0vh;
	background-color: #eee;
	border-radius: 2px;
	font-size: 0.8vw;
}

header {
	width: 100vw;
	height: auto;
	position: fixed;
	top: 3vh;
	right: 4vh;
	z-index: 99
}

#sodae {
	font-size: 0.5vw;
}

#footer {
	color: #eee;
	position: fixed;
	bottom: 1vh;
	z-index: 99;
	font-size: 10px;
	width: 100%;
	height: 1.5vh;
	text-align: center;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(e) {
	$('#menu').click(function() {
		$('#menub').css({
			'display' : 'block'
		})
	})
	$('#close').click(function() {
		$('#menub').css({
			'display' : 'none'
		})
	});
});
</script>
</head>
<body>
<header>
	<%@include file="/top_login.jsp"%>
</header>
<div id="logo">
	<a href="index.jsp"><img src="img/helloonlygul.png" alt="로고"></a>
</div>
<div id="signup">
	<ul id="Sul">
		<li id="SulL" class="Sull">
			<ul>
				<li>
					<p id="sodae">
						소중한 정보를 입력해주셔서 감사합니다.<br /> '로그인'을 클릭해주세요.
					</p>
				</li>
				<li id="button"><a href="login">로그인</a></li>
			</ul>
		</li>
	</ul>
	</li>
	</ul>
</div>
<%@include file="/menu.jsp"%>
<div id="footer">ⓒCoding by LSG, Design by LMS, All Right Reserved</div>
</body>
</html>