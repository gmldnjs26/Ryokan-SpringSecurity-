<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KWAK</title>
<link rel="stylesheet" href="../admin/css/admin12.css">
<script language="javascript">
	function worker_check() {
		if (document.frm.id.value == "") {
			alert("IDを入力してください。");
			frm.id.focus();
			return false;
		} else if (document.frm.pwd.value == "") {
			alert("Passwordを入力してください。");
			frm.pwd.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body bgcolor="f7f7f7" onLoad="loginFocus();">
	<table width="100%" height="100%" border="0" cellspacing="0"
		cellpadding="0">
		<tr>
			<td valign="top" bgcolor="f7f7f7">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="200"></td>
					</tr>
					<tr>
						<td height="1" bgcolor="d6d6d6"></td>
					</tr>
					<tr>
						<td height="280" align="center" bgcolor="#FFFFFF">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><img src="../admin/images/login_txt_login.gif"
										width="263" height="153" /></td>
									<td width="40">&nbsp;</td>
									<td><img src="../admin/images/login_txt_vline.gif"
										width="24" height="227" /></td>
									<td width="20">&nbsp;</td>
									<td>
										<table border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td>
													<table border="0" cellspacing="0" cellpadding="0">
														<form name="frm" action="/admin/login" method="post">
															<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
															<tr>
																<td>
																	<table border="0" cellspacing="0" cellpadding="1">
																		<tr>
																			<td><img src="../admin/images/login_txt_id.gif"
																				width="63" height="10" /></td>
																			<td><input type="text" name="id" value=""
																				class="login_input" style="width: 160px"></td>
																		</tr>
																		<tr>
																			<td><img src="../admin/images/login_txt_pw.gif"
																				width="63" height="10" /></td>
																			<td><input type="password" name="pwd" value=""
																				class="login_input" style="width: 160px"></td>
																		</tr>
																	</table>
																</td>
																<td style="padding-left: 6px"><input type="image"
																	src="../admin/images/login_bt_login.gif"
																	onclick="return worker_check()"></td>
															</tr>
														</form>
													</table>
												</td>
											</tr>
											<tr>
												<td height="15"></td>
											</tr>
											<tr>
												<td style="padding-left: 63px"><img
													src="../admin/images/login_txt_01.gif" width="229"
													height="26" /></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<h1 style="color: red">${message}</h1>
						<td height="1" bgcolor="d6d6d6"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>