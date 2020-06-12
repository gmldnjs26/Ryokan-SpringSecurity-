package com.gwak.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gwak.dto.ReserveVO;
import com.gwak.mapper.ReserveMapper;

import utils.ReserveJoinVO;

@Service
public class ReserveService {
	@Autowired
	private ReserveMapper reserveMapper;

	public List<ReserveVO> getRoomReserveList(int r_code) {
		return reserveMapper.getRoomReserveList(r_code);
	}
	public List<ReserveVO> getAllReserveList() {
		return reserveMapper.getAllReserveList();
	}
	public void save(ReserveVO rvo) {
		reserveMapper.save(rvo);
	}
	public List<ReserveVO> getMemberReserveList(String mber_id) {
		return reserveMapper.getMemberReserveList(mber_id);
	}
	public int totalRecord() {
		return reserveMapper.totalRecord();
	}
	public List<ReserveJoinVO> getReserveJoinList() {
		return reserveMapper.getReserveJoinList();
	}
	public ReserveVO findOne(int re_code) {
		return reserveMapper.findOne(re_code);
	}
	public void updateStatus(Map<String,Object>payload) {
		reserveMapper.updateStatus(payload);
	}
	public void delete(int re_code) {
		reserveMapper.delete(re_code);
	}
	
}
