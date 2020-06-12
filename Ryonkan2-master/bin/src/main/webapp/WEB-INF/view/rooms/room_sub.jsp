<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script>
	jQuery(function($) {
		var minDate = new Date();
		$.datepicker.regional["jp"] = {
			closeText : '閉じる',
			prevText : '先月',
			nextText : '来月',
			currentText : '今日',
			monthNames : [ '1月(JAN)', '2月(FEB)', '3月(MAR)', '4月(APR)',
					'5月(MAY)', '6月(JUN)', '7月(JUL)', '8月(AUG)', '9月(SEP)',
					'10月(OCT)', '11月(NOV)', '12月(DEC)' ],
			monthNamesShort : [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月',
					'9月', '10月', '11月', '12月' ],
			dayNames : [ '日', '月', '火', '水', '木', '金', '土' ],
			dayNamesShort : [ '日', '月', '火', '水', '木', '金', '土' ],
			dayNamesMin : [ '日', '月', '火', '水', '木', '金', '土' ],
			weekHeader : 'Wk',
			dateFormat : 'yy-mm-dd',
			firstDay : 0,
			isRTL : false,
			showMonthAfterYear : true,
			yearSuffix : ""
		};
		$.datepicker.setDefaults($.datepicker.regional["jp"]);

		// Today 버튼 코드 추가
		/* $.datepicker._gotoToday = function(id) {
			$(id).datepicker('setDate', new Date());
			$(".ui-datepicker").hide().blur();
		}; */
		$("#depart").datepicker({
			showAnim : 'drop',
			numberOfMonth : 1,
			minDate : minDate,
			dateFormat : 'yy-mm-dd',
			beforeShowDay : noDays,
			onClose : function(selectedDate) {
				$('#return').datepicker("option", "minDate", selectedDate);
			}
		});
		$("#return").datepicker({
			showAnim : 'drop',
			numberOfMonth : 1,
			beforeShowDay : noDays,
			minDate : minDate,
			dateFormat : 'yy-mm-dd'
		/* onClose : function(selectedDate) {
			$('#depart').datepicker("option", "minDate", selectedDate);
		} */
		});
		var dd = [];
		<c:forEach items="${dateList }" var="item" varStatus="idx">
			dd.push("${item}");
		</c:forEach>
		function noDays(date) {
			var month = date.getMonth() + 1;
			if (month < 10) {
				month = "0" + month;
			}
			var dates = date.getDate();
			if (dates < 10) {
				dates = "0" + dates;
			}
			var ymd = date.getFullYear() + "-" + month + "-" + dates;
			for (i = 0; i < dd.length; i++) {
				if ($.inArray(ymd, dd) != -1) {
					return [ false ];
				} else {
					return [ true ];
				}
			}
			return [true]; // 예약 일정이 없을때 위 for문 안타서 여기서 true 리턴했다.
		}
	});
</script>

<div id="content" class="sub pd_panel dogs_panel">
	<input type="hidden" id="dateList" value="${dateList }" />
	<div class="wrapping">
		<!-- 서브타이틀 -->
		<div class="partner_top">
			<!-- 상단 서브 배너 영역 ---------------------->
			<div class="sub_visual">
				<img src="common/img/pd/room_board.jpg" hspace="265" />
			</div>
			<div class="contains">

				<ul class="rsvStep" id="stepGuide_RM">
					<li class="step-1 active">STEP 1. <span class="step">お部屋の選択</span></li>
					<li class="step-2">STEP 2. <em class="step">お食事プランの選択</em></li>
					<li class="step-3">STEP 3. <span class="step">予約完了</span></li>
				</ul>
			</div>
			<div class="contains">
				<div class="show_mobile">
					<p class="partner_title">
						<b></b>
					</p>
				</div>
			</div>
			<!-- 상단 서브 배너 영역 ---------------------->
		</div>

		<div class="sub_wrap">
			<div class="contains">
				<div class="sub_title_box">
					<img src="common/img/room_view/1_sec1_title.png" alt="" />
				</div>
				<div class="notice_wrap">

					<div class="view_title">
						<h1 class="top_title">
							<img src="upload/room/${roomVO.r_logo}" alt="">
						</h1>
						<p class="summary">${roomVO.r_content}</p>
					</div>

					<!-- 리스트-->
					<div class="pd_area">
						<div id="main_visual" class="main_visual">
							<div class="visual_slide">
								<!-- 이미지형 -->
								<c:forEach var="roop" begin="1" end="6" step="1">
									<c:set var="temp" value="rurl${roop}" />
									<c:if test="${roomVO[temp] ne null}">
										<div class="list_box slide_01" style="background-color: #fff">
											<!-- 배경컬러 데이터 밖이라 컬러값을 넣을 수가 없음 -->
											<a href="#" alt=""> <!-- 이미지형 --> <span class="img_box pc bg_cover">
													<img width="200" src="upload/room/${roomVO[temp]}" alt="" class="bg" />
													<!--<span class="text" style="background-image:url(common/img/main/title.png)"></span>-->
												</span> <!-- 웹 --> <span class="img_box mobile bg_cover">
													<img src="upload/room/${roomVO[temp]}" alt="" class="bg" />
												</span> <!-- 모바일 -->
											</a>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<div class="slide_btn">
								<div class="btn_box">
									<a href="#" class="btn_slide prev">이전</a> <a href="#" class="btn_slide next">다음</a>
								</div>
							</div>
							<!--<a href="#" class="btn_page_down"><img src="img/icon/page_arrow_bottom.png" alt=""></a>-->
						</div>
					</div>
					<div class="Information" style="margin-bottom: 10px;">
						<h2 align="center">客室情報</h2>
						<div class="infor_both_side">
							<div class="left">
								<ul class="list01">
									<li><strong>間取り</strong>${roomVO.r_size}</li>
									<li><strong>眺望</strong>${roomVO.r_sight}</li>
									<li><strong>定員</strong>${roomVO.r_limit}名様</li>
								</ul>
							</div>
							<div class="right">
								<ul class="list01">
									<li><strong>チェックイン</strong>入館並びにチェックインは午後一時から</li>
									<li class="type01"><strong>&nbsp;</strong>お部屋の入室は午後三時からされます。</li>
									<li><strong>チェック<br />アウト
									</strong>午前11時</li>
								</ul>
							</div>
						</div>
						<ul class="alert_list">
							<li>&nbsp;※チェックインとチェックアウトの時間は当日の都合のよって変わることがございます。</li>
							<li>下のカレンダーでグレーの日はご予約できません。</li>
						</ul>
					</div>
					<div id="schRoom" class="search schBox room schForm active" style="display: block;">
						<form name="srchRoomFrm" id="srchRoomFrm" method="post" action="reserve_step2.do">
							<div class="schFm">
								<input type="hidden" value="${roomVO.r_code }" name="r_code" />
								<input type="hidden" value="${roomVO.r_price }" name="r_price" />
								<input type="hidden" value="${roomVO.r_title }" name="r_title" />
								<!-- check in // -->
								<div class="schPeriod checkin_icon i-schperiod">
									<input type="text" class="ipt-2 dropup" title="Check In" name="depart" id="depart" placeholder="Check In" readonly="readonly" value="${check_in }">
								</div>
								<!-- // check in -->

								<!-- check out // -->
								<div class="schOption ico i-schOpt">
									<input type="text" id="return" name="return" class="ipt-2" title="Check Out" placeholder="Check Out" readonly="readonly" value="${check_out }">
								</div>
								<!-- // check out -->
							</div>
							<div align="center" class="btn_reserve">
								<input type="submit" class="btnF btn-3" value="予約する" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		var body = $('body').width();
		if (body < 1200) {
			var slider_01 = $('#slider_top').bxSlider({
				auto : false,
				controls : false,
				pager : false,
				maxSlides : 1,
				moveSlides : 1,
				slideWidth : 1000,
				slideMargin : 0,
				pause : 2000,
				infiniteLoop : false
			});
			console.log('a');
		}
		if (body > 1200) {
			var slider_01 = $('#slider_top').bxSlider({
				auto : false,
				controls : false,
				pager : false,
				maxSlides : 4,
				moveSlides : 1,
				slideWidth : 200,
				slideMargin : 0,
				pause : 2000,
				autoHover : false,
				infiniteLoop : false
			});
			console.log('b');
		}
	});
</script>
<script>
	$(function() {
		$('#faq').hide();

	});
	function viewNotice(board_idx, board_type, page, num) {

		if (board_type == 'THUM_NTC_0') {
			location.href = "./center/notice_view.php?board_idx=" + board_idx
					+ "&board_type=" + board_type;
		} else if (board_type == 'FAQ') {
			location.href = "./center/faq.php?board_idx=" + board_idx
					+ "&board_type=" + board_type;
		}
	}
	function changeNotice(stat) {
		if (stat == 'A') {
			$('#noti').show();
			$('#faq').hide();
			$('#bnoti').attr('class', 'tab active');
			$('#bfaq').attr('class', 'tab');
		} else if (stat == 'B') {
			$('#noti').hide();
			$('#faq').show();
			$('#bnoti').attr('class', 'tab');
			$('#bfaq').attr('class', 'tab active');
		}
	}
</script>

<script>
	$('#slider1').bxSlider({
		//mode: 'fade',
		autoControls : true,
		pause : 2000
	});
	$('#slider2').bxSlider({
		//mode: 'fade',
		autoControls : true,
		pause : 2000
	});

	$(document).ready(function() {
		var body = $('body').width();
		if (body < 1200) {
			var slider_03 = $('#slider_top').bxSlider({
				auto : true,
				controls : true,
				pager : true,
				maxSlides : 1,
				moveSlides : 1,
				slideWidth : 1000,
				slideMargin : 0,
				pause : 2000,
			// autoHover:true,
			});
			console.log('a');
		}
		if (body > 1200) {
			var slider_03 = $('#slider_top').bxSlider({
				auto : true,
				controls : true,
				pager : true,
				maxSlides : 4,
				moveSlides : 1,
				slideWidth : 200,
				slideMargin : 0,
				pause : 2000,
				autoHover : true,
			});
			console.log('b');
		}
	});
</script>



<!-- //컨텐츠 -->
<%@ include file="../footer.jsp"%>