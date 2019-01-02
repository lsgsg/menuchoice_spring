<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 메뉴를 추천합니다.</title>
<link rel="stylesheet" href="css/style.css">
<link href="css/view_imgcss.css" rel="stylesheet" type="text/css">
<style>
#viewCol {
	width: 62.5vw;
	margin: 15vh auto;
	box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.3);
}

#view_title {
	width: 100%;
	height: 25vh;
	box-sizing: border-box;
	padding: 40px;
}

#view_title h3 {
	width: 100%;
	height: 80px;
	line-height: 50px;
	color: #333;
}

#view_title a {
	padding: 5px 7px;
	border: 1px solid #333;
	border-radius: 10px;
}

#view_title a:hover {
	background-color: #bacf8c
}

#view_input {
	width: 50%;
	margin: 0 auto;
	height: 10vh;
	margin-bottom: 100px;
}

#view_input input[type=radio] {
	display: none;
}

#view_input input[type=radio] ~ label span {
	font-size: 20px;
	color: #fff
}

#view_input input[type=radio] ~ label {
	display: block;
	height: 100%;
	line-height: 10vh;
	width: 50%;
	float: left;
	text-align: center;
	cursor: pointer; /* background-color:#f4a9af */
}

#view_input #recommend:checked+label span {
	font-size: 20px;
	color: #bacf8c
}

#view_input #recommend:checked+label {
	border-bottom: 3px solid #bacf8c;
}

#view_input #purpose:checked+label span {
	font-size: 20px;
	color: #f4a9af
}

#view_input #purpose:checked+label {
	border-bottom: 3px solid #f4a9af;
}

#view_content {
	width: 100%;
}

.semicircle_out {
	width: 100%;
	height: 31.25vw;
	position: relative;
}

.semicircle {
	width: 100%;
	height: 31.25vw;
	transform-origin: top center;
	border-bottom-left-radius: 100%;
	border-bottom-right-radius: 100%;
	border-top: 5px solid #bacf8c;
	border-bottom: 15px solid #bacf8c;
	overflow: hidden;
	background-image: url(img/스테이크.jpg);
	background-attachment: fixed;
	/*     background-size: 62.5vw; */
	background-repeat: no-repeat;
	background-position: center bottom;
}

.backcolor {
	width: 100%;
	height: 100%;
	background-color: rgb(0, 0, 0, 0.6);
	color: #fff;
	font-weight: bold;
	font-size: 30px;
	text-align: center;
	line-height: 31vw;
}

.backcolor:hover {
	background-color: rgb(0, 0, 0, 0);
	color: #f4a9af;
	cursor: pointer;
}

.searchNaver {
	width: 100%;
	height: 7vh;
	position: absolute;
	bottom: -3.5vh;
	text-align: center;
	z-index: 55
}

.searchNaver .randomChoiceMenu {
	border-radius: 20px;
	display: block;
	width: 200px;
	padding: 10px 0;
	margin: 0 auto;
	background-color: #fff;
	border: 3px solid #bacf8c
}

.tuplePlus {
	width: 3vh;
	height: 3vh;
	position: absolute;
	bottom: -6vh;
	left: 50%;
	margin-left: -1.5vh;
}

.menuTable {
	width: 100vw;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	background-color: rgb(0, 0, 0, 0.6);
	z-index: 999;
	overflow: scroll;
	display: none;
}

.menuTable h3 {
	color: #bacf8c;
	text-align: center;
	margin-top: 10vh;
	font-size: 30px;
}

.menuTable table {
	width: 85%;
	margin: 10vh auto;
	background-color: #efefef;
	border-radius: 1vw 1vw 0 0vw;
	overflow: hidden;
	border-collapse: collapse;
	font-size: 14px;
}

.menuTable table tr th, td {
	padding: 20px;
}

.menuTable table tr td {
	border-bottom: 1px solid #bacf8c
}

.menuTable table tr:nth-child(1) {
	background-color: #bacf8c;
	color: #fff;
	font-weight: bold;
}

.menuTable table tr th {
	height: 7vh;
}

.menuTable table tr th:nth-child(1) {
	width: 5%
}

.menuTable table tr th:nth-child(2) {
	width: 8%
}

.menuTable table tr th:nth-child(3) {
	width: 8%
}

.menuTable table tr th:nth-child(4) {
	
}

.menuTable table tr th:nth-child(5) {
	
}

.menuTable table tr th:nth-child(6) {
	
}

.menuTable table tr th:nth-child(7) {
	
}

.menuTable table tr th:nth-child(8) {
	
}

.menuTable table tr th:nth-child(9) {
	
}

.menuTable table tr th:nth-child(10) {
	
}

.menuTable table tr th:nth-child(11) {
	
}

.menuTable table tr th:nth-child(12) {
	
}

.menuTable table tr th:nth-child(13) {
	
}

.menuTable table tr th:nth-child(14) {
	width: 15%
}

.menuTable table tr td {
	text-align: center;
}

.menuTable table tr td:last-child {
	text-align: left;
}

.menuTable>a {
	position: fixed;
	top: 3vh;
	right: 3vh;
	width: 5vh;
	height: 5vh;
}

.trtr:hover {
	background-color: #f4a9af;
	color: #fff;
}

#purpose_menu {
	display: none;
}

#purpose_menu .semicircle {
	border-bottom: 15px solid #f4a9af;
	border-top: 5px solid #f4a9af;
}

#purpose_menu  .searchNaver .randomChoiceMenu {
	border: 3px solid #f4a9af
}

.menuTable2 {
	width: 100vw;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	background-color: rgb(0, 0, 0, 0.6);
	z-index: 999;
	overflow: scroll;
	display: none;
}

.menuTable2 h3 {
	color: #bacf8c;
	text-align: center;
	margin-top: 10vh;
	font-size: 30px;
}

.menuTable2 table {
	width: 85%;
	margin: 10vh auto;
	background-color: #efefef;
	border-radius: 1vw 1vw 0 0vw;
	overflow: hidden;
	border-collapse: collapse;
	font-size: 14px;
}

.menuTable2 table tr th, td {
	padding: 20px;
}

.menuTable2 table tr td {
	border-bottom: 1px solid #bacf8c
}

.menuTable2 table tr:nth-child(1) {
	background-color: #bacf8c;
	color: #fff;
	font-weight: bold;
}

.menuTable2 table tr th {
	height: 7vh;
}

.menuTable2 table tr th:nth-child(1) {
	width: 5%
}

.menuTable2 table tr th:nth-child(2) {
	width: 8%
}

.menuTable2 table tr th:nth-child(3) {
	width: 8%
}

.menuTable2 table tr th:nth-child(4) {
	
}

.menuTable2 table tr th:nth-child(5) {
	
}

.menuTable2 table tr th:nth-child(6) {
	
}

.menuTable2 table tr th:nth-child(7) {
	
}

.menuTable2 table tr th:nth-child(8) {
	
}

.menuTable2 table tr th:nth-child(9) {
	
}

.menuTable2 table tr th:nth-child(10) {
	
}

.menuTable2 table tr th:nth-child(11) {
	
}

.menuTable2 table tr th:nth-child(12) {
	
}

.menuTable2 table tr th:nth-child(13) {
	
}

.menuTable2 table tr th:nth-child(14) {
	width: 15%
}

.menuTable2 table tr td {
	text-align: center;
}

.menuTable2 table tr td:last-child {
	text-align: left;
}

.menuTable2>a {
	position: fixed;
	top: 3vh;
	right: 3vh;
	width: 5vh;
	height: 5vh;
}

.recommendOther {
	width: 100%;
	height: 40vh;
}

.recommendOther table {
	width: 70%;
	margin: 15vh auto;
}

.recommendOther table tr td {
	vertical-align: middle;
}

.recommendOther table tr td span {
	color: #333;
	font-weight: bold
}

.recommendOther table tr td a {
	padding: 10px 15px;
	border-radius: 30px;
	box-shadow: 3px 3px 3px rgb(0, 0, 0, 0.3);
	cursor: pointer;
}

.recommendOther table tr td:nth-child(2) {
	text-align: center;
}

#alertBox {
	width: 100vw;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.65);
	position: fixed;
	z-index: 9999;
	top: 0;
	left: 0;
	display: none;
}

#alert {
	width: 25vw;
	height: 20vw;
	position: absolute;
	top: 45%;
	left: 50%;
	margin-left: -12.5vw;
	margin-top: -10vw;
	background-color: #efefef;
	border-radius: 20px;
	overflow: hidden;
	text-align: center;
}

#alert>span {
	display: block;
	padding: 50px;
	font-weight: 500;
	font-size: 20px;
	color: #666;
	line-height: 30px;
	font-size: 14px;
}

#alert>p {
	height: 20%;
	width: 100%;
	position: absolute;
	bottom: 0;
	background-color: #bacf8c;
}

#alert>p>a {
	display: block;
	float: left;
	width: 50%;
	height: 100%;
	line-height: 80px;
	color: #fff;
	font-weight: bold;
	font-size: 20px;
	text-align: center;
	cursor: pointer;
}

#alert>p>a:hover {
	color: #dc6e77;
}

.myBody {
	position: fixed;
	top: 0;
	left: 0;
	width: 100vw;
	background-color: rgba(0, 0, 0, 0.6);
	z-index: 60;
	height: 100vh;
}

.myBody p span {
	font-weight: bold;
	font-size: 25px;
}

.myBody p {
	width: 100%;
	height: 10vh;
	background-color: #f4a9af;
	color: #fff;
	line-height: 10vh;
	box-sizing: border-box;
	padding: 0px 40px;
}

.myBodyInfo_1 {
	width: 62.5vw;
	margin: 7vh auto;
	box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.3);
	background-color: #fff;
	height: 80vh;
	border-radius: 1vw;
	overflow: hidden;
	text-align: center;
}

.myBodyInfo_1>div {
	width: 60%;
	margin: 0 auto;
	height: 31vh;
}

.myBodyInfo_1 table {
	float: left;
	width: 47.5%;
	border-collapse: collapse;
}

.myBodyInfo_1 table:nth-child(2) {
	margin-left: 5%;
}

.myBodyInfo_1 table tr {
	height: 2vh;
}

.myBodyInfo_1 table tr td {
	text-align: center;
	padding: 13px;
}

.mybodyInfo {
	padding: 10px 12px !important;
	border: none !important;
	background-color: #f4a9af;
	color: #fff;
	font-weight: bold;
}

.mybodyInfo2 {
	padding: 10px 12px !important;
	border: none !important;
	background-color: #f4a9af;
	color: #fff;
	font-weight: bold;
}

.showMenu {
	padding: 10px 25px;
	color: #fff;
	font-weight: bold;
	background-color: #bacf8c;
	border-radius: 10px;
	margin-top: 15px;
}

.reChoise {
	padding: 10px 25px;
	color: #fff;
	font-weight: bold;
	background-color: #bacf8c;
	border-radius: 10px;
	margin-top: 15px;
}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(e) {

		$('.atag').css({
			'border' : '1.4px solid #9ccd62'
		});
		$('.atag').css({
			'color' : '#9ccd62'
		});
		$('.close').click(function() {
			$('.menuTable').css({
				"display" : "none"
			})
		})

		$('.close2').click(function() {
			$('.menuTable2').css({
				"display" : "none"
			})
		})
		$('.other_menu').click(function() {
			$('.menuTable').css({
				"display" : "block"
			})
		})

		$('.other_menu2').click(function() {
			$('.menuTable2').css({
				"display" : "block"
			})
		})

		$('#view_input input[type=radio]').click(function() {
			if ($('#recommend').is(":checked")) {
				//alert("추천메뉴보이기")
				$("#purpose_menu").css("display", "none");
				$("#recommend_menu").css("display", "block");
			} else if ($('#purpose').is(":checked")) {
				//alert("목적메뉴보이기")
				$("#recommend_menu").css("display", "none");
				$("#purpose_menu").css("display", "block");
			}
		})

		$(".no").click(function() {

			$("#alertBox").css("display", "none");
		})
		$(".showMenu").click(function() {
			$('.myBody').css("display", "none");
		})

		$(".mybodyInfo").click(function() {
			$('.myBody').css("display", "block");
		})

	});

	function loginCheck() {
		$("#alertBox").css("display", "block");
	}
	
	function processPick(ifYes, id){
		//alert($(".randomPick").val());
 		//alert($("input[name=purMenu]").val());
 		//alert($("input[name=recMenu]").val());
		//alert(ifYes + " " + id + " " + $(".randomPick").val());
 		//var no = $(".randomPick").val();
 		var no = $("input[name=purMenu]").val();
 		//document.choiceMenu1.value() = document.purMenu.value;
		location.href = "addsuggest?ifYes=" + ifYes + "&id=" + id + "&no=" + no;
	}
	
	function processPick2(ifYes, id){
 		var no = $("input[name=recMenu]").val();
		location.href = "addsuggest?ifYes=" + ifYes + "&id=" + id + "&no=" + no;
	}
</script>
</head>
<body id="viewMenu">
	<div id="wrap">
		<header>
			<%@ include file="../../top_login.jsp"%>
			<%@ include file="../../menu.jsp"%>
		</header>

		<div id="logo">
			<a href="main.jsp"><img src="img/helloonlygul.png" alt="로고"></a>
		</div>
		<c:if test="${userid == null}">
			<div id="alertBox">
				<div id="alert">
					<span>회원가입 멤버에게만 제공되는 서비스 입니다.<br> 내 몸에 대해 더 알고 싶고 <br>
						더 많은 음식 정보를 알고 싶으시다면 <br> 회원가입을 해주시길 바랍니다.
					</span>
					<p>
						<a class="yes" href="login_form.jsp">예</a> <a class="no">아니오 </a>
					</p>
				</div>
			</div>
		</c:if>

		<c:if test="${userid != null}">
			<div class="myBody">
				<div class="myBodyInfo_1">
					<p class="myBodyHeader">
						<span>${survey.name}</span> 님의 분석결과 입니다.
					</p>

					<br> <br> 저희 메뉴초이스는 <br> <b>${survey.name}</b>님의
					나이대와 신체정보를 종합하여 <br> 본인에게 가장 알맞은 메뉴를 선별해드립니다.<br> <br>
					${survey.name}님의<b> BMI는 ${list[5]}</b>이므로 <b>${list[7]}</b>에
					해당합니다. <br> <b>키 ${survey.height}</b>에 맞는 <b>표준체중은
						${list[8]}</b> 이므로 <br> <b>${survey.name}</b>님의 건강한 한끼를 위해선 <br>
					<br> <b>한끼 칼로리 ${list[12]}</b> 를 넘지않고,<br> 한끼에 필요한<b>
						탄수화물양 (${list[13]}), 단백질양(${list[14]}), 지방량(${list[15]})</b>을 모두
					고려해야합니다. <br> <b>${survey.name}</b>님이 작성하신 활동정도에 따른 <b>기초대사량은
						${list[6]}kcal</b> 입니다. <br> <br>
					<div>
						<table border="1">
							<tr>
								<td colspan="2">"한끼" 필요영양기준</td>
							</tr>
							<tr>
								<td>열량</td>
								<td>${list[12]}kcal</td>
							</tr>
							<tr>
								<td>지방</td>
								<td>${list[15]}g</td>
							</tr>
							<tr>
								<td>탄수화물</td>
								<td>${list[13]}g</td>
							</tr>
							<tr>
								<td>단백질</td>
								<td>${list[14]}g</td>
							</tr>

						</table>
						<table border="1">
							<tr>
								<td colspan="2">"하루"필요영양기준</td>
							</tr>
							<tr>
								<td>열량</td>
								<td>${list[2]}kcal</td>
							</tr>
							<tr>
								<td>지방</td>
								<td>${list[3]}g</td>
							</tr>
							<tr>
								<td>탄수화물</td>
								<td>${list[4]}g</td>
							</tr>
							<tr>
								<td>단백질</td>
								<td>${list[11]}g</td>
							</tr>
						</table>

						<br> <span style="font-size: 10px;"> 출처 : 한국영양학협회</span>
					</div>

					<a href="#" class="showMenu">메뉴추천보기</a> <a href="survey.jsp"
						class="reChoise">설문조사다시하기</a>
				</div>
			</div>
		</c:if>
		<section>

			<c:if test="${userid != null}">
				<div class="menuTable">
					<h3>메뉴초이스 추천 메뉴</h3>
					<a class="close" href="#"><img src="img/cancel_green.png"
						alt="닫기"></a>
					<table>
						<tr>

							<th>번호</th>
							<th>식품군</th>
							<th>식품이름</th>
							<th>1회제공량(g)</th>
							<th>열량(kcal)</th>
							<th>탄수화물(g)</th>
							<th>단백질(g)</th>
							<th>지방(g)</th>
							<th>당류(g)</th>
							<th>나트륨(mg)</th>
							<th>콜레스테롤(mg)</th>
							<th>포화지방산(g)</th>
							<th>트랜스지방산(g)</th>
							<th>재료</th>

						</tr>
						<c:set var="i" value="0" />
						<c:forEach var="d2" items='${dto2}'>
							<c:if test="${random == i}">
								<tr
									style="background-color: #d45b65; color: #fff; font-weight: bold">
									<td>${d2.no}</td>
									<td>${d2.name}</td>
									<td>${d2.groups}</td>
									<td>${d2.once}</td>
									<td>${d2.kcal}</td>
									<td>${d2.tan}</td>
									<td>${d2.dan}</td>
									<td>${d2.gi}</td>
									<td>${d2.dang}</td>
									<td>${d2.na}</td>
									<td>${d2.col}</td>
									<td>${d2.powha}</td>
									<td>${d2.trans}</td>
									<td>${d2.jae}</td>
								</tr>
							</c:if>
							<tr class="trtr">
								<td>${d2.no}</td>
								<td>${d2.name}</td>
								<td>${d2.groups}</td>
								<td>${d2.once}</td>
								<td>${d2.kcal}</td>
								<td>${d2.tan}</td>
								<td>${d2.dan}</td>
								<td>${d2.gi}</td>
								<td>${d2.dang}</td>
								<td>${d2.na}</td>
								<td>${d2.col}</td>
								<td>${d2.powha}</td>
								<td>${d2.trans}</td>
								<td>${d2.jae}</td>
							</tr>
							<c:set var="i" value="${i+1}" />
						</c:forEach>
					</table>
				</div>

				<div class="menuTable2">
					<h3>${survey.name}님의목적에 맞는 추천 메뉴</h3>
					<a class="close2" href="#"><img src="img/cancel_green.png"
						alt="닫기"></a>
					<table>
						<tr>

							<th>번호</th>
							<th>식품군</th>
							<th>식품이름</th>
							<th>1회제공량(g)</th>
							<th>열량(kcal)</th>
							<th>탄수화물(g)</th>
							<th>단백질(g)</th>
							<th>지방(g)</th>
							<th>당류(g)</th>
							<th>나트륨(mg)</th>
							<th>콜레스테롤(mg)</th>
							<th>포화지방산(g)</th>
							<th>트랜스지방산(g)</th>
							<th>재료</th>

						</tr>
						<c:set var="i" value="0" />
						<c:forEach var="d1" items='${dto1}'>
							<c:if test="${random2 == i}">
								<tr
									style="background-color: #d45b65; color: #fff; font-weight: bold">
									<td>${d1.no}</td>
									<td>${d1.name}</td>
									<td>${d1.groups}</td>
									<td>${d1.once}</td>
									<td>${d1.kcal}</td>
									<td>${d1.tan}</td>
									<td>${d1.dan}</td>
									<td>${d1.gi}</td>
									<td>${d1.dang}</td>
									<td>${d1.na}</td>
									<td>${d1.col}</td>
									<td>${d1.powha}</td>
									<td>${d1.trans}</td>
									<td>${d1.jae}</td>
								</tr>
							</c:if>
							<tr class="trtr">
								<td>${d1.no}</td>
								<td>${d1.name}</td>
								<td>${d1.groups}</td>
								<td>${d1.once}</td>
								<td>${d1.kcal}</td>
								<td>${d1.tan}</td>
								<td>${d1.dan}</td>
								<td>${d1.gi}</td>
								<td>${d1.dang}</td>
								<td>${d1.na}</td>
								<td>${d1.col}</td>
								<td>${d1.powha}</td>
								<td>${d1.trans}</td>
								<td>${d1.jae}</td>
							</tr>
							<c:set var="i" value="${i+1}" />
						</c:forEach>
					</table>
				</div>
			</c:if>


			<div id="viewCol">
				<div id="view_title">

					<h3>Basic Survey</h3>
					<a href="#">나이 : ${survey.age}</a> <a href="#">이름 :
						${survey.name}</a> <a href="#">성별 : ${survey.gen}</a> <a href="#">
						몸무게 : ${survey.weight}</a> <a href="#"> 키 : ${survey.height}</a> <a
						href="#"> 목적 : ${survey.purpose }</a> <a href="#">활동정도 :
						${survey.active}</a> <a href="#"> 기피음식 1 : ${survey.hate1}</a> <br>
					<br>
					<c:if test="${userid == null}">
						<a href="#" onclick="loginCheck()">내 몸 알아보러가기</a>
					</c:if>
					<c:if test="${userid != null}">
						<br>
						<a href="#" class="mybodyInfo">나의 분석결과 자세히 보기</a>
						<a href="survey.jsp" class="mybodyInfo2">설문조사다시하기</a>
					</c:if>
				</div>
				<!--view_title end-->
				<div id="view_content">

					<div id="view_content1">
						<div id="view_input">
							<input type="radio" id="recommend" name="choice"
								checked="checked"> <label for="recommend"> <span>●</span>
								메뉴초이스추천메뉴
							</label> <input type="radio" id="purpose" name="choice"> <label
								for="purpose"><span>●</span> ${survey.name}님의 순수목적메뉴</label>
						</div>

						<div id="recommend_menu">
							<c:set var="i" value="1" />
							<c:forEach var="l" items='${dto2}'>
								<%-- 랜덤번호 : ${random} --%>
								<c:if test="${random == i}">

									<div class="semicircle_out">
										<div class="semicircle">
											<!-- <a href="#"><img src="img/스테이크.jpg" alt="추천메뉴"></a> -->
											<input type="hidden" name="purMenu" class="randomPick" value="${l.no}">
											<div class="backcolor">#${l.name}</div>
										</div>
										<div class="searchNaver">
											<a class="randomChoiceMenu" target="_blank"
												href="https://store.naver.com/restaurants/list?menu=${l.name}&query=맛집">
												<b>${l.name}</b><br>맛집검색
											</a> <a class="tuplePlus"> <img src="img/mb1plus1.png"
												alt="더보기">
											</a>
										</div>
									</div>
								</c:if>
								<c:set var="i" value="${i+1}" />
							</c:forEach>
							<div class="recommendOther">
								<form name="choiceMenuForm1">

									<table>
										<tr>
											<td>그 외 또 다른 <span>메뉴초이스 추천 메뉴</span><br> 를 보고싶다면?
											</td>
											<td><c:if test="${userid == null}">
													<a onclick="loginCheck()">CLICK</a>
												</c:if> <c:if test="${userid != null}">
													<a class="other_menu">CLICK</a>
												</c:if></td>
										</tr>
										<tr>
											<td><span>${survey.name}</span>님의 <br> 목적에 맞는 또다른
												메뉴를 보고싶다면?</td>
											<td><c:if test="${userid == null}">
													<a onclick="loginCheck()">CLICK</a>
												</c:if> <c:if test="${userid != null}">
													<a class="other_menu2">CLICK</a>
												</c:if></td>
										</tr>
										<tr>
											<td>지금 보고계시는 이 메뉴가 맘에 든다면?</td>
											<td><input type="hidden" name="choiceMenu1"> <a
												href="#" class="pickMenu pickMenu1" onclick="processPick('T', '${userid}')"> PICK !</a></td>
										</tr>
										<tr>
											<td>지금 보고계시는 이 메뉴가 맘에 들지 않는다면!!</td>
											<td><!-- <input type="hidden" name="choiceMenu1"> --> <a
												href="#" class="pickMenu pickMenu1" onclick="processPick('F', '${userid}')"> NO PICK !</a></td>
										</tr>
									</table>



								</form>
							</div>
						</div>
						<div id="purpose_menu">
							<c:set var="i" value="1" />
							<c:forEach var="l" items='${dto1}'>
								<c:if test="${random2 == i}">
									<%-- 랜덤번호2 : ${random2} --%>
									<div class="semicircle_out">
										<div class="semicircle">
											<!-- <a href="#"><img src="img/스테이크.jpg" alt="추천메뉴"></a> -->
											<input type="hidden" name="recMenu" class="randomPick" value="${l.no}">
											<div class="backcolor">#${l.name}</div>
										</div>
										<div class="searchNaver">
											<a class="randomChoiceMenu" target="_blank"
												href="https://store.naver.com/restaurants/list?menu=${l.name}&query=맛집">
												<b>${l.name}</b><br>맛집검색
											</a> <a class="tuplePlus"> <img src="img/mb1plus1.png"
												alt="더보기">
											</a>
										</div>
									</div>
								</c:if>
								<c:set var="i" value="${i+1}" />
							</c:forEach>
							<div class="recommendOther">
								<form name="choiceMenuForm2">

									<table>
										<tr>
											<td>그 외 또 다른 <span>메뉴초이스 추천 메뉴</span><br> 를 보고싶다면?
											</td>
											<td><c:if test="${userid == null}">
													<a onclick="loginCheck()">CLICK</a>
												</c:if> <c:if test="${userid != null}">
													<a class="other_menu">CLICK</a>
												</c:if></td>
										</tr>
										<tr>
											<td><span>${survey.name}</span>님의 <br> 목적에 맞는 또다른
												메뉴를 보고싶다면?</td>
											<td><c:if test="${userid == null}">
													<a onclick="loginCheck()">CLICK</a>
												</c:if> <c:if test="${userid != null}">
													<a class="other_menu2">CLICK</a>
												</c:if></td>
										</tr>
										<tr>
											<td>지금 보고계시는 이 메뉴가 맘에 든다면?</td>
											<td><input type="hidden" name="choiceMenu2"> <a
												href="#" class="pickMenu pickMenu2" onclick="processPick2('T', '${userid}')"> PICK !</a></td>
										</tr>
										<tr>
											<td>지금 보고계시는 이 메뉴가 맘에 들지 않는다면!!</td>
											<td><input type="hidden" name="choiceMenu2"> <a
												href="#" class="pickMenu pickMenu2" onclick="processPick2('F', '${userid}')"> NO PICK !</a></td>
										</tr>
									</table>



								</form>
							</div>
						</div>

					</div>


				</div>
				<!--view_content end-->
				<div id="item_date"></div>
				<div id="view_button"></div>
			</div>

		</section>
		<footer>
			<p>ⓒCoding by LSG, Design by LMS, All Right Reserved</p>
		</footer>


	</div>

	<%-- 						 사용자 목적에 맞는 탄수화물 : ${list[0]} <br> --%>
	<%-- 						 사용자 목적에 맞는 지방량 : ${list[1]}<br> --%>
	<%-- 						 추천칼로리:${list[2]}<br> --%>
	<%-- 						 추천지방량 : ${list[3]}<br> --%>
	<%-- 						추천탄수화물:${list[4]}<br> --%>
	<%-- 						BMI : ${list[5]}<br> --%>
	<%-- 						비만도 판단 : ${list[7]}<br> --%>
	<%-- 						기초대사량 : ${list[6]}<br> --%>

	<%-- 						표준체중 : ${list[8]}<br> --%>
	<%-- 						활동정도에 따른 열량계산 :  ${list[9]}<br> --%>
	<%-- 						하루 필요 열량 : ${list[10]}<br> --%>
	<%-- 						 하루 필요 단백질 : ${list[11]}<br> --%>
	<%-- 						 한끼 필요 열량 : ${list[12]}<br> --%>
	<%-- 						  한끼 필요 탄수화물 : ${list[13]}<br> --%>
	<%-- 						   한끼 필요 단백질 : ${list[14]}<br> --%>
	<%-- 						   한끼 필요 지방 : ${list[15]}<br> --%>

</body>
</html>