<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>
<article>
	<h1>会員目録</h1>
	<form name="frm" method="post">
		<table style="float: right;">
			<tr>
				<td>
					<span style="font-size: large; font-weight: bold;">会員 ID: </span>
					<input type="text" id="search_id">
					<input type="hidden" value="${page }" id="page">
					<input class="btn" type="button" value="検索" onclick="go_search()">
				</td>
			</tr>
		</table>
		<table id="orderList">
			<tr>
				<th>ID</th>
				<th>名前</th>
				<th>E-Mail</th>
				<th>住所</th>
				<th>電話番号</th>
				<th>가입일</th>
			</tr>
			<c:choose>
				<c:when test="${pageMaker.totalCount<=0 }">
					<tr>
						<td width="100%" colspan="7" align="center" height="23">등록된 회원이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${memberList}" var="memberVO">
						<tr>
							<td style="text-align: left; padding-left: 50px; padding-right: 0px;">
								<a href="#" onClick="go_detail('${page}','${memberVO.mber_id }')">${memberVO.mber_id}</a>
							</td>
							<td>${memberVO.nm_first}/${memberVO.nm_last }</td>
							<td>${memberVO.email}@${memberVO.email_domain}</td>
							<td>${memberVO.adres1}${memberVO.adres2 }</td>
							<td>${memberVO.telno}</td>
							<td>가즈아</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<div class="pagination clearfix">
			<c:if test="${pageMaker.prev }">
				<a href='<c:url value="admin_member_list.do?page=${pageMaker.startPage-1 }"/>'>prev</a>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<c:choose>
					<c:when test="${idx==page }">
						<strong>${idx }</strong>
					</c:when>
					<c:otherwise>
						<a href='<c:url value="admin_member_list.do?page=${idx }"/>'>${idx }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<a href='<c:url value="admin_member_list.do?page=${pageMaker.endPage+1 }"/>'>next</a>
			</c:if>
		</div>
	</form>
</article>
<%@ include file="/admin/footer.jsp"%>
</body>
</html>