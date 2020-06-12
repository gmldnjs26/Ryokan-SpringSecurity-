package com.gwak.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gwak.dto.MemberVO;
import com.gwak.dto.QnaVO;
import com.gwak.service.QnaService;

@Controller	
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/qna/notice")
	public String notice() {
		return "center/notice";
	}
	
	@GetMapping("/qna/list")
	public String list(Model model,HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginMember");
		List<QnaVO>qnaList = qnaService.getLoginMemberQnaList(memberVO.getMber_id());
		System.out.println(qnaList.size());
		model.addAttribute("qnaList", qnaList);
		return "qna/qna_list";
	}
	@GetMapping("/qna/write")
	public String writeForm() {
		return "qna/qna_write";
	}
	@PostMapping("/qna/write")
	public String insertQna(QnaVO qnaVO) {
		System.out.println(qnaVO.getMber_id());
		qnaService.insertQna(qnaVO);
		return "redirect:/qna/list";
	}
	@GetMapping("/qna/view")
	public String findOne(Model model,@RequestParam int q_code) {
		QnaVO qnaVO = qnaService.findOne(q_code);
		model.addAttribute("qnaVO", qnaVO);
		return "qna/qna_view";
	}
	@GetMapping("/qna/delete")
	public String delete(@RequestParam int q_code) {
		qnaService.delete(q_code);
		return "redirect:/qna/list";
	}
}
