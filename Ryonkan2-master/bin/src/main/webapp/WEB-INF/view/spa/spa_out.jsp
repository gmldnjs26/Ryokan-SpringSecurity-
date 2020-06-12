	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div id="content" class="sub pd_panel spa_panel">
            <div class="wrapping">            
            	<!-- 서브타이틀 -->
                <div class="partner_top">
                    <!-- 상단 서브 배너 영역 ---------------------->
                    <div class="sub_visual">
						<img src="common/img/pd/room_board.jpg" alt="" class="show_mobile"/>
					</div>

<!-- view페이지일경우, 브랜드에 따라 비쥬얼이미지가 달라져야합니다. (웹:배경이미지&컬러,모바일:이미지) -->
<!-- <div class="sub_visual" style="background-image:url(../../common/img/brand/bg.jpg); background-color:#fff">
	<img src="../../common/img/pd/dogs_bg_m.jpg" alt="모바일이미지" class="show_mobile"/>
</div>-->   
                    <!-- //상단 서브 배너 영역 ---------------------->  
                    
                   <div class="contains">
 						
                        <div class="show_mobile">
                            <p class="partner_title"><b></b></p>
                        </div>                                      
                    </div>                                        
				</div>
<%--  				<div class="lnb_tab_box show">
                	<div class="lnb_tab_wrap">
                		<div class="lnb_tab_contains">
                			<div class="lnb_tab_menu">
								<a href="#test01" class="btn_tab active" name="btn1" onclick="btn_act(btn1)">${room.rtitle}</a>
								<a href="#test02" class="btn_tab" name="btn2" onclick="btn_act(btn2)">お食事について</a>
								<a href="#test03" class="btn_tab" name="btn3" onclick="btn_act(btn3)">館内施設・設備について</a>
								<a href="#test04" class="btn_tab" name="btn4" onclick="btn_act(btn4)">入浴・お風呂について</a>
								<a href="#test05" class="btn_tab" name="btn5" onclick="btn_act(btn5)">アクセス・駐車場について</a>

							</div>
						</div>
					</div>
                </div> --%>

                <!-- //서브타이틀 -->
                
	
		<div class="sub_wrap">
			<div class="contains">
				<div class="sub_title_box">
					<img src="common/img/room_view/1_sec1_title.png" alt="" />
				</div>
				<div class="notice_wrap">
				<c:forEach var="room" items="${room}">

					<div class="view_title">
						<h1 class="top_title">
							<img src="upload/room/${room.rlogo}" alt="">
						</h1>
						<p class="summary">
																									
							${room.rcontent}
						</p>	
					</div>
					
					<!-- 리스트-->
					<div class="pd_area">
						<div id="main_visual" class="main_visual">
							<div class="visual_slide">
			                	<!-- 이미지형 -->       	
			                	<c:forEach var="roop" begin="1" end="6" step="1">	
			                		<c:set var="temp" value="rurl${roop}"/>	
			                		<c:if test="${room[temp] ne null}">	
			                			<div class="list_box slide_01" style="background-color:#fff "><!-- 배경컬러 데이터 밖이라 컬러값을 넣을 수가 없음 --> 
											<a href="#" alt="">
												<!-- 이미지형 -->
												<span class="img_box pc bg_cover">
												   <img src="upload/room/${room[temp]}" alt="" class="bg"/>
												   <!--<span class="text" style="background-image:url(common/img/main/title.png)"></span>-->
												</span><!-- 웹 -->
												<span class="img_box mobile bg_cover">
												   <img src="upload/room/${room[temp]}" alt="" class="bg"/>
												</span><!-- 모바일 -->					                            
					                   		</a>		
										</div>
					              	</c:if>
								</c:forEach>    
				           </div>
				           <div class="slide_btn">
			                    <div class="btn_box">
			                        <a href="#" class="btn_slide prev">이전</a>
			                        <a href="#" class="btn_slide next">다음</a>
			                    </div>
			                </div>			                
                <!--<a href="#" class="btn_page_down"><img src="img/icon/page_arrow_bottom.png" alt=""></a>-->                							
            			</div>            			   
					</div>
					<div class="Information" style="margin-bottom: 10px;">
						<h2>客室情報</h2>
						<div class="infor_both_side">
							<div class="left">
								<ul class="list01">
									<li><strong>間取り</strong>${room.rsize}</li>
									<li><strong>眺望</strong>${room.rsight}</li>
									<li><strong>定員</strong>${room.rlimit}名様</li>
								</ul>
							</div>
							<div class="right">
								<ul class="list01">
									<li><strong>チェックイン</strong>入館並びにチェックインは午後一時から</li>
									<li class="type01"><strong>&nbsp;</strong>お部屋の入室は午後三時からされます。</li>
									<li><strong>チェック<br/>アウト</strong>午前11時</li>
								</ul>
							</div>
						</div>
						<ul class="alert_list">
							<li>&nbsp;※チェックインとチェックアウトの時間は当日の都合のよって変わることがございます。</li>
						</ul>
					</div>
					<div class="btn_reserve">
						<a href="#" class="cal_icon i-reserve" onclick="reserve_chk();">
							<span class="btnF btn-3">予約する</span>
						</a>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		       




	</div>
</div>
        <!-- //컨텐츠 -->
<%@ include file="../footer.jsp" %>