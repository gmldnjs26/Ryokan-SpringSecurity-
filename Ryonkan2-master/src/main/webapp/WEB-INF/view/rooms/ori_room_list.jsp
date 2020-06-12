<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div id="content" class="sub pd_panel dogs_panel">
	<div class="wrapping">
		<!-- 서브타이틀 -->
		<div class="partner_top">
			<!-- 상단 서브 배너 영역 ---------------------->
			<div class="sub_visual">
				<img src="../../common/img/pd/dogs_bg_m.jpg" alt=""
					class="show_mobile" />
			</div>

			<!-- view페이지일경우, 브랜드에 따라 비쥬얼이미지가 달라져야합니다. (웹:배경이미지&컬러,모바일:이미지) -->
			<!-- <div class="sub_visual" style="background-image:url(../../common/img/brand/bg.jpg); background-color:#fff">
	<img src="../../common/img/pd/dogs_bg_m.jpg" alt="모바일이미지" class="show_mobile"/>
</div>-->
			<!-- //상단 서브 배너 영역 ---------------------->

			<div class="contains">
				<div class="lnb_tab_box">
					<div class="lnb_tab_menu">
						<!--<a href="../brand.php" class="btn_tab">Dogs 브랜드 소개</a>-->
						<a href="../list_dry.php" class="btn_tab active">Dry dog food</a>
						<a href="../list_wet.php" class="btn_tab">Wet dog food</a> <a
							href="../list_treats.php" class="btn_tab">Dog treats</a>
					</div>
				</div>
				<div class="show_mobile">
					<p class="partner_title">
						<b>Dogs</b>
					</p>
				</div>
			</div>
		</div>

		<!-- //서브타이틀 -->

		<div class="sub_wrap">
			<div class="contains">
				<div class="sub_title_box">
					<p class="title">お部屋</p>
				</div>

				<div class="notice_wrap">
					<!-- 검색 -->
					<script>
jQuery(function() {

	
    				
	
});
	function dogsearch(){

		f = document.searchfrm;
		f.action = searchUrl;
		f.method = 'GET';
		f.submit();
		
	}

	function brandval(){
		var brandval = '';
		 $('input:checkbox[name="brand_code"]').each(function() {
			  if(this.checked){//checked 처리된 항목의 값
					if(brandval == ''){
						brandval += this.value; 
					}else{
						brandval += ','+this.value;
					}
			  }
		 });
		$('#b_brand_code').val(brandval);		
		
	}

	function ageval(){
		var ageval = '';
		 $('input:checkbox[name="age_code"]').each(function() {
			  if(this.checked){//checked 처리된 항목의 값
					if(ageval == ''){
						ageval += this.value; 
					}else{
						ageval += ','+this.value;
					}
			  }
		 });
		$('#b_age').val(ageval);		
		
	}

	function sizeval(){
		var sizeval = '';
		 $('input:checkbox[name="size_code"]').each(function() {
			  if(this.checked){//checked 처리된 항목의 값
					if(sizeval == ''){
						sizeval += this.value; 
					}else{
						sizeval += ','+this.value;
					}
			  }
		 });
		$('#b_size').val(sizeval);		
		
	}
	function functionval(){
		var functionval = '';
		 $('input:checkbox[name="function_code"]').each(function() {
			  if(this.checked){//checked 처리된 항목의 값
					if(functionval == ''){
						functionval += this.value; 
					}else{
						functionval += ','+this.value;
					}
			  }
		 });
		$('#b_function').val(functionval);		
		
	}

	function newcheck(){
		location.href =  searchUrl;

	}
</script>
					<form name="searchfrm" id="searchfrm">
						<input type="hidden" name="b_brand_code" id="b_brand_code"
							value=""> <input type="hidden" name="b_age" id="b_age"
							value=""> <input type="hidden" name="b_size" id="b_size"
							value=""> <input type="hidden" name="b_function"
							id="b_function" value=""> <input type="hidden"
							name="board_type" id="board_type"> <input type="hidden"
							name="board_idx" id="board_idx"> <input type="hidden"
							name="gotolist" id="gotolist"> <input type="hidden"
							name="page" id="page">
						<div class="pd_search_wrap">
							<div class="pd_search">
								<ul class="search">
									<li>
										<p class="hide_mobile">
											<span class="subject">브랜드</span>
										</p> <a href="../#" class="show_mobile"><span class="subject">브랜드</span>
											<span class="arrow">▼</span></a>
										<div class="answer">
											<label id="bchklb1" class="check_box"><input
												type="checkbox" class="check" id="brand_code"
												name="brand_code" value="275" onclick="brandval()">아이디얼레시피</label>
											<label id="bchklb2" class="check_box"><input
												type="checkbox" class="check" id="brand_code"
												name="brand_code" value="277" onclick="brandval()">슈슈</label>
											<label id="bchklb3" class="check_box"><input
												type="checkbox" class="check" id="brand_code"
												name="brand_code" value="276" onclick="brandval()">뉴트리웰</label>
											<label id="bchklb4" class="check_box"><input
												type="checkbox" class="check" id="brand_code"
												name="brand_code" value="278" onclick="brandval()">자연가득</label>
											<label id="bchklb5" class="check_box"><input
												type="checkbox" class="check" id="brand_code"
												name="brand_code" value="279" onclick="brandval()">도그매니아</label>
											<label id="bchklb6" class="check_box"><input
												type="checkbox" class="check" id="brand_code"
												name="brand_code" value="452" onclick="brandval()">원더독스</label>

										</div>
									</li>
									<li>
										<p class="hide_mobile">
											<span class="subject">나이</span>
										</p> <a href="../#" class="show_mobile"><span class="subject">나이</span>
											<span class="arrow">▼</span></a>
										<div class="answer">
											<label id="achklb1" class="check_box"><input
												type="checkbox" class="check" id="age_code" name="age_code"
												value="233" onclick="ageval()">1세 이하</label> <label
												id="achklb2" class="check_box"><input
												type="checkbox" class="check" id="age_code" name="age_code"
												value="234" onclick="ageval()">1세 이상</label> <label
												id="achklb3" class="check_box"><input
												type="checkbox" class="check" id="age_code" name="age_code"
												value="235" onclick="ageval()">6세 이상</label> <label
												id="achklb4" class="check_box"><input
												type="checkbox" class="check" id="age_code" name="age_code"
												value="236" onclick="ageval()">전연령</label>

										</div>
									</li>
									<li>
										<p class="hide_mobile">
											<span class="subject">크기</span>
										</p> <a href="../#" class="show_mobile"><span class="subject">크기</span>
											<span class="arrow">▼</span></a>
										<div class="answer">
											<label id="schklb1" class="check_box"><input
												type="checkbox" class="check" id="size_code"
												name="size_code" value="238" onclick="sizeval()">소형견</label>
											<label id="schklb2" class="check_box"><input
												type="checkbox" class="check" id="size_code"
												name="size_code" value="239" onclick="sizeval()">중형견</label>
											<label id="schklb3" class="check_box"><input
												type="checkbox" class="check" id="size_code"
												name="size_code" value="240" onclick="sizeval()">대형견</label>

										</div>
									</li>
									<li>
										<p class="hide_mobile">
											<span class="subject">기능</span>
										</p> <a href="../#" class="show_mobile"><span class="subject">기능</span>
											<span class="arrow">▼</span></a>
										<div class="answer">
											<label id="fchklb1" class="check_box"><input
												type="checkbox" class="check" id="function_code"
												name="function_code" value="241" onclick="functionval()">유기농</label>
											<label id="fchklb2" class="check_box"><input
												type="checkbox" class="check" id="function_code"
												name="function_code" value="242" onclick="functionval()">천연원료</label>
											<label id="fchklb3" class="check_box"><input
												type="checkbox" class="check" id="function_code"
												name="function_code" value="243" onclick="functionval()">그레인프리</label>
											<label id="fchklb4" class="check_box"><input
												type="checkbox" class="check" id="function_code"
												name="function_code" value="244" onclick="functionval()">관절</label>
											<label id="fchklb5" class="check_box"><input
												type="checkbox" class="check" id="function_code"
												name="function_code" value="245" onclick="functionval()">피부</label>
											<label id="fchklb6" class="check_box"><input
												type="checkbox" class="check" id="function_code"
												name="function_code" value="246" onclick="functionval()">체중관리</label>
											<label id="fchklb7" class="check_box"><input
												type="checkbox" class="check" id="function_code"
												name="function_code" value="453" onclick="functionval()">영양식</label>
											<label id="fchklb8" class="check_box"><input
												type="checkbox" class="check" id="function_code"
												name="function_code" value="454" onclick="functionval()">일반식</label>
											<label id="fchklb9" class="check_box"><input
												type="checkbox" class="check" id="function_code"
												name="function_code" value="455" onclick="functionval()">예방식</label>

										</div>
									</li>
								</ul>
								<a href="../javascript:newcheck();" class="btn_reset">선택 초기화</a>
							</div>
							<div class="search_btn_wrap">
								<a href="../javascript:dogsearch();" class="btn2 btn_black">검색</a>
							</div>
						</div>
					</form>

					<!-- 리스트-->
					<div class="pd_area">
						<ul>
							<li><a href="../javascript:viewNotice('7182')">
									<p class="img">
										<img
											src="../file/dogs/dry/35120358951c433bcc96da3936d1098d_IMG190514184144.jpg"
											alt="" />
									</p>
									<p class="cate">뉴트리웰</p>
									<p class="title">뉴트리웰 그레인프리 전연령 오리</p>
							</a></li>
							<li><a href="../javascript:viewNotice('7181')">
									<p class="img">
										<img
											src="../file/dogs/dry/27e12950d16877316e9e128c1014ffdb_IMG190514184224.jpg"
											alt="" />
									</p>
									<p class="cate">뉴트리웰</p>
									<p class="title">뉴트리웰 그레인프리 전연령 연어</p>
							</a></li>
							<li><a href="../javascript:viewNotice('7053')">
									<p class="img">
										<img
											src="../file/dogs/dry/96392cc61842cdb00da899bd71d3b0db_IMG190515100208.jpg"
											alt="" />
									</p>
									<p class="cate">아이디얼레시피</p>
									<p class="title">스킨앤코트</p>
							</a></li>
							<li><a href="../javascript:viewNotice('7166')">
									<p class="img">
										<img
											src="../file/dogs/dry/02c2507fcd5b0e64d4b037f3fca9f25a_IMG190306144100.jpg"
											alt="" />
									</p>
									<p class="cate">뉴트리웰</p>
									<p class="title">뉴트리웰 인도어</p>
							</a></li>
							<li><a href="../javascript:viewNotice('7165')">
									<p class="img">
										<img
											src="../file/dogs/dry/7940dbe3b82fe3a85612982aba270975_IMG190306143936.jpg"
											alt="" />
									</p>
									<p class="cate">뉴트리웰</p>
									<p class="title">뉴트리웰 스마트</p>
							</a></li>
							<li><a href="../javascript:viewNotice('7164')">
									<p class="img">
										<img
											src="../file/dogs/dry/c8662ee1b267b31ffc2b34be10864d7c_IMG190306143508.jpg"
											alt="" />
									</p>
									<p class="cate">뉴트리웰</p>
									<p class="title">뉴트리웰브리더</p>
							</a></li>
							<li><a href="../javascript:viewNotice('7163')">
									<p class="img">
										<img
											src="../file/dogs/dry/e5b1a916b9a7a734e1c75d54ea1c3604_IMG190515101031.jpg"
											alt="" />
									</p>
									<p class="cate">뉴트리웰</p>
									<p class="title">뉴트리웰대형견퍼포먼스</p>
							</a></li>
							<li><a href="../javascript:viewNotice('7162')">
									<p class="img">
										<img
											src="../file/dogs/dry/4b9a1b62a9b7a190a4ca2eda085967ae_IMG190515101047.jpg"
											alt="" />
									</p>
									<p class="cate">뉴트리웰</p>
									<p class="title">뉴트리웰 대형견 어덜트</p>
							</a></li>
							<li><a href="../javascript:viewNotice('7161')">
									<p class="img">
										<img
											src="../file/dogs/dry/4c831027d0dc3afa7876e621cde53537_IMG190515101104.jpg"
											alt="" />
									</p>
									<p class="cate">뉴트리웰</p>
									<p class="title">뉴트리웰 대형견 퍼피</p>
							</a></li>
							<li><a href="../javascript:viewNotice('7156')">
									<p class="img">
										<img
											src="../file/dogs/dry/6eee69c0292a582d9620d91bd680a47d_IMG190515100226.jpg"
											alt="" />
									</p>
									<p class="cate">아이디얼레시피</p>
									<p class="title">아이디얼레시피 시니어앤다이어트</p>
							</a></li>
							<li><a href="../javascript:viewNotice('7155')">
									<p class="img">
										<img
											src="../file/dogs/dry/535060735cc98718cc06c80116dee8b2_IMG190515100248.jpg"
											alt="" />
									</p>
									<p class="cate">아이디얼레시피</p>
									<p class="title">아이디얼레시피 어덜트</p>
							</a></li>
							<li><a href="../javascript:viewNotice('7154')">
									<p class="img">
										<img
											src="../file/dogs/dry/e2dc9ab4b1ace87c3f68ba4547d00e06_IMG190515100306.jpg"
											alt="" />
									</p>
									<p class="cate">아이디얼레시피</p>
									<p class="title">아이디얼레시피 퍼피</p>
							</a></li>

						</ul>
					</div>


					<!-- 페이징 -->
					<div class="page_list">
						<a href=".././list_dry.php?qr=&page=1" class="btn_first"><span>처음</span></a>
						<a href="../#" class="btn_page active">1</a> <a
							href=".././list_dry.php?qr=&page=2" class="btn_page">2</a><a
							href=".././list_dry.php?qr=&page=3" class="btn_page">3</a><a
							href=".././list_dry.php?qr=&page=3" class="btn_last"><span>마지막</span></a>
						</ul>
					</div>

				</div>
			</div>
		</div>


		<!-- 서브 도움 배너 -->
		<div class="partner_help">
			<div class="contains">
				<ul class="help_list">

					<li class="help_01 page_animate"><a
						href="../http://170.170.103.67/center/notice.php"> <img
							src="../file/banner/help/0a6450e288a4c848a30cb3478bbce76c_IMG180927022628.jpg"
							alt="test2" />
					</a>
					<!--도움배너 1--></li>

					<li class="help_01 page_animate"><a href="../center/faq.php">
							<img
							src="../file/banner/help/74b859ec74391eea08a5b0fb13de067b_IMG180927022710.jpg"
							alt="test1" />
					</a>
					<!--도움배너 1--></li>

				</ul>
			</div>
		</div>
		<!-- //서브 도움 배너 -->

	</div>
</div>
<!-- //컨텐츠 -->
<%@ include file="../footer.jsp"%>