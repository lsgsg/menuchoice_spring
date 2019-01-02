<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>문의게시판</title>
<link href="css/view_imgcss.css" rel="stylesheet" type="text/css">
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>

<script>
$(document).ready(function(e) {

    $('.atag').css({'border': '1.4px solid #9ccd62'});
	$('.atag').css({'color': '#9ccd62'});
	
	});

function del(href){
	if(confirm("한번 삭제한 자료는 복구할 방법이 없습니다. \n\n 정말 삭제하시겠습니까?")){
		document.location.href=href;
		}
	}
</script>
</head>

<body>
<div id="wrap">
<header><%@ include file = "top_login.jsp"%></header>
<%@ include file = "menu.jsp"%>
<div id="logo">
    <a href="index.jsp"><img src="img/helloonlygul.png" alt="로고"></a>
</div>
<section>
 <div id="col2">
       

        <div id="view_title">
        	<div id="view_title1">
            	
            </div>
            <div id="view_title2">
               <ul>
            		<li id="itemli1"></li>
                	<li id="itemli2">
						<img src="img/view.png" alt="조회수">
                    	<P></P>
                    </li>
                	
               </ul>
            </div>
       </div><!--view_title end-->
            <div id="view_content">
            	<div class="view_clear"></div>
                    
                
            </div><!--view_content end-->
            <div id="item_date"></div>
            <div id="view_button">
            	<a href="qna_list.jsp">목록</a>&nbsp;
                
              
                <a href="qna_insert.jsp">수정 </a>
                <a href="qna_delete.jsp">삭제</a>
				<a href="qna_write_form.jsp">답변달기</a>
                    	
            </div>
        <div class="clear"></div>
        </div><!--col2 end-->
</section>
<footer>
    <p>ⓒCoding by LSG, Design by LMS, All Right Reserved</p>
    </footer>


</div>

</body>
</html>