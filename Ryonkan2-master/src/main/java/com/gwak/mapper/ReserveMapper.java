package com.gwak.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gwak.dto.ReserveVO;

import utils.ReserveJoinVO;

@Mapper
public interface ReserveMapper {
	public List<ReserveVO> getRoomReserveList(int r_code);

	public List<ReserveVO> getAllReserveList();

	public void save(ReserveVO rvo);

	public List<ReserveVO> getMemberReserveList(String mber_id);

	public int totalRecord();

	public List<ReserveJoinVO> getReserveJoinList();

	public ReserveVO findOne(int re_code);

	public void updateStatus(Map<String,Object>payload);

	public void delete(int re_code);
}
