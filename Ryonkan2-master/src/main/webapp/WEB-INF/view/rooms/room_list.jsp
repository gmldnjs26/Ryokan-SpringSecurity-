<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div id="content" class="sub pd_panel dogs_panel">
	<div class="wrapping">
		<!-- 서브타이틀 -->
		<div class="partner_top">
			<!-- 상단 서브 배너 영역 ---------------------->
			<div class="sub_visual">
				<img src="../common/img/pd/room_board.jpg" hspace="265" style="width: 80%;" />
			</div>

			<!-- //상단 서브 배너 영역 ---------------------->

			<div class="contains">

				<div class="show_mobile">
					<p class="partner_title">
						<b></b>
					</p>
				</div>
			</div>
		</div>

		<!-- //서브타이틀 -->

		<div class="sub_wrap">
			<div class="contains">
				<div class="sub_title_box">
					<img src="../common/img/room_view/1_sec1_title.png" alt="" />
				</div>
				<div class="notice_wrap">
					<div class="record_group">
						<p>木造りの温かみと和の情緒あふれる タイプの客室。</p>
					</div>
					<form name="searchfrm" id="searchfrm">
						<input type="hidden" name="b_brand_code" id="b_brand_code" value="">
						<input type="hidden" name="b_age" id="b_age" value="">
						<input type="hidden" name="b_size" id="b_size" value="">
						<input type="hidden" name="b_function" id="b_function" value="">
						<input type="hidden" name="board_type" id="board_type">
						<input type="hidden" name="board_idx" id="board_idx">
						<input type="hidden" name="gotolist" id="gotolist">
						<input type="hidden" name="page" id="page">
					</form>

					<!-- 리스트-->
					<div class="pd_area">
						<ul>
							<c:forEach var="room" items="${roomList}">
								<li>
									<p class="img">
										<c:choose>
											<c:when test="${check_in != null }">
												<img src="../upload/room/${room.rurl_off}" 
												onclick="location.href='/room/sub?r_code=${room.r_code }&check_in=${checkIn }&check_out=${checkOut }'"
												onmouseover="this.src='../upload/room/${room.rurl_on}'" onmouseout="this.src='../upload/room/${room.rurl_off}'" alt="" class="viewphoto" />
											</c:when>
											<c:otherwise>
												<img src="../upload/room/${room.rurl_off}" onclick="location.href='/room/sub?r_code=${room.r_code }'" onmouseover="this.src='../upload/room/${room.rurl_on}'" onmouseout="this.src='../upload/room/${room.rurl_off}'" alt="" 　class="viewphoto" />
											</c:otherwise>
										</c:choose>
									</p>
									<p class="cate">
										<img src="../upload/room/${room.rurl_title}" alt="" class="viewphoto" />
									</p>
									<div class="btn-list-area">

										<c:choose>
											<c:when test="${check_in != null }">
												<a href="/room/sub?r_code=${room.r_code }&check_in=${check_in}&check_out=${check_out}" class="btn-default">ご予約/詳細</a>
											</c:when>
											<c:otherwise>
												<a href="/room/sub?r_code=${room.r_code }" class="btn-default">ご予約/詳細</a>
											</c:otherwise>
										</c:choose>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<script>
				function floatinglayout() {

					var scrTop = $(window).scrollTop(); // 스크롤 바가 있는 수직값 ??

					var $wr = $(".rsv-sel-info-wr"); // 플로팅 보드 클래스
					var $p = $(".sub_wrap");// 플로팅 보드의 상위 클래스

					if ($(window).width() < 1000) {//브라우저 창 넓이가 1000px보다 작으면, 다시말해 모바일로 보는 경우에는 플로팅 보드를 고정시킨다
						var toTop = 0;
						$wr.stop().animate({
							"top" : toTop
						});
					} else { // 일반적인 브라우저 창으로 보는 경우에는

						if ($p.offset().top < scrTop) { // 스크롤이 $p보다 낮은 곳에 있으면, 플로팅보드의 위치를 '(스크롤 위치) - (p위치) + 70(헤더 메뉴 두께)'로 이동															 
							// $p.offset().top 브라우저 상단을 기준으로 $p 엘리먼트가 위치한 절대좌표값, scrTop 현재의 스크롤값
							var toTop = scrTop - $p.offset().top + 70;
						} else {
							var toTop = 0;
						}
						var limitTop = ($p.outerHeight() - $wr.outerHeight());
						if (toTop > limitTop) { // .outerHeight() 선택한 요소 집합의 첫 번째 요소의 높이에 패딩 영역과 테두리를 포함한 높이를 반환한다. 또는 인수로 true를 전달받으면 마진 영역까지 포함한 높이를 반환한다.
							toTop = limitTop;
						}

						$wr.stop().animate({
							"top" : toTop
						});
					}
				}
			</script>
		</div>
	</div>
</div>
<!-- //컨텐츠 -->
<%@ include file="../footer.jsp"%>