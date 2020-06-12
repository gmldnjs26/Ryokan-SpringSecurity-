package utils;

import java.sql.Timestamp;

import com.gwak.dto.PaymentVO;
import com.gwak.dto.RoomVO;

public class ReserveJoinVO {
	private Long re_code;

	private String mber_id; // MemberVO.m_id references

	private Timestamp check_in;
	private Timestamp check_out;

	private int num_people;
	
	private RoomVO roomVO;
	private Long m_code; // meal code
	private PaymentVO paymentVO;

	// 1:決済待ち 2.入金完了3.予約キャンセル申請
	private int re_status;
	
	private Timestamp re_date;
	private String re_memo;
	public Long getRe_code() {
		return re_code;
	}
	public void setRe_code(Long re_code) {
		this.re_code = re_code;
	}
	public String getMber_id() {
		return mber_id;
	}
	public void setMber_id(String mber_id) {
		this.mber_id = mber_id;
	}
	public Timestamp getCheck_in() {
		return check_in;
	}
	public void setCheck_in(Timestamp check_in) {
		this.check_in = check_in;
	}
	public Timestamp getCheck_out() {
		return check_out;
	}
	public void setCheck_out(Timestamp check_out) {
		this.check_out = check_out;
	}
	public int getNum_people() {
		return num_people;
	}
	public void setNum_people(int num_people) {
		this.num_people = num_people;
	}
	public RoomVO getRoomVO() {
		return roomVO;
	}
	public void setRoomVO(RoomVO roomVO) {
		this.roomVO = roomVO;
	}
	public Long getM_code() {
		return m_code;
	}
	public void setM_code(Long m_code) {
		this.m_code = m_code;
	}
	public PaymentVO getPaymentVO() {
		return paymentVO;
	}
	public void setPaymentVO(PaymentVO paymentVO) {
		this.paymentVO = paymentVO;
	}
	public int getRe_status() {
		return re_status;
	}
	public void setRe_status(int re_status) {
		this.re_status = re_status;
	}
	public Timestamp getRe_date() {
		return re_date;
	}
	public void setRe_date(Timestamp re_date) {
		this.re_date = re_date;
	}
	public String getRe_memo() {
		return re_memo;
	}
	public void setRe_memo(String re_memo) {
		this.re_memo = re_memo;
	}
	
	
}
