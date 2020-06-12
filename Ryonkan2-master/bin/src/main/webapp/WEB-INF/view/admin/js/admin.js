
function re_status_change(obj,obj2){
	var allData = {"re_status":obj.value, "re_code":obj2};
	$.ajax({
		async: true, // 동기
		url : "admin_re_status_change.do", // 니 유알엘
		type : 'POST',
		data : JSON.stringify(allData), // 데이터와 위에 선언한 거 넣고
		dataType : "json", // 타입은 json 으로
		cache: false,
		contentType: "application/json; charset=UTF-8",
		success : function(data) {
			if (data.result == 1) { // 받은 data중 결과->결과이름을 난 result 로 해놓음
				alert("예약 상태가 변경되었습니다.");
			} else {
				alert("예약 상태 변경에 실패했습니다.");
			}
		}
	});
}
function go_memo(re_code) {
	  var url = "admin_memo_form.do?re_code="+re_code;
	  window.open( url, "_blank_1",
	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=330, height=200");
	}


function removeComma(input) // ,을 빼고 값을 다시 넣어준다.
{
	return input.value.replace(/,/gi, "");
}
// productWrite.jsp에서 사용한다. 상품 리스트로 이동한다.
function go_cancel()
{
	var theForm = document.frm;
	theForm.action = "admin_member_list.do";
	theForm.submit();
}

function go_qna_search(){
	var theForm = document.frm;
	var search_title = $("#search_title").val();
	alert(search_title);
	theForm.action = "admin_qna_search.do?search_title="+search_title;
	theForm.submit();
}

function go_search() { // 회원 검색 -> 멤버관리 부분
	var theForm = document.frm;
	var search_id = $("#search_id").val();
	var page = $("#page").val();
	theForm.action =  "admin_memeber_search.do?search_id="+search_id+"&page="+page;
	theForm.submit();
}

function go_re_search(){ // 예약 검색 -> 예약관리 부분
	var theForm = document.frm;
	var search_id = $("#search_id").val();
	var page = $("#page").val();
	theForm.action = "admin_reserve_search.do?search_id="+search_id+"&page="+page;
	theForm.submit();
}

function go_detail(page, mber_id) {
	var theForm = document.frm;
	// 회원 상세보기 페이지에서 돌아올때 보던 페이지로 
	// 돌아올 수 있도록 하기 위해서 현재 페이지 번호를 쿼리 스트링으로 넘겨준다.
	theForm.action =  "admin_member_detail.do?page=" +
	                  page+"&mber_id="+mber_id;
	
	theForm.submit();
}
function go_re_delete(re_code){
	var theForm = document.frm;
	theForm.action = "admin_reserve_delete.do?re_code="+re_code;
	theForm.submit();
}

function go_list(page) {
	var theForm = document.frm;
	//상품 리스트로 이동하되 현재 페이지를 쿼리 스트링으로 넘긴다.
	theForm.action = "admin_member_list.do?page=" + page;
	theForm.submit();
}

// 회원 정보 수정으로 넘기기
function go_mod(page, mber_id) {
	var theForm = document.frm;
	//현재 페이지를 쿼리 스트링으로 넘긴다.
	theForm.action = "admin_member_update_form.do?page=" + 
		              page+"&id="+mber_id;
	theForm.submit();
}


function go_mod_mov(tpage, pseq) {
	var theForm = document.frm;
	theForm.action = 'NonageServlet?command=admin_product_detail&tpage=' + tpage + "&pseq=" + pseq;
	theForm.submit();
}
