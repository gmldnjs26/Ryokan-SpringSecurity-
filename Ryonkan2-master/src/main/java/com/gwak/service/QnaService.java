package com.gwak.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gwak.dto.QnaVO;
import com.gwak.mapper.QnaMapper;

@Service
public class QnaService {
	@Autowired
	private QnaMapper qnaMapper;

	public List<QnaVO> getLoginMemberQnaList(String mber_id) {
		return qnaMapper.getLoginMemberQnaList(mber_id);
	}

	public void insertQna(QnaVO qnaVO) {
		qnaMapper.insertQna(qnaVO);
	}

	public QnaVO findOne(int q_code) {
		return qnaMapper.findOne(q_code);
	}

	public void delete(int q_code) {
		qnaMapper.delete(q_code);
	}

	public List<QnaVO> getAllQnaList() {
		return qnaMapper.getAllQnaList();
	}

	public void update(QnaVO qnaVO) {
		qnaMapper.update(qnaVO);
	}

	public int totalCount() {
		return qnaMapper.totalCount();
	}
	
}
