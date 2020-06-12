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
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$.ajax({
		data : {
			"mber_id":$("#mber_id").val(),
		},
		url:"/idCheck",
		type:'POST',
		dataType:'json',
		beforeSend: function(xhr) {
            // here it is
            xhr.setRequestHeader(header, token);
		},
		success: function(data) {
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
		}
	});
	//xhr.setRequestHeader(header,token); meta data に入ってる値を持ってくる
	
//	$.post("/idCheck", {
//		mber_id:$("#mber_id").val(),
//		dataType : "application/json; charset=UTF-8",
//		async : true,
//		beforeSend: function(xhr) {
//            // here it is
//            xhr.setRequestHeader(header, token);
//        },
//	}, function(data) {
//		if (data.result == 1) {
//			$('#idCheckComment').text("お使えます。");
//			$('#idCheckComment').css("color","blue");
//			$("#mber_id_check").val("Y");
//			$("#temp_mber_id").val($("#mber_id").val());
//			$("#pw").focus();
//		} else {
//			$("#idCheckComment").text("お使えないでございます。");
//			$("#idCheckComment").css("color","red");
//			$("#mber_id").focus();
//		}
//	});
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
	$("#mber_telno").val($("#telno1").val()+$("#telno2").val()+$("#telno3").val());

	if (isEmpty("email_id", "이메일을 입력해 주세요.")) {
		return false;
	}
	if (isEmpty("email_domain", "이메일 도메인을 입력해 주세요.")) {
		return false;
	}
	var email1 = $("#email").val()
	var email2 = $("#email_domain").val()
	var validEmail = email1 + "@" + email2;

	if (!fnChkEmailValid(validEmail)) {
		alert("올바른 이메일 주소를 입력하세요.");
		return false;
	}

	var email_str = $("#email_id").val() + "@" + $("#email_domain").val();
	$("#email_object").val(email_str);

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
	$("#mber_nm").val($("#kr_nm_first").val() + " " + $("#kr_nm_last").val());
	$("#mber_nm_yomi").val($("#kr_nm_first_yomi").val() + " " + $("#kr_nm_last_yomi").val());
	
	// mailは処理しました。
	$("#mber_country").val($("#reside_country_code2").val());
	
	$("#mber_sex").val($("input[name='sexdstn_code']:checked").val());
	$("#mber_birth").val($("#brthdy_mt").val() + "/"+ $("#brthdy_de").val() +"/"+  $("#brthdy_yy").val());
	$("#zip_num").val($("#zip1").val());
	$("#adres").val($("#adres1").val() + $("#adres2").val());
	
    document.insertForm.submit();
	// /join
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
	$("#email_id").fnSetMaxlength(30);
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
	$("#email_id").val('');
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
function fnChkValidYearDate(yy, mm, dd) {
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
		$(this).val($(this).val().replace(/[^0-9]/g, ''))
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