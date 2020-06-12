<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>
<script type="text/javascript">
	function go_search() {
		document.frm.action = "admin_member_list.do";
		document.frm.submit();
	}
</script>

<article>
	<h1>予約目録</h1>
	<form name="frm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<table style="float: right;">
			<tr>
				<td>
					<span style="font-size: large; font-weight: bold;">会員 ID: </span>
					<input type="text" name="search_id">
					<input class="btn" type="button" value="検索" onclick="go_re_search()">
				</td>
			</tr>
		</table>
		<br>
		<table id="orderList">
			<tr>
				<th>予約番号</th>
				<th>お客様 ID</th>
				<th>お名前</th>
				<th>客室名</th>
				<th>人数</th>
				<th>受付日</th>
				<th>Check IN</th>
				<th>Check OUT</th>
				<th>料金</th>
				<th>予約状態</th>
				<th>削除</th>
				<th>Memo</th>
			</tr>
			<c:choose>
				<c:when test="${pageMaker.totalCount<=0 }">
					<tr>
						<td width="100%" colspan="7" align="center" height="23">등록된 예약이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${reserveList}" var="reserveVO">
						<tr>
							<td>${reserveVO.re_code}</td>
							<td style="text-align: left; padding-left: 0px; padding-right: 0px;">
								<a href="#" onClick="go_detail('${page}','${reserveVO.mber_id }')">${reserveVO.mber_id}</a>
							</td>
							<td>${reserveVO.mber_id}</td>
							<td>123</td>
							<td>${reserveVO.num_people }人</td>
							<td>
								<fmt:formatDate value="${reserveVO.re_date}" type="date" />
							<td>
								<fmt:formatDate value="${reserveVO.check_in}" type="date" />
							</td>
							<td>
								<fmt:formatDate value="${reserveVO.check_out}" type="date" />
							</td>
							<td>${reserveVO.paymentVO.p_price}円</td>
							<td>
								<select name="re_status" style="width: 72" onchange="re_status_change(this,${reserveVO.re_code })">
									<c:forEach begin="1" end="4" step="1" var="val">
										<c:choose>
											<c:when test="${reserveVO.re_status == val }">
												<option value="${val}" selected="selected">${re_status_val[val-1] }</option>
											</c:when>
											<c:otherwise>
												<option value="${val}">${re_status_val[val-1] }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</td>
							<td>
								<input type="button" value="削除" onclick="go_re_delete(${reserveVO.re_code})" />
							</td>
							<td>
								<input type="button" value="Memo" onclick="go_memo(${reserveVO.re_code})" />
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<div class="pagination clearfix">
			<c:if test="${pageMaker.prev }">
				<a href='<c:url value="/admin/reserve/list?page=${pageMaker.startPage-1 }"/>'>prev</a>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<c:choose>
					<c:when test="${idx==page }">
						<strong>${idx }</strong>
					</c:when>
					<c:otherwise>
						<a href='<c:url value="/admin/reserve/list?page=${idx }"/>'>${idx }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<a href='<c:url value="/admin/reserve/list?page=${pageMaker.endPage+1 }"/>'>next</a>
			</c:if>
		</div>
	</form>
</article>
<%@ include file="../footer.jsp"%>
</body>
</html>