	var fill_rotation = 180;
	var fix_rotation = fill_rotation*2;
	var classNum2 = 0;
	var mainTl = new TimelineMax({paused: true});

	$(".step:not(.first) .radial-progress").each(function(i){
		var circle = $(this);
		var line = 	circle.prev('.line').find('.progress');
		var circleFill = circle.find('.fill:not(.fix)');
		var circleMask = circle.find('.mask.full');
		var circleFillMix = circle.find('.fill.fix');

		mainTl.to(line, 0.15, {width: "100%"})
			.to(circle, 0.3, {rotation: "-="+fill_rotation}, "fillCircle-"+i+"")
			.to([circleFill, circleMask], 0.3, {rotation: fill_rotation}, "fillCircle-"+i+"")
			.to(circleFillMix, 0.3, {rotation: fix_rotation}, "fillCircle-"+i+"")
			.set(circleFillMix, {rotation: fix_rotation}, "stopPoint-"+i+"");
	});

	$("[class^='stpbtn_']").click(function(){
		
		var className = $(this).attr("class")
		className = className.replace("stpbtn_","")

		if(className==8) {
			className=7;
		}
		var regexp = /[^0-9]/gi; //숫자가 아닌 것
		
		if(className==1){
			classNum2 = 1;
			if(!$(".gender1").is(":checked") & !$(".gender2").is(":checked")){
				alert("성별을 체크해주세요");
				return;
			}
		}
		
		if(className == 2){
			classNum2 = 2;
			if(regexp.test($('input[name=age]').val()) || $('input[name=age]').val() == ""){
				alert("나이는 숫자로만 입력해주세요")
				return;
			}
		}
		
		if(className == 3){
			classNum2 = 3;
			if(regexp.test($('input[name=height]').val()) || $('input[name=height]').val() == ""){
				alert("키는 숫자로만 입력해주세요")

				return;
			}
		}
		
		if(className == 4){
			classNum2 = 4;
			if(regexp.test($('input[name=weight]').val()) || $('input[name=weight]').val() == ""){
				alert("몸무게는 숫자로만 입력해주세요")

				return;
			}
		}
		
		if(className == 5){
			classNum2 = 5;
			if(!$(".act1").is(":checked") & !$(".act2").is(":checked") & !$(".act3").is(":checked") ){
				alert("활동정도를 체크해주세요!")

				return;
			}
		}
		
		if(className == 6){
			classNum2 = 6;
			if(!$(".pur1").is(":checked") & !$(".pur2").is(":checked") & !$(".pur3").is(":checked") 
					& !$(".pur4").is(":checked") & !$(".pur5").is(":checked") & !$(".pur6").is(":checked")
					& !$(".pur7").is(":checked")
			){
				alert("메뉴선택의 목적을 체크해주세요!")

				return;
			}
		}
		
		if(className == 7){
            classNum2 = 7;
			regexp = /[^가-힣]; //한글만

            v = $('input[name=hate1]').val();

            if (regexp.test(v)|| v == "") {

                alert("한글로 싫어하는 재료명을 적어주세요.");
                $('input[name=hate1]').val("");

                return;

            }
		}
		
		
		if($("#click_"+(Number(className)+1)).hasClass('active')){

			return false;
		}

		animateToDefault();

		$('.active').removeClass('active');

		var index = parseInt($("#click_"+(Number(className)+1)).attr('data-index'));
		mainTl.tweenTo("stopPoint-"+(index-1)+"", {onComplete: animateToActive, onCompleteParams:[$("#click_"+(Number(className)+1))]});

	})




	$("[id^='click_']").click(function(){
		
		var classNum = $(this).attr('id');
		classNum = classNum.replace("click_",""); // 현재 클릭한 클라스 번호
		if(classNum2 >= classNum ){
			checkAnimate(classNum); // 현재 클릭한 클라스의 번호(3)가 이전클라스번호(2)보다 작으면 에니메이션을 실행하고 바로 리턴.
			classNum2 = classNum; // 현재 클릭한 클래스 번호를 전역변수에 저장함...
			return;
		}
		
		
		
		var regexp = /[^0-9]/gi; //숫자가 아닌 것
		
		
		
		
		
			if(!$(".gender1").is(":checked") & !$(".gender2").is(":checked")){
				alert("성별을 체크해주세요");
				checkAnimate(1)
				return;
			}
			if(regexp.test($('input[name=age]').val()) || $('input[name=age]').val() == ""){
				alert("나이는 숫자로만 입력해주세요")
				checkAnimate(2)
				return;
			}
			if(regexp.test($('input[name=height]').val()) || $('input[name=height]').val() == ""){
				alert("키는 숫자로만 입력해주세요")
				checkAnimate(3)
				return;
			}
			if(regexp.test($('input[name=weight]').val()) || $('input[name=weight]').val() == ""){
				alert("몸무게는 숫자로만 입력해주세요")
				checkAnimate(4)
				return;
			}
			if(!$(".act1").is(":checked") & !$(".act2").is(":checked") & !$(".act3").is(":checked") ){
				alert("활동정도를 체크해주세요!")
				checkAnimate(5)
				return;
			}
			if(!$(".pur1").is(":checked") & !$(".pur2").is(":checked") & !$(".pur3").is(":checked") 
					& !$(".pur4").is(":checked") & !$(".pur5").is(":checked") & !$(".pur6").is(":checked")
					& !$(".pur7").is(":checked")
			){
				alert("메뉴선택의 목적을 체크해주세요!")
				checkAnimate(6)
				return;
			}
			
			
			regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g; //한글만

            v = $('input[name=hate1]').val();

            if (regexp.test(v) || v == "") {

                alert("한글로 싫어하는 재료명을 적어주세요.");
                checkAnimate(7)
                return;

            }
	
		
		
		if($(this).hasClass('active')){
			return false;
		}
		animateToDefault();

		$('.active').removeClass('active');

		var index = parseInt($(this).attr('data-index'));
		mainTl.tweenTo("stopPoint-"+(index-1)+"", {onComplete: animateToActive, onCompleteParams:[$(this)]});
	});

	function animateToActive(el) {
		var index = parseInt(el.attr('data-index')) + 1;
		$('.copy-holder').find(".step-"+index+"").addClass('active');
		el.addClass('active');

		var innerCircle = el.find('.inner-circle');
		var inset = el.find('.inset');
		var circle = el.find('.circle');
		var mask = el.find('.mask');
		var fill = el.find('.fill');
		var number = el.next('p');
		var stepsCopy = $('.copy-holder div.active');

		TweenLite.set(number, {color: "rgb(250,250,250)", fontSize: 46})
		TweenLite.to(innerCircle, 0.15, {scale: 0});
		TweenLite.to(el, 0.3, {scale: 1.3, zIndex: 10, ease: Back.easeOut});
		TweenLite.fromTo(stepsCopy, 0.7, {autoAlpha: 0}, {autoAlpha: 1});
	}

	function animateToDefault(){
		var mainCircle = $('.radial-progress.active');
		var innerCircle = $('.radial-progress.active').find('.inner-circle');
		var inset = $('.radial-progress.active').find('.inset');
		var number = $('.radial-progress.active').next('p');
		var stepsCopy = $('.copy-holder div');

		TweenLite.to(innerCircle, 0.15, {scale: 1})
		TweenLite.set(number, {color: "rgb(119,119,119)", fontSize: 30});
		TweenLite.to(mainCircle, 0.3, {scale: 1, zIndex: 1, ease: Bounce.easeOut});
		TweenLite.to(stepsCopy, 0.7, {autoAlpha: 0});
	}

	
	
	function checkAnimate(num){
		
		if($("#click_"+num).hasClass('active')){

			return false;
		}

		animateToDefault();

		$('.active').removeClass('active');

		var index = parseInt($("#click_"+num).attr('data-index'));
		mainTl.tweenTo("stopPoint-"+(index-1)+"", {onComplete: animateToActive, onCompleteParams:[$("#click_"+num)]});
	}