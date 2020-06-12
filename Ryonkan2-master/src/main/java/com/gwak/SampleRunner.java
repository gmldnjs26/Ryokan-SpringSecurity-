package com.gwak;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.gwak.dto.MemberVO;
import com.gwak.service.MemberService;

//@Component
public class SampleRunner implements ApplicationRunner{
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PasswordEncoder pe;
	
	@Override
	public void run(ApplicationArguments args) throws Exception {
		System.out.println("Runner");
		MemberVO memberVO = new MemberVO();
		memberVO.setMber_id("imleesky");
		memberVO.setPw(pe.encode("1234"));
		memberService.join(memberVO);
	}
}
