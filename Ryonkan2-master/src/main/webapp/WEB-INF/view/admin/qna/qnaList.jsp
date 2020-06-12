<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>
<script type="text/javascript">
	function go_view(q_code) {
		var theForm = document.frm;
		theForm.q_code.value = q_code;
		theForm.action = "admin_qna_detail.do";
		theForm.submit();
	}
</script>

<article>
	<h1>Q&amp;A リスト</h1>
	<form name="frm" method="post">
		<table style="float: right;">
			<tr>
				<td>
					<span style="font-size: large; font-weight: bold;">題目: </span>
					<input type="text" id="search_title">
					<input type="hidden" value="${page }" id="page">
					<input class="btn" type="button" value="検索" onclick="go_qna_search()">
				</td>
			</tr>
		</table>
		<input type="hidden" name="q_code">
		<table id="orderList">
			<tr>
				<th>답변여부</th>
				<th>題目</th>
				<th>作成者</th>
				<th>作成日</th>
			</tr>
			<c:choose>
				<c:when test="${pageMaker.totalCount<=0 }">
					<tr>
						<td width="100%" colspan="7" align="center" height="23">登録された質問がございません</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${qnaList}" var="qnaVO">
						<tr>
							<td>
								<c:choose>
									<c:when test='${qnaVO.q_status==0}'>(未処理)</c:when>
									<c:otherwise>(処理完了)</c:otherwise>
								</c:choose>
							</td>
							<td>
								<a href="/admin/qna/update?q_code=${qnaVO.q_code }"> ${qnaVO.q_title} </a>
							</td>
							<td>${qnaVO.mber_id}</td>
							<td>
								<fmt:formatDate value="${qnaVO.q_date}" />
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<div class="pagination clearfix">
			<c:if test="${pageMaker.prev }">
				<a href='<c:url value="/admin/qna/list?page=${pageMaker.startPage-1 }"/>'>prev</a>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<c:choose>
					<c:when test="${idx==page }">
						<strong>${idx }</strong>
					</c:when>
					<c:otherwise>
						<a href='<c:url value="/admin/qna/list?page=${idx }"/>'>${idx }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<a href='<c:url value="admin_qna_list.do?page=${pageMaker.endPage+1 }"/>'>next</a>
			</c:if>
		</div>
	</form>
</article>
<%@ include file="../footer.jsp"%>
</body>
</html>