
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div id="content" class="sub pd_panel spa_panel">
	<div class="wrapping">
		<!-- 서브타이틀 -->
		<div class="partner_top">
			<!-- 상단 서브 배너 영역 ---------------------->
			<div class="sub_visual">
				<img src="common/img/pd/room_board.jpg" hspace="265"/>
			</div>

			<!-- view페이지일경우, 브랜드에 따라 비쥬얼이미지가 달라져야합니다. (웹:배경이미지&컬러,모바일:이미지) -->
			<!-- <div class="sub_visual" style="background-image:url(../../common/img/brand/bg.jpg); background-color:#fff">
	<img src="../../common/img/pd/dogs_bg_m.jpg" alt="모바일이미지" class="show_mobile"/>
</div>-->
			<!-- //상단 서브 배너 영역 ---------------------->

			<div class="contains">

				<div class="show_mobile">
					<p class="partner_title">
						<b></b>
					</p>
				</div>
			</div>
		</div>


		<div class="sub_wrap">
			<div class="contains">
				<div class="notice_wrap">
					<c:forEach var="spa_in" items="${spa_in}">
						<c:if test="${spa_in.scode eq 0}">
							<div class="sub_title_box spa_sub_title_box">
								<img class="spa_logo" src="./upload/spa/in/0/0_title.png" alt="" />
								<div class="view_title">
									<p class="summary spa_summary">${spa_in.scontent}</p>
								</div>
							</div>
						</c:if>
						<c:if test="${spa_in.scode eq 1}">
							<!-- 리스트-->
							<div class="pd_area">
								<div id="main_visual" class="main_visual spa_visual">
									<div class="visual_slide">
										<!-- 이미지형 -->
										<c:forEach var="roop" begin="1" end="2" step="1">
											<c:set var="temp" value="sphoto${roop}" />
											<c:if test="${spa_in[temp] ne null}">
												<div class="list_box slide_01" style="background-color: #fff">
													<!-- 배경컬러 데이터 밖이라 컬러값을 넣을 수가 없음 -->
													<a href="#" alt=""> <!-- 이미지형 --> <span class="img_box pc bg_cover spa_sub">
															<img src="upload/spa/in/${spa_in.scode}/${spa_in[temp]}" alt="" class="bg" />
															<!--<span class="text" style="background-image:url(common/img/main/title.png)"></span>-->
														</span>
														<!-- 웹 --> <span class="img_box mobile bg_cover spa_sub">
															<img src="upload/spa/in/${spa_in.scode}/${spa_in[temp]}" alt="" class="bg" />
														</span>
														<!-- 모바일 -->
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
								<h2 class="spa_information">
									<img src="upload/spa/in/${spa_in.scode}/${spa_in.stitle}" alt="つつじの湯">
								</h2>
								<div class="infor_both_side">
									<ul class="list01">
										<li><strong>利用時間</strong><strong>＜男性＞</strong>${spa_in.s_m_time1_start}~${spa_in.s_m_time1_end}&nbsp;&nbsp;&nbsp;翌日 &nbsp;${spa_in.s_m_time2_start}~${spa_in.s_m_time2_end}</li>
										<li class="type01"><strong>&nbsp;</strong><strong>＜女性＞</strong>${spa_in.s_f_time1_start}~${spa_in.s_f_time1_end}</li>
										<li><strong>&nbsp;</strong></li>
										<li>${spa_in.scontent}</li>
									</ul>
								</div>
							</div>
						</c:if>
						<c:if test="${spa_in.scode eq 2}">
							<div class="spa_img_box">
								<img src="upload/spa/in/${spa_in.scode}/${spa_in.sphoto1}" alt="" class="spa_img" />
							</div>
							<div class="Information" style="margin-bottom: 10px;">
								<h2 class="spa_information">
									<img src="upload/spa/in/${spa_in.scode}/${spa_in.stitle}" alt="ひいらぎの湯">
								</h2>
								<div class="infor_both_side">
									<ul class="list01">
										<li><strong>利用時間</strong><strong>＜男性＞</strong>${spa_in.s_m_time1_start}~${spa_in.s_m_time1_end}</li>
										<li><strong>利用時間</strong><strong>＜女性＞</strong>${spa_in.s_f_time1_start}~${spa_in.s_f_time1_end}&nbsp;&nbsp;&nbsp;翌日 &nbsp;${spa_in.s_f_time2_start}~${spa_in.s_f_time2_end}</li>

										<li><strong>&nbsp;</strong></li>
										<li>${spa_in.scontent}</li>
									</ul>
								</div>
							</div>
						</c:if>

						<c:if test="${spa_in.scode eq 3}">
							<div class="sec1_3">
								<img src="upload/spa/in/${spa_in.scode}/${spa_in.sphoto1}" width="433" height="269" alt="家族風呂">
								<h4>
									<img src="upload/spa/in/${spa_in.scode}/${spa_in.stitle}" alt="家族風呂">
								</h4>
								<dl>
									<dt>利用時間</dt>
									<dd>${spa_in.s_m_time1_start}~${spa_in.s_m_time1_end}翌日${spa_in.s_m_time2_start}~${spa_in.s_m_time2_end}</dd>
								</dl>
								<p>${spa_in.scontent}</p>
							</div>
						</c:if>

						<c:if test="${spa_in.scode eq 4}">
							<div class="sec1_4">
								<h4>
									<img src="upload/spa/in/${spa_in.scode}/${spa_in.stitle}" width="154" height="18" alt="温泉情報">
								</h4>
								<table>
									<tbody>
										<tr>
											<th>泉質</th>
											<td>ナトリウム・カルシウムー塩化物高温泉（Na・Ca-Cl泉）</td>
										</tr>
										<tr>
											<th>効能</th>
											<td>
												神経痛・筋肉痛・関節痛・五十肩・運動まひ・関節のこわばり・うちみ・くじき・慢性消化器病・痔症・冷え性・病後回復・疲労回復・健康増進・<br>きりきず・やけど・慢性皮膚病・虚弱児童・慢性婦人病
											</td>
										</tr>
										<tr>
											<th>禁忌症</th>
											<td>腎臓病・高血圧症・その他一般にむくみのあるもの</td>
										</tr>
										<tr>
											<th>泉温</th>
											<td>約42℃（源泉温度37〜83℃）</td>
										</tr>
									</tbody>
								</table>
							</div>
						</c:if>
					</c:forEach>

					<c:forEach var="spa_out" items="${spa_out}" varStatus="status">
						<c:if test="${spa_out.scode eq 0}">
							<div class="sec2">
								<h3>
									<img src="upload/spa/out/${spa_out.scode}/${spa_out.stitle}" width="372" height="72" alt="城崎温泉 外湯めぐり">
								</h3>
								<p class="summary spa_summary">
									大谿川（おおたにがわ）に点在する7つの外湯には、それぞれに由来と数々の言い伝えが残っており、城崎温泉の歴史の深さを物語って居ます。浴衣姿にカランコロンと下駄の音を鳴らしながら、旅情たっぷりの外湯めぐりをお楽しみ下さい。<br> 当館へお泊まりの方はチェックインからチェックアウトまでの間は何度でも7つの外湯に入る事が出来ます。
								</p>
								<img src="upload/spa/out/${spa_out.scode}/${spa_out.sphoto1}" width="931" height="497" alt="三木屋周辺外湯マップ" class="map">
							</div>
						</c:if>

						<div class="sec3">
							<c:if test="${spa_out.scode ne 0 && spa_out.scode ne 8}">
								<div class="sec3_${status.index}">
									<div class="heightLine" style="height: 367px;">
										<h5>
											<img src="upload/spa/out/${spa_out.scode}/${spa_out.stitle}" width="35" height="237" alt="さとの湯/三木屋から15分">
										</h5>
										<img src="upload/spa/out/${spa_out.scode}/${spa_out.sphoto1}" width="157" height="233" alt="さとの湯" class="photo">
										<dl>
											<dt>ふれあいの湯</dt>
											<dd>【営業時間】${spa_out.s_time_start}~${spa_out.s_time_end}</dd>
											<dd>【休湯日】 ${spa_out.s_holiday}</dd>
										</dl>
										<p>${spa_out.scontent}</p>
									</div>
								</div>
							</c:if>


							<c:if test="${spa_out.scode eq 8}">
								<h4>
									<img src="upload/spa/out/${spa_out.scode}/${spa_out.stitle}" width="43" height="229" alt="城崎温泉 外湯めぐり">
								</h4>

							</c:if>
						</div>
					</c:forEach>
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
				</div>
			</div>
		</div>





	</div>
</div>
<!-- //컨텐츠 -->
<%@ include file="../footer.jsp"%>