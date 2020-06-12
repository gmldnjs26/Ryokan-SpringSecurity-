package com.gwak.mapper;

import java.util.List;

import com.gwak.dto.MemberVO;

public interface MemberMapper {
	public List<MemberVO>getAllMember();
	public MemberVO getOneMember(String mber_id); //
	public void join(MemberVO memberVO);
	public int totalRecord();
	public void updateMember(MemberVO memberVO);
}
