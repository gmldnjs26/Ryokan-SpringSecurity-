<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="contWrap">
	<h2 class="pagTit">会員登録</h2>
	<div class="pagTitSub">会員登録していただけたら、ポイントが貯まる他、様々なイベントにご参加していただけます。</div>
	<form id="insertForm" name="insertForm" method="post" action="join.do">
		<input type="hidden" id="mber_se_code" name="mber_se_code" value="M1041">
		<input type="hidden" id="country_telno" name="country_telno" value="82">
		<!-- 대한민국 -->
		<input type="hidden" id="reside_country_code" name="reside_country_code" value="M9067">
		<input type="hidden" id="temp_mber_id" name="temp_mber_id" value="dddd1">
		<input type="hidden" id="mber_id_check" name="mber_id_check" value="Y">
		<input type="hidden" id="temp_email" name="temp_email" value="">
		<input type="hidden" id="email_check" name="email_check" value="N">
		<input type="hidden" id="agree1" name="agree1" value="">
		<input type="hidden" id="agree2" name="agree2" value="">
		<input type="hidden" id="agree3" name="agree3" value="">
		<input type="hidden" id="request_card_issue_way" name="request_card_issue_way" value="">
		<input type="hidden" id="certtype" name="certtype" value="1">
		<input type="hidden" name="route_code" value="M1137">
		<!-- etc -->
		<input type="hidden" name="route_code2" value="">
		<!-- etc -->
		<input type="hidden" name="telno" id="telno">
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
							<input type="text" class="ipt fw-1" placeholder="姓" title="姓" id="kr_nm_last" name="nm_last_yomi" value="" maxlength="5" style="ime-mode: active;">
							メイ&nbsp;
							<input type="text" class="ipt fw-2" placeholder="名" title="名" id="kr_nm_first" name="nm_first_yomi" value="" style="ime-mode: active;" maxlength="5">
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
							<input type="text" class="ipt fw-5" title="Eメール" id="email" name="email" maxlength="30">
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
							<a href="#" class="btnD btn-4 fmBtn" id="btnEmailConfirm" onclick="fn_email_confirm()">利用可能か確認</a>
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
			<input type="submit" class="btnA btn-3" onclick="return fn_insert()" value="登録する" />
		</div>
	</form>
</div>

<script>
		
		function fn_mberid_confirm() {// IDチェックをクリックした時に作動するスクリプト 아이디 중복 체크
			if ($.trim($("#mber_id").val()) == "") {
				alert('IDをご入力ください');
				$("#mber_id").focus();
				return;
			}

			if (!fnChkID($("#mber_id").val())) {
				alert('ローマ字/数字を組み合わせた4~20字のIDのみご使用ください');
				$("#mber_id").focus();
				return;
			}

//			var url = "idcheck.do?mber_id=" + document.insertForm.mber_id.value;
//			window.open(url, "_blank1", "width=450, height=200");
		//
//			$.post('idcheck.do', $("#insertForm").serialize(), function(data) {
//				alert(data.result);
//				if (data.result == 1) {
//					$("#mber_id_check").val("Y");
//					$("#temp_mber_id").val($("#mber_id").val());
//					$("#pw").focus();
//				} else {
//					$("#mber_id").focus();
//				}
//			}, 'json');
		//
//			$.ajax({
//				type : "POST",
//				url : "idCheck.do",
//				mber_id : $("#mber_id").val(),
//				dataType : "json",
//				async : true,
//				error : function(error) {
//				},
//				success : function(result) {
//					if (result == 1) {
//						alert("사용하실수 있는 것");
//						$("#mber_id_check").val("Y");
//						$("#temp_mber_id").val($("#mber_id").val());
//						$("#pw").focus();
//					} else {
//						$("#mber_id").focus();
//					}
//				}
//			});
			$.post("/idCheck", {
				mber_id : $("#mber_id").val(),
				dataType : "json",
				async : true
			}, function(data) {
				if (data.result == 1) {
					$('#idCheckComment').text("お使えます。");
					$('#idCheckComment').css("color","blue");
					$("#mber_id_check").val("Y");
					$("#temp_mber_id").val($("#mber_id").val());
					$("#pw").focus();
				} else {
					$("#idCheckComment").text("お使えないでございます。");
					$("#idCheckComment").css("color","red");
					$("#mber_id").focus();
				}
			});
		}
		function fn_email_confirm() { // 이메일 체크
			if (isEmpty("email", "メールを入力してください")) {
				return;
			}
			if (isEmpty("email_domain", "メールのドメインを入力してください")) {
				return;
			}
			ㄴ

			var email1 = $("#email").val().toLowerCase()
			var email2 = $("#email_domain").val().toLowerCase();
			var validEmail = email1 + "@" + email2;

			if (!fnChkEmailValid(validEmail)) {
				alert("正しいメールアドレスを入力してください");
				return;
			}

			$("#email").val(email1);
			$("#email_domain").val(email2);
		}
		function fnChkEmailValid(email) { // 이메일 정규식
			var reg = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			return (email != '' && email != 'undefined' && reg.test(email));
		}
		function fnDaumPostCode(tgtId) { // 다음 주소 검색 API
			new daum.Postcode({
				oncomplete : function(data) {
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}
					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
									: data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById(tgtId + 'zip1').value = data.zonecode; // 5자리
					// 새우편번호
					// 사용
					document.getElementById(tgtId + 'adres1').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById(tgtId + 'adres2').focus();
					if (tgtId == '') {
						fnSetTransAddressDefault();
					}
				}
			}).open({
				popupName : 'zipCodePop'
			});
		}
		var isUpper = /[^A-Z]/g; // 여기는 뭔지 모르겠는 친구들 ?
		function fnSetTransAddressDefault() {
			var def = '';
			if ($.trim($("#zip1").val()) != '') {
				def += '(' + $.trim($("#zip1").val()) + ') ';
			}
			if ($.trim($("#adres1").val()) != '') {
				def += $.trim($("#adres1").val()) + ' ';
			}
			if ($.trim($("#adres2").val()) != '') {
				def += $.trim($("#adres2").val());
			}
			$("#def_ipt_addr").text(def);
		}

		function fnChkID(mId) { // 아이디를 똑바른 형식으로 입력하였는가 체크 하는거
			if (mId.length < 4 || mId.length > 20) {
				return false;
			} else if (/[^a-z0-9]+|^([a-z]+|[0-9]+)$/i.test(mId)) {
				return false;
			} else if (/^[^a-z]|[^a-z0-9]+|^([a-z]+|[0-9]+)$/i.test(mId)) {
				return false;
			}
			/**
			 * var pattern1 = /(^[a-z])/; var pattern2 = /([^a-z0-9])/; var id = 'w1';
			 * if (mId.length < 4 || mId.length > 20) { return false; }
			 * if(!pattern1.test(mId)){ return false; } if(pattern2.test(mId)){ return
			 * false; }
			 */
			return true;
		}

		function fn_change_reside_country_code() {
			if ($.trim($("#reside_country_code2").val()) != '') {
				var v = $("#reside_country_code2").val();
				var vs = v.split("_");
				$("#reside_country_code").val(vs[0]);
				$("#country_telno").val(vs[1]);
				if ($("#telno0")) {
					$("#telno0").val(vs[1]);
				}
			}
		}
		function fnChkSafePwd() {
			var $obj = $("#pw");
			var str = $obj.val();
			var num_cnt = 0;
			var numPattern = /[0-9]/;
			if (numPattern.test(str)) {
				num_cnt = 1;
			}
			var eng_cnt = 0;
			var engPattern = /[a-zA-Z]/;
			if (engPattern.test(str)) {
				eng_cnt = 1;
			}
			var etc_cnt = 0;
			var etcPattern = /[!@#$%^&*(),.]/;
			if (etcPattern.test(str)) {
				etc_cnt = 1;
			}
			var total = num_cnt + eng_cnt + etc_cnt;
			if (total > 1) {
				return true;
			} else {
				return false;
			}
		}
		function validation() { // 유효성 검사 돌리는 부분
			$("#telno").val($("#telno1").val()+$("#telno2").val()+$("#telno3").val());
			if ($(":input:radio[name=sexdstn_code]:checked").length == 0) {
				alert("性別を選んでください");
				$("#sexdstn_code1").focus();
				return false;
			}
			if (isEmpty("mber_id", "IDを入力してください")) {
				return false;
			}
			if ($("#mber_id_check").val() == "N"
					|| $("#mber_id").val() != $("#temp_mber_id").val()) {
				alert("IDチェックをして下さい");
				$("#mber_id").focus();
				return false;
			}
			if (isEmpty("pw", "パスワードを入力してください")) {
				return false;
			}
			if ($("#pw").val() == $("#mber_id").val()) {
				alert("IDと同じパスワードはご利用して頂けません");
				$("#pw").val('');
				$("#pw").focus();
				return false;
			}
			if (fnGetRegexCnt($("#pw").val()) < 3) {
				alert("8~20字のローマ字/数字/特殊文字を組み合わせたパスワードのみご利用して頂けます");
				$("#pw").focus();
				return false;
			}
			if (isEmpty("pw_confirm", "パスワードチェックを行ってください")) {
				return false;
			}
			if ($("#pw").val() != $("#pw_confirm").val()) {
				alert("パスワード確認を行ってください");
				$("#pw_confirm").val('');
				$("#pw_confirm").focus();
				return false;
			}
			if (isEmpty("brthdy_yy", "年を選択してください")) {
				$("#brthdy_yy").focus();
				return false;
			}
			if (isEmpty("brthdy_mt", "月を選択してください")) {
				$("#brthdy_mt").focus();
				return false;
			}
			if (isEmpty("brthdy_de", "日を選択してください")) {
				$("#brthdy_de").focus();
				return false;
			}
			if (!fnChkValidYearDate($("#brthdy_yy").val(), $("#brthdy_mt").val(), $(
					"#brthdy_de").val())) {
				alert('正しい生年月日を入力してください');
				$("#brthdy_de").focus();
				return false;
			}
			
			if (isNotPhone("telno1", "telno2", "telno3", "연락처를 입력해 주세요.")) {
				return false;
			}

			if ($("#telno2").val().length < 3) {
				alert("연락처를 입력해 주세요.");
				$("#telno2").focus();
				return false;
			}

			if ($("#telno3").val().length < 4) {
				alert("연락처를 입력해 주세요.");
				$("#telno3").focus();
				return false;
			}
			$("#telno").val($("#telno1").val()+$("#telno2").val()+$("#telno3").val());
		
			if (isEmpty("email", "이메일을 입력해 주세요.")) {
				return false;
			}
			if (isEmpty("email_domain", "이메일 도메인을 입력해 주세요.")) {
				return false;
			}
			var email1 = $("#email").val().toLowerCase()
			var email2 = $("#email_domain").val().toLowerCase();
			var validEmail = email1 + "@" + email2;

			if (!fnChkEmailValid(validEmail)) {
				alert("올바른 이메일 주소를 입력하세요.");
				return false;
			}

			/*
			 * if ($("#email_check").val() == "N") { alert("이메일 중복체크를 해주세요.");
			 * $("#email").focus(); return false; }
			 */

			var email_str = $("#email").val() + "@" + $("#email_domain").val();
			/*
			 * if (email_str != $("#temp_email").val()) { alert("이메일 중복체크를 해주세요.");
			 * $("#email").focus(); return false; }
			 * 
			 * if(isNotAddress("zip1", "adres1", "주소를 입력해 주세요.")) { return false; }
			 * if(isEmpty("adres2", "상세주소를 입력해 주세요.")) { return false; }
			 * if(isMaxLengthOver("adres2", 100, "주소는 100Byte 이상 초과는 입력할 수 없습니다.
			 * \n.(한글:2Byte, 영문숫자:1Byte)")) { return false; }
			 */
			if ($("#request_card_type").is(":checked")) {

				if ($("#req_addr_type2").is(":checked")) {
					if ($("#trans_zip1").val() == '') {
						alert("주소를 입력해 주세요.");
						$("#trans_zip1").focus();
						return false;
					}
					if ($("#trans_adres1").val() == '') {
						alert("주소를 입력해 주세요.");
						$("#trans_adres1").focus();
						return false;
					}
					if ($("#trans_adres2").val() == '') {
						alert("상세주소를 입력해 주세요.");
						$("#trans_adres2").focus();
						return false;
					}
				} else {
					if (isNotAddress("zip1", "adres1", "주소를 입력해 주세요.")) {

						return false;
					}
					if (isEmpty("adres2", "상세주소를 입력해 주세요.")) {
						return false;
					}
					if (isMaxLengthOver("adres2", 100,
							"주소는 100Byte 이상 초과는 입력할 수 없습니다. \n.(한글:2Byte, 영문숫자:1Byte)")) {
						return false;
					}
				}
			}
			return true; // 다 통과하면 그제서야 true 반환
		}

		function fn_insert() { // 기입
			if (!validation()) {
				return false;
			}

			if (isEmpty("brthdy_yy", "년도를 선택하세요.")) {
				$("#brthdy_yy").focus();
				return false;
			}
			if (isEmpty("brthdy_mt", "월을 선택하세요.")) {
				$("#brthdy_mt").focus();
				return false;
			}
			if (isEmpty("brthdy_de", "일을 선택하세요.")) {
				$("#brthdy_de").focus();
				return false;
			}
			if ($(':checkbox[name="email_recptn_yn"]').is(":checked") == true) {
				$("#email_recptn_yn").val("Y");
			}else{
				$("#email_recptn_yn").val("N");
			}	 
			if ($(':checkbox[name="sms_recptn_yn"]').is(":checked") == true) {
				$("#sms_recptn_yn").val("Y");
			}else{
				$("#sms_recptn_yn").val("N");
			}
			if ($(':checkbox[name="dm_recptn_yn"]').is(":checked") == true) {
				$("#dm_recptn_yn").val("Y");
			}else{
				$("#dm_recptn_yn").val("N");
			}
			return true;
			// 여기서 join.do 로 보내주게 설정하면됨.
		}
		document.addEventListener("DOMContentLoaded",function(){
			$("#kr_nm_last").fnSetMaxlength(2);
			$("#kr_nm_first").fnSetMaxlength(5);
			$("#eng_nm_first").fnSetMaxlength(20);
			$("#eng_nm_last").fnSetMaxlength(20);
			$("#mber_id").fnSetMaxlength(20);
			$("#pw").fnSetMaxlength(20);
			$("#pw_confirm").fnSetMaxlength(20);
			$("#telno2").fnSetMaxlength(4);
			$("#telno3").fnSetMaxlength(4);
			$("#email").fnSetMaxlength(30);
			$("#email_domain").fnSetMaxlength(30);
			$("#zip1").fnSetMaxlength(6);
			$("#adres2").fnSetMaxlength(50);
			$("#zip1").fnSetAttr("readonly", true);
			$("#adres1").fnSetAttr("readonly", true);
	
			
			$("#telno2").fnKeyOnlyNumber();
			$("#telno3").fnKeyOnlyNumber();

			$("#zip1").click(function() {
				fnDaumPostCode();
			});

			$("#pw").fnIsSafePassword("pwdLvl", "jp");
			$("#telno2").val('');
			$("#telno3").val('');
			fnMakeYearSelect($("#brthdy_yy"), '');
			fnMakeSelOption($("#brthdy_mt"), 1, 12, '');
			fnMakeSelOption($("#brthdy_de"), 1, 31, '');
			$("#email").val('');
			$("#email_domain").val('');
			$("#country_telno").val('82');
			$("#reside_country_code").val('国籍');
			// 2017-08-09 ledler
			// 전체동의 체크박스 추가
			
			$("#recptChkAll").click(function(e) {
				if ($(this).is(":checked")) {
					$(".agree").prop("checked", true);
				} else {
					$(".agree").prop("checked", false);
				}
			});

			$(".agree").click(function() {
				if ($(this).is(":checked")) {
					if ($(".agree").length == $(".agree:checkbox:checked").length) {
						$("#recptChkAll").prop("checked", true);
					}
				} else {
					$("#recptChkAll").prop("checked", false);
				}
			});
			// checked인 input요소

			$("#brthdy_yy").val("1970");
			$("#brthdy_mt").val("01");
			$("#brthdy_de").val("01");
		}); // ---------------------------------------------------- 여기까지 ---------------------------------------------------------------

		function isNotAddress(obj1, obj2, msg) { // 주소 체크
			if (isEmpty(obj1, msg)) {
				$("#" + obj1).focus();
				return true;
			}
			if (isEmpty(obj2, msg)) {
				$("#" + obj2).focus();
				return true;
			}
			return false;
		}
		function isNotId(obj, msg) {
			var $obj = $("#" + obj);

			// null check
			if (isEmpty(obj, msg)) {
				$obj.focus();
				return true;
			}

			if ($obj.val().length < 4 || $obj.val().length > 20) {
				alert("아이디는 4자리 이상 20자리 이내로 입력해주세요.");
				$obj.val("");
				$obj.focus();
				return false;
			}
			var num = $obj.val().search(/[0-9]/g);
			var eng = $obj.val().search(/[a-z]/ig);
			if (num < 0 || eng < 0) {
				alert("아이디는 영문과 숫자 조합으로 입력해주세요.");
				$obj.val("");
				$obj.focus();
				return false;
			}
			// 영문과 숫자
			var objPattern = /^[a-zA-Z0-9]+$/;
			if (!objPattern.test($obj.val())) {
				alert("아이디는 영문과 숫자만 입력 가능합니다.");
				$obj.val("");
				$obj.focus();
				return true;
			}

			return false;
		}

		// 생년월일 체크
		/* function fnChkValidYearDate(yy, mm, dd) {
			var year = Number(yy);
			var month = Number(mm);
			var day = Number(dd);
			var today = new Date();
			var yearNow = today.getFullYear();
			var adultYear = yearNow - 20;
			var age = 18

			age = calcAge(yy + mm + dd);
			if (year < 1900 || year > adultYear) {
				if (age < 19) {
					return false;
				}
			}

			if (month < 1 || month > 12) {
				return false;
			}
			if (day < 1 || day > 31) {
				return false;
			}
			if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
				return false;
			}
			if (month == 2) {
				var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
				if (day > 29 || (day == 29 && !isleap)) {
					return false;
				}
			}
			return true;
		} */

		function calcAge(birth) {
			var date = new Date();
			var year = date.getFullYear();
			var month = (date.getMonth() + 1);
			var day = date.getDate();
			if (month < 10)
				month = '0' + month;
			if (day < 10)
				day = '0' + day;
			var monthDay = month + day;

			birth = birth.replace('-', '').replace('-', '');
			var birthdayy = birth.substr(0, 4);
			var birthdaymd = birth.substr(4, 4);

			var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
			return age;
		}

		function fnMakePhoneFirstNumber(obj, selVal) {
			var nos = [ '010', '011', '016', '017', '018', '019', '070' ];
			for (var i = 0; i < nos.length; i++) {
				if (selVal == nos[i]) {
					obj.append('<option value="' + nos[i] + '" selected>' + nos[i]
							+ '</option>');
				} else {
					obj
							.append('<option value="' + nos[i] + '">' + nos[i]
									+ '</option>');
				}
			}
		}
		// 로그인
		function fnLoginFirst(msg) {
			alert(msg);
			document.location.href = ambContext + "/" + ambLangCd + "/members/login.do";
			return;
		}
		// 숫자에 콤마
		function fnNumberWithComma(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		// 언어별 text
		function fnGetLangText(lang, obj) {
			var str = '';
			switch (lang) {
			case "ko":
				str = obj.ko;
				break;
			case "en":
				str = obj.en;
				break;
			case "cn":
				str = obj.cn;
				break;
			case "jp":
				str = obj.jp;
				break;
			default:
				str = obj.ko;
				break;
			}
			return str;
		}

		// 읽기 전용 설정 이건 뭐하는 친구인지 모르겠다
		function fnSetMailType(tgt, v, isLogin) {
			isLogin = (isLogin === undefined) ? false : isLogin;
			if (v == '1') {
				if (!isLogin) {
					$("#" + tgt).prop('readonly', false);
					$("#" + tgt).val('');
				}
				$("#" + tgt).focus();
			} else {
				if (isLogin) {
					var emails = $("#" + tgt).val().split("@");
					$("#" + tgt).val(emails[0]);
				} else {
					$("#" + tgt).prop('readonly', true);
					$("#" + tgt).val(v);
				}
			}
		}
		// 이메일 도메인
		function fnMakeEmailDomins(obj, selVal, lang, isLogin) {
			isLogin = (isLogin === undefined) ? false : isLogin;
			var domains = [ '1', 'gmail.com', 'hanmail.net', 'daum.net', 'naver.com',
					'nate.com', 'hotmail.com', 'zum.com', 'yahoo.com' ];
			var isCustom = false;
			var tmpTxt = '';
			function checkDomain(v) {
				return v == selVal;
			}

			var ver = fnGetIEVersion();

			if (ver != 'N/A') {
				if (parseInt(ver) < 12) {
					if (domains.indexOf(selVal) == -1) {
						isCustom = true;
					}
				}
			} else {
				if (!domains.find(checkDomain)) {
					isCustom = true;
				}
			}
			for (var i = 0; i < domains.length; i++) {
				if (i == 0) {
					tmpTxt = fnGetLangText(lang, {
						"ko" : "직접입력",
						"en" : "Enter",
						"cn" : "直接输入",
						"jp" : "直接入力"
					});
				} else {
					tmpTxt = ((isLogin) ? "@" : "") + domains[i];
				}

				if (isCustom) {
					if (i == 0) {
						obj.append('<option value="' + domains[i] + '" selected>'
								+ tmpTxt + '</option>');
					} else {
						obj.append('<option value="' + domains[i] + '">' + tmpTxt
								+ '</option>');
					}
				} else {
					if (selVal == domains[i]) {
						obj.append('<option value="' + domains[i] + '" selected>'
								+ tmpTxt + '</option>');
					} else {
						obj.append('<option value="' + domains[i] + '">' + tmpTxt
								+ '</option>');
					}
				}
			}
		}
		// 년도 콤보박스
		function fnMakeYearSelect(obj, selVal) {
			var today = new Date();
			var endYear = today.getFullYear() - 19;
			var startYear = today.getFullYear() - 100;
			var tmpVal = '';
			var cnt = 0;

			if (selVal == '' || selVal == 'undefined') {
				selVal = '1970';
			}
			for (var i = startYear; i <= endYear; i++) {
				tmpVal = startYear + cnt;
				if (selVal == tmpVal) {
					obj.append('<option value="' + tmpVal + '" selected>' + tmpVal
							+ '</option>');
				} else {
					obj
							.append('<option value="' + tmpVal + '">' + tmpVal
									+ '</option>');
				}
				cnt++;
			}
		}

		function fnMakeYearSelect2(obj, selVal) {
			var today = new Date();
			var endYear = today.getFullYear();
			var startYear = today.getFullYear() - 50;
			var tmpVal = '';
			var cnt = 0;

			for (var i = startYear; i <= endYear; i++) {
				tmpVal = startYear + cnt;
				if (selVal == tmpVal) {
					obj.append('<option value="' + tmpVal + '" selected>' + tmpVal
							+ '</option>');
				} else {
					obj
							.append('<option value="' + tmpVal + '">' + tmpVal
									+ '</option>');
				}
				cnt++;
			}
		}

		// 콤보박스 생성 (시작, 종료)
		function fnMakeSelOption(obj, start, end, selVal) {
			var tmpVal = 0;
			for (var i = start; i <= end; i++) {
				if (i < 10) {
					tmpVal = '0' + i;
				} else {
					tmpVal = '' + i;
				}
				if (selVal == tmpVal) {
					obj.append('<option value="' + tmpVal + '" selected>' + tmpVal
							+ '</option>');
				} else {
					obj
							.append('<option value="' + tmpVal + '">' + tmpVal
									+ '</option>');
				}
			}
		}

		// 빈값 체크
		function isEmpty(obj, msg) {
			var $obj = $("#" + obj);
			if ($obj.val() == null || $obj.val() == "undefined"
					|| $obj.val().replace(/ /gi, "") == "") {
				if (msg != undefined) {
					alert(msg);
				}
				$obj.focus();
				return true;
			} else {
				return false;
			}
		}

		// 이메일 체크
		function isNotEmail(obj1, obj2, msg) {
			if (isEmpty(obj1, msg)) {
				return true;
			}
			if (isEmpty(obj2, msg)) {
				return true;
			}

			var email = $("#" + obj1).val() + "@" + $("#" + obj2).val();
			if (!fnChkEmailValid(email)) {
				$("#" + obj1).focus();
				return true;
			}

			return false;
		}

		// 비밀번호 안전도
		function fnGetRegexCnt(str) {
			var eng_cnt, num_cnt, etc_cnt, total;
			total = eng_cnt = num_cnt = etc_cnt = 0;
			if (str == '' || str == 'undefined')
				return 0;
			if (str.length < 8)
				return 0;
			if (/[a-z]/.test(str)) {
				eng_cnt = 1;
			}
			if (/[0-9]/.test(str)) {
				num_cnt = 1;
			}
			if (/[!@#$%^&*(),.]/.test(str)) {
				etc_cnt = 1;
			}
			total = eng_cnt + num_cnt + etc_cnt;
			return total;
		}

		// 전화번호
		function isNotPhone(obj1, obj2, obj3, msg) {
			if (isEmpty(obj1, msg)) {
				return true;
			}
			if (isEmpty(obj2, msg)) {
				return true;
			}
			if (isEmpty(obj3, msg)) {
				return true;
			}
			return false;
		}

		// 전화번호2
		function isNotPhone2(obj1, obj2, obj3, obj4, msg) {
			if (isEmpty(obj1, msg)) {
				return true;
			}
			if (isEmpty(obj2, msg)) {
				return true;
			}
			if (isEmpty(obj3, msg)) {
				return true;
			}
			if (isEmpty(obj4, msg)) {
				return true;
			}
			return false;
		}

		//
		function isNotInternationalCode(obj1, msg) {
			if (isEmpty(obj1, msg)) {
				return true;
			}
		}
		// 최대입력값체크
		function isMaxLengthOver(obj, size, msg) {
			var $obj = $("#" + obj);
			if ($obj.val() == null || $obj.val() == "undefined") {
				return false;
			} else {
				var str = $obj.val();
				var intByteLength = 0;
				for (var i = 0; i < str.length; i++) {
					intByteLength += (str.charCodeAt(i) > 128) ? 2 : 1;
					if (intByteLength > size) {
						alert(msg);
						$obj.val(str.substring(0, i));
						$obj.focus();
						return true;
						break;
					}
				}
				return false;
			}
		}

		function isMinLengthUnder(obj, size, msg) {
			var $obj = $("#" + obj);
			if ($obj.val() == null || $obj.val() == "undefined") {
				return false;
			} else {
				var str = $obj.val();
				if (str.length < size) {
					alert(msg);
					$obj.val("");
					$obj.focus();
					return true;
				}
				return false;
			}
		}

		// 버튼 상태 변경
		function fnBtnDisabled(id, flag) {
			$("#" + id).prop('disabled', flag);
		}

		// 비번 안전도
		$.fn.fnIsSafePassword = function(lv, lang) {
			$(this).keyup(
					function() {
						var lvl = $("#" + lv);
						var total = 0;
						total = fnGetRegexCnt($(this).val());
						_g_pwd = false;
						if (total == 3) {
							lvl.show();
							lvl.removeClass("msg-2").removeClass("msg-3").removeClass(
									"msg-1").addClass("msg-1");
							lvl.text(fnGetLangText(lang, {
								"ko" : "안전",
								"en" : "Safe",
								"cn" : "安全",
								"jp" : "安全"
							}));
							_g_pwd = true;
						} else if (total == 2) {
							/*
							 * lvl.show();
							 * lvl.removeClass("msg-2").removeClass("msg-3").removeClass("msg-1").addClass("msg-3");
							 * lvl.text(fnGetLangText(lang, { "ko": "보통", "en":
							 * "Common", "cn": "普通", "jp": "普通" })); _g_pwd = false;
							 */
							lvl.show();
							lvl.removeClass("msg-2").removeClass("msg-3").removeClass(
									"msg-1").addClass("msg-2");
							lvl.text(fnGetLangText(lang, {
								"ko" : "사용불가",
								"en" : "Cannot be used",
								"cn" : "不可使用",
								"jp" : "使用不可"
							}));
							_g_pwd = false;
						} else {
							lvl.show();
							lvl.removeClass("msg-2").removeClass("msg-3").removeClass(
									"msg-1").addClass("msg-2");
							lvl.text(fnGetLangText(lang, {
								"ko" : "사용불가",
								"en" : "Cannot be used",
								"cn" : "不可使用",
								"jp" : "使用不可"
							}));
							_g_pwd = false;
						}
					});
		}
		// 최대입력 길이설정
		$.fn.fnSetMaxlength = function(mxlen) {
			mxlen = mxlen || 10;
			$(this).attr("maxlength", mxlen);
		}

		// 속성 설정
		$.fn.fnSetAttr = function(p, v) {
			$(this).attr(p, v);
		}

		// ime-mode
		$.fn.fnSetImeMode = function(v) {
			$(this).css("ime-mode", v);
		}

		// 숫자만
		$.fn.fnKeyOnlyNumber = function() {
			$(this).fnSetImeMode("disabled");
			$(this).on("input", function(evt) {
				$(this).val($(this).val().replace(/[^0-9]/g, ''));
				evt = evt || window.event;
				var code = (evt.which) ? evt.which : evt.keyCode;
				if (code != 46 && (code < 48 || code > 57)) {
					if (window.event) {
						window.event.returnValue = false;
					} else {
						evt.preventDefault();
					}
				}
			});
		}
		</script>

<%@ include file="../footer.jsp"%>