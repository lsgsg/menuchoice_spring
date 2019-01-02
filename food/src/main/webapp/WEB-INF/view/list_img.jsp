<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>꿀조합 게시판</title>
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
                str += "<a class='atagLine' href='view_img?no="+ obj["no"] + "'>"+"&nbsp;&nbsp;&nbsp;"+ obj["name"]
                + "</a>";
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
            <div id="bg"></div>
               <!-- 검색아이콘 / 셀렉트박스 -->
               <form name="board_form" method="post" id="searchForm_img" action="list_show">
                  <div id="list_search" class="float search-wrapper active">
                     <div class="input-holder">
                        <button class="search-icon" type="submit">
<!--                            <span></span> -->
                        </button>
                        <input type="text" class="search-input" placeholder="Search" name="name">
                        <div id="showData"> </div>
                     </div>
                  </div>
               </form>

               <!-- 카테고리 모음 -->
               <div id="list_content" class="float">

                  <div class="list_item">
                     <img src='img/음식사진/정은/9.png' width='30%'>

                     <!--<div id="list_item1"><? //$number ?></div>-->
                     <div id="list_item2">
                        <a href="qna_img?groups=${list[0].groups}">
                           <p>${list[0].groups}</p>
                        </a>
                     </div>

                     <div id="hoverme"></div>
                  </div>
                  

                  <div class="list_item">
                     <img src='img/음식사진/정은/18.png' width='30%'>

                     <!--<div id="list_item1"><? //$number ?></div>-->
                     <div id="list_item2">
                        <a href="qna_img?groups=${list[1].groups}">
                           <p>${list[1].groups}</p>
                        </a>
                     </div>

                     <div id="hoverme"></div>
                  </div>


                  <div class="list_item">
                     <img src='img/음식사진/이마태/9.jpg' width='30%'>

                     <!--<div id="list_item1"><? //$number ?></div>-->
                     <div id="list_item2">
                        <a href="qna_img?groups=${list[2].groups}">
                           <p>${list[2].groups}</p>
                        </a>
                     </div>

                     <div id="hoverme"></div>
                  </div>


                  <div class="list_item">
                     <img src='img/음식사진/정은/8.png' width='30%'>

                     <!--<div id="list_item1"><? //$number ?></div>-->
                     <div id="list_item2">
                        <a href="qna_img?groups=${list[3].groups}">
                           <p>${list[3].groups}</p>
                        </a>
                     </div>

                     <div id="hoverme"></div>
                  </div>


                  <div class="list_item">
                     <img src='img/음식사진/전민승/10.jpg' width='30%'>

                     <!--<div id="list_item1"><? //$number ?></div>-->
                     <div id="list_item2">
                        <a href="qna_img?groups=${list[4].groups}">
                           <p>${list[4].groups}</p>
                        </a>
                     </div>

                     <div id="hoverme"></div>
                  </div>

                  <div class="list_item">
                     <img src='img/음식사진/정은/4.png' width='30%'>

                     <!--<div id="list_item1"><? //$number ?></div>-->
                     <div id="list_item2">
                        <a href="qna_img?groups=${list[5].groups}">
                           <p>${list[5].groups}</p>
                        </a>
                     </div>

                     <div id="hoverme"></div>
                  </div>


                  <div class="list_item">
                     <img src='img/음식사진/정은/salad.png' width='30%'>

                     <!--<div id="list_item1"><? //$number ?></div>-->
                     <div id="list_item2">
                        <a href="qna_img?groups=${list[6].groups}">
                           <p>${list[6].groups}</p>
                        </a>
                     </div>

                     <div id="hoverme"></div>
                  </div>


                  <div class="list_item">
                     <img src='img/음식사진/정은/스프.png' width='30%'>

                     <!--<div id="list_item1"><? //$number ?></div>-->
                     <div id="list_item2">
                        <a href="qna_img?groups=${list[7].groups}">
                           <p>${list[7].groups}</p>
                        </a>
                     </div>

                     <div id="hoverme"></div>
                  </div>

                  <div class="list_item">
                     <img src='img/음식사진/정은/10.png' width='30%'>

                     <!--<div id="list_item1"><? //$number ?></div>-->
                     <div id="list_item2">
                        <a href="qna_img?groups=${list[8].groups}">
                           <p>${list[8].groups}</p>
                        </a>
                     </div>

                     <div id="hoverme"></div>
                  </div>



                  <div class="list_item">
                     <img src='img/음식사진/정은/찜류.png' width='30%'>

                     <!--<div id="list_item1"><? //$number ?></div>-->
                     <div id="list_item2">
                        <a href="qna_img?groups=${list[9].groups}">
                           <p>${list[9].groups}</p>
                        </a>
                     </div>

                     <div id="hoverme"></div>
                  </div>


                  <div class="list_item">
                     <img src='img/음식사진/정은/튀김.png' width='30%'>

                     <!--<div id="list_item1"><? //$number ?></div>-->
                     <div id="list_item2">
                        <a href="qna_img?groups=${list[10].groups}">
                           <p>${list[10].groups}</p>
                        </a>
                     </div>

                     <div id="hoverme"></div>
                  </div>


                  <div class="list_item">
                     <img src='img/음식사진/이마태/10.jpg' width='30%'>

                     <!--<div id="list_item1"><? //$number ?></div>-->
                     <div id="list_item2">
                        <a href="qna_img?groups=${list[11].groups}">
                           <p>${list[11].groups}</p>
                        </a>
                     </div>

                     <div id="hoverme"></div>
                  </div>


                  <div class="list_item">
                     <img src='img/음식사진/정은/burger.png' width='30%'>

                     <!--<div id="list_item1"><? //$number ?></div>-->
                     <div id="list_item2">
                        <a href="qna_img?groups=${list[12].groups}">
                           <p>${list[12].groups}</p>
                        </a>
                     </div>

                     <div id="hoverme"></div>
                  </div>

               </div>
               <!--page_num end-->
<!--                <div id="list_search1">▶ 총 개의 게시물이 -->
<!--                   있습니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
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