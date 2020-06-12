<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div id="content" class="sub company_panel company">
	<div class="wrapping">
		<!-- 서브타이틀 -->
		<div class="partner_top">
			<!-- 상단 서브 배너 영역 ---------------------->
			<div class="sub_visual">
				<img src="../common/img/company/bg_m.jpg" alt="" class="show_mobile" />
			</div>
			<!-- //상단 서브 배너 영역 ---------------------->
			<form action="reserve_step3.do" name="frm">
				<div class="contains">
					<ul class="rsvStep" id="stepGuide_RM">
						<li class="step-1">STEP 1. <span class="step">お部屋の選択</span></li>
						<li class="step-2 active">STEP 2. <em class="step">お食事プランの選択</em></li>
						<li class="step-3">STEP 3. <span class="step">予約完了</span></li>
					</ul>

					<c:forEach var="mealVO" items="${mealList}" varStatus="status">

						<div class="info_box_wrap meal_box_wrap">
							<p class="title">${mealVO.m_title }<button type="button" onclick="view(${status.count})" class="btn_vh active">
									<img src="">
								</button>
							</p>
							<div class="table_box">
								<div class="table_td img_box">
									<input type="radio" style="font-size: 17px; width: 17px; height: 17px" name="m_code" value="${mealVO.m_code }">
									<img src="upload/dish/${mealVO.m_code}/${mealVO.m_photo1}" class="dish_img" alt="${mealVO.m_title}" />
								</div>
								<div class="table_td right_text">
									<p class="dcontent">${mealVO.m_content}</p>
									<span class="price">
										<input type="hidden" value="${mealVO.m_price }" name="m_price" />
										お一人様&nbsp;<strong><fmt:formatNumber value="${mealVO.m_price}" pattern="#,###.##" />円</strong>
									</span>
								</div>
							</div>
						</div>
						&nbsp;
						<input type="hidden" name="m_title" value="${mealVO.m_title }" /> 
					</c:forEach>
				</div>
				<div class="btn_reserve">
					<input type="submit" class="btnF btn-3" value="次へ">
				</div>
			</form>
		</div>

		<script>
                $(document).on("click", ".btn_vh", function(e) {
                	if($(this).checked==true){
                		$(this).style.display="none";
                		$(this).removeClass("active");
		    		}else{
		    			$(this).style.display="";
		    			$(this).addClass("active");
                	}
		    	});
                </script>


	</div>
</div>
<%@ include file="../footer.jsp"%>