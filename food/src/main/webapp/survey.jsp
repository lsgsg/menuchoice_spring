<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="css/style.css">

<link href="css/maincss.css" rel="stylesheet" type="text/css">
<style>
#logo {
    width: 15vh;
    position: fixed;
    top: 3.4vh;
    left: 5.8vw;
    z-index: 99;
}
#alertBox{width:100vw; height:100vh; background-color:rgba(0,0,0,0.65); position:fixed; z-index:9999; top:0; left:0;}
#alert{width:25vw; height:20vw; position:absolute; top:45%; left:50%; margin-left:-12.5vw; margin-top:-10vw; background-color:#efefef;
border-radius:20px; overflow: hidden; text-align:center;}
#alert > span { display:block; padding:50px; font-weight:500; font-size:20px; color:#666; line-height:30px; }
#alert > p {height:20%; width:100%; position:absolute; bottom:0; background-color:#bacf8c;}
#alert > p > a {display: block; float:left; width:50%; height:100%; line-height:80px; color:#fff; font-weight:bold; font-size:20px; text-align: center;}
#alert > p > a:hover { color: #dc6e77;}

#alertBox2{width:100vw; height:100vh; background-color:rgba(0,0,0,0.65); position:fixed; z-index:9999; top:0; left:0; display:none;}
#alert2{width:25vw; height:20vw; position:absolute; top:45%; left:50%; margin-left:-12.5vw; margin-top:-10vw; background-color:#efefef;
border-radius:20px; overflow: hidden; text-align:center;}
#alert2 > span { display:block; padding:50px; font-weight:500; font-size:20px; color:#666; line-height:30px; }
#alert2 > p {height:20%; width:100%; position:absolute; bottom:0; background-color:#bacf8c;}
#alert2 > p > a {display: block; float:left; width:50%; height:100%; line-height:80px; color:#fff; font-weight:bold; font-size:20px; text-align: center;}
#alert2 > p > a:hover { color: #dc6e77;}
#actTbl {/* display:inline-block; */ border-collapse: collapse; border : 1px solid #333; width:80%; margin: 20px auto;}
#actTbl tr {}
#actTbl tr th {height:6vh; vertical-align:middle; border:1px solid #333;}
#actTbl tr td{height:10vh; vertical-align:middle; border:1px solid #333;}
</style>
<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".no").click(function(){
		$("#alertBox").css("display","none");
	});
	$(".no2").click(function(){
		$("#alertBox2").css("display","none");
	});
	
	$("[class^='stpbtn_']").css({	
	"width":"120px",
	"height":"40px",
	"text-align":"center",
	"display" : "inline-block",
	"color" : "#fff",
	"font-weight":"bold",
	"background":"#f88491",
	"line-height":"38px",
	"border-radius":"5px",
	"cursor":"pointer"})
	
	$('.lastButton').click(function(){
		$("#alertBox2").css("display","block");
	})
	
	
})
function submit(){
	surveyFrm.action="survey";
	surveyFrm.method="GET";
	surveyFrm.submit();
}

function survey(){
	surveyFrm2.method="POST";
	surveyFrm2.submit();
}

function survey3(){
	surveyFrm.action="survey3";
	surveyFrm.method="GET";
	surveyFrm.submit();
}
</script>
</head>
<body>
<header>
<%@ include file="top_login.jsp" %>
<%@ include file="menu.jsp" %>
</header>
<div id="logo">
    <a href="main.jsp"><img src="img/helloonlygul.png" alt="로고"></a>
</div>

<c:if test="${userid == null}" >
	<div id="alertBox">
		<div id="alert">
			<span>회원가입 후 로그인을 하시면<br> 더 많은 정보를 얻으실 수 있습니다.<br> 로그인 하시겠습니까?</span>
			<p>
			<a class="yes" href="login_form.jsp">예</a>
			<a href="#" class="no"> 아니오 </a>
			</p>
		</div>
	</div>
</c:if>
<c:if test="${userid != null}" >
	<div id="alertBox">
		<div id="alert">
			<span>회원가입 당시 작성하신<br> 정보가 있습니다.<br> 기존정보 그대로 메뉴추천을 해드릴까요?</span>
			<p>
			<a href="#" onclick="javascript:survey()">예</a>
			<a href="#" class="no"> 아니오 </a>
			</p>
		</div>
	</div>
	<form action="survey" name="surveyFrm2">
		<input type="hidden" value="${userid}" name="id">
	</form>
</c:if>

	<div id="alertBox2">
		<div id="alert2">
			<span>
				모든 설문조사가 완료되었습니다.<br>
				추천메뉴를 보시겠습니까?
			</span>
			<p>
			<c:if test="${userid == null}" > <!-- 로그인 안되어 있으면 -->
			<a class="yes2" href="#" onclick="javascript:submit()">예</a>
			</c:if>
			<c:if test="${userid != null}" >
			<a class="yes2" href="#" onclick="javascript:survey3()">예</a>	
			</c:if>
			<a href="#" class="no2"> 아니오 </a>
			</p>
		</div>
	</div>
	
	<h1>
		<b>헬로키친</b><br><br> Basic Survey
	</h1>
	<!-- 33번 부터 206번 라인까지 디자인 태그니깐 신경쓰지 말고 작업하시오~  -->
	<div class="step-nav">
		<div class="step first">
			<div class="radial-progress active" id="click_1" data-index="0">
				<div class="circle">
					<div class="mask full"><div class="fill"></div></div>
					<div class="mask half"> 
						<div class="fill"></div>
						<div class="fill fix"></div>
					</div>
					<div class="shadow"></div>
				</div>
				<div class="inset"><div class="inner-circle"></div></div>
			</div>
			<p>1</p>
		</div>
		
		
		<div class="step">
			<div class="line"><div class="progress"></div></div>
			<div class="radial-progress" id="click_2" data-index="1">
				<div class="circle">
					<div class="mask full"><div class="fill"></div></div>
					<div class="mask half">
						<div class="fill"></div>
						<div class="fill fix"></div>
					</div>
					<div class="shadow"></div>
				</div>
				<div class="inset">
					<div class="inner-circle"></div>
				</div>
			</div>
			<p>2</p>
		</div>
		
		
		<div class="step">
			<div class="line">
				<div class="progress"></div>
			</div>
			<div class="radial-progress" id="click_3" data-index="2">
				<div class="circle">
					<div class="mask full">
						<div class="fill"></div>
					</div>
					<div class="mask half">
						<div class="fill"></div>
						<div class="fill fix"></div>
					</div>
					<div class="shadow"></div>
				</div>
				<div class="inset">
					<div class="inner-circle"></div>
				</div>
			</div>
			<p>3</p>
		</div>
		
		
		<div class="step">
			<div class="line">
				<div class="progress"></div>
			</div>
			<div class="radial-progress" id="click_4" data-index="3">
				<div class="circle">
					<div class="mask full">
						<div class="fill"></div>
					</div>
					<div class="mask half">
						<div class="fill"></div>
						<div class="fill fix"></div>
					</div>
					<div class="shadow"></div>
				</div>
				<div class="inset">
					<div class="inner-circle"></div>
				</div>
			</div>
			<p>4</p>
		</div>
		
		
		<div class="step">
			<div class="line">
				<div class="progress"></div>
			</div>
			<div class="radial-progress" id="click_5" data-index="4">
				<div class="circle">
					<div class="mask full">
						<div class="fill"></div>
					</div>
					<div class="mask half">
						<div class="fill"></div>
						<div class="fill fix"></div>
					</div>
					<div class="shadow"></div>
				</div>
				<div class="inset">
					<div class="inner-circle"></div>
				</div>
			</div>
			<p>5</p>
		</div>
		
		
		<div class="step">
			<div class="line">
				<div class="progress"></div>
			</div>
			<div class="radial-progress" id="click_6" data-index="5">
				<div class="circle">
					<div class="mask full">
						<div class="fill"></div>
					</div>
					<div class="mask half">
						<div class="fill"></div>
						<div class="fill fix"></div>
					</div>
					<div class="shadow"></div>
				</div>
				<div class="inset">
					<div class="inner-circle"></div>
				</div>
			</div>
			<p>6</p>
		</div>
		
		
		<div class="step">
			<div class="line">
				<div class="progress"></div>
			</div>
			<div class="radial-progress" id="click_7" data-index="6">
				<div class="circle">
					<div class="mask full">
						<div class="fill"></div>
					</div>
					<div class="mask half">
						<div class="fill"></div>
						<div class="fill fix"></div>
					</div>
					<div class="shadow"></div>
				</div>
				<div class="inset">
					<div class="inner-circle"></div>
				</div>
			</div>
			<p>7</p>
		</div>
		
		
		<div class="step">
			<div class="line">
				<div class="progress"></div>
			</div>
			<div class="radial-progress" id="click_8" data-index="7">
				<div class="circle">
					<div class="mask full">
						<div class="fill"></div>
					</div>
					<div class="mask half">
						<div class="fill"></div>
						<div class="fill fix"></div>
					</div>
					<div class="shadow"></div>
				</div>
				<div class="inset">
					<div class="inner-circle"></div>
				</div>
			</div>
			<p>8</p>
		</div>
	</div>
	<!-- 33번 부터 206번 라인까지 디자인 태그니깐 신경쓰지 말고 작업하시오~  -->

	<form name="surveyFrm">

		<div class="copy-holder">
		
				<div class="step_wrap step-1 active clearfix">
					
					<p class="step_input">
						<span>Q. 당신의 성별은 ?</span>
						<span>
							<input type="radio" name="gen" id="gen1" class="gender1" value="남">
							<label for="gen1"> 남 </label>
							<input type="radio" name="gen" id="gen2" class="gender2" value="여">
							<label for="gen2"> 여</label>
							<i id="disp1"></i>
						</span>
						<span class="stpbtn_1"> NEXT </span>
					</p>
				</div>
				
				
				<div class="step_wrap step-2 clearfix">
					<p class="step_input">
						<span>Q. 당신의 나이는?</span>
						<span>
							<input type="text" name="age" placeholder="숫자만 입력해주세요. ex) 25 ">&nbsp;&nbsp;살
						</span>
						<span class="stpbtn_2"> NEXT</span>
					</p>
				</div>
				
				<div class="step_wrap step-3 clearfix">
					<p class="step_input">
						<span>Q. 당신의 키?</span>
						<span>
							<input type="text" name="height" placeholder="숫자만 입력해주세요. ex) 160 ">&nbsp;&nbsp;cm 
						</span>
						<span class="stpbtn_3"> NEXT</span>
					</p>
				</div>
				
				<div class="step_wrap step-4 clearfix">
					<p class="step_input">
						<span>Q. 당신의 몸무게?</span>
						<span>
							<input type="text" name="weight" placeholder="숫자만 입력해주세요. ex) 59">&nbsp;&nbsp;kg 
						</span>
						<span class="stpbtn_4"> NEXT</span>
					</p>
				</div>
				
				<div class="step_wrap step-5 clearfix" style = "margin-bottom: 100px;">
					<p class="step_input">
						<span>Q. 당신의 활동량은 어느정도 입니까?</span>
						<span>
							<input type="radio" name="active" id="active1" class="act1" value="하">
							<label for="active1"> 가벼운활동정도 </label>
							<input type="radio" name="active" id="active2"class="act2" value="중">
							<label for="active2"> 중정도 활동정도 </label>
							<input type="radio" name="active" id="active3"class="act3" value="상">
							<label for="active3"> 심한 활동정도 </label>
							
							
						</span>
						
						<span class="stpbtn_5">NEXT </span>
						
					</p>
					<table border= "1" id="actTbl">
								<tr>
									<th>활동정도</th><th>예</th>
								</tr>
								<tr>
									<td>가벼운<br>활동정도</td> <td> 앉아서 하는 일, 사무직 일, 타이핑 치기등</td>
								</tr>
								<tr>
									<td>중정도<br>활동정도</td> <td> 보통 속도로 걷기, 빨래, 청소, 아이보기, 경공업, 가사노동 등</td>
								</tr>
								<tr>
									<td>심한<br>활동정도</td> <td> 등산, 무거운짐 운반, 빠르게 달리기, 농사일, 광산일, 운동선수 등</td>
								</tr>
					</table>
				</div>
				
				<div class="step_wrap step-6 clearfix">
					
					<p class="step_input">
						<span>Q. 어떠한 이유로 위 사이트에 들어오셨나요?</span>
						<span>
							<input type="radio" name="purpose" id="purpose1" class="pur1" value="체중감량">
							<label for="purpose1">체중감량 </label> 
							<input type="radio" name="purpose" id="purpose2" class="pur2" value="체중증량">
							<label for="purpose2"> 체중증량 </label> 
							<input type="radio" name="purpose" id="purpose3" class="pur3" value="채식"> 
							<label for="purpose3"> 채식</label> 
							<input type="radio" name="purpose" id="purpose4"class="pur4" value="없음">
							<label for="purpose4"> 없음 </label> 
							<input type="radio" name="purpose" id="purpose5" class="pur5"value="고단백식"> 
							<label for="purpose5"> 고단백식 </label> 
							<input type="radio" name="purpose" id="purpose6"class="pur6" value="저탄수화물식">
							<label for="purpose6">저탄수화물식 </label>
							<input type="radio" name="purpose" id="purpose7"class="pur7" value="저지방식"> 
							<label for="purpose7"> 저지방식 </label>
						</span>
						<span class="stpbtn_6"> NEXT</span>
					</p>
				</div>
				<div class="step_wrap step-7 clearfix">
					<p class="step_input">
						<span>Q. 어떠한 재료를 기피(싫어)하나요?</span>
						<span>
							<input type="text" name="hate1">
						</span>
						<span class="stpbtn_7">NEXT</span>
					</p>
				</div>
				
				<div class="step_wrap step-8 clearfix">
					<p class="step_input">
						<span>Q. 이름을 입력해주세요.</span>
						<span>
							<input type="text" name="name" value="">
						</span>
						<span class="lastButton">NEXT</span>
					</p>
				</div>

		</div>

	</form>

<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js'></script>
<script src="js/index.js"></script>


</body>
</html>