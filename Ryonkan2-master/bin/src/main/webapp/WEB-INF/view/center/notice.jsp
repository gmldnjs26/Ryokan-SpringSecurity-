<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div id="content" class="sub center_panel bbs_photo">
	<div class="wrapping">
		<!-- 서브타이틀 -->
		<div class="partner_top">
			<!-- 상단 서브 배너 영역 ---------------------->
			<div class="sub_visual">
				<img src="../../common/img/center/bg_m.jpg" alt="" class="show_mobile" />
			</div>
			<!-- //상단 서브 배너 영역 ---------------------->

			<div class="contains">
				<div class="lnb_tab_box">
					<div class="lnb_tab_menu">
						<a href="#test01" class="btn_tab active" name="btn1" onclick="btn_act(btn1)">宿泊・客室について</a> <a href="#test02" class="btn_tab" name="btn2" onclick="btn_act(btn2)">お食事について</a> <a href="#test03" class="btn_tab" name="btn3" onclick="btn_act(btn3)">館内施設・設備について</a> <a href="#test04" class="btn_tab" name="btn4" onclick="btn_act(btn4)">入浴・お風呂について</a> <a href="#test05" class="btn_tab" name="btn5" onclick="btn_act(btn5)">アクセス・駐車場について</a>
					</div>
				</div>

				<div class="show_mobile">
					<p class="partner_title">
						<b>よくある質問</b>
					</p>
				</div>

			</div>
		</div>
		<!-- //서브타이틀 -->

		<div class="sub_wrap">
			<div class="contains">
				<div class="sub_title_box">
					<p class="title">FAQ</p>
				</div>


				<div class="notice_wrap">
					<!-- 리스트-->
					<div id="test01" style="padding: 4%;"></div>
					<dl id="sec1" class="section">

						<dt>チェックイン、チェックアウトの時間は？</dt>
						<dd>チェックイン15 ： 00 ～ 18 ： 30、チェックアウト11 ： 00 です。</dd>

						<dt>客室の備品は何がありますか？</dt>
						<dd>
							TV、冷蔵庫、冷暖房機、電話、金庫、綿棒、ドライヤー、浴衣一式、ハンドタオル、バスタオル、巾着、歯ブラシ、ハンドソープがございます。<br> 髭そり、ヘアーブラシ、綿棒、シャワーキャップなどはお風呂にございます。
						</dd>

						<dt>志賀直哉ゆかりの部屋は宿泊出来るの？</dt>
						<dd>はい。ご希望の方はご予約時にお問い合わせ下さいませ。</dd>

						<dt>志賀直哉ゆかりの部屋は見学できますか？</dt>
						<dd>はい。ただしご宿泊の方に限らせて頂いております。又、宿泊でご利用中の場合はご見学頂けません。ご了承下さい。</dd>

						<dt>門限はありますか？</dt>
						<dd>はい。通常23 ： 00 に玄関を施錠致します。ただしお出かけの方がいらっしゃる間は開けております。</dd>

						<dt>子供は宿泊可能ですか？</dt>
						<dd>
							はい。小学生以上のお子様が宿泊可能です。誠に申し訳ありませんが、未就学のお子様はご宿泊いただけません。<br> 料金は年齢に合わせて異なります。以下をご参照下さい。<br> ●10 ～ 12 歳：料金 大人一人の70％、<br> 内容：夕食（大人の食事に準じたもの）、浴衣、寝具、朝食<br> ●7 歳～ 9 歳：料金 大人一人の50％<br> 内容：夕食（お子様向けの内容）、浴衣、寝具、朝食
						</dd>

						<dt>クレジットカードは使えますか？</dt>
						<dd>
							以下の種類のクレジットカードをご利用いただけます。<br> JCB,VISA、マスターカード、アメリカンエクスプレス、ダイナース、UFJ、UC、DC、ニコス<br> ただしご利用金額が1000円以下の場合は現金でのお支払いとなります。
						</dd>

						<dt>デザイン浴衣は選べるの？</dt>
						<dd>はい。年間を通じて無料でご用意しております。女性約20種類、男性3種類からお選びいただけます。</dd>
					</dl>
					<div id="test02" style="padding: 4%;"></div>


					<dl id="sec2" class="section">
						<dt>部屋食は可能ですか？</dt>
						<dd>誠に申し訳ありませんが、お部屋食は承っておりません。お食事は全てお食事処でのご提供とさせていただきます。</dd>

						<dt>食物アレルギーなのですが食材を変更できますか？</dt>
						<dd>はい。可能な限り対応させて頂きます。ご予約時にその旨をお伝え下さいませ。</dd>

						<dt>夕食の時間は何時からですか？</dt>
						<dd>通常18 ： 00 または 18 ： 30 の開始とさせていただいております。</dd>
					</dl>
					<div id="test03" style="padding: 4%;"></div>


					<dl id="sec3" class="section">
						<dt>館内はバリアフリーですか？</dt>
						<dd>
							残念ながらバリアフリー対応ではございません。昭和初期の造りの為、階段も少し急でございます。<br> ただし、多少の段差はございますが１階にもお部屋がございますのでご予約の際にお申し出ください。可能な限り対応させて頂きます。
						</dd>

						<dt>館内でインターネットは出来ますか？</dt>
						<dd>ロビーにて無線LAN 環境をご提供しております。ただし備え付けのPC はございませんのでご自身のノートPC をお持ち下さい。</dd>
					</dl>
					<div id="test04" style="padding: 4%;"></div>

					<dl id="sec4" class="section">
						<dt>館内のお風呂について</dt>
						<dd>
							館内のお風呂も天然温泉でございます。<br> 城崎温泉は温泉資源の保護の観点から各旅館の浴槽に制限がございますので外湯に比べると小さいです。<br> 利用可能時間は6 ： 00 ～ 10 ： 00、15 ： 00 ～ 24 ： 00 です。
						</dd>
					</dl>
					<div id="test05" style="padding: 4%;"></div>

					<dl id="sec5" class="section">
						<dt>JR城崎温泉駅からはどうやって行けばよいのですか？</dt>
						<dd>
							城崎温泉では駅前の混雑を避ける為に宿毎のお迎えを控えており、その代わりに旅館組合の乗合バスが出ております。<br> 特急電車の到着に合わせて出ており、宿の名前を伝えておくと宿の前で止まって降ろしてくれます。<br> 駅前で旅館組合のスタッフが案内しています。<br> （ただし13：00～18：00間に城崎温泉駅到着の特急電車に限りますのでご注意ください）
						</dd>

						<dt>駐車場はありますか？</dt>
						<dd>はい。当館の向かい側にございます。当館玄関前の車寄せにお乗り付け下さいませ。係がご案内申し上げます。</dd>
					</dl>

					<!-- 페이징 -->
					<div class="page_list">
						<a href="javascript:;" class="btn_first"><span>처음</span></a> <a href="#" class="btn_page active">1</a> <a href="javascript:;" class="btn_last"><span>마지막</span></a>
					</div>


					<script>
						$(function() {
							var quicka = $(".contains > .lnb_tab_box > .lnb_tab_wrap > .lnb_tab_contains > .lnb_tab_menu > a");
							quicka.click(function() {
								var target = $(this).attr('href');
								$('html, body').stop().animate({
									scrollTop : $(target).offset().top
								}, 500);
							});
						});

						$(document).on(
								"click",
								".btn_tab",
								function(e) {
									$(this).addClass("active").siblings(
											".btn_tab").each(function(i, elem) {
										$(elem).removeClass("active");
									});
								});
					</script>
					<script>
						function slist() {

							f = document.sform;
							f.action = searchUrl;
							f.submit();
						}
					</script>
					<form name="sform" id="sform">
						<div class="form_table">
							<div class="search_box">
								<div class="select_box">
									<select class="select" id="subtitle" name="subtitle">
										<option value="T">제목</option>
										<option value="C">내용</option>
									</select>
									<a href="#" class="btn_select"></a>
								</div>
								<input type="text" name="searchText" id="searchText" class="input_text phone_01" value="">
								<a href="javascript:slist();" class="btn2 btn_black">검색</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>



	</div>
</div>

<!-- //컨텐츠 -->
<%@ include file="../footer.jsp"%>