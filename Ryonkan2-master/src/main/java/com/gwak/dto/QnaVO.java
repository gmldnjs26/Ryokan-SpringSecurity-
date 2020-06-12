package com.gwak.dto;

import java.sql.Timestamp;

public class QnaVO {
	private Long q_code;
	private String mber_id;
	private String q_title;
	private String q_content;
	private String a_title;
	private String a_content;
	private int q_status;
	private Timestamp q_date;
	
	public Long getQ_code() {
		return q_code;
	}
	public void setQ_code(Long q_code) {
		this.q_code = q_code;
	}
	
	public String getMber_id() {
		return mber_id;
	}
	public void setMber_id(String mber_id) {
		this.mber_id = mber_id;
	}

	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getA_title() {
		return a_title;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public int getQ_status() {
		return q_status;
	}
	public void setQ_status(int q_status) {
		this.q_status = q_status;
	}
	public Timestamp getQ_date() {
		return q_date;
	}
	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}
}
