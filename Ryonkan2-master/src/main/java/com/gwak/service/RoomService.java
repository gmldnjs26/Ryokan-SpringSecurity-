package com.gwak.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gwak.dto.RoomVO;
import com.gwak.mapper.RoomMapper;

@Service
public class RoomService {
	@Autowired
	RoomMapper roomMapper;
	
	public List<RoomVO>getRoomList() {
		return roomMapper.getRoomList();
	}

	public RoomVO getRoomOne(int r_code) {
		return roomMapper.getRoomOne(r_code);
	}
	
}
