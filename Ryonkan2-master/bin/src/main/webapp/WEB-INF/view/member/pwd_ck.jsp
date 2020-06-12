<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div id="container" class="contBg">
		<div class="login">
			<h2 class="loginTit">三木屋</h2>
			<c:if test="${message != null }">
				<script>alert(message);</script>
			</c:if>
			<div class="loginRow">
				<!-- 멤버십 회원 // -->
				<form name="loginForm" id="loginForm" method="post" action="login.do">
				<input type="hidden" id="url" name="url" value="">
				<div class="loginCol">
					<h2 class="loginTit2"></h2>
					<div class="loginBox">
						<div class="loginFm">
							<li>
								<span class="ipt fw-full">ID</span>
								<strong>${loginMember.mber_id }</strong>
							</li>
							<input type="password" class="ipt fw-full fmMg-1" placeholder="パスワードをご入力ください" title="パスワードをご入力ください" name="mber_pw" id="mber_pw" maxlength="20">
							<span class="chkFm fmMg-1"><input type="checkbox" class="chk" id="chkSaveId" name="chkSaveId" value="Y"><span class="act"></span><label for="chkSaveId" class="fc-3">ログイン状態を保持する</label></span>
							<span class="forgot"><a href="#" class="txtLine" onclick="fn_idpw_search();">ログインできない方</a></span>
							<a href="#" class="btn-1 btnLogin" onclick="fnLogin();">ログイン</a>
						</div>
					</div>
					<dl class="loginOpt">
						<dt>会員登録をしていらっしゃいませんか？</dt>
						<dd>会員登録して頂きますと、ポイントが貯まる他<br>様々なイベントにご参加になれます</dd>
						<dd class="btnOpt"><a href="join_form.do" class="btn-9 btnJoin">会員登録</a></dd>
					</dl>
				</div>
				</form>
				<!-- // 멤버십 회원 -->

				<!-- // 비회원 예약 조회 -->
			</div>
		</div>

	</div>
<script type="text/javascript">
	function fnLogin() {
		if($("#mber_pw").val() == ""){
			alert("パスワードをご入力ください")
			$("#mber_pw").focus();
			return;
		}
		document.loginForm.submit();
	}
	</script>

<%@ include file="../footer.jsp"%>