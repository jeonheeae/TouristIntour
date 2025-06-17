
// 전역 변수 wnum을 0으로 초기화합니다.
 	var wnum=0;
 // 자동 슬라이딩을 위한 변수 wwslidingAuto를 null로 초기화합니다.
	var wwslidingAuto=null;
// play_w 함수는 슬라이더의 방향을 제어합니다.
	function play_w(directw) {	
	// 'right' 방향으로 이동할 경우
			if(directw=="right"){
				wnum++;
				// wnum이 2를 초과하면 0으로 초기화합니다.
				if(wnum>2)wnum=0;
				 // 'left' 방향으로 이동할 경우
			}else if(directw=="left"){
				wnum--;
				 // wnum이 0 미만이면 2로 초기화합니다.
				if(wnum<0)wnum=2;
				// 그 외의 경우, wnum을 directw로 설정합니다
			}else {
				wnum = directw;
			}
			 // 모든 슬라이딩 버튼의 이미지를 비활성화된 상태로 변경합니다.
			$(".rollingbtn").find('li.seq a').each(function(){
				$(".rollingbtn li.seq a img").attr('src',$(".rollingbtn li.seq a img").attr('src').replace('_on.png','_off.png'));
			});
			// 현재 활성화된 슬라이딩 버튼의 이미지를 활성화된 상태로 변경합니다.
			$(".rollingbtn li.butt"+wnum+ " a img").attr('src',$(".rollingbtn li.butt"+wnum+ " a img").attr('src').replace('_off.png','_on.png'));
 			// wnum 값에 따라 해당하는 이미지 리스트의 투명도를 조절하여 슬라이드를 표시합니다.
				if(wnum==0) {
				$(".viewImgList li.imglist1").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist2").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist0").animate({'opacity' : 1 },1000);
			}else if (wnum==1){
				$(".viewImgList li.imglist0").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist2").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist1").animate({'opacity' : 1 },1000);
			}else if (wnum==2){
				$(".viewImgList li.imglist0").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist1").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist2").animate({'opacity' : 1 },1000);
			}
			// 자동 슬라이딩 타이머를 초기화합니다.
			if(wwslidingAuto)clearTimeout(wwslidingAuto);
			 // 6초 후에 'right' 방향으로 자동 슬라이딩을 실행합니다.
			wwslidingAuto=setTimeout("play_w('right')",6000);
	}
	// 자동 슬라이딩을 시작합니다.
	var wwslidingAuto=setTimeout("play_w('right')",6000);

// 문서가 준비되면 실행됩니다.
$(document).ready(function(){
	// '정지' 버튼을 클릭하면 자동 슬라이딩을 멈춥니다.
	$(".rollstop a").click(function(){
		$(this).parent().hide();
		$(".rollplay").css('display','inline-block');
		if(wwslidingAuto)clearTimeout(wwslidingAuto);	
	});
	// '재생' 버튼을 클릭하면 자동 슬라이딩을 시작합니다.
	$(".rollplay a").click(function(){
		$(this).parent().hide();
		$(".rollstop").css('display','inline-block');
		play_w('right');
	});
	// 각 슬라이딩 버튼에 클릭 이벤트를 바인딩합니다.
	$(".rollingbtn li.seq a").each(function(index){
		$(this).click(function(){
			$(".rollplay").hide();
			$(".rollstop").css('display','inline-block');
			if(wwslidingAuto)clearTimeout(wwslidingAuto);	
			play_w(index);
		});
	});

});