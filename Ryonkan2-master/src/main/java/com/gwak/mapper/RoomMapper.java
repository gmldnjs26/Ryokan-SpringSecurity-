package com.gwak.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gwak.dto.RoomVO;

@Mapper
public interface RoomMapper {
	public List<RoomVO>getRoomList();
	public RoomVO getRoomOne(int r_code);
}
