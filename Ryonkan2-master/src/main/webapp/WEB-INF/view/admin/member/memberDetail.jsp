<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article>
	<h1>会員情報</h1>
	<form name="frm" method="get">
		<table id="list">
			<tr>
				<th>会員グレード</th>
				<td colspan="5">${memberVO.mber_grade}</td>
			</tr>
			<tr>
				<th align="center" height="30">名前1</th>
				<td colspan="1">${memberVO.mber_nm}</td>
				<th align="center">名前2</th>
				<td colspan="1">${memberVO.mber_nm_yomi}</td>
				<th align="center">性別</th>
				<td colspan="1">${memberVO.mber_sex}</td>
			</tr>
			<tr>
				<th align="center" height="30">ID</th>
				<td colspan="1">${memberVO.mber_id }</td>
				<th align="center" height="30">PASSWORD</th>
				<td colspan="2">********</td>
			</tr>
			<tr>
				<th align="center" height="30">BirthDay</th>
				<td>${memberVO.mber_birth }</td>
				<th>携帯電話 </th>
				<td>${memberVO.mber_telno }</td>
			</tr>
			<tr>
				<th height="30">E-Mail</th>
				<td>${memberVO.email }</td>
				<th height="30">住所</th>
				<td width="150">${memberVO.adres}</td>
			</tr>
			<tr>
				<th height="30">メール受信同意</th>
				<td>${memberVO.email_recptn_yn }</td>
				<th>SMS-受信同意</th>
				<td>${memberVO.sms_recptn_yn }</td>
				<th>DM-受信同意</th>
				<td>${memberVO.dm_recptn_yn }</td>
			</tr>
			<tr>
				<th height="30">予約回数</th>
				<td width="10">5</td>
				<th>予約総金額</th>
				<td width="20">${memberVO.reserve_sum}</td>
				<th>Mileage</th>
				<td>${memberVO.mileage}</td>
			</tr>
			<tr>
				<th height="50">会員コメント</th>
				<td colspan="5">${memberVO.mber_comment}</td>
			</tr>

			<%-- <tr>
				<th>상품이미지</th>
				<td colspan="5" align="center">
					<!--[7] 상품 이미지를 출력하기 -->
					<img src="product_images/${productVO.image}" width="200pt">
				</td>
			</tr> --%>

		</table>
		<input type="hidden" name="page" value="${page }">
		<input type="hidden" name="mber_id" value="${memberVO.mber_id }">
		<!--[8] 수정 버튼이 눌리면 상품 수정 페이지로 이동하되 현재 페이지와 상품 일련번호 값을 전달해 준다. -->
		<input class="btn" type="button" value="修正" onClick="go_mod('${page}','${memberVO.mber_id}')">
		<!--[9] 목록 버튼이 눌리면 상품 리스트 페이지로 이동하되 현재 페이지를 전달해 준다. -->
		<input class="btn" type="button" value="リスト" onClick="go_list('${page}')">
	</form>
</article>
<%@ include file="../footer.jsp"%>
</body>
</html>