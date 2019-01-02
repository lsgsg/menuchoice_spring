<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>꿀조합 게시판</title>
<link href="css/view_imgcss.css" rel="stylesheet" type="text/css">
<script
   src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<style>
#comment {
   width: 100%;
   height: 15vh;
}

#comment textarea {
   height: 100%;
   width: 100%;
   outline: 2.5px solid #bacf8c;
   padding: 10px;
   box-sizing: border-box;
   overflow: hidden;
   border: none;
   resize: none;
   outline-offset: -10px;
}

#gogo {
   padding: 15px 20px;
   background-color: #bacf8c;
   border-radius: 10px;
   color: #fff;
   font-weight: bold;
   border: none;
   margin-left: 15px;
   cursor:pointer;
}

#showComment {
   width: 100%;
   margin-top: 70px;
   margin-bottom: 70px;
}

#showComment table tr td {
   padding: 20px;
}

#showComment table tr td:nth-child(1) {
   width: 20%;
}

#showComment table tr td:nth-child(2) {
   width: 80%;
}

#showComment table tr td:nth-child(1) a {
   padding: 10px 15px;
   background-color: #f4a9af;
   color: #fff;
   font-weight: bold;
   border-radius: 10px;
}
</style>
<script>
   $(document).ready(function(e) {

      $('.atag').css({
         'border' : '1.4px solid #9ccd62'
      });
      $('.atag').css({
         'color' : '#9ccd62'
      });

   });
</script>
<script type="text/javascript">
   function gogo(food_no, client_id) {

      var content = $("#comment textarea").val();
      if (content == null || content == "") {

         alert('댓글창에 글을 적어주세요!')
      }
      $.ajax({
         type : "GET",
         url : "commentGo",
         data : {
            "content" : content,
            "food_no" : food_no,
            "client_id" : client_id
         },
         dataType : "json",
         success : function(data) {
            $("#comment textarea").val("");
            $("#showComment").html("");
            var list = data.datas; // 배열의 대표명 (멀티컨트롤러의 "datas")
            var str = "";
            str += "<table>"
            $(list).each(
                  function(index, obj) {
                     str += "<tr><td><a href='#'>";
                     str += obj["client_id"];
                     str += "</a></td><td>";
                     str += obj["content"];
                     str += "</td>";
                     
                     str +="</tr>";
                  })
            str += "</table>"
            $("#showComment").html(str);
         },
         error : function() {
            console.log("err");
         }

      })
   }

   function del(href) {
      when(confirm("한번 삭제한 자료는 복구할 방법이 없습니다. \n\n 정말 삭제하시겠습니까?"))
      {
         document.location.href = href;
      }
   }
   
   
   function update_ajax(no, food_no){
      alert("수정하기" + no + "," + food_no)
   }
   
   function delete_ajax(no, food_no){
      alert("삭제하기" + no + "," + food_no)
   }
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
         <div id="col2">


            <div id="view_title">
               <div id="view_title1">${dto.name}</div>
               <div id="view_title2">
                  <ul>
                     <li id="itemli1">${dto.groups}</li>
                     <li id="itemli2"><img src="img/view.png" alt="조회수">
                        <P></P></li>

                  </ul>
               </div>
            </div>
            <!--view_title end-->
            <div id="view_content">
               <div class="view_cclear"></div>
               <div id="view_content1">
                  <%-- ${dto.groups} --%>
                  <%-- ${glist[0].groups} 구이류 ${glist[1].groups} 국 및 탕류 --%>
                  <c:choose>
                     <c:when test="${dto.groups eq glist[0].groups}">
                        <!-- 구이류 -->
                        <img src="img/음식사진/슬기사진/생선일러.png" width="90%">
                     </c:when>
                     <c:when test="${dto.groups eq glist[1].groups}">
                        <!-- 국 및 탕류 -->
                        <img src="img/음식사진/슬기사진/스파게티일러.png" width="90%">
                     </c:when>
                     <c:when test="${dto.groups eq glist[2].groups}">
                        <!-- 면류 -->
                        <img src="img/음식사진/슬기사진/백반일러.png" width="90%">
                     </c:when>
                     <c:when test="${dto.groups eq glist[3].groups}">
                        <!-- 밥류 -->
                        <img src="img/음식사진/슬기사진/비빔밥일러.png" width="90%">
                     </c:when>
                     <c:when test="${dto.groups eq glist[4].groups}">
                        <!-- 볶음류 -->
                        <img src="img/음식사진/슬기사진/스테이크일러.png" width="90%">
                     </c:when>
                     <c:when test="${dto.groups eq glist[5].groups}">
                        <!-- 분식 -->
                        <img src="img/음식사진/슬기사진/오므라이스일러.png" width="90%">
                     </c:when>
                     <c:when test="${dto.groups eq glist[6].groups}">
                        <!-- 샐러드 -->
                        <img src="img/음식사진/슬기사진/샐러드일러.png" width="90%">
                     </c:when>
                     <c:when test="${dto.groups eq glist[7].groups}">
                        <!-- 죽 및 스프류 -->
                        <img src="img/음식사진/슬기사진/햄버거일러.png" width="90%">
                     </c:when>
                     <c:when test="${dto.groups eq glist[8].groups}">
                        <!-- 찌개 및 전골류 -->
                        <img src="img/음식사진/슬기사진/햄버거일러.png" width="90%">
                     </c:when>
                     <c:when test="${dto.groups eq glist[9].groups}">
                        <!-- 찜류 -->
                        <img src="img/음식사진/슬기사진/햄버거일러.png" width="90%">
                     </c:when>
                     <c:when test="${dto.groups eq glist[10].groups}">
                        <!-- 튀김류 -->
                        <img src="img/음식사진/슬기사진/햄버거일러.png" width="90%">
                     </c:when>
                     <c:when test="${dto.groups eq glist[11].groups}">
                        <!-- 피자 -->
                        <img src="img/음식사진/슬기사진/햄버거일러.png" width="90%">
                     </c:when>
                     <c:when test="${dto.groups eq glist[12].groups}">
                        <!-- 햄버거 -->
                        <img src="img/음식사진/슬기사진/햄버거일러.png" width="90%">
                     </c:when>
                  </c:choose>
                  <div class="nuInfo">
                     <table>
                        <tr>
                           <td>1회제공량 ${dto.once}g</td>
                           <td>열량 ${dto.kcal}kcal</td>
                           <td>탄수화물 ${dto.tan}g</td>
                           <td>단백질 ${dto.dan}g</td>
                           <td>지방 ${dto.gi}g</td>
                           <td>당류 ${dto.dang}g</td>
                           <td>나트륨 ${dto.na}mg</td>
                           <td>콜레스테롤 ${dto.col}mg</td>
                           <td>포화지방산 ${dto.powha}g</td>
                           <td>트랜스지방산 ${dto.trans}g</td>
                        </tr>
                     </table>
                  </div>
               <div class="view_cclear"></div>

            </div>
            <!--view_content end-->
            <div id="item_date"></div>
            <div id="view_button"></div>
            <div class="food_board">
               <%--             <a href="insert?food_no=${dto.no}">추가</a><br> --%>
               <c:if test="${userid != null}">
                  <div id="comment">
                     <input type="button" value="댓글쓰기" id="gogo"
                        onclick="javascript:gogo('${dto.no}','${userid}')">
                     <textarea name="content" width="100%"></textarea>

                  </div>
                  <div id="showComment">

                     <table>
                        <c:forEach var="b" items="${list}">
                           <tr>
                              <td><a href="#">${b.client_id}</a></td>
                              <td>${b.content}</td>
                           </tr>
                        </c:forEach>
                     </table>
                  </div>
               </c:if>

               <!--                <table border="1"> -->
               <!--                   <tr> -->
               <!--                      <th>글번호</th> -->
               <!--                      <th>아이디</th> -->
               <!--                      <th>글내용</th> -->
               <!--                      <th>작성일</th> -->
               <!--                      <th>메뉴번호</th> -->
               <!--                      <th>변경</th> -->
               <!--                   </tr> -->
               <%--                   <c:forEach var="b" items="${list}"> --%>
               <!--                      <tr> -->
               <%--                         <td>${b.no}</td> --%>
               <%--                         <td>${b.client_id}</td> --%>
               <%--                         <td>${b.content}</td> --%>
               <%--                         <td>${b.date}</td> --%>
               <%--                         <td>${b.food_no}</td> --%>
               <%--                         <td><a href="update?board_no=${b.no}&food_no=${b.food_no}">수정</a> <a href="update?num=${m.num}/zz/bb">수정</a> 이런식으로 붙여서 갈 수 있음 --%>
               <%--                            <a href="delete?board_no=${b.no}&food_no=${b.food_no}">삭제</a></td> --%>
               <!--                      </tr> -->
               <%--                   </c:forEach> --%>
               <!--                </table> -->
            </div>
            <div class="clear"></div>
            <!--col2 end-->
      </section>
      <footer>
         <p>ⓒCoding by LSG, Design by LMS, All Right Reserved</p>
      </footer>


   </div>
</body>
</html>