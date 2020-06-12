function pop_open(sel_num) {
	page.popupopen($("#popup_smart"));
	go_page_pop(sel_num);
}

function email_input(name) {
	$("#q_email2").val(name);
}

function pop_email_input(name) {
	$("#pop_q_email2").val(name);
}

function emailCheck(email_address){ 
	email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	if(!email_regex.test(email_address)){ 
		return false; 
	}else{
		return true;
	}
}

function makeComma(val){
	val = uncomma(val);
	return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
 
//콤마풀기
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
 


$(document).ready(function(){
	$(".onlyNumber").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi,''));
		}
	});

	/*$("#sido,#pop_sido").on("change" ,function(event) {
		$("#loading_area").css({"display":"block"});
		$.ajax({
			type : "POST",
			url : "./src/sido_change.php",
			data :  { "sido" : this.value },
			async : false,
			success : function(data, status)
			{
				
				var json = eval("(" + data + ")");
				$("#sigun").html("<option value=\"\">시/군/구</option>" + json.result);
				$("#pop_sigun").html("<option value=\"\">시/군/구</option>" + json.result);
				$("#loading_area").delay(30).fadeOut();
				return false;
			},
			error : function(err)
			{
				alert(err.responseText);
				$("#loading_area").delay(30).fadeOut();
				return false;
			}
		});
	});*/
});