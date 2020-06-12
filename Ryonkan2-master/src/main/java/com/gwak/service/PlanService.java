package com.gwak.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gwak.dto.MealVO;
import com.gwak.mapper.PlanMapper;

@Service
public class PlanService {
	@Autowired
	PlanMapper planMapper;

	public List<MealVO> getAllMealList() {
		return planMapper.getAllMealList();
	}
	public MealVO getMeal(int m_code) {
		return planMapper.getMeal(m_code);
	}
}
