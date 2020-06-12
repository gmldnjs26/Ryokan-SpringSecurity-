<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<body>
	<div class="tabCont mypage" style="display: block;">
		<h3 class="title-3 fc-1">ご予約情報</h3>
		<table class="tb-1 tbList">
			<colgroup>
				<col width="50px">
				<col width="130px">
				<col width="300px">
				<col width="150px">
				<col width="90px">
				<col width="90px">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">番号</th>
					<th scope="col">予約番号</th>
					<th scope="col">予約内容</th>
					<th scope="col">利用期間</th>
					<th scope="col">金額</th>
					<th scope="col">予約状態</th>
				</tr>
			</thead>
			<tbody class="fc-2">
				<c:forEach items="${reserveList }" var="reserveVO">
					<tr>
						<td scope="col">${reserveVO.re_code}
						</th>
						<td scope="col">${reserveVO.re_code}
						</th>
						<td scope="col">${reserveVO.r_title}${reserveVO.num_people}様
						</th>
						<td scope="col">${reserveVO.check_in}~${reserveVO.check_out }
						</th>
						<td scope="col">
							<fmt:formatNumber value="${reserveVO.pay_price}" pattern="#,###.##" />
							円
						</th>
						<td scope="col">
							<c:choose>
								<c:when test="${reserveVO.re_status == 1}">
								予約完了
							</c:when>
								<c:otherwise>
								決済待ち
							</c:otherwise>
							</c:choose>
						</th>
					</tr>
				</c:forEach>
			</tbody>
			<br />
		</table>

		<!-- 고객 정보 // -->
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

						<input type="text" class="ipt fw-1" placeholder="姓" title="姓" name="rsvLastNm" id="rsvLastNm" value="${loginMember.nm_first }" maxlength="2" readonly="readonly" disabled="disabled" style="background: rgb(245, 245, 245);">
						<input type="text" class="ipt fw-2" placeholder="名" title="名" name="rsvFirstNm" id="rsvFirstNm" value="${loginMember.nm_last }" maxlength="5" readonly="readonly" disabled="disabled" style="background: rgb(245, 245, 245);">


						<span class="radG fmMgL">
							<c:choose>
								<c:when test="${loginMember.sexdstn_code.trim()=='男' }">
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
						<input type="text" class="slt fw-4" title="年" name="rsvBrthdyYY" id="rsvBrthdyYY" disabled="disabled" style="background: rgb(245, 245, 245);" value="${loginMember.brthdy_yy }">
						<span class="fmTxt-1">年</span>
						<input type="text" class="slt fw-4" title="月" name="rsvBrthdyMT" id="rsvBrthdyMT" disabled="disabled" style="background: rgb(245, 245, 245);" value="${loginMember.brthdy_mt }">

						<span class="fmTxt-1">月</span>
						<input type="text" class="slt fw-4" title="日" name="rsvBrthdyDE" id="rsvBrthdyDE" disabled="disabled" style="background: rgb(245, 245, 245);" value="${loginMember.brthdy_de }">

						<span class="fmTxt-1">日</span>
					</td>
					<th scope="row">連絡先</th>
					<td class="fm">
						<!-- ** Code ** // -->
						<input type="text" title="最初の3桁" name="rsvTel1" id="rsvTel1" value="${loginMember.telno }" style="background: rgb(245, 245, 245);" disabled="disabled">

					</td>
					<!-- // ** Code ** -->

				</tr>
				<tr>
					<th scope="row">メールアドレス</th>
					<td class="fm" colspan="3">
						<input type="text" class="ipt fw-5" title="メールアドレス" name="rsvEmail1" id="rsvEmail1" value="${loginMember.email }" maxlength="30" disabled="disabled" readonly="readonly" style="background: rgb(245, 245, 245);">
						<span class="fmTxt-3">@</span>
						<input type="text" class="ipt fw-5" title="メールドメイン" name="rsvEmail2" id="rsvEmail2" value="${loginMember.email_domain }" maxlength="30" style="width: 144px; background: rgb(245, 245, 245);" disabled="disabled" readonly="readonly">
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
				<tr>
					<th scope="row">グレード</th>
					<td class="fm" colspan="1">${loginMember.grade }</td>
					<th scope="row">予約の総金額</th>
					<td class="fm" colspan="1">${loginMember.reserve_sum } 円</td> 
				</tr>
			</tbody>
		</table>
		<!-- // 고객 정보 -->
	</div>
	<%@include file="../footer.jsp"%>