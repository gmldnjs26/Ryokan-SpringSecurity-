<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 푸터 -->
<div id="footer">
	<div class="contains">
		<div class="footer_top clear_wrap">
			<ul class="footer_menu">
				<li class="pc"><a href="index.jsp">トップページ</a></li>
				<li><a href="#">サイトマップ</a></li>
				<li><a target="_blank" href="#">スタートページに設定</a></li>
				<li><a href="#">RSS</a></li>
				<li><a href="#">広告掲載</a></li>
				<li><a href="#">免責事項</a></li>
				<li><a href="#">プライバシーポリシー</a></li>
				<li><a href="#">ヘルプ</a></li>
				<li><a href="#">企業情報</a></li>
			</ul>
			<div class="right_menu">
				<div class="drop_family">
					<span class="icon"></span>
					<a href="#" class="btn_family">三木屋</a>
					<ul class="drop_list">
						<li><a href="index.do" target="_blank" class="btn_menu">三木屋について</a></li>
						<li><a href="roomList.do" target="_blank" class="btn_menu">お部屋</a></li>
						<li><a href="mealList.do" target="_blank" class="btn_menu">お食事</a></li>
						<li><a href="" class="btn_menu">温泉 </a></li>
						<li><a href="notice.do" target="_blank" class="btn_menu">よくある質問</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="footer_bottom">
			<div class="contains">
				<div class="address_box">
					<p>
						<img src="../file/profile/sinfo/d009f44beecdb041864f15f8a9c26aad_IMG181005030830.png" alt="" />
					</p>
					<p>
						兵庫県豊岡市城崎町湯島487<br> TEL：0796-32-2031（受付時間 8：00〜20：00）<br class="show_mobile" />
					</p>
					<p class="copyright">Copyright © 2019 Mikiya All Right Reserved.</p>
				</div>

				<a href="https://ko-kr.facebook.com/jeilpet/" target="_blink" class="footer_sns_01">facebook</a> <a href="https://www.instagram.com/idealrecipe/" target="_blink" class="footer_sns_02">insta</a> <a href="https://blog.naver.com/jeilpet" target="_blink" class="footer_sns_03">blog</a>

			</div>

		</div>
	</div>
</div>

<a href="#" id="page_top" style="margin-bottom: 0px;" class="active"><img src="../common/img/icon/page_top.png" alt="위로"></a>
</div>

<!-- 팝업 -->
<div id="popup_mask"></div>
<style>
#popup_basic {
	display: block;
	position: fixed; /*box-shadow:0 0 10px rgba(0,0,0,0.2)*/;
	z-index: 1000;
	/*-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box*/
}

#popup_basic img.popup_img {
	width: 100%;
}

#popup_basic .popup_check {
	color: #666;
	font-size: 14px;
	background: #fff;
	margin-top: -4px;
	padding: 10px;
	position: relative;
}

#popup_basic .popup_check input, #popup_basic .popup_check span {
	vertical-align: middle
}

#popup_basic .btn_close {
	display: block;
	position: absolute;
	right: 10px;
	top: 10px;
	z-index: 20;
	color: #666;
	text-align: left
}

#popup_basic .btn_close:hover {
	color: #dc3775
}

#popup_basic .btn_close img {
	display: block;
	width: 100%
}

@media screen and (max-width:1020px) {
	#popup_basic {
		width: 60% !important;
		height: auto;
		left: 20% !important;
		top: 120px !important;
		text-align: center
	}
	#popup_basic .popup_check {
		text-align: left
	}
	#popup_basic .popup_img {
		width: 80%;
		margin: 0 auto;
	}
	/*#popup_basic .btn_close { top:-45px; right:0}*/
}
</style>
</body>
</html>