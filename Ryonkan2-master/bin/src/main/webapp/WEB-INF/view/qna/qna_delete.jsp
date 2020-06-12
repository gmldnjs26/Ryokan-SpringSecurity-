<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function send(){
			board.submit();
			alert("削除されました");
			window.opener.location.replace("/q_list");
			self.close();
}
</script>

<style type="text/css">
.contain{
	margin: 50px 0 0 50px;
}

.btnList {
	padding: 30px 0 0 0;
}

.btnList {
	text-align: left;
	zoom: 1;
	margin: 0px 0 0px 0;
	position: relative;
	min-height: 28px;
}

.btnList .btn {
	font-size: 15px;
	font-family: "돋움";
	border: 1px solid #212121;
	background-color: #212121;
	color: #faf9f4;
	padding: 10px 20px 10px 20px;
}

.btnList .btn:hover {
	color: #212121;
	background-color: #faf9f4;
}

</style>
</head>
<body>
<div class="contain">
<form name="board" method="post" action="q_delete" >
<input type="hidden" name="q_code" value="${q_code}">
<tr>
       <td height="30" >
       <font size="4" face="돋움">質問を削除しますか<br></font></td></tr>
<div class="btnList">
<a href="javascript:send()" class="btn" style="text-decoration: none">削除</a>
<a href="javascript:self.close()" class="btn" style="text-decoration: none">閉じる</a>
</div>
 </form>
 </div>
</body>
</html>