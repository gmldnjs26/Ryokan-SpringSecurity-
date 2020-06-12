<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>

<style type="text/css">
.contain {
	padding: 65px 0 0 0;
}

.contain .container {
	width: 1200px;
	zoom: 1;
	margin: 0 auto 100px auto;
}

.contents {
	width: 866px;
	padding: 0;
	background: #fff;
	min-height: 440px;
}

.customerCenterTit {
	display: block;
	height: 47px;
	border-bottom: 5px solid #212121;
}

h4.tit {
	font-size: 20pt;
	font-family: "돋움"
}

h1, h2, h3, h4, h5, h6, h7, form {
	font-weight: normal;
	margin: 0;
	padding: 0;
}

th {
	display: table-cell;
	vertical-align: inherit;
	font-weight: bold;
}

.tableTypeA {
	font-family: "돋움";
	border: none;
	border-top: #cdcbbe solid 1px;
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
}

.tableTypeA td {
	padding: 6px 14px;
}

.tableTypeA th, .tableTypeA td {
	line-height: 20px;
}

.tableTypeA td {
	background: #FFF;
	color: #1b1b1b;
}

.tableCustomer th {
	padding-left: 20px;
}

.tableTypeA th {
	font-size: 15px;
	color: #666;
	background: #faf9f4;
}

.tableTypeA th, .tableTypeA td {
	border: none;
	padding: 6px 13px;
	text-align: left;
	line-height: 22px;
	border-bottom: #eceae1 solid 1px;
}

label {
	cursor: default;
}

.ast {
	color: #F33;
	font-size: 10px;
	font-family: Verdana;
	vertical-align: middile;
}

textarea.memo {
	width: 620px;
	height: 110px;
	vertical-align: middle;
}

.uiform {
	color: #727272;
}

textarea {
	border: 1px solid #ccc;
	padding: 5px 4px 4px;
	margin: 1px 0;
	resize: none;
}

input {
	border: 1px solid #ccc;
	padding: 5px 4px 4px;
	margin: 1px 0;
}

input, select {
	vertical-align: middle;
	font-size: 12px;
	font-family: Arial, Dotum;
}

.btnList {
	padding: 30px 0 0 0;
}

.btnList {
	text-align: center;
	zoom: 1;
	margin: 0px 0 0px 0;
	position: relative;
	min-height: 28px;
}

.btnList .btn {
	font-size: 15px;
	font-family: "돋움";
	font-weight: bold;
	border: 1px solid #212121;
	background-color: #212121;
	color: #faf9f4;
	padding: 10px 20px 10px 20px;
	border: 1px solid #212121;
}

.btnList .btn:hover {
	color: #212121;
	background-color: #faf9f4;
}
</style>

<script type="text/javascript">
	function q_del() {
		var url = "q_delete?p_code=${vo.p_code}";
		window
				.open(url, "q_delete",
						"width=300, height=200, left=600, top=300");
	}
</script>
</head>
<body>

	<div class="contain">
		<div class="container">
			<div class="contents" id="contents">
				<div class="ctnInquires ctnCustomer">
					<img alt="" src="qna/qna.gif" width="865" height="180">
					&nbsp;
					<table class="tableTypeA tableCustomer">
						<tbody>
							<tr>
								<th scope="row" colspan="4">
									<label for="mber_id" class="mber_id">Question</label>
								</th>
							</tr>
							<tr id="showTitle">
								<th scope="row">
									<label for="askSubj" class="title">
										<span class="ast">*</span>
										タイトル
									</label>
								</th>
								<td colspan="3">
									<font face="Hiragino Kaku Gothic Pro" size="3">${qnaVO.q_title }</font>
								</td>
							</tr>
							<tr>
								<th scope="row" height="200">
									<label for="askTxt" class="qMemo">
										<span class="ast">*</span>
										内容 <br>
									</label>
								</th>
								<td colspan="3">
									<font face="Hiragino Kaku Gothic Pro" size="3">${qnaVO.q_content}</font>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="btnList">
						<a href="qna_delete.do?q_code=${qnaVO.q_code }" class="btn" style="text-decoration: none">削除</a> <a href="qna_list.do" class="btn" style="text-decoration: none">リスト</a>
					</div>
					&nbsp;
					&nbsp;
					<c:choose>
						<c:when test="${qnaVO.q_status != 0 }">
							<table class="tableTypeA tableCustomer">
								<tbody>
									<tr>
										<th scope="row" colspan="4">
											<label for="mber_id" class="mber_id">Answer</label>
										</th>
									</tr>
									<tr id="showTitle">
										<th scope="row">
											<label for="askSubj" class="title">
												<span class="ast">*</span>
												タイトル
											</label>
										</th>
										<td colspan="3">
											<font face="Hiragino Kaku Gothic Pro" size="3">${qnaVO.a_title}</font>
										</td>
									</tr>
									<tr>
										<th scope="row" height="200">
											<label for="askTxt" class="qMemo">
												<span class="ast">*</span>
												内容 <br>
											</label>
										</th>
										<td colspan="3">
											<font face="Hiragino Kaku Gothic Pro" size="3">${qnaVO.a_content}</font>
										</td>
									</tr>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<p align="left" style="margin: 10px; font-weight: bold;">
								<font size="3" face="Hiragino Kaku Gothic Pro"><a class="list">まだ回答できていません。</a></font>
							</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="../footer.jsp"%>