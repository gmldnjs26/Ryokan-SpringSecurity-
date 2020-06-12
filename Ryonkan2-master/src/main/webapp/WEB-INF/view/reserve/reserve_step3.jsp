<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script>
	function fnCdCmp() { // 인원수 바뀔시 돈 계산해서 뿌려주는 ajax
		var num_people = $("#num_people option:selected").val();
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$.ajax({
			url : "/reserve/re_cal", // 니 유알엘
			type : 'post',
			data : num_people, // 데이터와 위에 선언한 거 넣고
			dataType : "json", // 타입은 json 으로
			contentType : "application/json; charset=UTF-8",
			beforeSend: function(xhr) {
	            // here it is
	            xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				if (data.result == 1) { // 받은 data중 결과->결과이름을 난 result 로 해놓음
					//alert("金額が変更されました。");
					$("#midVatpc").text(data.tax_price + ' 円');
					$("#lastTotal").text(data.sum_price + ' 円');
					$("#midTotal").text(data.sum_price + ' 円');
					$("#mileage").text(data.mileage + ' 点');
					$("#membership2").text('-' + data.membership + ' 円');
					$("#membership").text('-' + data.membership+ ' 円');
				} else {
					alert("error");
				}
			}
		});
	}
</script>
<div id="content" class="sub company_panel company">
	<div class="wrapping">
		<!-- 서브타이틀 -->
		<div class="partner_top">
			<!-- 상단 서브 배너 영역 ---------------------->
			<div class="sub_visual">
				<img src="../common/img/company/bg_m.jpg" alt="" class="show_mobile" />
			</div>
			<!-- //상단 서브 배너 영역 ---------------------->

			<div class="container">
				<div class="contWrap">
					<ul class="rsvStep" id="stepGuide_RM">
						<li class="step-1">STEP 1. <span class="step">お部屋の選択</span></li>
						<li class="step-2">STEP 2. <em class="step">お食事プランの選択</em></li>
						<li class="step-3 active">STEP 3. <span class="step">予約完了</span></li>
					</ul>

					<!-- Search -->
					<div class="search ty2">
						<span>· お部屋 : </span>
						<strong class="item">${ReserveInfo.r_title }</strong>
						<span>· お食事プラン : </span>
						<span class="item" style="padding-right: 15px; color: black">
							<strong>${ReserveInfo.r_title }</strong>
						</span>
						<br>
						<span class="item" style="padding-right: 15px;">· お泊りの期間 : ${ReserveInfo.check_in} - ${ReserveInfo.check_out} (ー泊)</span>
						<span class="item"> · 人員情報 : - </span>
						<a href="#" class="btnRefresh i-refresh" onclick="fnInitRsvSrch();">予約の取り消し</a>
					</div>
					<!-- // Search -->

					<form id="reservationForm" name="reservationForm" method="post" autocomplete="off" action="/reserve/save">
						<div id="room2-1" class="tabCont" style="display: block;">
							<div class="cHead chw-3">
								<h2 class="title-3 fc-1 chwTit">注文メモ</h2>
							</div>
							<div class="msgBox-1">
								<div style="text-align: left; width: 50%; margin: 0 auto;">注文メモは旅館の状況に応じて、提供しかねる場合がございます。何卒ご了承いただきますよう、よろしくお願い申し上げます。</div>
							</div>
							<table class="tb-1 tbData">
								<caption>お部屋1注文メモ</caption>
								<colgroup>
									<col width="175px">
									<col width="*">
								</colgroup>
								<tbody>
									<!--  
							<tr>
								<th scope="row">도착예정시간</th>
								<td class="fm">
									<select class="slt fw-24" title="도착예정시간" name="arrivalTime_1" id="arrivalTime_1">
										<option value="">선택</optoin>
									</select>
								</td>
							</tr>
							-->
									<input type="hidden" name="arrivalTime_1" value="">
									<tr>
										<th scope="row">注文メモ</th>
										<td class="fm">
											<textarea class="fw-full fh-1" title="何なりとお申し付けください" placeholder="内容をご入力ください" name="re_memo" id="re_memo" maxlength="200"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>


						<!-- 예약자 정보 // -->
						<h3 class="title-3 fc-1">お客様情報</h3>
						<table class="tb-1 tbData">
							<caption>お客様情報</caption>
							<colgroup>
								<col width="175px">
								<col width="*">
								<col width="175px">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">お名前</th>
									<td class="fm" colspan="3">

										<input type="text" class="ipt fw-1" placeholder="姓" title="姓" name="rsvLastNm" id="rsvLastNm" value="${loginMember.mber_nm }" maxlength="2" readonly="readonly" disabled="disabled" style="background: rgb(245, 245, 245);">
										<input type="text" class="ipt fw-2" placeholder="名" title="名" name="rsvFirstNm" id="rsvFirstNm" value="${loginMember.mber_nm_yomi }" maxlength="5" readonly="readonly" disabled="disabled" style="background: rgb(245, 245, 245);">


										<span class="radG fmMgL">
											<c:choose>
												<c:when test="${loginMember.mber_sex.trim()=='男' }">
													<span class="radFm">
														<input type="radio" class="rad" id="rsvGender1" name="rsvGender" value="M0541" checked="" disabled="disabled">
														<span class="act"></span>
														<label for="rsvGender1">남</label>
													</span>
													<span class="radFm">
														<input type="radio" class="rad" id="rsvGender2" name="rsvGender" value="M0542" disabled="disabled">
														<span class="act"></span>
														<label for="rsvGender2">여</label>
													</span>
												</c:when>
												<c:otherwise>
													<span class="radFm">
														<input type="radio" class="rad" id="rsvGender1" name="rsvGender" value="M0541" disabled="disabled">
														<span class="act"></span>
														<label for="rsvGender1">남</label>
													</span>
													<span class="radFm">
														<input type="radio" class="rad" id="rsvGender2" name="rsvGender" value="M0542" checked="" disabled="disabled">
														<span class="act"></span>
														<label for="rsvGender2">여</label>
													</span>
												</c:otherwise>
											</c:choose>

										</span>
									</td>
								</tr>
								<tr>
									<th scope="row">生年月日</th>
									<td class="fm">
										<input type="text" class="slt fw-4" title="年" name="rsvBrthdyYY" id="rsvBrthdyYY" disabled="disabled" style="background: rgb(245, 245, 245);" value=1994>
										<span class="fmTxt-1">年</span>
										<input type="text" class="slt fw-4" title="月" name="rsvBrthdyMT" id="rsvBrthdyMT" disabled="disabled" style="background: rgb(245, 245, 245);" value=12>

										<span class="fmTxt-1">月</span>
										<input type="text" class="slt fw-4" title="日" name="rsvBrthdyDE" id="rsvBrthdyDE" disabled="disabled" style="background: rgb(245, 245, 245);" value=15>

										<span class="fmTxt-1">日</span>
									</td>
									<th scope="row">連絡先</th>
									<td class="fm">
										<!-- ** Code ** // -->
										<input type="text" title="最初の3桁" name="rsvTel1" id="rsvTel1" value="${loginMember.mber_telno }" style="background: rgb(245, 245, 245);" disabled="disabled">

									</td>
									<!-- // ** Code ** -->

								</tr>
								<tr>
									<th scope="row">メールアドレス</th>
									<td class="fm" colspan="3">
										<input type="text" class="ipt fw-5" title="メールアドレス" name="rsvEmail1" id="rsvEmail1" value="imleesky" maxlength="30" disabled="disabled" readonly="readonly" style="background: rgb(245, 245, 245);">
										<span class="fmTxt-3">@</span>
										<input type="text" class="ipt fw-5" title="メールドメイン" name="rsvEmail2" id="rsvEmail2" value="gmail.com" maxlength="30" style="width: 144px; background: rgb(245, 245, 245);" disabled="disabled" readonly="readonly">
										<select class="slt fw-6" title="直接入力" onchange="fnSetMailType('rsvEmail2', this.value);" id="rsvEmailDomain" name="rsvEmailDomain" disabled="disabled" style="background: rgb(245, 245, 245);">
											<option value="1" disabled="disabled">直接入力</option>
											<option value="gmail.com" disabled="disabled">gmail.com</option>
											<option value="hanmail.net" disabled="disabled">hanmail.net</option>
											<option value="daum.net" disabled="disabled">daum.net</option>
											<option value="naver.com" selected="">naver.com</option>
											<option value="nate.com" disabled="disabled">nate.com</option>
											<option value="hotmail.com" disabled="disabled">hotmail.com</option>
											<option value="zum.com" disabled="disabled">zum.com</option>
											<option value="yahoo.com" disabled="disabled">yahoo.com</option>
										</select>

										<p>*メールアドレスの変更はマイページ &gt; 個人情報の修正で変えることができます。</p>

									</td>
								</tr>
							</tbody>
						</table>
						<!-- // 예약자 정보 -->



						<!-- 결제 정보 // -->
						<h3 class="title-3 fc-1">お支払い情報</h3>
						<table class="tb-1 tbData">
							<caption>お支払い情報</caption>
							<colgroup>
								<col width="175px">
								<col width="*">
								<col width="175px">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">銀行口座</th>
									<td colspan="3" class="fm">
										<select class="slt fw-25" title="銀行" id="pay_way" name="pay_way">
											<option value="銀行選択">銀行選択</option>

											<option value="みずほ銀行">みずほ銀行 xxxxxxx</option>

											<option value="三菱UFJ銀行">三菱UFJ銀行 xxxxxxx</option>

											<option value="三井住友銀行">三井住友銀行 xxxxxxx</option>

											<option value="りそな銀行">りそな銀行 xxxxxxx</option>

											<option value="埼玉りそな銀行">埼玉りそな銀行 xxxxxxx</option>

											<option value="北海道銀行">北海道銀行 xxxxxxx</option>

											<option value="青森銀行">青森銀行 xxxxxxx</option>

											<option value="みちのく銀行">みちのく銀行 xxxxxxx</option>

											<option value="秋田銀行">秋田銀行 xxxxxxx</option>

											<option value="北都銀行">北都銀行 xxxxxxx</option>

											<option value="荘内銀行">荘内銀行 xxxxxxx</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- // 결제 정보 -->

						<!-- 결제 금액 // -->

						<h3 class="title-3 fc-1">お支払金額</h3>
						<table class="tb-1 tbData">
							<caption>お支払金額</caption>
							<colgroup>
								<col width="175px">
								<col width="240px">
								<col width="175px">
								<col width="240px">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">お部屋の価格</th>
									<td>
										<fmt:formatNumber value="${ReserveInfo.r_price }" pattern="#,###.##" />
										円
									</td>
									<th scope="row">人員</th>
									<td>
										<select class="slt fw-1" title="銀行" id="num_people" name="num_people" onchange="fnCdCmp()">
											<option value="">人数選択</option>

											<option value=1>1</option>

											<option value=2>2</option>

											<option value=3>3</option>

											<option value=4>4</option>

											<option value=5>5</option>

											<option value=6>6</option>

											<option value=7>7</option>

											<option value=8>8</option>

										</select>
										<span class="fmTxt-1">名様</span>
									</td>
									<td rowspan="4" class="totalPricefield">
										<dl class="totalPrice">
											<dt class="total">合計金額（税込）</dt>
											<dd class="total">
												<em id="midTotal"></em>
											</dd>
											<dt>メンバーシップ</dt>
											<dd class="total">
												<em id="membership"></em>
											</dd>
											<dt>貯まるポイント</dt>
											<dd>合計金額（税込）5% 貯まります</dd>
											<dt>ポイント</dt>
											<dd id="mileage"></dd>
										</dl>
									</td>
								</tr>
								<tr>
									<th scope="row">お食事プラン価格</th>
									<!-- 옵션 -->
									<td>
										<span id="midOptpc">
											<fmt:formatNumber value="${ReserveInfo.m_price}" pattern="#,###.##" />
											円
										</span>
									</td>
									<!--  멤버쉽 할인 -->

								</tr>
								<tr>
									<th scope="row">消費税</th>
									<!-- 부가세 -->
									<td colspan="3" id="midVatpc"></td>
								</tr>
								<tr>
									<!--  멤버쉽 할인 -->
									<th scope="row">メンバーシップ</th>
									<td colspan="3" id="membership2"></td>
								</tr>
								<tr>
									<th scope="row">合計金額（税込）</th>
									<!-- 최종결제금액 -->
									<td colspan="3" id="lastTotal"></td>
								</tr>
							</tbody>
						</table>
						<!-- // 결제 금액 -->
						<div class="btnArea-1">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type="submit" class="btnA btn-1" id="submitBtn" value="予約する">
							<a href="#" class="btnA btn-2" onclick="history.go(-1);">前へ</a>
						</div>
					</form>
				</div>
			</div>

		</div>

		<script>
			$(document).on("click", ".btn_vh", function(e) {
				if ($(this).checked == true) {
					$(this).style.display = "none";
					$(this).removeClass("active");
				} else {
					$(this).style.display = "";
					$(this).addClass("active");
				}
			});
		</script>

		<!-- ci
                <//php include("lib/ci.php"); //> -->

		<!-- 서브 도움 배너 -->
		<!-- //서브 도움 배너 -->

	</div>
</div>
<%@ include file="../footer.jsp"%>