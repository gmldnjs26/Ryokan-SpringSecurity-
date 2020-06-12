<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kwak</title>
<link rel="stylesheet" href="/admin/css/admin.css?ver=3">
<link rel="stylesheet" href="/admin/css/paging.css?ver=11">
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script type="text/javascript" src="/admin/js/admin.js?ver=3"></script>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<c:choose>
	<c:when test="${empty admin}">
		<script type="text/javascript">
			location.href = '/admin/login';
		</script>
	</c:when>
</c:choose>
<script type="text/javascript">
function fnCdCmp(){
	$.ajax({
		async: true,
		url : "admin_re_cal.do", // 니 유알엘
		type : 'POST',
		data : {num_people : $("#num_people option:selected").val()},
		dataType : "json", // 타입은 json 으로
		contentType: "application/json; charset=UTF-8",
		success : function(data) {
			if (data.result == 1) { // 받은 data중 결과->결과이름을 난 result 로 해놓음
				alert("金額が変更されました。");
			} else {
				alert("error");
			}
		}
	});
}
</script>
</head>
<body>
	<div id="wrap">
		<header>
			<div id="logo">
				<a href="/admin/login"> <img style="width: 800px" height="200px" src="/file/banner/main/main_banner01.jpg"> <img src="../admin/images/text.gif">
				</a>
			</div>
			<form action="/logout" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	
				<input class="btn" type="submit" value="logout" style="float: right;">			
			</form>
		</header>
		<div class="clear"></div>