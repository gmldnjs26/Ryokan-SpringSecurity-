package com.gwak.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gwak.mapper.PayMapper;

@Service
public class PayService {
	@Autowired
	private PayMapper payMapper;
	
	public int save(Map<String,Object>map) {
		return payMapper.save(map);
	}
}
