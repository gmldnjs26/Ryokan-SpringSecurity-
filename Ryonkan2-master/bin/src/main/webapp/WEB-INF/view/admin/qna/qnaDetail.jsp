<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>
<script type="text/javascript">
	function go_rep(q_code) {
		var theForm = document.frm;
		theForm.action = "admin_rep_write.do";
		theForm.submit();
	}
	function go_qna_list(){
		document.location.href="admin_qna_list.do"
	}
</script>
<article>
	<h1>Q&amp;A 게시판</h1>
	<form name="frm" method="post" action="admin_rep_write.do">
		<input type="hidden" name="q_code" value="${qnaVO.q_code }"/>
		<table id="orderList">
			<tr>
				<th width="20%">タイトル</th>
				<td>${qnaVO.q_title}</td>
			</tr>
			<tr>
				<th>登録日</th>
				<td>
					<fmt:formatDate value="${qnaVO.q_date}" />
				</td>
			</tr>
			
			<tr>
				<th>内容</th>
				<td>${qnaVO.q_content}</td>
			</tr>
		</table>
		<c:choose>
			<c:when test='${qnaVO.q_status==0}'>
				<table id="orderList">
					<tr>
						<th width="20%">答弁_タイトル</th>
						<td>
							<input type="text"  name="a_title"/>
						</td>
					</tr>
					<tr>
						<th width="20%">内容</th>
						<td colspan="2">
							<textarea  name="a_content" rows="3" cols="80"></textarea>
						</td>
					</tr>
				</table>
				<br>
			</c:when>
			<c:otherwise>
				<table id="orderList">
					<tr>
						<th width="20%">答弁_タイトル</th>
						<td>${qnaVO.a_title}</td>
					</tr>
					<tr>
						<th>内容</th>
						<td>${qnaVO.a_content}</td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
		<input type="submit" class="btn" value="SAVE"  />
		<input type="button" class="btn" value="リスト" onClick="go_qna_list()">
	</form>
</article>
<%@ include file="/admin/footer.jsp"%>
</body>
</html>