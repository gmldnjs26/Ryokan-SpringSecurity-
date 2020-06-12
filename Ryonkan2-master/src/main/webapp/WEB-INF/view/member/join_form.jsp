<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src="common/js/join.js"></script>
<div class="contWrap">
	<h2 class="pagTit">会員登録</h2>
	<div class="pagTitSub">会員登録していただけたら、ポイントが貯まる他、様々なイベントにご参加していただけます。</div>
	<form id="insertForm" name="insertForm" method="post" action="/join">
		<!-- 대한민국 -->
		<input type="hidden" id="temp_mber_id" />
		<input type="hidden" name="mber_sex" id="mber_sex"/>
		<input type="hidden" name="mber_country" id="mber_country"/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="mber_nm" id="mber_nm"/>
		<input type="hidden" name="mber_nm_yomi"id="mber_nm_yomi"/>
		
		<input type="hidden" name="mber_birth" id="mber_birth"/>
		
		<input type="hidden" name="mber_telno" id="mber_telno"/>
		
		<input type="hidden" name="email" id="email_object"/>
		
		<input type="hidden" name="zip_num" id = "zip_num"/>
		<input type="hidden" name="adres" id = "adres"/>
		
		
		<!-- etc -->
		<input type="hidden" name="route_code2" value="">
		<!-- etc -->
		<div class="contBox">
			<div class="cHead chw-3 first">
				<h4 class="title-3 fc-1 chwTit">会員情報入力</h4>
				<span class="fR chwTxt">
					<span class="obligatory">
						<span class="blind">必須</span>
						必須
					</span>
				</span>
			</div>
			<table class="tb-1 tbData">
				<caption>会員情報入力</caption>
				<colgroup>
					<col width="175px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">
							<span class="obligatory">
								<span class="blind">必須</span>
								お名前
							</span>
						</th>
						<td class="fm">
							姓&nbsp;
							<input type="text" class="ipt fw-1" placeholder="姓" title="姓" id="kr_nm_last" name="nm_last" value="" maxlength="5" style="ime-mode: active;">
							名&nbsp;
							<input type="text" class="ipt fw-2" placeholder="名" title="名" id="kr_nm_first" name="nm_first" value="" style="ime-mode: active;" maxlength="5">
							<span class="radG fmMgL">
								<span class="radFm">
									<input type="radio" class="rad" id="sexdstn_code1" name="sexdstn_code" value="男" checked="">
									<span class="act"></span>
									<label for="sexdstn_code1">男</label>
								</span>
								<span class="radFm">
									<input type="radio" class="rad" id="sexdstn_code2" name="sexdstn_code" value="女">
									<span class="act"></span>
									<label for="sexdstn_code2">女</label>
								</span>
							</span>
						</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="obligatory">
								<span class="blind">必須</span>
								お名前</br>（フリガナ）
							</span>
						</th>
						<td class="fm">
							セイ&nbsp;
							<input type="text" class="ipt fw-1" placeholder="姓" title="姓" id="kr_nm_last_yomi" name="nm_last_yomi" value="" maxlength="5" style="ime-mode: active;">
							メイ&nbsp;
							<input type="text" class="ipt fw-2" placeholder="名" title="名" id="kr_nm_first_yomi" name="nm_first_yomi" value="" style="ime-mode: active;" maxlength="5">
							&nbsp;（カタカナ）
						</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="obligatory">
								<span class="blind">必須</span>
								ID
							</span>
						</th>
						<td class="fm">
							<input type="text" class="ipt fw-24" title="아이디" id="mber_id" name="mber_id" maxlength="20">
							<div id="idCheckComment"></div>
							<input type="button" value="IDチェック" onclick="fn_mberid_confirm()" class="btnD btn-4 fmBtn">
							<input type="hidden" name="reid">
							<span class="fmTxt-2">4~20字のローマ字、 数字の組み合わせ 必須</span>
						</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="obligatory">
								<span class="blind">必須</span>
								パスワード
							</span>
						</th>
						<td class="fm">
							<div class="fmSecurity fw-24">
								<input type="password" class="ipt fw-24" title="パスワード" id="pw" name="pw" maxlength="20">
								<span id="pwdLvl" class="security"></span>
							</div>
							<span class="fmTxt-2">8~20字のローマ字、 数字、特殊文字(!,@,#,$,%,^,&amp;,*)の組み合わせ 必須</span>
						</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="obligatory">
								<span class="blind">必須</span>
								パスワードチェック
							</span>
						</th>
						<td class="fm">
							<input type="password" class="ipt fw-24" title="パスワードチェック" id="pw_confirm" name="pw_confirm" maxlength="20">
						</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="obligatory">
								<span class="blind">必須</span>
								国
							</span>
						</th>
						<td class="fm">
							<input type="text" class="ipt fw-5" title="国選択ドメイン" id="reside_country_code2" name="reside_country_code2" maxlength="30">
							<select class="slt fw-6" title="直接入力" onchange="fnSetMailType('reside_country_code2', this.value);" id="reside_country_code" name="reside_country_code">
								<option value="" selected="">直接入力</option>
								<option value="アメリカ">アメリカ</option>
								<option value="カナダ">カナダ</option>
								<option value="ロシア">ロシア</option>
								<option value="フランス">フランス</option>
								<option value="スペイン">スペイン</option>
								<option value="イギリス">イギリス</option>
								<option value="ドイツ">ドイツ</option>
								<option value="オーストラリア">オーストラリア</option>
								<option value="シンガポール">シンガポール</option>
								<option value="日本">日本</option>
								<option value="韓国">韓国</option>
								<option value="ベトナム">ベトナム</option>
								<option value="中国">中国</option>
								<option value="香港">香港</option>
								<option value="台湾">台湾</option>
								<option value="イスラエル">イスラエル</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="obligatory">
								<span class="blind">必須</span>
								生年月日
							</span>
						</th>
						<td class="fm">
							<select class="slt fw-3" title="년" id="brthdy_yy" name="brthdy_yy">
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<c:set var="sysYear">
									<fmt:formatDate value="${now}" pattern="yyyy" />
								</c:set>
								<option value="">選ぶ</option>
								<c:forEach var="year" begin="${sysYear-100}" end="${sysYear}" step="1">
									<option value="${year}">${year}</option>
								</c:forEach>
							</select>
							<span class="fmTxt-1">年</span>
							
							<select class="slt fw-3" title="월" id="brthdy_mt" name="brthdy_mt">
								<option value="">選ぶ</option>
								<c:forEach var="month" begin="1" end="12" step="1">
									<option value="${month}">${month}</option>
								</c:forEach>
							</select>
							<span class="fmTxt-1">月</span>
							
							<select class="slt fw-3" title="일" id="brthdy_de" name="brthdy_de">
								<option value="">選ぶ</option>
								<c:forEach var="day" begin="1" end="31" step="1">
									<option value="${day}">${day}</option>
								</c:forEach>
							</select>
							<span class="fmTxt-1">日</span>
						</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="obligatory">
								<span class="blind">必須</span>
								連絡先
							</span>
						</th>
						<td class="fm">
							<select class="slt fw-3" title="最初の3桁" id="telno1" name="telno1">
								<option value="010">010</option>
								<option value="020">020</option>
								<option value="030">030</option>
								<option value="040">040</option>
								<option value="060">060</option>
								<option value="070">070</option>
								<option value="080">080</option>
								<option value="090">090</option>
							</select>
							<span class="fmTxt-3">-</span>
							<input type="text" class="ipt fw-3" title="間の4桁" id="telno2" name="telno2" value="" maxlength="4">
							<span class="fmTxt-3">-</span>
							<input type="text" class="ipt fw-3" title="最後の4桁" id="telno3" name="telno3" value="" maxlength="4">
						</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="obligatory">
								<span class="blind">必須</span>
								Eメール
							</span>
						</th>
						<td class="fm">
							<input type="text" class="ipt fw-5" title="Eメール" id="email_id" name="email_id" maxlength="30">
							<span class="fmTxt-3">@</span>
							<input type="text" class="ipt fw-5" title="E-mail ドメイン" id="email_domain" name="email_domain" maxlength="30">
							<select class="slt fw-6" title="직접입력" onchange="fnSetMailType('email_domain', this.value);" id="email_domain_sel" name="email_domain_sel">
								<option value="1" selected="">直接入力</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="daum.net">daum.net</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="zum.com">zum.com</option>
								<option value="yahoo.com">yahoo.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row" class="vT">ご住所</th>
						<td class="fm">
							<input type="text" class="ipt fw-7" title="우편번호" id="zip1" name="zip1" />
							<a href="#" class="btnD btn-4 fmBtn" onclick="fnDaumPostCode('');">우편번호검색</a>
							<input type="text" class="ipt fw-8 fmMg-1" title="주소" id="adres1" name="adres1" maxlength="100" />
							<input type="text" class="ipt fw-8 fmMg-1" title="상세주소" id="adres2" name="adres2" maxlength="50" onkeyup="fnSetTransAddressDefault()" />
						</td>

					</tr>
					<tr>
						<th scope="row" class="vT">情報受信同意</th>
						<td>
							<span class="chkG">
								<span class="chkFm ty-3">
									<input type="checkbox" class="chk" id="recptChkAll" name="">
									<span class="act"></span>
									<label for="recptChkAll"><strong class="fc-1">全て同意</strong></label>
								</span>
								<span class="chkFm">
									<input type="checkbox" class="chk agree" id="email_recptn_yn" name="email_recptn_yn" value="Y">
									<span class="act"></span>
									<label for="email_recptn_yn">E-mail</label>
								</span>
								<span class="chkFm">
									<input type="checkbox" class="chk agree" id="sms_recptn_yn" name="sms_recptn_yn" value="Y">
									<span class="act"></span>
									<label for="sms_recptn_yn">SMS</label>
								</span>
								<span class="chkFm">
									<input type="checkbox" class="chk agree" id="dm_recptn_yn" name="dm_recptn_yn" value="Y">
									<span class="act"></span>
									<label for="dm_recptn_yn">DM</label>
								</span>
							</span>
							<ul class="list-2 fc-6">
								<li>情報受信同意をしていただけたら、会員サービス、会員特別セールのご招待、イベントなど様々な情報のご案内をしていただけます。</li>
								<li>情報受信同意をして頂かなくても、消滅予定ポイントのご案内はEメール、もしくはDMで自動的に発送されます。</li>
								<li>選択項目に同意して頂かなくても、サービスは正常にご利用していただけます。</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btnArea-1">
			<input type="button" class="btnA btn-3" onclick="fn_insert()" value="登録する" />
		</div>
	</form>
</div>

<%@ include file="../footer.jsp"%>