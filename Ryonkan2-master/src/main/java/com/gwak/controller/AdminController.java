package com.gwak.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gwak.dto.MemberVO;
import com.gwak.dto.QnaVO;
import com.gwak.service.MemberService;
import com.gwak.service.QnaService;
import com.gwak.service.ReserveService;

import utils.CriteriaVO;
import utils.PageMaker;
import utils.ReserveJoinVO;

@Controller
@SessionAttributes("admin")
public class AdminController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private QnaService qnaService;


	@GetMapping("/admin/login")
	public String index(HttpSession session) {
		session.invalidate();
		return "admin/main2";
	}
	@PostMapping("/admin/login")
	public String login(Model model,@RequestParam String id, @RequestParam String pwd) {
		if(id.equals("admin") && pwd.equals("1234")) {
			model.addAttribute("admin", id);
			return "redirect:/admin/member/list";
		}
		return "admin/main2";
	}
	@GetMapping("/admin/member/list")
	public String memberList(Model model,@RequestParam(required = false) Integer page) {
		CriteriaVO cri = new CriteriaVO();
		if(page != null) 
			cri.setPage(page);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberService.totalRecord());
		model.addAttribute("memberList", memberService.getMemberList());
		model.addAttribute("pageMaker", pageMaker);
		return "admin/member/memberList";
	}
	@PostMapping("/admin/member/findOne")
	public String memberDetail(Model model, @RequestParam String mber_id,@RequestParam String page) {
		MemberVO memberVO = memberService.getOneMember(mber_id);
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("page", page);
		return "admin/member/memberDetail";
	}
	@GetMapping("/admin/member/update")
	public String memberUpdateView(Model model, @RequestParam String mber_id,@RequestParam String page) {
		MemberVO memberVO = memberService.getOneMember(mber_id);
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("page", page);
		return "admin/member/memberUpdate";
	}
	@PostMapping("/admin/member/update")
	public String memberUpdate(Model model, MemberVO member,@RequestParam String page) {
		
		return "admin/member/memberUpdate";
	}
	@GetMapping("/admin/reserve/list")
	public String reserveList(Model model, @RequestParam(required = false)Integer page) {
		List<ReserveJoinVO> reserveList = reserveService.getReserveJoinList();
		CriteriaVO cri = new CriteriaVO();
		if(page != null) 
			cri.setPage(page);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(reserveService.totalRecord());
		String[] re_status_val = { "入金待機", "予約完了", "取り消し", "CheckOut" };
		model.addAttribute("re_status_val", re_status_val);
		model.addAttribute("reserveList", reserveList);
		model.addAttribute("pageMaker", pageMaker);
		return "admin/reserve/reserveList";
	}
	@GetMapping("/admin/memo/form")
	public String adminMemoForm(Model model, @RequestParam int re_code) {
		model.addAttribute("reserveVO", reserveService.findOne(re_code));
		return "admin/reserve/memo";
	}
	@PostMapping("/admin/re_status/update")
	@ResponseBody
	public Map<String,Object> adminReserveUpdate(@RequestBody Map<String,Object>payload ) {
		Map<String,Object>map = new HashMap<String,Object>();
		payload.put("re_status", Integer.parseInt((String)payload.get("re_status")));
		reserveService.updateStatus(payload);
		map.put("result", 1);
		return map;
		
	}
	
	@PostMapping("/admin/reserve/delete")
	public String adminReserveDelete(@RequestParam int re_code) {
		reserveService.delete(re_code);
		return "redirect:/admin/reserve/list";
	}
	@GetMapping("/admin/qna/list")
	public String adminQnaList(Model model) {
		CriteriaVO criVO = new CriteriaVO();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criVO);
		pageMaker.setTotalCount(qnaService.totalCount());
		model.addAttribute("qnaList", qnaService.getAllQnaList());
		return "admin/qna/qnaList";
	}
	@GetMapping("/admin/qna/update")
	public String adminQnaUpdateForm(Model model,@RequestParam int q_code) {
		model.addAttribute("qnaVO", qnaService.findOne(q_code));
		return "admin/qna/qnaDetail";
	}
	
	@PostMapping("/admin/qna/update")
	public String adminQnaUpdate(Model model,QnaVO qnaVO) {
		qnaService.update(qnaVO);
		return "redirect:/admin/qna/list";
	}
	
}
