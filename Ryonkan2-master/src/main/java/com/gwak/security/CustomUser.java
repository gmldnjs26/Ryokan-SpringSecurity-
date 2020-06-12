package com.gwak.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.gwak.dto.MemberVO;

public class CustomUser implements UserDetails{
	private String username;
	private String password;
	private Collection<? extends GrantedAuthority> authorities;
	private MemberVO memberVO;
	
	public CustomUser(String mber_id, String pw, 
			Collection<? extends GrantedAuthority> authorize, MemberVO memberVO) {
		username = mber_id;
		password = pw;
		authorities = authorize;
		this.memberVO = memberVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}
	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
	@Override
	public boolean isAccountNonExpired() { //アカウントは期限切れではありません
		return true;
	}
	@Override
	public boolean isAccountNonLocked() { //계정이 잠기지 않음
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() { //자격 증명이 만료되지 않음
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
	
	
}
