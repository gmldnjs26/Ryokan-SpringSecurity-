package com.gwak.dto;

import java.sql.Timestamp;

public class MemberVO {

	private String mber_id; // 
	private String pw; // 
	private String mber_sex; // sexdstn_code
	private String mber_country; //reside_country_code2 
	
	private String mber_nm; // first last
	private String mber_nm_yomi;
	
	private String mber_birth; // yy mm dd
	private Timestamp mber_birth_db; // 
	
	
	private String mber_telno; //  
	
	private String email; // email + domain
	
	private String zip_num; // zip1 
	private String adres; //adres1 + adres2
	
	private String email_recptn_yn; // 
	private String sms_recptn_yn;
	private String dm_recptn_yn;
	
	private int mber_grade; // default
	
	private String mber_comment; // default
	private int reserve_sum; // default
	private int mileage; // default
	
	public Timestamp getMber_birth_db() {
		return mber_birth_db;
	}
	public void setMber_birth_db(Timestamp mber_birth_db) {
		this.mber_birth_db = mber_birth_db;
	}
	
	public String getMber_id() {
		return mber_id;
	}
	public void setMber_id(String mber_id) {
		this.mber_id = mber_id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMber_sex() {
		return mber_sex;
	}
	public void setMber_sex(String mber_sex) {
		this.mber_sex = mber_sex;
	}
	public String getMber_country() {
		return mber_country;
	}
	public void setMber_country(String mber_country) {
		this.mber_country = mber_country;
	}
	public String getMber_nm() {
		return mber_nm;
	}
	public void setMber_nm(String mber_nm) {
		this.mber_nm = mber_nm;
	}
	public String getMber_nm_yomi() {
		return mber_nm_yomi;
	}
	public void setMber_nm_yomi(String mber_nm_yomi) {
		this.mber_nm_yomi = mber_nm_yomi;
	}
	public String getMber_birth() {
		return mber_birth;
	}
	public void setMber_birth(String mber_birth) {
		this.mber_birth = mber_birth;
	}
	public String getMber_telno() {
		return mber_telno;
	}
	public void setMber_telno(String mber_telno) {
		this.mber_telno = mber_telno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZip_num() {
		return zip_num;
	}
	public void setZip_num(String zip_num) {
		this.zip_num = zip_num;
	}
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getEmail_recptn_yn() {
		return email_recptn_yn;
	}
	public void setEmail_recptn_yn(String email_recptn_yn) {
		this.email_recptn_yn = email_recptn_yn;
	}
	public String getSms_recptn_yn() {
		return sms_recptn_yn;
	}
	public void setSms_recptn_yn(String sms_recptn_yn) {
		this.sms_recptn_yn = sms_recptn_yn;
	}
	public String getDm_recptn_yn() {
		return dm_recptn_yn;
	}
	public void setDm_recptn_yn(String dm_recptn_yn) {
		this.dm_recptn_yn = dm_recptn_yn;
	}
	public int getMber_grade() {
		return mber_grade;
	}
	public void setMber_grade(int mber_grade) {
		this.mber_grade = mber_grade;
	}
	public String getMber_comment() {
		return mber_comment;
	}
	public void setMber_comment(String mber_comment) {
		this.mber_comment = mber_comment;
	}
	public int getReserve_sum() {
		return reserve_sum;
	}
	public void setReserve_sum(int reserve_sum) {
		this.reserve_sum = reserve_sum;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	
	
	
}
