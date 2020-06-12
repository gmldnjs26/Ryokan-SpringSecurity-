<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article>
	<h1>会員修正</h1>
	<form name="frm" method="post" action="/admin/member/update">
		<input type="hidden" value="${page }" name="page" />
		<input type="hidden" value="${memberVO.mber_id }" name="mber_id" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	
		<table id="list">
			<tr>
				<th>会員グレード</th>
				<td colspan="5">
					<select name="grade">
						<c:forEach var="val" begin="1" end="5" step="1">
							<c:choose>
								<c:when test="${memberVO.mber_grade == val}">
									<option value="${val }" selected="selected">${val }</option>
								</c:when>
								<c:otherwise>
									<option value="${val }">${val }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
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
				<td colspan="2">***********</td>
			</tr>
			<tr>
				<th align="center" height="30">BirthDay</th>
				<td>${memberVO.mber_birth }</td>
				<th>携帯電話 </th>
				<td>
					<input type="text" name="telno" value="${memberVO.mber_telno }"/>
				</td>
			</tr>
			<tr>
				<th height="30">E-Mail</th>
				<td>${memberVO.email }</td>
				<th height="30">住所</th>
				<td width="150">${memberVO.adres}</td>
			</tr>
			<tr>
				<th>メール受信同意</th>
				<td>
					<c:choose>
						<c:when test="${memberVO.email_recptn_yn.trim().equals('Y')}">
							<input type="checkbox" name="email_recptn_yn" value="Y" checked="checked">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="email_recptn_yn" value="N">
						</c:otherwise>
					</c:choose>
				</td>
				<th>SNS-受信同意</th>
				<td>
					<c:choose>
						<c:when test='${memberVO.sms_recptn_yn.trim()=="Y"}'>
							<input type="checkbox" name="sms_recptn_yn" value="Y" checked="checked">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="sms_recptn_yn" value="N">
						</c:otherwise>
					</c:choose>
				</td>
				<th>DM-受信同意</th>
				<td>
					<c:choose>
						<c:when test='${memberVO.dm_recptn_yn.trim()=="Y"}'>
							<input type="checkbox" name="dm_recptn_yn" value="Y" checked="checked">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="dm_recptn_yn" value="N">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>予約回数</th>
				<td width="70">5</td>
				<th>予約総金額</th>
				<td width="70">${memberVO.reserve_sum}</td>
				<th>Mileage</th>
				<td width="72">
					<input type="text" name="mileage" size="11" value="${memberVO.mileage }">
				</td>
			</tr>
			
			<tr>
				<th>会員説明</th>
				<td colspan="5">
					<textarea name="mber_comment" rows="8" cols="70">${memberVO.mber_comment}</textarea>
				</td>
			</tr>
			<%-- <tr>
				<th>상품이미지</th>
				<td colspan="5">
					<img src="product_images/${productVO.image}" width="200pt"> <br>
					<input type="file" name="image">
				</td>
			</tr> --%>
		</table>
		<input class="btn" type="submit" value="修正">
		<input class="btn" type="button" value="取り消す" onClick="history.go(-1)">
	</form>
</article>
<%@ include file="../footer.jsp"%>
</body>
</html>