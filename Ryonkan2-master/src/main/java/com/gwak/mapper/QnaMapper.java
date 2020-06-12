package com.gwak.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.gwak.dto.QnaVO;

@Mapper
public interface QnaMapper {
	List<QnaVO> getLoginMemberQnaList(String mber_id);
	
	void insertQna(QnaVO qnaVO);
	
	QnaVO findOne(int q_code);
	
	void delete(int q_code);
	
	List<QnaVO> getAllQnaList();

	void update(QnaVO qnaVO); // repWrite

	int totalCount();
}
