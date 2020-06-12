<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div id="content" class="main">
	<div id="main_visual" class="main_visual">
		<div class="visual_slide">
			<!-- 이미지형 -->
			<c:forEach var="slide_num" begin="1" end="6" step="1">
				<div class="list_box slide_01" style="background-color: #fff">
					<!-- 배경컬러 데이터 밖이라 컬러값을 넣을 수가 없음 -->
					<a href="#" alt=""> <!-- 이미지형 --> <span class="img_box pc bg_cover">
							<img src="file/banner/main/main_banner0${slide_num}.jpg" alt="" class="bg" />
							<!--<span class="text" style="background-image:url(common/img/main/title.png)"></span>-->
						</span> <!-- 웹 --> <span class="img_box mobile bg_cover">
							<img src="file/banner/main/main_banner0${slide_num}.jpg" alt="" class="bg" />
						</span> <!-- 모바일 -->
					</a>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="slide_btn">
		<div class="btn_box">
			<a href="#" class="btn_slide prev">이전</a> <a href="#" class="btn_slide next">다음</a>
		</div>
	</div>
	<!--<a href="#" class="btn_page_down"><img src="img/icon/page_arrow_bottom.png" alt=""></a>-->
</div>
<div class="mainVis">
	<style type="text/css">
.search .btnRefresh {
	position: absolute;
	right: 0;
	top: -37px;
	height: 16px;
	line-height: 16px;
	color: #666;
	font-size: 13px;
}

.search .btnRefresh:after {
	content: '';
	position: absolute;
	left: 0;
	right: 0;
	bottom: -5px;
	height: 1px;
	background: #aaa;
}

.search .btnRefresh:before {
	vertical-align: top;
	margin: 1px 4px 0 0;
}
</style>

	<div class="schFormWrap">
		<!-- Search Tab // -->
		<ul class="schTab" data-type="tab" data-titles=">li>a">
			<li class="active"><a href="#schRoom" id="tabRoom" onclick="fnShowStepGuide('RM');">お部屋 &amp; お食事プラン</a></li>
		</ul>
		<!-- // Search  Tab -->

		<!-- Room Tab Contents // -->
		<div id="schRoom" class="search schBox room schForm active" style="display: block;">
			<form name="srchRoomFrm" id="srchRoomFrm" method="post" action="reserve_search_date.do">
				<div class="schFm">

					<!-- check in // -->
					<div class="schPeriod checkin_icon i-schperiod">

						<input type="text" class="ipt-2 dropup" title="Check In" name="depart" id="depart" placeholder="Check In" readonly="readonly">
					</div>
					<!-- // check in -->

					<!-- check out // -->
					<div class="schOption ico i-schOpt">

						<input type="text" id="return" name="return" class="ipt-2" title="Check Out" placeholder="Check Out" readonly="readonly">
					</div>
					<!-- // check out -->
				</div>
				<div class="schCheck">
					<span class="radG"> </span>
				</div>
				<input type="submit" class="btnSch" value="検索" />
			</form>
		</div>
	</div>
</div>



<div id="content" class="sub company_panel company">
	<div class="wrapping">
		<!-- 서브타이틀 -->
		<div class="partner_top">

			<div class="contains">
				<div class="lnb_tab_box_sm">
					<div class="lnb_tab_menu_sm">
						<ul class="sm_tab">
							<li class="sm_current" data-tab="company"><a href="javascript:void(0)">会社紹介</a></li>
							<li data-tab="event"><a href="javascript:void(0)">会員特典</a></li>
							<li data-tab="tour"><a href="javascript:void(0)">付帯施設</a></li>
							<li data-tab="map"><a href="javascript:void(0)">会社地図</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- //서브타이틀 -->

		<!-- top -->
		<div class="sub_wrap brand_top">
			<div class="contains">
				<div id="company" class="sm_tab_content current">
					<%@ include file="./company/test_company.jsp"%>
				</div>
				<div id="event" class="sm_tab_content">
					<%@ include file="./company/test_event.jsp"%>
				</div>
				<div id="tour" class="sm_tab_content">
					<%@ include file="./company/test_tour.jsp"%>
				</div>
				<div id="map" class="sm_tab_content">
					<%@ include file="./company/test_map.jsp"%>
				</div>
			</div>
		</div>

	</div>
</div>
<!-- //컨텐츠 -->

<script>
	$(function() {
		$('ul.sm_tab li').click(function() {
			var active = $(this).attr('data-tab');
			$('ul.sm_tab li').removeClass('sm_current');
			$('.sm_tab_content').removeClass('current');
			$(this).addClass('sm_current');
			$('#' + active).addClass('current');
		});
	});
</script>
<!-- //탭 javascript -->
<!-- //컨텐츠 -->
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
			onClose : function(selectedDate) {
				$('#return').datepicker("option", "minDate", selectedDate);
			}
		});
		$("#return").datepicker({
			showAnim : 'drop',
			numberOfMonth : 1,
			minDate : minDate,
			dateFormat : 'yy-mm-dd',
		/* onClose : function(selectedDate) {
			$('#depart').datepicker("option", "minDate", selectedDate);
		} */
		});
	});
</script>

</body>
<%@ include file="footer.jsp"%>