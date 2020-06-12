package com.gwak.service;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gwak.dto.MemberVO;
import com.gwak.mapper.MemberMapper;

@Service
@SessionAttributes("loginMember")
public class MemberService implements UserDetailsService{
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	PasswordEncoder passwordEncoder; // Service層でエンコードした方がいいと思う。
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO memberVO = memberMapper.getOneMember(username);
		if(memberVO == null) 
			throw new UsernameNotFoundException(username);
		
		return new User(memberVO.getMber_id(),memberVO.getPw(),authorize(memberVO.getMber_grade()));
		
	}
	
	
	private Collection<? extends GrantedAuthority> authorize(int mber_grade) {
		if(mber_grade == 1) {
			return Arrays.asList(new SimpleGrantedAuthority("ROLE_USER"));
		}
		// mber_gradeによる権限を割りましょう
		else
			return Arrays.asList(new SimpleGrantedAuthority("ROLE_ADMIN"));
	}

	public boolean idCheck(String mber_id) {
		if(memberMapper.getOneMember(mber_id) != null)
			return false;
		return true;
	}
	public void join(MemberVO memberVO) {
		memberVO.setMber_birth_db(utils.Convert.StringToTimestamp(memberVO.getMber_birth()));
		memberVO.setPw(passwordEncoder.encode(memberVO.getPw())); //パスワードを暗号化
		memberMapper.join(memberVO);
	}
	public MemberVO getOneMember(String mber_id) {
		return memberMapper.getOneMember(mber_id);
	}

	public List<MemberVO> getMemberList() {
		return memberMapper.getAllMember();
	}

	public int totalRecord() {
		return memberMapper.totalRecord();
	}
	
	public void updateMember(MemberVO memberVO) {
		memberMapper.updateMember(memberVO);
	}
}
