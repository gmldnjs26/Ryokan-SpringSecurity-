<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div id="container" class="contBg">
		<div class="login">
			<h2 class="loginTit">三木屋</h2>
			<c:if test="${message != null }">
				<script>alert("${message}");</script>
			</c:if>
			<div class="loginRow">
				<!-- 멤버십 회원 // -->
				<form name="loginForm" id="loginForm" method="post" action="/authorized">
				<input type="hidden" id="url" name="url" value="">
				<div class="loginCol">
					<h2 class="loginTit2"></h2>
					<div class="loginBox">
						<div class="loginFm">
						<!--  CSRF  -->
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type="text" class="ipt fw-full" placeholder="IDをご入力ください" title="IDをご入力ください" name="mber_id" id="mber_id" maxlength="20">
							<input type="password" class="ipt fw-full fmMg-1" placeholder="パスワードをご入力ください" title="パスワードをご入力ください" name="pw" id="pw" maxlength="20" onkeyup="enterkey();">
							<span class="chkFm fmMg-1"><input type="checkbox" class="chk" id="chkSaveId" name="chkSaveId" value="Y"><span class="act"></span><label for="chkSaveId" class="fc-3">ログイン状態を保持する</label></span>
							<span class="forgot"><a href="#" class="txtLine" onclick="fn_idpw_search();">ログインできない方</a></span>
							<a href="#" class="btn-1 btnLogin" id="myInput" onclick="fnLogin();">ログイン</a>
						</div>
					</div>
					<dl class="loginOpt">
						<dt>会員登録をしていらっしゃいませんか？</dt>
						<dd>会員登録して頂きますと、ポイントが貯まる他<br>様々なイベントにご参加になれます</dd>
						<dd class="btnOpt"><a href="/join" class="btn-9 btnJoin">会員登録</a></dd>
					</dl>
				</div>
				</form>
				<!-- // 멤버십 회원 -->

				<!-- // 비회원 예약 조회 -->
			</div>
		</div>

	</div>
<script type="text/javascript">
	function enterkey() {
		if (window.event.keyCode == 13) {
			// 엔터키가 눌렸을 때 실행할 내용
			fnLogin();
		}
	}
	function fnLogin() {
		if ($("#mber_id").val() == "") {
			alert("IDをご入力ください")
			$("#mber_id").focus();
			return;
		}
		if ($("#pw").val() == "") {
			alert("パスワードをご入力ください")
			$("#pw").focus();
			return;
		}
		document.loginForm.submit();
	}
</script>

<%@ include file="../footer.jsp"%>