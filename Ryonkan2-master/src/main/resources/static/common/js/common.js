$(function() {
    page.init();
});

var page = {
    init: function() {		
		//공통
        page.common();
        
        //페이지 에니메이션
        page.animate();
        
        //메인 페이지
        page.main();
        
        //서브 페이지
        page.sub();
        
        //팝업
        page.popup();        
        
    },
    common: function() {
				
        //헤더 gnb
        var header = $("#header");
        var headerGnb = $("#gnb");
        var headerTop = $("#header .header_top");
        var headerInterval = null;
        var headerBottom = $("#header .header_bottom").hover(
            function() {
                if(!headerTop.is(":visible")) return;
                clearTimeout(headerInterval);
                headerInterval = setTimeout(function() {
                    headerGnb.stop(true,true).animate({ height:400 }, 300);
                    headerBottom.stop(true,true).addClass("hover").animate({ height:400 }, 300, function() {
                        headerBottom.addClass("hover");
                    });
                }, 100);
            },
            function() {
                if(!headerTop.is(":visible")) return;
                clearTimeout(headerInterval);
                headerInterval = setTimeout(function() {
                    headerGnb.stop(true,true).animate({ height:69 }, 300);
                    headerBottom.stop(true,true).animate({ height:69 }, 300, function() {
                        headerBottom.removeClass("hover");
                    });
                }, 100);
            }
        );
        $("#gnb .menu").hover(
            function() {
                if(!headerTop.is(":visible")) return;
                $(this).addClass("active");
            },
            function() {
                if(!headerTop.is(":visible")) return;
                $(this).removeClass("active");
            }
        );
        $("#gnb").on("focusin", function() {
            if(!headerTop.is(":visible")) return;
            headerGnb.stop(true,true).height(400);
            headerBottom.stop(true,true).height(400);
        }).on("focusout", function() {
            if(!headerTop.is(":visible")) return;
            headerGnb.stop(true,true).height(69);
            headerBottom.stop(true,true).height(69);
        });
        
        //모바일 gnb
        headerGnb.find(".icon").on("click", function() {
            var getMenu = $(this).parent();
            if(getMenu.hasClass("active")) {
                getMenu.removeClass("active").find(".sub_menu").stop(true,true).slideUp(300);
            }
            else {
                headerGnb.find(".menu.active").removeClass("active").find(".sub_menu").stop(true,true).slideUp(300);
                getMenu.addClass("active").find(".sub_menu").stop(true,true).slideDown(300);
            }
            return false;
        });
        var gnbArea = $("#header .gnb_area");
        var gnbRight = $("#header .gnb_right");
        $("#btn_mobile_gnb").on("click", function() {
            gnbArea.stop(true,true).fadeIn(300, function() {
                $("body").addClass("popup_mobile");
				$('.bxslider_right').bxSlider({
                    mode: 'fade',
                    dots:false,
                    captions: true
                  });
            });
            gnbRight.stop(true,true).animate({ right:0 }, 300);
            return false;
        });
        gnbArea.find(".btn_close").on("click", function() {
            gnbArea.stop(true,true).fadeOut(300);
            gnbRight.stop(true,true).animate({ right:-420 }, 300);
            $("body").removeClass("popup_mobile");
			$(".header_bottom .lang_menu").stop(true,true).animate({ top:-9999 }, 10);
            return false;
        });
        gnbArea.on("click", function(e) {
            if($(e.target).hasClass("gnb_area")) {
                gnbArea.stop(true,true).fadeOut(300);
                gnbRight.stop(true,true).animate({ right:-420 }, 300);
				$(".header_bottom .lang_menu").stop(true,true).animate({ top:-9999 }, 10);
                $("body").removeClass("popup_mobile");
                return false;
            }
        });
		
		var topBanner = $("#top_banner");
        var topHeader = $("#header");
        
        var gnbResizeInterval = null;
        function gnbResize() {
            clearTimeout(gnbResizeInterval);
            gnbResizeInterval = setTimeout(function() {
                var getGnbHeight = $(window).height();
                gnbArea.height(getGnbHeight + 2);
            }, 10);
        }
        
        $(window).on("resize", function() {
            gnbResize();
            //bannerHeaderResize();
        });
        gnbResize();
        //bannerHeaderResize();
        
        //퀵메뉴
        var content = $("#content");
        var quickMenu = $("#quick_menu").css("top", content.offset().top + 44);
        
        var quickMobile = $("#quick_mobile");
        var quickMobileBtn = quickMobile.find(".btn_quick").on("click", function() {
            if($(this).hasClass("active")) {
                $(this).removeClass("active");
                quickMobile.stop(true,true).animate({ bottom:-90 }, 200);
            }
            else {
                $(this).addClass("active");
                quickMobile.stop(true,true).animate({ bottom:0 }, 200);
            }
            return false;
        });
        
        var pageTop = $("#page_top").on("click", function() {
            $("html,body").stop(true,true).animate({ scrollTop:0 }, 300);
            return false;
        });
        
        var viewport = $("#viewport");
        var mobileScrollInterval = null;
        function quickMenuScroll() {
            var getScrollTop = $(window).scrollTop();
            var getPageTop = content.offset().top;
            var getFooterTop = $("#footer").offset().top;
            
            clearTimeout(mobileScrollInterval);
            mobileScrollInterval = setTimeout(function() {
                if(getScrollTop > 10) {
                    if(!header.hasClass("scroll")) {
                        header.addClass("scroll");
                        setTimeout(function() {
                            header.addClass("active");
                        }, 1);
                    }
                }
                else {
                    if(header.hasClass("scroll")) {
                        header.removeClass("active");
                        setTimeout(function() {
                            header.removeClass("scroll");
                        }, 1);
                    }
                }
            }, 10);
            
            if(getScrollTop > getPageTop - 70) {
                quickMenu.addClass("fixed");
            }
            else {
                quickMenu.removeClass("fixed");
            }
            
            if(getScrollTop > 100) {
                pageTop.addClass("active");
            }
            else {
                pageTop.removeClass("active");
            }
            
            var getPageHeight = getScrollTop + $(window).height();
            if(getPageHeight > getFooterTop) {
                var getFooterMargin = getPageHeight - getFooterTop;
                pageTop.css("margin-bottom", getFooterMargin);
                quickMobileBtn.css("margin-top", "-" + getFooterMargin + "px");
            }
            else {
                pageTop.css("margin-bottom",0);
                quickMobileBtn.css("margin-top",0);
            }
			
			//헤더 스크롤
            var headerTopPos = $("#header").offset().top + ($("#header .header_top:visible").length > 0 ? $("#header .header_top:visible").height() : 0);
            if(getScrollTop > headerTopPos) {
                //viewport.removeClass("trans");
                headerBottom.addClass("fixed");
            }
            else {
                //viewport.addClass("trans");
                headerBottom.removeClass("fixed");
            }
            
            //var getTopBannerHeight = topBanner.is(":visible") ? topBanner.height() : 0;
            //var getTopMargin = 0;
            //if(getTopBannerHeight > 0 && getTopBannerHeight > getScrollTop) {
                //getTopMargin = getTopBannerHeight - getScrollTop;
            //}
            //topHeader.css("top", getTopMargin);
        }
        $(window).on("scroll touchmove", function() {
            quickMenuScroll();
        });
        quickMenuScroll();
        
        //푸터 페밀리
        var footerFamily = $("#footer .drop_family");
        var footerFamilyDrop = $("#footer .drop_list");
        $("#footer .drop_family .btn_family").on("click", function() {
            footerFamily.toggleClass("active");
            footerFamilyDrop.stop(true,true).slideToggle(300);
            return false;
        });
		
		$(".select_box:not(.on)").each(function() {
            var getSelectBox = $(this);
            var getValue = $(this).find(".btn_select");
            var getSelect = $(this).find(".select");
            var getSelectList = $("<ul class='select_list'></ul>");
            getSelect.find("option").each(function() {
                getSelectList.append("<li><a href='#' data-value='" + $(this).attr("value") + "'>" + $(this).text() + "</a></li>");
            });
            getSelectBox.append(getSelectList);
            getSelectBox.addClass("on").find(".select").on("change", function() {
                getValue.html(getSelect.find("option:selected").text());
                if(getSelect.hasClass("select_email")) {
                    if(this.value == "") {
                        getSelect.closest(".email_box").find(".input_email").prop("readonly",false).val("").focus();
                    }
                    else {
                        getSelect.closest(".email_box").find(".input_email").prop("readonly",true).val(this.value);
                    }
                }
            });
            getValue.html(getSelect.find("option:selected").text());
            
            getValue.on("click", function() {
                if(getSelectBox.hasClass("active")) {
                    getSelectBox.removeClass("active");
                }
                else {
                    $(".select_box.active").removeClass("active");
                    getSelectBox.addClass("active");
                }
                return false;
            });
            getSelectList.find("a").on("click", function() {
                getSelectBox.removeClass("active");
                getSelect.val($(this).data("value")).trigger("change");
                return false;
            });
        });
		
		$(".select_box:not(.on)").each(function() {
            var getValue = $(this).find(".btn_select");
            var getSelect = $(this).find(".select");
            $(this).addClass("on").find(".select").on("change", function() {
                getValue.html(getSelect.find("option:selected").text());
                if(getSelect.hasClass("select_email")) {
                    if(this.value == "") {
                        getSelect.closest(".email_box").find(".input_email").prop("readonly",false).val("").focus();
                    }
                    else {
                        getSelect.closest(".email_box").find(".input_email").prop("readonly",true).val(this.value);
                    }
                }
            });
            getValue.html(getSelect.find("option:selected").text());
        });
        
        $(".check_box:not(.on)").each(function() {
            var getCheck = $(this).addClass("on").find(".check").on("change", function() {
                if(this.checked) {
                    $(this).parent().addClass("active");
                }
                else {
                    $(this).parent().removeClass("active");
                }
            });
            if(getCheck.is(":checked")) {
                $(this).addClass("active");
            }
        });
        
        $(".radio_box:not(.on)").each(function() {
            var getCheck = $(this).addClass("on").find(".radio").on("change", function() {
                $(this).closest(".radio_area").find(".active").removeClass("active");
                if(this.checked) {
                    $(this).parent().addClass("active");
                }
            });
            if(getCheck.is(":checked")) {
                $(this).addClass("active");
            }
        });
		
		$(".main_visual .bg_cover").each(function() {
			$(this).css("backgroundImage","url(" + $(this).children(".bg").attr("src") + ")");
		});		
		
		if($(".main_visual").length == 0) return;
        

/*    	var mainSlideOpt = {
	            autoplay:true,            
	            speed:500,
	            autoplaySpeed:5000,
	            prevArrow:"#main_visual .btn_slide.prev",
	            nextArrow:"#main_visual .btn_slide.next",
	            dots:true,
	            dotsClass:"slide_thumb"
	        }   */     	
    	


    			mainSlideOpt = {
    		            autoplay:true,            
    		            speed:500,
    		            autoplaySpeed:5000,
    		            prevArrow:".main_visual .btn_slide.prev",
    		            nextArrow:".main_visual .btn_slide.next",
    		            dots:true,
    		            dotsClass:"slide_thumb"
    		        }


    		

        
        if($("#viewport.main").length > 0) {
            mainSlideOpt.autoplay = false;
            //메인 슬라이드
            var videoObject = [];
            var videoIdx = -1;
            var slideInterval = null;
            var slideDelay = 4000;  //다음 슬라이드 딜레이 
            function mainVideo(target, idx) {
                clearTimeout(slideInterval);
                if(videoIdx > -1 && videoObject[videoIdx] != undefined) {
                    videoObject[videoIdx].data('ytPlayer').player.stopVideo();
                }
                var checkMobile = $(".main_visual .list_box .img_box.mobile").eq(0).is(":visible");
                
                
                
                if($(target).hasClass("slide_video") && checkMobile === false) {
                    //영상 
                    if(videoObject[idx] == undefined) {
                        var getVideoID = $(target).find(".video_box").data("video");
                        videoIdx = idx;
                        videoObject[idx] = $(target).find(".video_box").YTPlayer({
                            fitToBackground: true,
                            videoId:getVideoID,
                            mute:true, //소리
                            repeat:false,   //반복
                            playerVars: {
                                modestbranding: 0,
                                autoplay: 1,
                                controls: 1,
                                showinfo: 0,
                                branding: 0,
                                rel: 0,
                                autohide: 0
                            },
                            callback: function() {
                                videoObject[idx].data('ytPlayer').player.addEventListener("onStateChange", function(state){
                                    if(state.data === 1) {
                                        $(videoObject[idx]).addClass("play");
                                    }
                                    else if(state.data === 0) {
                                        //영상 재생 끝
                                        $(".main_visual .visual_slide").slick("slickNext");
                                    }
                                });
                            }
                        });
                    }
                    else if(videoObject[idx] != undefined) {
                        $(videoObject[idx]).removeClass("play");
                        videoObject[idx].data('ytPlayer').player.playVideo();
                    }
                }
                else {
                    //이미지 
                    slideInterval = setTimeout(function() {
                        $(".main_visual .visual_slide").slick("slickNext");
                    }, slideDelay);
                }
            }
            $(".main_visual").on("mouseenter", ".list_box:not(.slide_video)", function() {
                clearTimeout(slideInterval);
            }).on("mouseleave", ".list_box:not(.slide_video)", function() {
                slideInterval = setTimeout(function() {
                    $(".main_visual .visual_slide").slick("slickNext");
                }, slideDelay - 1000);
            });
            
            $(".main_visual .visual_slide").on("init", function(event, slick) {
                var getSlide = $(slick.$slides.get(0));
                mainVideo(getSlide,0);
            }).on("beforeChange", function(event, slick, currentSlide, nextSlide){
                var getSlide = $(slick.$slides.get(nextSlide));
                mainVideo(getSlide,nextSlide);
            });
        }
       
        var mainVisual = $(".main_visual");
        var mainVisualSlide = $(".main_visual .visual_slide").slick(mainSlideOpt);
    	
    	
        
        var mainNewSlide = $(".main_news .news_slide").slick({
            speed:500,
            touchThreshold:10000,
            prevArrow:".main_news .btn_slide.prev",
            nextArrow:".main_news .btn_slide.next",
            dots:false,
            slidesToShow:3,
            slidesToScroll:1,
            responsive: [
                {
                    breakpoint:780,
                    settings: {
                        dots:true,
                        dotsClass:"slide_thumb",
                        slidesToShow:1,
                        slidesToScroll:1
                    }
                }
            ]
        });
		
		var mainNewSlide2 = $(".main_news2 .news_slide").slick({
            speed:500,
            touchThreshold:10000,
            prevArrow:".main_news2 .btn_slide.prev",
            nextArrow:".main_news2 .btn_slide.next",
            dots:false,
            slidesToShow:4,
            slidesToScroll:1,
            responsive: [
                {
                    breakpoint:780,
                    settings: {
                        dots:true,
                        dotsClass:"slide_thumb",
                        slidesToShow:2,
                        slidesToScroll:1
                    }
                }
            ]
        });
		
		//인터뷰 슬라이드
        var interviewVisual = $("#interview_visual");
        var interviewVisualSlide = $("#interview_visual .visual_slide").slick({
            autoplay:true,            
            speed:500,
			autoplaySpeed:4000,
            prevArrow:"#interview_visual .btn_slide.prev",
            nextArrow:"#interview_visual .btn_slide.next",
            dots:true,
            dotsClass:"slide_thumb"
        });
		
		//brand 슬라이드
        var brandVisual = $("#brand_visual");
        var brandVisualSlide = $("#brand_visual .visual_slide").slick({            
			autoplay:true,            
            speed:500,
			autoplaySpeed:4000,
            prevArrow:"#brand_visual .btn_slide.prev",
            nextArrow:"#brand_visual .btn_slide.next",
            dots:true,
			fade : true,
            dotsClass:"slide_thumb"
        });
		
		
    },
    animate: function() {
        var getAnimate = $(".page_animate");
        if(getAnimate.length > 0) {
            var animateInterval = null;
            var mainNumberObj = $("#main_number");
            function animateScroll() {
                clearTimeout(animateInterval);
                animateInterval = setTimeout(function() {
                    var getScroll = $(window).scrollTop();
                    var getScrollTop = getScroll + $(window).height();
                    var animateIdx = 0;
                    $(".page_animate").each(function() {
                        var getObj = $(this);
                        var getTop = getObj.offset().top;
                        //var getHeight = getObj.height();
                        if(getScrollTop > getTop) {
                            if(!getObj.hasClass("animate")) {
                                animateIdx += 1;
                                var getAnimateIdx = animateIdx;
                                setTimeout(function() {
                                    getObj.addClass("animate");
                                    if(getObj.hasClass("number_box")) {
                                        var getNumber = parseInt(mainNumberObj.data("value"), 10);
                                        mainNumberObj.html("").prop("count",0).stop(true,true).delay(animateIdx * 100).animate({
                                            count:getNumber
                                        }, {
                                            duration: 4000,
                                            easing:"easeOutExpo",
                                            step: function (now) {
                                                var getStep = Math.ceil(now);
                                                getStep = getStep.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                                $(this).text(getStep);
                                            }
                                        });
                                    }
                                }, getAnimateIdx * 100);
                            }
                        }
                        else {
                            getObj.removeClass("animate");
                        }
                    });
                    
                }, 10);
            }
            $(window).on("scroll resize", function() {
                animateScroll();
            });
            animateScroll();
        }
    },
    main: function() {
        
        
        var mainServiceSlide = $(".main_service .service_slide").slick({
            //infinite:false,
            //waitForAnimate:false,
			autoplay:true,   
            speed:500,
            touchThreshold:99999,
            prevArrow:".main_service .btn_slide.prev",
            nextArrow:".main_service .btn_slide.next",
            dots:false,
            slidesToShow:4,
            slidesToScroll:1,
            responsive: [
                {
                    breakpoint:1200,
                    settings: {
                        slidesToShow:3,
                        slidesToScroll:1
                    }
                }, {
                    breakpoint:900,
                    settings: {
                        slidesToShow:2,
                        slidesToScroll:1
                    }
                }, {
                    breakpoint:780,
                    settings: {
                        dots:true,
                        dotsClass:"slide_thumb",
                        slidesToShow:2,
                        slidesToScroll:1
                    }
                }
            ]
        });
        
        var mainDesignSlide = $(".main_design .design_slide").slick({
            waitForAnimate:false,
			speed:500,
			touchThreshold:10000,
            prevArrow:".main_design .btn_slide.prev",
            nextArrow:".main_design .btn_slide.next",
            dots:false,
            responsive: [
                {
                    breakpoint:780,
                    settings: {
                        dots:true,
                        dotsClass:"slide_thumb",
                        slidesToShow:1,
                        slidesToScroll:1
                    }
                }
            ]
        });
        
        var mainYanoljaSlide = $(".main_yanolja .yanolja_slide").slick({
            waitForAnimate:false,
			speed:500,
			touchThreshold:10000,
            prevArrow:".main_yanolja .btn_slide.prev",
            nextArrow:".main_yanolja .btn_slide.next",
            dots:false
        });
        
        //페이지 상단 스크롤
        var mobileCheck = $("#btn_mobile_gnb");
        var mainPageDown = $(".main_visual .btn_page_down").on("click", function() {
            var getPageBottom = mainSolution.offset().top;
            $("html,body").stop(true,true).animate({ scrollTop:getPageBottom - 65 }, 300);
            return false;
        });
        var mainSolution = $(".main_brand");
        function pageDownScroll() {
            if(mobileCheck.is(":visible")) {
                var getScrollTop = $(window).scrollTop();
                if(getScrollTop > 100) {
                    mainPageDown.addClass("hide");
                }
                else {
                    mainPageDown.removeClass("hide");
                }
            }
        }
        $(window).on("scroll touchmove", function() {
            pageDownScroll();
        });
        pageDownScroll();
        
        var mainInterval = null;
        var mainSolutionSlide = null;
        var mainVisualCheck = $("#viewport.main").length > 0;
        function mainResize(type) {
            clearTimeout(mainInterval);
            mainInterval = setTimeout(function() {
                
                if(mainVisualCheck === true) {
                    var getWinHeight = $(window).height() - $("#top_banner:visible").height() - $("#header .header_top:visible").height();
                    //$("#main_visual").height(getWinHeight); //높이100%
                }
                
                if(mainSolutionSlide != null) {
                    mainSolutionSlide.slick("unslick");
                }
                    
                if(mobileCheck.is(":visible")) {
                    //mobile
                    mainSolutionSlide = $("#main_solution .solution_list").slick({
                        waitForAnimate:false,
						speed:500,
                        touchThreshold:10000,
                        // prevArrow:"#main_solution .btn_slide.prev",
                        // nextArrow:"#main_solution .btn_slide.next",
                        arrows:false,
                        dots:true,
                        dotsClass:"slide_thumb",
                        centerMode:true,
                        slidesToShow:3,
                        slidesToScroll:1
                    });
                }
                else {
                    //pc
                }
            }, type === true ? 0 : 100);
        }
        $(window).on("resize", function() {
            mainResize(false);
        });
        mainResize(true);
		
		//탑 배너
        var btnTopClose = $("#topbclose").on(".btn_close").on("click", function() {
            clearTimeout(topInterval);
            $("#top_banner").stop(true,true).slideUp(200, function() {
                $("#quick_menu").css("top", $("#content").offset().top + 44);
                $("#header").css("top","auto");
                mainResize(true);
            });
            return false;
        });
        var topInterval = setTimeout(function() {
            if(!mobileCheck.is(":visible")) {
                btnTopClose.trigger("click");
            }
        }, 10000);
        
        
        //플로팅 원형 배너
        $("#circle_banner .btn_close").on("click", function() {
            $("#circle_banner").stop(true,true).fadeOut(200);
            return false;
        });
		
		
		
		$(".popup_window .btn_close").on("click", function() {
            $(this).closest(".popup_window").stop(true,true).fadeOut(300);
            $("#popup_mask").stop(true,true).fadeOut(300);
            $("body").removeClass("popup");
            return false;
        });
        $("#popup_mask").on("click", function(e) {
            if($(e.target).attr("id") == "popup_mask") {
                $(".popup_window:visible").stop(true,true).fadeOut(300);
                $("#popup_mask").stop(true,true).fadeOut(300);
                $("body").removeClass("popup");
            }
        });
        
		$(".select_box:not(.on)").each(function() {
            var getSelectBox = $(this);
            var getValue = $(this).find(".btn_select");
            var getSelect = $(this).find(".select");
            var getSelectList = $("<ul class='select_list'></ul>");
            getSelect.find("option").each(function() {
                getSelectList.append("<li><a href='#' data-value='" + $(this).attr("value") + "'>" + $(this).text() + "</a></li>");
            });
            getSelectBox.append(getSelectList);
            getSelectBox.addClass("on").find(".select").on("change", function() {
                getValue.html(getSelect.find("option:selected").text());
                if(getSelect.hasClass("select_email")) {
                    if(this.value == "") {
                        getSelect.closest(".email_box").find(".input_email").prop("readonly",false).val("").focus();
                    }
                    else {
                        getSelect.closest(".email_box").find(".input_email").prop("readonly",true).val(this.value);
                    }
                }
            });
            getValue.html(getSelect.find("option:selected").text());
            
            getValue.on("click", function() {
                if(getSelectBox.hasClass("active")) {
                    getSelectBox.removeClass("active");
                }
                else {
                    $(".select_box.active").removeClass("active");
                    getSelectBox.addClass("active");
                }
                return false;
            });
            getSelectList.find("a").on("click", function() {
                getSelectBox.removeClass("active");
                getSelect.val($(this).data("value")).trigger("change");
                return false;
            });
        });
		
    },
    sub: function() {
        //서브 타이틀 위치이동
        if($(".partner_top .partner_title").length > 0) {
            $("#viewport").addClass("move_title");
            $("#header .header_bottom .gnb_box > .contains").append($(".partner_top .partner_title").clone());
        }
        if($(".main_visual").length > 0) {
            $("#viewport").addClass("sub_visual");
        }
		
		
    
        //lnb 스크롤 탭
        if($(".sub .lnb_tab_menu").length > 0) {
            $(".sub .lnb_tab_menu").wrap("<div class='lnb_tab_wrap'><div class='lnb_tab_contains'></div></div>");
            
            var lnbTabBox = $(".sub .lnb_tab_box");
            if($(".main_visual").length > 0) {
                $("<div class='contains'><div class='lnb_tab_box mobile'>" + lnbTabBox.html() + "</div></div>").insertAfter($(".main_visual"));
                lnbTabBox.addClass("pc");
            }
            else {
                lnbTabBox.addClass("show");
            }
			
			//lnb 스크롤
			var getLnbTab = $(".lnb_tab_box:visible .btn_tab.active");
            if(getLnbTab.length > 0) {
                var getLnbLeft = getLnbTab.position().left;
                if($(".lnb_tab_box:visible .lnb_tab_menu").width() < getLnbLeft + getLnbTab.width()) {
                    $(".lnb_tab_menu").scrollLeft(getLnbLeft + getLnbTab.width());
                }
                else if(getLnbLeft < 0 || $(".lnb_tab_box:visible .lnb_tab_menu").width() < getLnbLeft) {
                    $(".lnb_tab_menu").scrollLeft(getLnbLeft);
                }
            };
            
            
            var lnbTabHeader = $("#header .header_bottom .gnb_box");
            
            var lnbTabPanel = $("#content .sub_panel");
            var lnbTabCheck = $(".lnb_tab_panel").length > 0;
            $("body").on("click", ".lnb_tab_panel .btn_tab", function() {
                var getIdx = $(this).index();
                var getTopHeight = lnbTabBox.height() + lnbTabHeader.height() - 40;
                $("html,body").stop(true,true).animate({ scrollTop:lnbTabPanel.eq(getIdx).offset().top - getTopHeight }, 200);
                return false;
            });
            
            var lnbTabInterval = null;
            function lnbTabScroll() {
                lnbTabInterval = setTimeout(function() {
                    var getScrollTop = $(window).scrollTop();
                    var getLnbHeight = $(window).width() > 780 ? 69 : 79;
                    var lnbTabTop = $(".lnb_tab_box:visible").offset().top - getLnbHeight - 2;
                    
                    
                    if(lnbTabCheck === true) {
                        var lnbTabIdx = 0;
                        lnbTabPanel.each(function(key, value) {
                            if($(value).offset().top - 110 < getScrollTop) {
                                lnbTabIdx = key;
                            }
                        });
                        var getLnbTab = $(".lnb_tab_box:visible .lnb_tab_panel .btn_tab").removeClass("active").eq(lnbTabIdx).addClass("active");
                        if(getLnbTab.length > 0) {
                            var getLnbLeft = getLnbTab.position().left;
                            if(getLnbLeft < 0 || $(".lnb_tab_box:visible .lnb_tab_menu").width() < getLnbLeft) {
                                $(".lnb_tab_menu").scrollLeft(getLnbLeft);
                            }
                        }
                    }
                }, 10);
            }
            
            $(window).on("scroll", function() {
                lnbTabScroll();
            });
            lnbTabScroll();
            setTimeout(function() {
                lnbTabScroll();
            }, 1000);
            
            if($(".sub_company").length > 0) {
                $("#gnb li").eq(0).find("a").on("click", function() {
                    var gnbIdx = $(this).closest("li").index();
                    $(".lnb_tab_menu:visible a").eq(gnbIdx).trigger("click");
                    if($("#btn_mobile_gnb").is(":visible")) {
                        $("#header .gnb_area:visible .btn_close").trigger("click");
                    }
                    return false;
                });
                $("#quick_web .btn_menu.quick5").on("click", function() {
                    $(".lnb_tab_menu:visible a").eq(4).trigger("click");
                    return false;
                });
                $("#header .top_menu li:eq(1) a").on("click", function() {
                    $(".lnb_tab_menu:visible a").eq(4).trigger("click");
                    return false;
                });
                var getIdx = parseInt(sub_part.replace("a", ""), 10);
                if(!isNaN(getIdx) && getIdx > 1) {
                    var getTopHeight = lnbTabBox.height() + lnbTabHeader.height() - 40;
                    $("html,body").stop(true,true).animate({ scrollTop:lnbTabPanel.eq(getIdx - 1).offset().top - getTopHeight }, 0);
                }
            }
        }
		
		//상세 문의 보기
        $(".form_tab .btn_tab").on("click", function() {
            var getTab = $(this).parent();
            if(getTab.hasClass("active")) {
                getTab.removeClass("active").find(".tab_panel").stop(true,true).slideUp(300);
            }
            else {
                getTab.addClass("active").find(".tab_panel").stop(true,true).slideDown(300);
            }
            return false;
        });
        
        //가맹절차 step
        $("#partner_step .step_list .title_box").on("click", function() {
            var getTab = $(this).closest("li");
            if(getTab.hasClass("active")) {
                getTab.removeClass("active");
            }
            else {
                $("#partner_step .step_list li.active").removeClass("active");
                getTab.addClass("active");
            }
            return false;
        });
        
        var mobileCheck = $("#btn_mobile_gnb");
        
        //가맹점 슬라이드
        var subPartnerWith = $(".partner_with").each(function() {
            if($(this).find(".with_list .list_box").length < 4) {
                var getPartnerWith = $(this).find(".with_list");
                var getAddHtml = getPartnerWith.find(".list_box").clone().addClass("mobile");
                getPartnerWith.append(getAddHtml);
            }
        });
        
        var subInterval = null;
        var subPartnerSlide = null;
        function subResize() {
            clearTimeout(subInterval);
            subInterval = setTimeout(function() {
                
                subPartnerWith.each(function() {
                    if(mobileCheck.is(":visible")) {
                        if($(this).find(".with_list.slick-initialized").length == 0) {
                            $(this).find(".with_list").slick({
                                waitForAnimate:false,
                                speed:500,
                                touchThreshold:10000,
                                prevArrow:$(this).find(".btn_slide.prev"),
                                nextArrow:$(this).find(".btn_slide.next"),
                                //dots:true,
                                dots:false,
								dotsClass:"slide_thumb",
                                centerMode:true,
                                slidesToShow:3,
                                slidesToScroll:1
                            });
                        }
                    }
                    else {
                        if($(this).find(".with_list.slick-initialized").length > 0) {
                            $(this).find(".with_list.slick-initialized").slick("unslick");
                        }
                    }
                });
            }, 100);
        }
        $(window).on("resize", function() {
            subResize();
        });
        subResize();
	
    },
    popupopen: function(target) {
        $(".popup_window:visible").stop(true,true).fadeOut(300);
        //var getScrollTop = $(window).scrollTop();
        //$(target).css("top", getScrollTop + 15).stop(true,true).fadeIn(300, function() {
        $(target).stop(true,true).fadeIn(300, function() {
            $("body").addClass("popup");
        });
        $("#popup_mask").stop(true,true).fadeIn(300);
    },
    popup: function() {
        
        //플로팅 원형 배너
        $("#circle_banner .btn_close").on("click", function() {
            $("#circle_banner").stop(true,true).fadeOut(200);
            return false;
        });
        
      		
		//샘플 팝업1
        $(".gallery_wrap .btn_photo_01").on("click", function() {
            page.popupopen($("#popup_photo"));
			$('.bxslider').bxSlider({
				mode: 'fade',
				dots:false,
				captions: true
			  });
            return false;
        });	
        
        $(".popup_window .btn_close").on("click", function() {
            $(this).closest(".popup_window").stop(true,true).fadeOut(300);
            $("#popup_mask").stop(true,true).fadeOut(300);
            $("body").removeClass("popup");
            return false;
        });
        $("#popup_mask").on("click", function(e) {
            if($(e.target).attr("id") == "popup_mask") {
                $(".popup_window:visible").stop(true,true).fadeOut(300);
                $("#popup_mask").stop(true,true).fadeOut(300);
                $("body").removeClass("popup");
            }
        });
    }
    
}
