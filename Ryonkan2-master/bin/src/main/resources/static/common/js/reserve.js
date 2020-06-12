var Reserv = {
	sYear : "",
	sMonth : "",
	selDays : [],
	room : {
		idx : "",
		pidx : "",
		name : "",
		amount : ""
	},
	addopt : [],
	_init : function(conf) {
		docURL._init();
		var this_s = this;
		this.aParam = docURL.selectQueryStr("sCode", "&") + "pCode=Reserv&";

		var $conf = $.extend({
			inDate : "",
			outDate : "",
			step : 1,
			rIdx : "",
			daylimit : 9
		}, conf);
		this.$conf = $conf;
		this.$wr = $(".rsv-sel-wr");
		this.$cal = $(".rsv-sel-date");

		// this.$form= $(".");

		this.step = $conf.step;

		this.initYear = $conf.sYear;
		this.initMonth = $conf.sMonth;

		$('.rsv-sel-date').bind("mouseover focus", function() {
			clearTimeout(this_s.calTimer);
			this.isOver = true;
		});
		$('.rsv-sel-date *').bind("focusin", function() {
			clearTimeout(this_s.calTimer);
			this.isOver = true;
		});

		$('.rsv-sel-date').bind("mouseout blur", function() {
			clearTimeout(this_s.calTimer);
			this.isOver = false;
			this_s.closeCalendar();
		});

		$('.chk-date').bind("focus click", function() {
			clearTimeout(this_s.calTimer);
			this.isOver = true;
			this_s.calendar(this.initYear, this.initMonth);
			this_s.openCalendar();
		});
		$('.chk-date').bind("blur", function() {
			clearTimeout(this_s.calTimer);
			this.isOver = false;
			this_s.closeCalendar();
		});

		// $('.chk-date').focusin(function() { this_s.calendar(); });

		if ($conf.inDate && $conf.outDate) {
			this.selectDate($conf.inDate, $conf.outDate);
		}

		if (this.step == 1) {

			this.calendar($conf.sYear, $conf.sMonth);
			var optionInputs = $(".rsv-sel-options input[type='text'],.rsv-sel-options select");
			optionInputs.on("change", function() {
				this_s.updateAddOptions();
			});
		}

		$("#main-rsv-date .bt-close").on("click", function() {
			clearTimeout(this_s.calTimer);
			this.isOver = false;
			$('#main-rsv-date').hide();
		});

	},
	closeCalendar : function() {
		console.log(this.isOver);
		var this_s = this;

		this.calTimer = setTimeout(function() {
			if (!this_s.isOver) {
				$('#main-rsv-date').hide();
			}
		}, 700);

		//

	},
	openCalendar : function() {
		$('#main-rsv-date').show();
		$('#main-rsv-date .rsv-sel-date').show();
	}
	// 날짜 지정
	,
	selectDate : function(fr, to) {

		// var sDate = d; var eDate = this.getDateAdd(sDate,1);
		var tmpDate = fr;
		var selDays = [];
		do {
			selDays.push(tmpDate);
			tmpDate = this.getDateAdd(tmpDate, 1);
		} while (tmpDate <= to);

		selDays.sort();

		this.selDays = selDays;

	}
	// 달력 출력
	,
	calendar : function(y, m) {
		var this_s = this;
		if (y == undefined)
			var y = this.sYear;
		if (m == undefined)
			var m = this.sMonth;

		var aURL = docURL.url;

		var aParam = this.aParam + "mode=reserv.calendar&y=" + y + "&m=" + m
				+ "&prcCode=ajax";
		$.post(aURL, aParam, function(r) {
			this_s.sYear = y;
			this_s.sMonth = m;
			this_s.$cal.html("").append(r);
			this_s.setCalendar();

			// this_s.setReservTimeSel();

		});
	}
	// 달력 클릭이벤트 셋팅
	,
	setCalendar : function() {
		var this_s = this;
		var $this = this_s.$cal;

		$(".btn-prev", $this).on("click", function() {
			this_s.calendar($(this).data("y"), $(this).data("m"));
		});
		$(".btn-next", $this).on("click", function() {
			this_s.calendar($(this).data("y"), $(this).data("m"));
		});
		$("tbody td button", $this).on(
				"click",
				function() {

					var d = ($(this).get(0).tagName == "TD") ? $(this).data(
							"date") : $($(this).parents("td").get(0)).data(
							"date");

					this_s.selectDayCell(d);

					// this_s.viewConfForm(d);

					return false;
				});
		$(".rsv-sel-date-wr .btn-reset").on("click", function() {
			this_s.resetSelectDays();

		});
		this_s.markSelectDays();

	}
	// 날짜 계산
	,
	getDateAdd : function(d, days) {
		var dateArr = d.split("-");
		var selDate = new Date(dateArr[0], parseInt(dateArr[1]) - 1,
				parseInt(dateArr[2]) + (days * 1));

		var sy = sprintf2("0000", selDate.getFullYear());
		var sm = sprintf2("00", selDate.getMonth() + 1);
		var sd = sprintf2("00", selDate.getDate());

		return sy + "-" + sm + "-" + sd;

	}
	// 기간내 날수 계산
	,
	dateDiff : function(_date1, _date2) {
		var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
		var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);

		diffDate_1 = new Date(diffDate_1.getFullYear(),
				diffDate_1.getMonth() + 1, diffDate_1.getDate());
		diffDate_2 = new Date(diffDate_2.getFullYear(),
				diffDate_2.getMonth() + 1, diffDate_2.getDate());

		var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
		diff = Math.ceil(diff / (1000 * 3600 * 24));

		return diff;
	}

	// 날짜 셀 선택
	,
	selectDayCell : function(d) {

		var $cell = $("[data-date='" + d + "']", this.$cal);

		var selDays = this.selDays;

		var sDate = d;

		if ($cell.hasClass("disabled")) {
			// alert("선택불가능한 날짜입니다");
		} else {
			// this.selectCalendarDays(sDate);
		}

		this.selectCalendarDays(sDate);

	}

	,
	selectCalendarDays : function(frDate, toDate) {

		if (this.selDays.length < 1) {
			var $cell = $("[data-date='" + frDate + "']", this.$cal);
			if ($cell.hasClass("disabled")) {
				alert("선택불가능한 날짜입니다");
			} else {
				this.selDays.push(frDate);
			}
		} else if (in_array(this.selDays, frDate)
				&& (this.selDays[0] == frDate || this.selDays[this.selDays.length - 1] == frDate)) {
			// 시작일 기준으로 구간 선택 축소
			this.selDays = remove_array(this.selDays, frDate);
		} else {
			if (in_array(this.selDays, frDate)) {
				// 선택한 날짜까지 날짜 구간 축소
				var tmpSDate = this.selDays[this.selDays.length - 1];
				var tmpEDate = frDate;

				var tmpDate = tmpSDate;

				do {
					if (in_array(this.selDays, tmpDate))
						this.selDays = remove_array(this.selDays, tmpDate);
					tmpDate = this.getDateAdd(tmpDate, -1);

				} while (tmpDate >= tmpEDate);

			} else {

				var nSelDays = this.selDays.clone();
				var orgSelDays = this.selDays;

				// 선택한 날짜까지 날짜 구간 선택
				var tmpSDate = (frDate < this.selDays[0]) ? frDate
						: this.selDays[0];
				var tmpEDate = (frDate < this.selDays[0]) ? this.selDays[0]
						: frDate;

				var tmpDate = tmpSDate;

				do {
					if (!in_array(this.selDays, tmpDate)) {
						// if(nSelDays.length < this.$conf.daylimit){
						// this.selDays.push(tmpDate); }
						nSelDays.push(tmpDate);
					}
					tmpDate = this.getDateAdd(tmpDate, 1);

				} while (tmpDate <= tmpEDate);

				// 체크인 날짜 기준으로 예약가능한 날인지 체크
				var checkDisabled = false;

				// 마지막 선택 날짜 제외한 선택 셀이 disabled 상태가 아니어야함
				for (var d = 0; d < nSelDays.length; d++) {

					var $cell = $("[data-date='" + nSelDays[d] + "']",
							this.$cal);
					if (d < (nSelDays.length - 1) && $cell.hasClass("disabled")) {
						checkDisabled = true;
						// alert("선택불가능한 날짜입니다.");
					}
				}

				if (checkDisabled) {
					alert("선택불가능한 날짜가 포함되어있습니다.");
				} else if (nSelDays.length > this.$conf.daylimit) {
					alert("예약가능한 최대 숙박일수는 " + this.$conf.daylimit + "일 입니다.");

				} else {
					this.selDays = nSelDays;

				}

			}

		}

		this.selDays.sort();

		this.markSelectDays();

	}

	,
	markSelectDays : function() {
		var this_s = this;
		// console.log(this_s.selDays);

		$("tbody td", this.$cal).removeClass("active");
		$("tbody td", this.$cal).each(function() {
			var $cell = $(this);
			var d = $(this).data("date");
			if (in_array(this_s.selDays, d) && !$cell.hasClass("other"))
				$cell.addClass("active");
		});

		var selInfo = this.getSelectInfo();

		this.printSelectInfo();

		// 침구 추가 옵션 셀렉트 폼 만들기
		this.updateSelectOptionsForm();

		// 예약가능한 객실목록 가져오기
		if (this.selDays.length > 0) {
		}
		this.getDaysRoomList();
	},
	resetSelectDays : function() {
		this.selDays = [];

		if (this.sYear != this.$conf.today.substring(0, 4)
				|| this.sMonth != this.$conf.today.substring(5, 7)) {
			this.calendar(this.$conf.today.substring(0, 4), this.$conf.today
					.substring(5, 7));
		}

		this.markSelectDays();

	}

	,
	getSelectInfo : function() {
		var sDate = this.selDays.length > 0 ? this.selDays[0] : "";
		var eDate = this.selDays.length > 1 ? this.selDays[this.selDays.length - 1]
				: "";
		var days = this.dateDiff(eDate, sDate);

		var selInfo = {
			sDate : sDate,
			eDate : eDate,
			days : days
		};
		return selInfo;

	},
	printSelectInfo : function() {
		var selInfo = this.getSelectInfo();
		var payTotalAmount = 0;
		var $wr = $(".rsv-sel-info-wr");
		var printStr = "";

		if (selInfo.sDate != "") {
			$("[name='inDate']").val(
					selInfo.sDate.replaceAll("-", ".").substring(2, 10));
		} else {
			$("[name='inDate']").val("YY.MM.DD");
		}
		if (selInfo.eDate != "") {
			$("[name='outDate']").val(
					selInfo.eDate.replaceAll("-", ".").substring(2, 10));
		} else {
			$("[name='outDate']").val("YY.MM.DD");
		}
		if (selInfo.sDate != "" && selInfo.eDate != "") {
			var selDateTxt = selInfo.sDate.replaceAll("-", ".") + " ~ "
					+ selInfo.eDate.replaceAll("-", ".") + " (" + selInfo.days
					+ "박)";

		} else if (selInfo.sDate != "" && selInfo.eDate == "") {
			var selDateTxt = selInfo.sDate.replaceAll("-", ".") + " ~ " + "";

		} else {
			var selDateTxt = "날짜를 선택하세요.";
		}
		$(".sel-date-itxt", $wr).html(selDateTxt);
		printStr = selDateTxt;

		var selRoomTxt = "";
		if (this.room.idx != "") {
			var selRoomTxt = "<span class='txt-name'>" + this.room.name
					+ "</span><span class='txt-amt'>"
					+ number_format(this.room.amount) + " 원</span>";
			payTotalAmount += (this.room.amount * 1);
		} else {
			// var selRoomTxt = "객실을 선택하세요.";
		}
		$(".sel-room-itxt", $wr).html(selRoomTxt);
		printStr = selRoomTxt;

		var selOptionTxt = "";

		if (this.addopt.length > 0) {
			var printOptionsStr = [];
			for (var i = 0; i < this.addopt.length; i++) {
				var opt = this.addopt[i];

				if (opt.num > 0) {
					printOptionsStr
							.push("<li><span class='txt-name'>"
									+ opt.name
									+ "</span><span class='txt-amt'><span class='opt-num'>"
									+ opt.num + "" + opt.num_lbl
									+ "</span> × <span class='opt-amount'>"
									+ number_format(opt.amount)
									+ " 원</span></span></li>");
					// payTotalAmount += ( opt.num * opt.amount * selInfo.days);
					payTotalAmount += (opt.num * opt.amount * 1);
				} else {
					printOptionsStr
							.push("<li><span class='txt-name'>"
									+ opt.name
									+ "</span><span class='txt-amt'><span class='opt-num'>선택안함</span></span></li>");
				}

			}
			if (printOptionsStr.length > 0) {
				selOptionTxt = "<ul>" + printOptionsStr.join("\n") + "</ul>";
			}
		} else {
			selOptionTxt = "선택안함";
		}

		$(".sel-addopt-itxt", $wr).html(selOptionTxt);

		// 쿠폰 선택 정보
		//

		// 전체 결제금액
		$(".rsv-amt-info .amt", $wr).html(number_format(payTotalAmount));

		printStr += "<div class='tot-amt-info'>"
				+ number_format(payTotalAmount);
		+"</div>";

		// $(".rsv-sel-info").html(printStr);

	}

	,
	getDaysRoomList : function(frDate, toDate) {
		var this_s = this;
		var selInfo = this.getSelectInfo();
		if (typeof (frDate) == "undefined" && typeof (toDate) == "undefined") {
			var frDate = selInfo.sDate;
			var toDate = selInfo.eDate;
		}
		if (typeof (frDate) == "undefined" != typeof (toDate) == "undefined")
			var toDate = frDate;

		var aURL = docURL.url;

		var to = $(".rsv-sel-room");

		var aParam = this.aParam + "mode=reserv.daysroom&frDate=" + frDate
				+ "&toDate=" + toDate + "&prcCode=ajax";
		if (this.room.idx)
			aParam += "&rIdx=" + this.room.idx;
		if (this.room.pidx)
			aParam += "&pIdx=" + this.room.pidx;

		if (frDate == "" && toDate == "") {

			to.html("<div class='init-txt'>예약 날짜를 선택해주시기 바랍니다.</div>");
			this.selectRoomProd("", "");
		} else {

			$
					.post(
							aURL,
							aParam,
							function(r) {
								to.html(r);

								$(".bt-view", to).on(
										"click",
										function() {
											var rmIdx = $(
													$(this).parents(".rm-item")
															.get(0)).data(
													"ridx");
											// var rmIdx =
											// $($(this).parents("li").get(0)).find("input[type='radio']").val();
											this_s.viewRoomInfo(rmIdx, true);
										});

								$(".bt-sel", to).on(
										"click",
										function() {
											var li = $(this).parents(
													".rm-prod-item").get(0);
											var rmIdx = $(li).data("ridx");
											var pIdx = $(li).data("pidx");

											// var rmIdx =
											// $($(this).parents(".rm-item").get(0)).find("input[type='radio']").val();
											this_s.selectRoomProd(rmIdx, pIdx);
										});

								if (this_s.room.idx) {

									if ($(".rsv-sel-roomlist").find(".rm-item")
											.filter(
													"#selRoom"
															+ this_s.room.idx).length > 0
											&& $(".rsv-sel-roomlist").find(
													".rm-prod-item").filter(
													"#selRoom"
															+ this_s.room.idx
															+ "-"
															+ this_s.room.pidx).length > 0) {

										this_s.selectRoomProd(this_s.room.idx,
												this_s.room.pidx);
										this_s.viewRoomInfo(this_s.room.idx);

									} else {
										this_s.selectRoomProd("", "");

									}

								}
							});
		}
	}

	,
	viewRoomInfo : function(rmIdx, toggle) {

		if (typeof (toggle) == "undefind")
			var toggle = false;

		var $li = $(".rsv-sel-roomlist").find(".rm-item").filter(
				"#selRoom" + rmIdx);

		if ($li.hasClass("is-open")) {
			if (toggle)
				$li.removeClass("is-open");
		} else {
			$li.addClass("is-open");
			$(".rsv-sel-roomlist .rm-item").not($li).removeClass("is-open");
		}

	}

	// 객실 선택
	,
	selectRoomProd : function(rmIdx, pIdx, roomdata) {

		if (typeof (pIdx) == "undefined" || pIdx == "")
			var pIdx = 0;

		if (rmIdx != "" && rmIdx > 0) {

			if (typeof (roomdata) == "undefined") {
				var $li = $(".rsv-sel-roomlist").find(".rm-item").filter(
						"#selRoom" + rmIdx).find(".rm-prod-item").filter(
						"#selRoom" + rmIdx + "-" + pIdx);

				this.room.idx = rmIdx;
				this.room.pidx = pIdx;
				this.room.name = $li.find(".prod-tit").text();
				this.room.amount = $li.data("amt");
			} else {
				this.room.idx = rmIdx;
				this.room.pidx = roomdata.pIdx;
				this.room.name = roomdata.name;
				this.room.amount = roomdata.amount;
			}

			// $(".rsv-sel-options-wr").show();
		} else {
			this.room.idx = "";
			this.room.pidx = "";
			this.room.name = "";
			this.room.amount = "";

			// $(".rsv-sel-options-wr").hide();

		}

		// 선택정보 업데이트
		this.printSelectInfo();

	}

	,
	updateSelectOptionsForm : function() {
		console.log("selInfo");
		var bed = $("[name='optBED'] option").length > 0 ? $(
				"[name='optBED'] option:selected").val() : $("[name='optBED']")
				.val();
		var selInfo = this.getSelectInfo();
		if (bed > 0 && bed == selInfo.days) {

		} else {
			$("[name='optBED']").find("option").not(":eq(0)").remove();
			if (selInfo.days > 0) {
				$("[name='optBED']").append(
						$("<option/>").val(selInfo.days).text(
								"추가함(" + selInfo.days + "박)"));
			}

			if (bed > 0) {
				$("[name='optBED'] option:eq(1)").prop("selected", true);
				this.updateAddOptions();
			}

		}

	}
	// 추가사항 입력 업데이트
	,
	updateAddOptions : function() {
		// 성인 조식
		var addopt = [];
		addopt.push({
			"code" : "BFA",
			"name" : "조식추가 (성인)",
			"num_lbl" : "장",
			num : $("[name='optBFA']").val(),
			amount : $(".opt-BFA-amt").data("amt")
		});
		addopt.push({
			"code" : "BFB",
			"name" : "조식추가 (어린이)",
			"num_lbl" : "장",
			num : $("[name='optBFB']").val(),
			amount : $(".opt-BFB-amt").data("amt")
		});
		addopt.push({
			"code" : "BED",
			"name" : "침구추가",
			"num_lbl" : "박",
			num : $("[name='optBED'] option").length > 0 ? $(
					"[name='optBED'] option:selected").val() : $(
					"[name='optBED']").val(),
			amount : $(".opt-BED-amt").data("amt")
		});
		this.addopt = addopt;

		// 선택정보 업데이트
		this.printSelectInfo();

	}

	,
	checkAgreement : function(f) {

		// var chkAgreement = $("[name^='agreement'],[name^='chk']
		// ",f).filter("[value='1']");

		// 동의 여부 선택체크
		var chkAgreement = $(".rsv-agree-chkcont", f);
		for (var i = 0; i < chkAgreement.length; i++) {
			var el = $(chkAgreement[i]);
			// var fldTitle = el.find(".c-tit02").text();
			var fldTitle = el.find("h5").length > 0 ? el.find("h5").text() : el
					.parent().prev().text();
			// 동의여부 선택 체크
			if ($("[type='radio']", el).filter(":checked").length < 1) {
				alert(fldTitle + "에 대한 동의 여부를 선택해주시기 바랍니다");
				$("[type='radio']", el).eq(0).focus();
				return false;
			} else if (el.data("chkrequired") == "1"
					&& $("[type='radio']", el).filter(":checked").val() != "1") {
				alert(fldTitle + "에 동의하지 않으시면 온라인 회원가입이 불가능합니다");
				$("[type='radio']", el).eq(0).focus();
				return false;
			}

		}

		return true;

	},
	checkGuestInfo : function() {
		var f = document.frmReserv;
		var chk = $("[name='chkusrinfo']", f).prop("checked");
		if (chk) {
			$("[name='gst_name']", f).val($("[name='rsv_name']", f).val());
			$("[name='gst_hp1']", f).val($("[name='rsv_hp1']", f).val());
			$("[name='gst_hp2']", f).val($("[name='rsv_hp2']", f).val());
			$("[name='gst_hp3']", f).val($("[name='rsv_hp3']", f).val());

		}
	},
	getReservInputForms : function(f) {
		var selInfo = this.getSelectInfo();
		var rsvName = $("[name='rsv_name']", f).val();
		var rsvHp = $("[name='rsv_hp1']", f).val() + "-"
				+ $("[name='rsv_hp2']", f).val() + "-"
				+ $("[name='rsv_hp3']", f).val();
		var rsvTel = $("[name='rsv_tel1']", f).val() + "-"
				+ $("[name='rsv_tel2']", f).val() + "-"
				+ $("[name='rsv_tel3']", f).val();
		var rsvEmail = $("[name='rsv_email1']", f).val() + "@"
				+ $("[name='rsv_email2']", f).val();
		var rsvBirth = $("[name='rsv_birth_y'] option:selected", f).val()
				+ ""
				+ sprintf2("00", $("[name='rsv_birth_m'] option:selected", f)
						.val())
				+ ""
				+ sprintf2("00", $("[name='rsv_birth_d'] option:selected", f)
						.val());

		var gstName = $("[name='gst_name']", f).val();
		var gstHp = $("[name='gst_hp1']", f).val() + "-"
				+ $("[name='gst_hp2']", f).val() + "-"
				+ $("[name='gst_hp3']", f).val();
		var gstNat = $("[name='gst_nat']", f).val();

		var rsvCard = $("[name='rsv_pay_card1']", f).val() + "-"
				+ $("[name='rsv_pay_card2']", f).val() + "-"
				+ $("[name='rsv_pay_card3']", f).val() + "-"
				+ $("[name='rsv_pay_card4']", f).val();
		var rsvCardLimit = $("[name='rsv_card_limit_m'] option:selected", f)
				.val()
				+ "/" + $("[name='rsv_card_limit_y']", f).val();

		var checkAgree = [];

		var chkAgreement = $(".rsv-agree-chkcont", f);
		for (var i = 0; i < chkAgreement.length; i++) {
			var el = $(chkAgreement[i]);
			var el = $("[type='radio']", chkAgreement[i]).filter(":checked");
			var fname = el.attr("name");
			checkAgree.push(fname.substring(3, fname.length) + ":" + el.val());
		}

		var selRsvData = {
			"inDate" : selInfo.sDate,
			"outDate" : selInfo.eDate,
			"rIdx" : this.room.idx,
			"pIdx" : this.room.pidx,
			"optBED" : $("[name='optBED'] option").length > 0 ? $(
					"[name='optBED'] option:selected").val() : $(
					"[name='optBED']").val(),
			"optBFA" : $("[name='optBFA']").val(),
			"optBFB" : $("[name='optBFB']").val(),
			"coupon" : "",
			"rsvuser" : rsvName + "|" + rsvHp + "|" + rsvTel + "|" + rsvEmail
					+ "|" + rsvBirth,
			"rsvgst" : gstName + "|" + gstHp + "|" + gstNat,
			"rsvcard" : rsvCard,
			"rsvcardlimit" : rsvCardLimit,
			"rsv_memo" : $("[name='rsv_memo']").val(),
			"chkagree" : checkAgree.join("|"),
			"cert_info" : $("[name='cert_info']").val(),

		};
		return {
			"rsvdata" : selRsvData,
			"rsvName" : rsvName,
			"rsvHp" : rsvHp,
			"rsvTel" : rsvTel,
			"rsvEmail" : rsvEmail,
			"rsvBirth" : rsvBirth,
			"gstName" : gstName,
			"gstHp" : gstHp,
			"gstNat" : gstNat
		};

	},
	submitReservForm : function(f) {
		// 날짜, 객실 선택 체크
		var selInfo = this.getSelectInfo();

		switch (this.step) {
		case 1:

			if (selInfo.sDate == "" || selInfo.eDate == "") {
				alert("예약일을 확인해주시기 바랍니다");
				// $("").focus();
				return false;

			}
			if (this.room.idx == "") {
				alert("객실을 선택해주시기 바랍니다");
				return false;
			}

			// 입력값 체크
			try {
				var bed = $.trim(($("[name='optBED'] option").length > 0 ? $(
						"[name='optBED'] option:selected").val() : $(
						"[name='optBED']").val()));
				/*
				 * if(bed!="" && parseInt(bed) > selInfo.days ){ alert("침구추가는
				 * 숙박일 이내로 입력해주시기 바랍니다."); $("[name='optBED']").focus(); return
				 * false; }
				 */

				var selRsvData = {
					"inDate" : selInfo.sDate,
					"outDate" : selInfo.eDate,
					"rIdx" : this.room.idx,
					"pIdx" : this.room.pidx,
					"optBED" : $("[name='optBED'] option").length > 0 ? $(
							"[name='optBED'] option:selected").val() : $(
							"[name='optBED']").val(),
					"optBFA" : $("[name='optBFA']").val(),
					"optBFB" : $("[name='optBFB']").val(),
				};

				this.setReservInfoData(selRsvData, f, function() {
					f.submit();
				});

			} catch (e) {
			}

			return false;
			break;
		case 2:
			var selRsvInfoData = this.getReservInputForms(f);

			// 인증 확인
			if ($("[name='cert_info']", f).length > 0) {
				if ($("[name='cert_info']", f).val() == "") {
					alert("본인인증 후 가능합니다");
					return false;
				} else {
					var certInfo = $("[name='cert_info']", f).val().split("|");
					if (certInfo[0] == "email"
							&& certInfo[1] != selRsvInfoData.rsvEmail) {
						alert("인증받은 이메일 주소가 변경되었습니다. 다시 인증해주시기 바랍니다.");
						return false;
					}
				}
			}
			// 입력,선택값 체크
			if (!FormCheck(f)) {
				return false;
			}
			if (!this.checkAgreement(f)) {
				return false;
			}

			try {

				var selRsvData = selRsvInfoData.rsvdata;

				var aURL = $(f).attr("action");
				var aParam = $.extend(docURL.strToData(this.aParam + "mode="
						+ $("[name='mode']", f).val() + "&prcCode=ajax"),
						selRsvData);

				/*
				 * var rsvinfo = aParam; for(var i in rsvinfo) {
				 * if($("[name='"+i+"']",toForm).length>0){
				 * $("[name='"+i+"']",toForm).val(rsvinfo[i]); } else $("<input
				 * type='hiddenx'
				 * />").attr("name",i).val(rsvinfo[i]).appendTo($(toForm)); }
				 */

				$alertLoading();

				$.post(aURL, aParam, function(r) {
					var rst = $.trim(r).split("|");
					if (rst[0] == "O") {
						alert(rst[1]);
						if (typeof (rst[2]) != "undefined")
							document.location.href = rst[2];
					} else {
						alert(rst[1]);
					}

					$alertLoadingClose();

					// payForm.append(r.

				}).fail(function(r) {
					alert("예약 실패" + r.responseText);
					$alertLoadingClose();
				});

				/*
				 * this.setReservInfoData(selRsvData,f, function(){
				 * //f.target="_blank"; f.submit();
				 * 
				 * });
				 */
			} catch (e) {
				console.log(e);
				return false;
			}

			return false;

			break;

		}

		return false;

	}
	// 선택정보 세션에 담기
	,
	setReservInfoData : function(reqData, frm, func) {
		var aURL = docURL.url;
		var aParam = $.extend(docURL.strToData(this.aParam
				+ "mode=reserv.setinfo"), reqData);

		var aParamEnc = this.encodeReservData(aParam);
		console.log(aParam);

		// var toForm = getFormObject();
		var toForm = $(frm);

		$.post(
				aURL,
				aParamEnc,
				function(r) {
					console.log(r);
					if (r.err) {
						alert(r.msg);
					} else {
						var rsvinfo = r.rsvdata;
						for ( var i in rsvinfo) {
							if ($("[name='" + i + "']", toForm).length > 0) {
								if (i == "optBED") {
									$("[name='" + i + "'] option", toForm)
											.filter(
													"[value='" + rsvinfo[i]
															+ "']").prop(
													"selected", true);
								} else {
									$("[name='" + i + "']", toForm).val(
											rsvinfo[i]);
								}
							} else
								$("<input type='hidden' />").attr("name", i)
										.val(rsvinfo[i]).appendTo($(toForm));
						}

						try {
							func();
						} catch (e) {
							console.log(e);
						}

					}

					// payForm.append(r.

				}, "json").fail(function(r) {
			alert("선택정보 처리 오류" + r.responseText);
		});

	}

	,
	encodeReservData : function(dt) {
		var ikey = $("[name='ikey']").val();
		var encData = {};

		for ( var ii in dt) {
			try {
				// console.log(ii+":"+typeof(dt[ii]));
				// if(typeof(dt[ii]);
				encData[ii] = (dt[ii] == "" && typeof (dt[ii]) != "undefined") ? dt[ii]
						: Aes.Ctr.encrypt(dt[ii], ikey, 256)
			} catch (e) {
				encData[ii] = dt[ii];
				// console.log("ERR" + ii+":"+typeof(dt[ii]));
				// alert("!!!"+e);
			}

		}
		return encData;

	}

	,
	scrollEndFunc : function() {

		var scrTop = $(window).scrollTop();

		var $wr = $(".rsv-sel-info-wr");
		var $p = $(".rsv-wr");// $wr.parent();

		if ($p.offset().top < scrTop) {
			var toTop = scrTop - $p.offset().top + 60;
		} else {
			var toTop = 0;
		}
		var limitTop = ($p.outerHeight() - $wr.outerHeight());
		if (toTop > limitTop) {
			toTop = limitTop;
		}

		$wr.stop().animate({
			"top" : toTop
		});
	}

	,
	checkEmailCert : function() {
		var this_s = this;
		var f = document.frmReserv;
		var selRsvInfoData = this.getReservInputForms(f);
		docURL._init();
		var aURL = docURL.url;
		var aParam = $.extend(docURL.strToData(this.aParam
				+ "mode=reserv.certchk&prcCode=ajax&email="
				+ selRsvInfoData.rsvEmail), selRsvInfoData.rsvdata);
		$.post(aURL, aParam, function(r) {

			if (r.err) {
				alert(r.msg);
			} else {
				$("[name='cert_info']", f).val(r.rstdata);

				this_s.certEmailResult();

			}

			// payForm.append(r.

		}, "json").fail(function(r) {
			alert("메일인증 확인 오류" + r.responseText);
		});

	},
	certEmailResult : function() {
		try {
			closeLayer(this.certReqWin);
		} catch (e) {
			console.log(e);
		}
		var this_s = this;

		// $(".rsv-usr-cert").html("인증완료");

		// this.submitReservForm(document.frmReserv);

	}

	,
	certReq : function(ctype) {

		if (ctype == "email") {
			var f = document.frmReserv;
			// 이메일인증
			var rsvEmail = $("[name='rsv_email1']", f).val() + "@"
					+ $("[name='rsv_email2']", f).val();
			if ($("[name='rsv_email1']", f).val() == ""
					|| $("[name='rsv_email2']", f).val() == "") {
				alert("예약자 이메일 주소를 입력하시기 바랍니다");
				return false;
			}
			var selRsvInfoData = this.getReservInputForms(f);
			docURL._init();
			var aURL = docURL.url;
			var aParam = $.extend(docURL.strToData(this.aParam
					+ "mode=reserv.certreq&email=" + selRsvInfoData.rsvEmail),
					selRsvInfoData.rsvdata);

			$("[name='cert_info']", f).val("");

			this.certReqWin = openLayerPageNew(null, aURL + "?"
					+ docURL.dataToQuseryStr(aParam), 460, 300, "이메일인증", {
				back_click_close : false,
				parameter : aParam
			});

		} else {
			// 휴대폰 본인인증
		}

	}

}

/* //////////////////////////////////////예약관리////////////////////////////////// */
var ReservApply = {
	_init : function(conf) {
		docURL._init();
		var this_s = this;
		this.aParam = docURL.selectQueryStr("sCode,pCode", "&");

		var $conf = $.extend({
			inDate : "",
			outDate : "",
			step : 1,
			rIdx : "",
			daylimit : 9
		}, conf);
		this.$conf = $conf;
	},
	print : function(aIdx) {
		docURL._init();

		var aURL = docURL.url;
		var param = "";
		var acTitle = "예약현황 출력";
		param = docURL.selectQueryStr("sCode,pCode", "&")
				+ "prcCode=ajax&mode=reserv.print&aIdx=" + aIdx;

		if (confirm("출력하시겠습니까?")) {

			var f = submitPostForm("reservApplyPrint", aURL, param, false);
			var w = window.open("", "reservApplyPrint",
					"width=900,height=980,scrollbars=yes");
			$(f).attr("target", "reservApplyPrint");
			f.submit();

		}

	},
	viewData : function(aIdx) {
		docURL._init();
		try {
			var aURL = docURL.url;
			var aParam = docURL.selectQueryStr("sCode,pCode", "&")
					+ "mode=reserv.view&aIdx=" + aIdx;
			openLayerPage(aURL + "?" + aParam + "&prcCode=ajax", 740, 890,
					"상세 예약현황", {
						// show_title:false,
						reload_button_yn : false,
						minmaxsize_button_yn : false,
						back_click_close : false,
						parameter : aParam
					});
		} catch (e) {
			alert(e);
		}

		return false;
	},
	cancelData : function(idx) {
		docURL._init();
		try {
			var aURL = docURL.url;
			var aParam = docURL.selectQueryStr("sCode,pCode", "&")
					+ "mode=reserv.cancelchk&aIdx=" + idx;
			openLayerPage(aURL + "?" + aParam + "&prcCode=ajax", 540, 400,
					"예약취소", {
						// show_title:false,
						reload_button_yn : false,
						minmaxsize_button_yn : false,
						back_click_close : false,
						parameter : aParam
					});
		} catch (e) {
			alert(e);
		}

		return false;
	},
	cancelFormSubmit : function(f) {
		var aURL = docURL.url;
		var aParam = docURL.selectQueryStr("sCode,pCode", "&")
				+ "mode=reserv.cancelchk&prcCode=ajax&aIdx=" + idx;
		if (confirm("예약을 취소하시겠습니까?")) {
			$alertLoading();
			$.post(aURL, aParam, function(r) {
				var rst = $.trim(r).split("|");
				if (typeof (rst[1]) != "undefined") {
					alert(rst[1]);
				}
				if (rst[0] == "O") {
					document.location.reload();
				}

			}).complete(function() {
				$alertLoadingClose();
			});
		}

	}

}
