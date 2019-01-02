<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지</title>
<link href="css/list_img_style.css" rel="stylesheet" type="text/css">
<style type="text/css">
.list_itemm {
	width: 80%;
	height: auto;
	padding: 3vh 0vh;
}

.list_itemm>div {
	float: left;
}

.list_itemm1 {
	width: 20%;
	text-align: left;
} /* 등록일 */
.list_itemm2 {
	width: 10%;
	text-align: left;
} /* 번호 */
.list_itemm3 {
	width: 30%;
	text-align: center;
} /* 음식 */
.list_itemm4 {
	width: 10%;
	text-align: center;
} /* 열량 */
.list_itemm5 {
	width: 10%;
	text-align: center;
} /* 구분 */
.list_itemm2>a {
	width: 100%;
	height: 100%;
	font-weight: 400;
	font-size: 0.8vw;
	text-align: left
}

.clear {
	width: 100%;
	height: 5vh;
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
	background-color: #f4a9af;
	border-radius: 10px;
	margin-top: 15px;
}
.showMenu:hover {background-color:#f88491}

.closeMenu {
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
#colOut{ }
#colIn { width:100%;box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.3); box-sizing:border-box; padding:60px; margin-bottom: 50px;}
.h2h2 { margin-bottom: 50px;}
.h2h2 h2 {display: inline-block; float:left; margin-top:20px;}
.h2h2 a { float:right; display: inline-block; margin-bottom:50px; }
.foodrecord { width: 100%; border-collapse: collapse;border-radius: 30px 30px 0px 0px; overflow: hidden;  
 outline-offset : -1px; outline-left:1px solid #bacf8c }
.foodrecord tr td,th { padding: 20px; text-align:center;}
.foodrecord tr td { border-bottom:1px solid #bacf8c}
.foodrecord tr:nth-child(1){}
.foodrecord tr th { background-color: #bacf8c; color:#fff; font-weight: bold; }

.namehover:hover {color:#f88491; font-weight: bold;}

</style>
<script
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>

<script>
	$(document).ready(function(e) {
		var list_item = $('.list_item').width();
		$('.atag').css({
			'border' : '1.4px solid #9ccd62'
		});
		$('.atag').css({
			'color' : '#9ccd62'
		});

		$(".closeMenu").click(function() {
			$('.myBody').css("display", "none");
		})

		$(".showMenu").click(function() {
			$('.myBody').css("display", "block");
		})

		/* $(".mybodyInfo").click(function() {
			$('.myBody').css("display", "block");
		}) */

	});
</script>
</head>

<body>
	<div id="wrap">

		<header><%@ include file="../../top_login.jsp"%></header>
		<%@ include file="../../menu.jsp"%>
		<div id="logo">
			<a href="main.jsp"><img src="img/helloonlygul.png" alt="로고"></a>
		</div>
		<section>
			<article id="a1">
				<div id="subbg1">
					<ul>
						<li id="ul1li1"><a href="#"> <img src="img/foodtip.png"
								alt="Hello Kitchen story">
						</a></li>
					</ul>
				</div>
			</article>

			<article id="a2">
				<div id="colOut">
					
					<div id="list_content" class="float">

						<c:if test="${dto.purpose != null}">
							<!-- 하나하나 체크 or age만 체크? -->
							<div class="myBody">
								<div class="myBodyInfo_1">
									<p class="myBodyHeader">
										<span>${dto.name}</span> 님의 분석결과 입니다.
									</p>
									<br><br><br>
									<b>${dto.name}</b>님의 <b>BMI는 ${infoList[5]}</b>이므로 <b>${infoList[7]}</b>에 해당합니다. <br>
									<b>키 ${dto.height}</b>에 맞는 <b>표준체중은 ${infoList[8]}</b> 이므로 <br>
									<b>${dto.name}</b>님의 건강한 한끼를 위해선 <br><br>
									<b>한끼 칼로리 ${infoList[12]}</b> 를 넘지않고,<br> 한끼에 필요한<b> 탄수화물양
									(${infoList[13]}), 단백질양(${infoList[14]}), 지방량(${infoList[15]})</b>을
									모두 고려해야합니다.<br>
									<b>${dto.name}</b>님이 작성하신 활동정도에 따른 <b>기초대사량은
									${infoList[6]}kcal</b> 입니다. <br><br>

									<div>
										<table border="1">
											<tr>
												<td colspan="2">"한 끼" 필요영양기준</td>
											</tr>
											<tr>
												<td>열량</td>
												<td>${infoList[12]}kcal</td>
											</tr>
											<tr>
												<td>지방</td>
												<td>${infoList[15]}g</td>
											</tr>
											<tr>
												<td>탄수화물</td>
												<td>${infoList[13]}g</td>
											</tr>
											<tr>
												<td>단백질</td>
												<td>${infoList[14]}g</td>
											</tr>

										</table>
										<table border="1">
											<tr>
												<td colspan="2">"하루"필요영양기준</td>
											</tr>
											<tr>
												<td>열량</td>
												<td>${infoList[2]}kcal</td>
											</tr>
											<tr>
												<td>지방</td>
												<td>${infoList[3]}g</td>
											</tr>
											<tr>
												<td>탄수화물</td>
												<td>${infoList[4]}g</td>
											</tr>
											<tr>
												<td>단백질</td>
												<td>${infoList[11]}g</td>
											</tr>
										</table>

										<br> <span style="font-size: 10px;"> 출처 : 한국영양학협회</span>
									</div>

									<a href="#" class="closeMenu">닫기</a>
								</div>
							</div>

							
						
						</c:if>
						
						<div id="colIn">
						<div class="h2h2">
							<h2>음식 추천 / 비추천 기록</h2><a href="#" class="showMenu">개인 분석자료 다시보기</a>
						</div>
						<table class="foodrecord">
						<tr>
							<th>등록일</th>
							<th>번호</th>
							<th>음식</th>
							<th>열량(kcal)</th>
							<th>구분</th>
						</tr>
						<!--list_item end-->

						<c:set var="i" value="0" />
						<c:forEach var="s" items="${list}">
							<tr>
								<c:set var="sdate" value="${fn:substring(s.date, 0, 10)}" />
								<td>${sdate}</td>
								<td>${s.no}</td>
								<td>
									<a href="view_img?no=${mlist[i].no}" class="namehover">${mlist[i].name}</a>
								</td>
								<td>${mlist[i].kcal}</td>
								<c:if test="${s.gubun == 'T'}">
									<td>추천</td>
								</c:if>
								<c:if test="${s.gubun == 'F'}">
									<td>비추천</td>
								</c:if>
							</tr>
							<!--list_item end-->
							<c:set var="i" value="${i+1}" /> <!-- index 1 증가하여 다음 레코드로 이동 -->
						</c:forEach>

					
					</table>
					<div id="list_search1" style="margin-right:60px; font-size:13px;">▶ 총 ${i}개의 메뉴 기록이 있습니다.</div>
					<div class="clear"></div>
					</div>
					<!--list_content end-->
					<div class="clear float"></div>
					<div id="page_button" class="float">
						<div id="page_num">
							<div id="page_num_in"></div>
							<div id="list">
								<!-- <a href="qna_write_form.jsp">Write</a> -->
							</div>

						</div>
						<!--page_num end-->
						
					</div>
					<!--page_button end-->
					</div>
				</div>

			</article>
		</section>

		<footer>
			<p>ⓒCoding by LSG, Design by LMS, All Right Reserved</p>
		</footer>
	</div>
</body>
</html>