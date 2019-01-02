<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">

<title>헬로키친 문의게시판</title>
<link href="css/list_img_style.css" rel="stylesheet" type="text/css">
<style>
#list_search {width:100%;}
.list_search {width:100%;}
.list_search {width:93%}
.input-holder {width:100%;}
.search-input {
    float: left;
    width: 100%;
    height:50px;
    font-size:20px;
    border:3px solid #bacf8c;
    background-color:#fff;
    border-radius: 10px;
    }
#bg { background-color:rgba(0,0,0,0.6); position:fixed; top:0; left:0px; width:100vw; height:100vh; z-index: 89;display:none;}
#searchForm_img{position:relative; z-index:90} 
#showData{ width:99.5%; height:auto; background-color:#fff; position: absolute; top:7vh; left:5px ; z-index:100; overflow:hidden; display: none; border-radius: 10px;}
.atagLine { display: block; width:100%; padding:10px 0px; font-size:25px;}
.atagLine:hover { background-color: #f4a9af; color:#fff; font-weight: bold;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(e) {
		//var list_item = $('.list_item').width();
		var list_item = 270
		$('.atag').css({
			'border' : '1.4px solid #9ccd62'
		});
		$('.atag').css({
			'color' : '#9ccd62'
		});
		$('.list_item').css({
			'height' : list_item
		});
		
		$(".search-input").focusout(function(){
			$("#showData").css("display","none");
			$("#bg").css("display","none");
		});
		$("#showData").hover(function(){
			$("#showData").css("display","block");
		})
		$(".search-input").focus(function(){
			$("#bg").css("display","block");
		})

		$(".search-input").keyup(function(){
			var name = $(this).val();
			$("#showData").css("display","block");
			
			$.ajax({
				type:"GET",
				url:"list_search",
				data:{"name" : name},
				dataType:"json",
				success:function(data){
					$("#showData").html("");
					var list = data.datas; // 배열의 대표명 (멀티컨트롤러의 "datas")
					var str = "";
					$(list).each(function(index, obj){
						str += "<a class='atagLine' href='view_img?no="+ obj["no"] + "'>"+"&nbsp;&nbsp;&nbsp;"+ obj["name"] + "</a>";
						console.log(obj["name"]);
					})
				 
					$("#showData").html(str);
				},error : function(){
					console.log("err");
				}
				
			});

		});
});
</script>
</head>

<body>
	<div id="wrap">
		<header>
			<%@ include file="/top_login.jsp"%>
			<%@ include file="/menu.jsp"%>
		</header>
		<div id="bg"></div>
		<div id="logo">
			<a href="index.jsp"><img src="img/helloonlygul.png" alt="로고"></a>
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

					<!-- 검색아이콘 / 셀렉트박스 -->
					<form name="board_form" method="post" id="searchForm_img" action="list_show">
						<div id="list_search" class="float search-wrapper active">
							<div class="input-holder">
								<button class="search-icon" type="submit">
<!-- 									<span></span> -->
								</button>
								<input type="text" class="search-input" placeholder="Search" name="name">
								<div id="showData"> </div>
							</div>
						</div>
					</form>

					<div id="list_content" class="float">
						<div class="list_itemm">

							<div class="list_itemm1">번호</div>
							<div class="list_itemm2">메뉴이름</div>
							<div class="list_itemm3">분류</div>
							<div class="list_itemm4">글쓴이</div>
							<div class="list_itemm5">조회</div>

						</div>
						<!--list_item end-->

						<c:forEach var="g" items="${list}">
							<div class="list_itemm">

								<div class="list_itemm1">${g.no}</div>
								<div class="list_itemm2">
									<a href="view_img?no=${g.no}&page=나중에 받을것"> ${g.name} </a>
								</div>
								<div class="list_itemm3">${g.groups}</div>
								<div class="list_itemm4">관리자</div>
								<div class="list_itemm5">0</div>
							</div>
						</c:forEach>
						<!--list_item end-->

					</div>
					<!--list_content end-->
					<div class="clear float"></div>
					<div id="page_button" class="float">
						<div id="page_num">
							<div id="page_num_in"></div>
							<div id="list"></div>

						</div>
						<!--page_num end-->
						<div id="list_search1">▶ 총 개의 게시물이 있습니다.</div>
					</div>
					<!--page_button end-->
				</div>

			</article>
		</section>

		<footer>
			<p>ⓒCoding by LSG, Design by LMS, All Right Reserved</p>
		</footer>
	</div>
</body>
</html>