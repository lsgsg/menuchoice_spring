<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title> -->
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
/*button{

  background:#9ccd62;
  color:#fff;
  border:none;
  position:absolute;
  left:50%;
  margin-left:-25%;
  width:50%;
  height:2.08vw;
  font-size:1.16vw;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  margin-top:1.05vw;
}
button:hover{
  background:rgba(255,255,255,0.6);
  color:#9ccd62;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:4px;
  width:0;
  background: #9ccd62;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
label{color:#eee;}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}*/
#signup {
	width: 400px;
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
	//아이디 검사하는 함수
	function checkId(){
// 		alert("$(\"#userid\").value: "+$("#userid").val());
		$.ajax({
			type:"get",
			url:"check_id",
			data:{"id":$("#userid").val()},
			dataType:"json",
			success:function(data){
// 				alert(data.result);
				var str="";
				
				if(data.result=="true"){
					str="이미 존재하는 아이디입니다.";
					$("#userid").val("");
					$("#userid").focus();
				}else if(data.result="false"){
					str="이 아이디는 사용하실 수 있습니다.";
				}else{
					str="알 수 없는 오류입니다"
				}
				$("#showData").html(str);
			},
			error:function(){
				$("@showData").text("에러");
			}
		});
	}
	
	//별명 검사하는 함수
	function check_nick() {
		window
				.open("check_nick.jsp?nick=" + document.member_form.nick.value,
						"NICKcheck",
						"left=200,top=200,width=200,height=60,scrollbars=no,resizable=yes");
	}
	//아이디, 비번 등 입력창이 비었으면 화면에 메시지를 띄우면서 커서(포커스)가 입력할 곳으로 이동
	function check_input() {
		//만약 member_form의 id입력창이 비어있다면
		if (!document.member_form.id.value) {

			document.member_form.id.focus();
			return;
		}
		//만약 member_form의 비밀번호 입력창이 비어있다면
		if (!document.member_form.passwd.value) {

			document.member_form.passwd.focus();
			return;
		}
		//만약 member_form의 비밀번호 확인 입력창이 비어있다면
		if (!document.member_form.passwd_confirm.value) {

			document.member_form.passwd_confirm.focus();
			return;
		}
		//만약 member_form의 이름 입력창이 비어있다면
		if (!document.member_form.name.value) {

			document.member_form.name.focus();
			return;
		}
		//비밀번호 입력값과 비밀번호 확인 입력값이 같은지 검사
		if (document.member_form.passwd.value != document.member_form.passwd_confirm.value) {
			// \n : 줄바꿈
			alert("비밀번호가 일치하지 않습니다.\n다시 입력해 주세요.");
			document.member_form.passwd.focus();
			document.member_form.passwd.select();
			return;
		}
		//위의 검사내용에 이상이 없다면 member_form의 정보를 DB에 전달함
		document.member_form.submit();

	}

	function reset_form() {
		document.member_form.id.value = "";
		document.member_form.passwd.value = "";
		document.member_form.passwd_confirm.value = "";
		document.member_form.name.value = "";
		document.member_form.id.focus();
		return;
	}

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
	<%@include file="top_login.jsp"%>
</header>

<div id="logo">
	<a href="index.jsp"><img src="img/helloonlygul.png" alt="로고"></a>
</div>
<div id="signup">
	<ul id="Sul">
		<form name="member_form" method="post" action="clientjoin">
			<li id="SulL" class="Sull">
				<ul>
					<li>
						<p><span>*</span>&nbsp;userID&nbsp;</p>
						<input type="text" name="id" id="userid" placeholder="UserID" required>
						<a href="#" onclick="checkId()" class="double">중복체크</a><br>
						 <span id="showData"></span>
					
					</li>
					<li>
						<p><span>*</span>&nbsp;password&nbsp;</p>
						<input type="password" name="passwd" required>
					</li>
					<li>
						<p><span>*</span>&nbsp;confirm password&nbsp;</p>
						<input type="password" name="passwd_confirm"  required>
					</li>
					<li>
						<p><span>*</span>&nbsp;name&nbsp;</p>
						<input type="text" name="name"required>
					</li>
					<li id="button">
						<button type="submit" class="btn-1">JOIN</button>
					</li>
				</ul>
			</li>
	</ul>
	</li>
	</form>
	</ul>
</div>
<%@include file="menu.jsp"%>
<div id="footer">ⓒCoding by LSG, Design by LMS, All Right Reserved</div>



</body>
</html>