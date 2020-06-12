package com.gwak.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gwak.dto.MemberVO;
import com.gwak.service.MemberService;
import com.gwak.service.ReserveService;

@Controller
@SessionAttributes("loginMember") 
public class MemberController {
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/")
	public String index(Model model,@RequestParam(required=false)String message) {
		model.addAttribute("message", message);
		return "index";
	}
	@GetMapping("/join") // HttpMessageConverter , Viewresolve
	public String join_form() {
		return "member/join_form";
	}
	@PostMapping("/join")
	public String join(MemberVO memberVO,Model model) {
		memberService.join(memberVO);
		model.addAttribute("message", "会員加入完了");
		return "member/login";
	}
	@PostMapping("/idCheck")
	public @ResponseBody Map<String,Object> idcheck(@RequestParam String mber_id,Model model) {
		Map<String,Object>map = new HashMap<String,Object>();
		if(memberService.idCheck(mber_id)) 
			map.put("result", 1);
		else
			map.put("result", 2);
		return map;
	}
	@RequestMapping("/login")
	public String loginForm() {
		return "member/login";
	}
	
	// Security Handling 
	@RequestMapping("/need_login")
	public String needLogin(Model model) {
		model.addAttribute("message", "ログインが必要です。");
		return "member/login";
	}
	@RequestMapping("/login_success")
	public String loginSuccess(@AuthenticationPrincipal User user,Model model, RedirectAttributes ra){
		MemberVO memberVO = memberService.getOneMember(user.getUsername());
		if(memberVO.getMber_grade() >= 4) {
			ra.addAttribute("admin_id", memberVO.getMber_id());
			return "redirect:/admin/login";
		}
		model.addAttribute("loginMember", memberVO);
		return "index";
	}
	@GetMapping("/login_fail")
	public String login_fail(Model model) {
		model.addAttribute("message", "Failed to Login");
		return "member/login";
	}
	@GetMapping("/member/mypage")
	public String mypage(Model model,HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginMember");
		model.addAttribute("reserveList", reserveService.getMemberReserveList(memberVO.getMber_id()));
		return "member/mypage";
	}
	

}
