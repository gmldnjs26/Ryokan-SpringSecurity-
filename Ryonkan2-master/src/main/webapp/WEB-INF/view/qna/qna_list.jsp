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
	display: inline-block;
	height: 47px;
	border-bottom: 5px solid #212121;
}

h4.tit {
	font-size: 20pt;
	font-family: "Hiragino Kaku Gothic Pro"
}

h1, h2, h3, h4, h5, h6, h7, form {
	font-weight: normal;
	margin: 0;
	padding: 0;
}

.faqList {
	border-top: #cdcbbe solid 1px;
	margin: 20px 0 20px 0;
	font-family: "Hiragino Kaku Gothic Pro";
}

.faqList tr td {
	padding: 9px 0px;
	font-color:
}

.btnList {
	padding: 30px 0 0 0;
}

.btnList {
	text-align: right;
	zoom: 1;
	margin: 0px 0 0px 0;
	position: relative;
	min-height: 28px;
}

.btnList .btn {
	font-size: 15px;
	font-family: "Hiragino Kaku Gothic Pro";
	border: 1px solid #212121;
	background-color: #212121;
	color: #faf9f4;
	padding: 10px 20px 10px 20px;
}

.btnList .btn:hover {
	color: #212121;
	background-color: #faf9f4;
}

a:link {
	color: #bb6542;
}

a:visited {
	color: #bb6542;
}
</style>
</head>
<body>
	<div class="contain">
		<div class="container">
			<div class="contents" id="contents">
				<div class="ctnInquires ctnCustomer">
					<div class="customerCenterTit">
						<img alt="" src="qna/qna.gif " width="865" height="180">
						<h4 class="tit" style="color: #bb6542"><br/></h4>
					</div>
					<table class="faqList">
						<tbody>
							<tr bgcolor="#faf9f4">
								<td width="50%" align="center" height="20" style="border-bottom: #ccc solid 1px">
									<font face="Hiragino Kaku Gothic Pro" size="3" color="#bb6542">タイトル</font>
								</td>
								<td width="15%" align="center" height="20" style="border-bottom: #ccc solid 1px">
									<font face="Hiragino Kaku Gothic Pro" size="3" color="#bb6542">作成者</font>
								</td>
								<td width="15%" align="center" height="20" style="border-bottom: #ccc solid 1px">
									<font face="Hiragino Kaku Gothic Pro" size="3" color="#bb6542">回答状況</font>
								</td>
							</tr>
							<c:if test="${!empty qnaList }">
								<c:forEach var="qnaVO" items="${qnaList }">
									<tr onMouseOver="style.backgroundColor='#faf9f4'" onMouseOut="style.backgroundColor=''">
										<td align="center" height="20" style="border-bottom: #ccc solid 1px">
											&nbsp; <font face="Hiragino Kaku Gothic Pro" size="2"></font> <a class="qnalist" href="/qna/view?q_code=${qnaVO.q_code }" style="text-decoration: none">${qnaVO.q_title } </a>
										</td>
										<td align="right" height="20" style="border-bottom: #ccc solid 1px">
											<font face="Hiragino Kaku Gothic Pro" size="2"> ${qnaVO.mber_id }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
										</td>
										<td align="left" height="20" style="border-bottom: #ccc solid 1px">
											<font face="Hiragino Kaku Gothic Pro" size="2"></font>
											<c:if test="${qnaVO.q_status==0}"><font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[回答待ち]</font></c:if>
											<c:if test="${qnaVO.q_status==1 }"><font color="blue">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[回答済み]</font></c:if>
										</td>
									</tr>
								</c:forEach>
							</c:if>

							<c:if test="${empty qnaList }">
								<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
									<td align="center" colspan="5">
										<font face="Hiragino Kaku Gothic Pro" size="2" color="#000000">登録された資料はありません</font>
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<div class="btnList">
						<a href="/qna/write" class="btn" style="text-decoration: none">書き込み</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>