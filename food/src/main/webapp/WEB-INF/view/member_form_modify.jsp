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
	background: url(img/loginbg.png) no-repeat;
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
	width: 55vw;
	max-height: 80vh;
	position: absolute;
	left: 50%;
	margin-left: -29.5vw;
	top: 47.5%;
	margin-top: -30vh;
	background-color: rgba(255, 255, 255, 0.03);
	box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.3);
	border-radius: 1vw 1vw 1vw 1vw;
	padding: 2.5vw;
}

#Sul {
	float: left;
	width: 55vw;
	margin: 0 auto;
	position: relative;
}

#SulL {
	width: 50%;
	border-right: 1px solid rgba(255, 255, 255, 0.5);
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
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: #fff !important;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

input[type=password] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: #fff !important;
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
	color: rgba(255, 255, 255, 0.8);
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
}

p {
	color: #eee;
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
	margin-left: 4.25vw;
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
	padding: 0.6vh 0.1vh;
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
/*  김태홍 추가 */
select{
    padding: 5px 5px;
    margin: 10px 0px;
    border: none;
    color: rgba(255, 255, 255, 0.8);
    width: 262px;
    height: 42px;
    background: transparent;
    border: 1px solid rgba(255, 255, 255, 0.6);
    border-radius: 2px;
 }
/*  김태홍 추가 */
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	//아이디, 비번 등 입력창이 비었으면 화면에 메시지를 띄우면서 커서(포커스)가 입력할 곳으로 이동
	function check_input() {
		//만약 member_form의 이름 입력창이 비어있다면
		if (!document.member_form.name.value) {

			document.member_form.name.focus();
			return;
		}
		//만약 member_form의 닉네임 입력창이 비어있다면
		if (!document.member_form.nick.value) {

			document.member_form.nick.focus();
			return;
		}
		//만약 member_form의 전화번호 입력창이 비어있다면
		if (!document.member_form.hp2.value) {

			document.member_form.hp2.focus();
			return;
		}
		if (!document.member_form.hp3.value) {

			document.member_form.hp3.focus();
			return;
		}
		//비밀번호 입력값과 비밀번호 확인 입력값이 같은지 검사
		if (document.member_form.pass.value != document.member_form.pass_confirm.value) {
			// \n : 줄바꿈
			alert("비밀번호가 일치하지 않습니다.\n다시 입력해 주세요.");
			document.member_form.pass.focus();
			document.member_form.pass.select();
			return;
		}
		//위의 검사내용에 이상이 없다면 member_form의 정보를 DB에 전달함
		document.member_form.submit();

	}

	function reset_form() {
		document.member_form.id.value = "";
		document.member_form.pass.value = "";
		document.member_form.pass_confirm.value = "";
		document.member_form.name.value = "";
		document.member_form.nick.value = "";
		document.member_form.hp1.value = "010";
		document.member_form.hp2.value = "";
		document.member_form.hp3.value = "";
		document.member_form.email1.value = "";
		document.member_form.email2.value = "";
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
	<%@include file="/top_login.jsp"%>
</header>

<div id="logo">
	<a href="index.jsp"><img src="img/helloonlygul.png" alt="로고"></a>
</div>
<div id="signup">
	<ul id="Sul">
		<form name="member_form" method="post" action="clientmodify">
			<li id="SulL" class="Sull">
				<ul>
					<li>
						<p>
							<span>*</span>&nbsp;아이디&nbsp;
						</p> <input type="text" name="id" readonly="readonly" value="${dto.id}" />
					</li>
					<li>
						<p>
							<span>*</span>&nbsp;이름&nbsp;
						</p> <input type="text" name="name" readonly="readonly" value="${dto.name}" />
					</li>
					<li>
						<p>
							<span>*</span>&nbsp;나이&nbsp;
						</p>
						<input type="number" name="age" placeholder="......" required value="${dto.age}">세
					</li>
					<li>
						<p>
							<span>*</span>&nbsp;성별&nbsp;
						</p>
						<select name="gen">
							<option value="${dto.gen}" selected="selected">${dto.gen}</option>
							<option value="남">남자</option>
							<option value="여">여자</option>
						</select>
					</li>
					<li>
						<p>
							<span>*</span>&nbsp;키&nbsp;
						</p> 
						<input type="number" name="height" placeholder="......" required value="${dto.height}">cm
					</li>
					<li>
						<p>
							<span>*</span>&nbsp;체중&nbsp;
						</p> 
						<input type="number" name="weight" placeholder="......" required value="${dto.weight}">kg
					</li>
					<li>
						<p>
							<span>*</span>&nbsp;목적&nbsp;
						</p> 
						<select name="purpose">
							<option value="${dto.purpose}" selected="selected">${dto.purpose}</option>
							<option value="없음">없음</option>
							<option value="체중감량">체중감량</option>
							<option value="체중증량">체중증량</option>
							<option value="채식">채식</option>
							<option value="고단백식">고단백식</option>
							<option value="저탄수화물식">저탄수화물식</option>
							<option value="저지방식">저지방식</option>
						</select>
					</li>
				</ul>
			</li>
			<li id="SulR" class="Sull">
				<ul>
					<li>
						<p>
							<span>*</span>&nbsp;활동량&nbsp;
						</p> 
						<select name="active">
							<option value="${dto.active}" selected="selected">${dto.active}</option>
							<option value="상">심한 활동정도</option>
							<option value="중">중정도 활동정도</option>
							<option value="하">가벼운 활동정도</option>
					</select>
					</li>
					<li>
						<p>
							<span>*</span>&nbsp;피해야할 음식 1&nbsp;
						</p> 
						<select name="hate1">
							<option value="${dto.hate1}" selected="selected">${dto.hate1}</option>
							<option value="없음">없음</option>
							<option value=갑각류>갑각류</option>
							<option value=견과류>견과류</option>
							<option value=밀가루>밀가루</option>
							<option value="콩">콩</option>
							<option value="우유">우유</option>
					</select>
					</li>
					<li>
						<p>
							<span>*</span>&nbsp;피해야할 음식 2&nbsp;
						</p> 
						<select name="hate2">
							<option value="${dto.hate2}" selected="selected">${dto.hate2}</option>
							<option value="없음">없음</option>
							<option value=갑각류>갑각류</option>
							<option value=견과류>견과류</option>
							<option value=밀가루>밀가루</option>
							<option value="콩">콩</option>
							<option value="우유">우유</option>
					</select>
					</li>
					<li>
						<p>
							<span>*</span>&nbsp;피해야할 음식 3&nbsp;
						</p>
						<select name="hate3">
							<option value="${dto.hate3}" selected="selected">${dto.hate3}</option>
							<option value="없음">없음</option>
							<option value=갑각류>갑각류</option>
							<option value=견과류>견과류</option>
							<option value=밀가루>밀가루</option>
							<option value="콩">콩</option>
							<option value="우유">우유</option>
					</select>
					</li>
					<li>
						<p>
							<span>*</span>&nbsp;피해야할 음식 4&nbsp;
						</p>
						<select name="hate4">
							<option value="${dto.hate4}" selected="selected">${dto.hate4}</option>
							<option value="없음">없음</option>
							<option value=갑각류>갑각류</option>
							<option value=견과류>견과류</option>
							<option value=밀가루>밀가루</option>
							<option value="콩">콩</option>
							<option value="우유">우유</option>
					</select>
					</li>
					<li>
						<p>
							<span>*</span>&nbsp;피해야할 음식 5&nbsp;
						</p>
						<select name="hate5">
							<option value="${dto.hate5}" selected="selected">${dto.hate5}</option>
							<option value="없음">없음</option>
							<option value=갑각류>갑각류</option>
							<option value=견과류>견과류</option>
							<option value=밀가루>밀가루</option>
							<option value="콩">콩</option>
							<option value="우유">우유</option>
					</select>
					</li>
					<li id="button">
						<button type="submit" class="btn-1">JOIN</button>
					</li>
				</ul>
			</li>
		</form>
	</ul>

</div>

<%@include file="/menu.jsp"%>
<div id="footer">ⓒCoding by LSG, Design by LMS, All Right
	Reserved</div>



</body>
</html>