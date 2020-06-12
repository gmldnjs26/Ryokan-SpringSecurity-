<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 컨텐츠 -->
<div id="content" class="sub pd_panel company dish_panel">
	<div class="wrapping">
		<!-- 서브타이틀 -->
		<div class="partner_top">
			<!-- 상단 서브 배너 영역 ---------------------->
			<div class="sub_visual">
				<img src="../common/img/pd/dish_board.jpg"  hspace="265"  />
			</div>
		</div>
		<div class="sub_wrap">
			<div class="contains">
				<div class="sub_title_box">
					<img src="../upload/dish/${mealVO.m_code}/${mealVO.m_logo}" alt="" />
				</div>
				<div class="notice_wrap">
					<div class="view_title">
						<h1 class="top_title">
							<img src="../upload/dish/${mealVO.m_code}/${mealVO.m_salespoint}" alt="">
						</h1>
						<p class="summary">${mealVO.m_content}</p>
					</div>

					<!-- 리스트-->
					<div class="pd_area">
						<div id="main_visual" class="main_visual">
							<div class="visual_slide">
								<!-- 이미지형 -->
								<c:forEach var="roop" begin="1" end="8" step="1">
									<c:set var="temp" value="m_photo${roop}" />
									<c:if test="${mealVO[temp] ne null}">
										<div class="list_box slide_01" style="background-color: #fff">
											<!-- 배경컬러 데이터 밖이라 컬러값을 넣을 수가 없음 -->
											<a href="#" alt=""> <!-- 이미지형 --> <span class="img_box pc bg_cover">
													<img src="../upload/dish/${mealVO.m_code}/${mealVO[temp]}" alt="" class="bg" />
													<!--<span class="text" style="background-image:url(common/img/main/title.png)"></span>-->
												</span> <!-- 웹 --> <span class="img_box mobile bg_cover">
													<img src="../upload/dish/${mealVO.m_code}/${mealVO[temp]}" alt="" class="bg" />
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
						<h2>プラン情報</h2>
						<div class="infor_both_side">
							<div class="left">
								<ul class="list01">
									<li><strong>対象期間</strong>${mealVO.m_start}~${mealVO.m_end}</li>
									<li><strong>お食事</strong>朝夕食付</li>
									<li><strong>価格</strong>お一人名様${mealVO.m_price}円</li>
								</ul>
							</div>
							<div class="right">
								<ul class="list01">
									<li><strong>支払方法</strong>現地決済またはオンラインクレジット決済</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //컨텐츠 -->
<%@ include file="../footer.jsp"%>