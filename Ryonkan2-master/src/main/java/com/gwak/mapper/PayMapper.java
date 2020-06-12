package com.gwak.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PayMapper {
	int save(Map<String,Object>map);
}
