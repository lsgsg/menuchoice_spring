<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

*{margin:0; padding:0;}
li{list-style:none;}
a{text-decoration: none; color:#333;}
img{width:100%; height:100%;}
@import url('https://fonts.googleapis.com/css?family=Raleway');
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
html, body{font-family: "Nanum Gothic", sans-serif; height:100%; width:100%; overflow-x:hidden}
body{
	background-color:#333;
	/*display:flex;*/
	/*flex-direction:column;
		justify-content:center;
	align-items:center;*/
	background:url(img/intro_index2.jpg) no-repeat;
	background-size:cover;
	
}
	
form{ width:400px; 
		height:300px; 
		position:absolute; 
		left:50%; 
		margin-left:-200px; 
		top:50%; 
		margin-top:-150px; 
		text-align:center;
		border: 1px solid rgba(255,255,255,0.6);
		}
h2{
	color:#fff;
	
	font-size:35px;
	width:20vh;
	height:auto;
	margin:2vh auto;
	}
input[type=text]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

input[type=password]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

input{
	height:35px;
	padding:5px 5px;
	margin:10px 0px;
	background-color:#e0dada;
	border:none;
	}

.btnfos {
  color: #fff;
  cursor: pointer;
  background-color:#85af4b;
  font-size: 16px;
  font-weight: bold;
  width:250px;
	height:40px;
	padding:5px 5px;
	margin:10px 10px;
  border:none;
  
  position: relative;
  text-transform: uppercase;
 }
  .btnfos-5 {
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

.btnfos-5:hover {
  border: 1px solid;
  box-shadow: inset 0 0 20px rgba(255, 255, 255, 0.5), 0 0 20px rgba(255, 255, 255, 0.2);
  outline-offset: 15px;
  outline-color: rgba(255, 255, 255, 0);
  text-shadow: 1px 1px 2px #427388;
}


@-webkit-keyframes shake{
	from,to{
		transform:translate3d(0,0,0);
		}
	10%,30%,50%,70%,90%{
		transform:translate3d(-10px,0,0);
		}
	20%,40%,60%,80%{
		transform:translate3d(10px,0,0);
		}
	}
.shake{
	animation-name:shake;
	animation-duration:1s;
	
	}


header{width:100vw; height:auto; position:fixed; top:3vh; right:4vh; z-index:99}

#footer { color:#eee; position:fixed; bottom:1vh; z-index:99; font-size:10px; width:100%; height:1.5vh; text-align:center; }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(e) {
    

	$('#menu').click(function(){
		$('#menub').css({'display':'block'})
		})	
	$('#close').click(function(){
		$('#menub').css({'display':'none'})
		});
		
	
});
</script>
</head>
<body>
<form name="member_form" method="post" action="login" id="shake">
	<h2><img src="img/helloonlygul.png"></h2>
    <input name="id" type="text" placeholder="Username" class="login_input" required/>
        <input name="passwd" type="password" placeholder="Password" class="login_input" required/>
        <button type="submit" class="btnfos btnfos-5">Login</button>
</form>
<header>
<%@ include file="top_login.jsp" %>
<%@ include file="menu.jsp" %>
</header>

<div id="footer">
ⓒCoding by LSG, Design by LMS, All Right Reserved

</div>


</body>
</html>