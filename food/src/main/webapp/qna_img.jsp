<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!doctype html>
<html>
<head>
<meta charset="utf-8">

<title>헬로키친 문의게시판</title>
<link href="css/list_img_style.css" rel="stylesheet" type="text/css">
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>

<script>
$(document).ready(function(e) {
	var list_item = $('.list_item').width();
    $('.atag').css({'border': '1.4px solid #9ccd62'});
	$('.atag').css({'color': '#9ccd62'});
	 
});
</script>
</head>

<body>
<div id="wrap">
	<header></header>
	
    <div id="logo">
    <a href="index.php"><img src="img/helloonlygul.png" alt="로고"></a>
    </div>
    <section>
    <article id="a1">
       		 <div id="subbg1">
             	<ul>
                	<li id="ul1li1">
                    <a href="#">
                        <img src="img/foodtip.png" alt="Hello Kitchen story">
                    </a>
                    </li>
                </ul>
             </div>
        </article>
    
    <article id="a2">
    	<div id="colOut">
        
        	<form name="board_form" method="post">
            	<div id="list_search" class="float search-wrapper active">
                
                     
                          <div class="input-holder fIn">
                            
                            <button class="search-icon" type="submit"><span></span></button>
                            <input type="text" class="search-input" placeholder="Search" name="search">
                          </div>
                          
                             <div id="list_S" class="fIn">
                                <div id="list_search0">
                                <select name="find" id="search2">
                                    <option value='subject'>Title</option>
                                    <option value='content'>Contents</option>
                                    <option value="nick">Nickname</option>
                                    <option value='name'>Name</option>
                                </select>
                                </div>
                             </div>
                
               
                    
                </div>
            </form>
              
            <div id="list_content"  class="float">
            <div class="list_itemm">
             
                	<div class="list_itemm1">번호</div>
                    <div class="list_itemm22">제목</div>
                    <div class="list_itemm3">글쓴이</div>
                    <div class="list_itemm4">등록일</div>
                    <div class="list_itemm5">조회</div>
                    
                </div><!--list_item end-->
           
                <div class="list_itemm">
             
                	<div class="list_itemm1"></div>
                    <div class="list_itemm2">
                    
                	
                    	
                   	</div>
                    <div class="list_itemm3"></div>
                    <div class="list_itemm4"></div>
                    <div class="list_itemm5"></div>
                    
                    </div><!--list_item end-->
                
            </div><!--list_content end-->
            <div class="clear float"></div>
       	<div id="page_button"  class="float">
            	<div id="page_num">
                	<div id="page_num_in">
                	
               		</div>
                    <div id="list">
                         
                           
                       	
                        
                    </div> 
                	
                </div><!--page_num end-->
                <div id="list_search1">
                    ▶ 총 개의 게시물이 있습니다.
                </div>
            </div><!--page_button end--> 
        </div>
         
        </article>
    </section>
     
	<footer>
    <p>ⓒCoding by LSG, Design by LMS, All Right Reserved</p>
    </footer>
</div>	
</body>
</html>