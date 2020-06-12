package com.gwak.dto;

import java.sql.Timestamp;

public class PaymentVO {
	private Long p_code;
    private String p_way;
    private Timestamp p_date;
    private int p_status;
    private String mber_id;
    private int p_price;
    
	public Long getP_code() {
		return p_code;
	}
	public void setP_code(Long p_code) {
		this.p_code = p_code;
	}
	public String getP_way() {
		return p_way;
	}
	public void setP_way(String p_way) {
		this.p_way = p_way;
	}
	public Timestamp getP_date() {
		return p_date;
	}
	public void setP_date(Timestamp p_date) {
		this.p_date = p_date;
	}
	public int getP_status() {
		return p_status;
	}
	public void setP_status(int p_status) {
		this.p_status = p_status;
	}
	
	public String getMber_id() {
		return mber_id;
	}
	public void setMber_id(String mber_id) {
		this.mber_id = mber_id;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
    
    
}
