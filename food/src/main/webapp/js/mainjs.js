$(document).ready(function(e) {
    //resize
  $(document).resize(function(){
	  $(this).css('width',$(window).width());
	  $(this).css('height',$(window).height());
  });
  
  	
	$('#menu').css({'opacity':0});
	var scrollTop=0;
	var atag=$('#atag>ul>li');
	$('.scrollFixR').css('height',$(window).height());	
	$('#wrap>section>#col1').delay(200).animate({'left':0},1000,function(){

		$('.scrollFixL1>ul>li:nth-child(1)').delay(100).animate({"left" : "4vh", "opacity" : 1}, 800);
		$('.scrollFixL1>ul>li:nth-child(2)').delay(200).animate({"top" : "72.5vh", "opacity" : 1}, 800);
		$('#menu').animate({'opacity':1},600);
		$('.logos').animate({'opacity':1},600);
		$('#button').delay(300).animate({'left':'4'+'vh'});
		});	
	
	
	$('#wrap>section>#col2').animate({'left':'35%'},1200);
	$('#wrap>section>#col2>#atag').delay(1200).animate({'opacity':1},1500);
	$('#wrap>#menu').delay(1200).animate({'opacity':1},1500);	
	$('footer').delay(1200).animate({'opacity':1},1500);
	$('.atag').css({'border': '1.4px solid rgb(156, 205, 98);'})
	$('.atag').css({'color': '#9ccd62'})
	
    $(window).scroll(function(){
		var swh = $(window).outerHeight()/2;
		 scrollTop = $(window).scrollTop(); 
		 
			if(scrollTop>=0 && scrollTop<$('#a2ulli1').offset().top-swh){
		
			
			
			}else{
				
				
				}
				
				

			
	
			
			
			 
		
		if(scrollTop>=0 && scrollTop<$('#a2ulli1').offset().top){
			
			$('.scrollFixL1').css({'z-index':5});
			$('.scrollFixL1').stop().animate({'opacity':1},300);
			$('#atag>ul>li>#aa1').css({'background-color':'#fd9cb0'})
			$('#atag>ul>li>#aa1').css({'color':'#fff'})
			}else{
				$('.scrollFixL1').css({'z-index':1});
				$('.scrollFixL1').stop().animate({'opacity':0},300);
				$('#atag>ul>li>#aa1').css({'background-color':'#fff'})
			$('#atag>ul>li>#aa1').css({'color':'#fd9cb0'})
				}
		if(scrollTop>=$('#a2ulli1').offset().top && scrollTop<$('.scrollFixR4').offset().top){
			$('#atag>ul>li>#aa2').css({'background-color':'#fd9cb0'})
			$('#atag>ul>li>#aa2').css({'color':'#fff'})
			$('.scrollFixL2').stop().animate({'opacity':1},300);
			$('.scrollFixL2').css({'z-index':5});
			
			
			}else{
				$('.scrollFixL2').stop().animate({'opacity':0},300);
				$('.scrollFixL2').css({'z-index':1});
				$('#atag>ul>li>#aa2').css({'background-color':'#fff'})
				$('#atag>ul>li>#aa2').css({'color':'#fd9cb0'})
			}
			
		if(scrollTop>=$('.scrollFixR4').offset().top){
			$('.scrollFixL3').stop().animate({'opacity':1},300);
			$('.scrollFixL3').css({'z-index':5});
			$('#atag>ul>li>#aa3').css({'background-color':'#fd9cb0'})
			$('#atag>ul>li>#aa3').css({'color':'#fff'})
			
			}else{
				$('.scrollFixL3').stop().animate({'opacity':0},300);
				$('.scrollFixL3').css({'z-index':1});
				$('#atag>ul>li>#aa3').css({'background-color':'#fff'})
				$('#atag>ul>li>#aa3').css({'color':'#fd9cb0'})
			}
			

	
			
		});//스크롤 끝	
		
	
		atag.find('a').click(function(e){
		e.preventDefault();		
		var attrib=$(this).attr('href');
		
		$('html,body').stop().animate({'scrollTop':$(attrib).offset().top+5},700);});//클릭했을 때 슬라이드 슈욱
			
		
	
	


	
	
	
	
	
	
		
});
// JavaScript Document