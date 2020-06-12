package com.gwak.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gwak.dto.MealVO;

@Mapper
public interface PlanMapper {
	List<MealVO> getAllMealList();
	MealVO getMeal(int m_code);
}
