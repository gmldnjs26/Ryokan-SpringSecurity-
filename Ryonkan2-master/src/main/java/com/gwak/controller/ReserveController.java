package com.gwak.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gwak.dto.MealVO;
import com.gwak.dto.MemberVO;
import com.gwak.dto.ReserveVO;
import com.gwak.dto.RoomVO;
import com.gwak.service.PayService;
import com.gwak.service.PlanService;
import com.gwak.service.ReserveService;
import com.gwak.service.RoomService;

import utils.Convert;
import utils.ReserveInfoVO;

@Controller
@RequestMapping("/reserve")
@SessionAttributes("ReserveInfo")
public class ReserveController {
	@Autowired
	ReserveService reserveService;
	@Autowired
	RoomService roomService;
	@Autowired
	PlanService planService;
	@Autowired
	PayService payService;

	@PostMapping("/search")
	public String reserveSearch(Model model,@RequestParam String checkIn,@RequestParam String checkOut) {
		List<ReserveVO>rList = reserveService.getAllReserveList();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<Long>rcodeList = new ArrayList<>();
		List<RoomVO>roomList = roomService.getRoomList();
		List<RoomVO>roomList2 = roomList;
		try {
			for(ReserveVO rvo : rList) {
				Date r_checkIn = new Date(rvo.getCheck_in().getTime());
				Date r_checkOut = new Date(rvo.getCheck_out().getTime());
				Date s_checkIn = sdf.parse(checkIn);
				Date s_checkOut = sdf.parse(checkOut);
				if(r_checkIn.compareTo(s_checkOut) == 1 
						|| r_checkOut.compareTo(s_checkIn) == -1) continue;
				else
					rcodeList.add(rvo.getR_code()); // 予約できない部屋のr_code
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		for(Long a : rcodeList) {
			System.out.println("Rcode : " +  a);
		}
		for(int i = 0; i < roomList.size(); i++) {
			for(int j = 0; j < rcodeList.size(); j++) {
				if(rcodeList.get(j).equals(roomList.get(i).getR_code())) {
					roomList.remove(i);
					i--;
				}
			}
		}
		model.addAttribute("roomList", roomList);
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut",checkOut);
		return "rooms/room_list";
	}

	@PostMapping("/insert1")
	public String reserveInsert1(ReserveInfoVO reserveInfoVO,Model model,HttpSession session) {
		model.addAttribute("ReserveInfo", reserveInfoVO);
		model.addAttribute("mealList",planService.getAllMealList());
		return "/reserve/reserve_step2";
	}
	@PostMapping("/insert2")
	public String reerveInsert2(@RequestParam int m_code,Model model,HttpSession session) {
		ReserveInfoVO rvo = (ReserveInfoVO)session.getAttribute("ReserveInfo");
		MealVO mealVO = planService.getMeal(m_code);
		rvo.setM_code(m_code);
		rvo.setM_price(mealVO.getM_price());
		rvo.setM_title(rvo.getM_title());
		model.addAttribute("ReserveInfo",rvo);
		System.out.println("Last : " + rvo.getCheck_in());
		return "/reserve/reserve_step3";
	}

	@RequestMapping("/re_cal")
	@ResponseBody
	public Map<String,Object> re_cal(Model model,HttpSession session,@RequestBody int num_people){ // String 으로도 받아진다 신기방기
		ReserveInfoVO vo = (ReserveInfoVO)session.getAttribute("ReserveInfo");
		MemberVO mVo = (MemberVO)session.getAttribute("loginMember");
		Map<String, Object> map2 = new HashMap<String, Object>();
		int total_price = (vo.getM_price()+vo.getR_price())*num_people;
		int tax_price = total_price/13;
		int mileage = total_price/20;
		int membership = 0;
		if(mVo.getMber_grade() == 1)
			membership = (int) (total_price*0.03);
		else if(mVo.getMber_grade() == 2)
			membership = (int) (total_price*0.05);
		else
			membership = (int) (total_price*0.07);


		vo.setSum_price(total_price+tax_price-membership); // 총가격+세금 -멤버쉽할인
		vo.setTax_price(tax_price);
		vo.setMileage(mileage);
		vo.setMembership(membership);
		vo.setNum_people(num_people);

		model.addAttribute("ReserveInfo", vo);
		map2.put("result", 1);
		map2.put("sum_price", vo.getSum_price());
		map2.put("tax_price", vo.getTax_price());
		map2.put("mileage",vo.getMileage());
		map2.put("membership",vo.getMembership());
		return map2;
	}
	@PostMapping("/save")
	public String reserveSave(ReserveInfoVO reserveInfo,HttpSession session,Model model,RedirectAttributes redirectAttrs) {
		ReserveInfoVO info = (ReserveInfoVO)session.getAttribute("ReserveInfo");
		// insert payment
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("mber_id",info.getMber_id());
		map.put("p_price",reserveInfo.getSum_price());
		int p_code = payService.save(map);
		// insert reserve
		ReserveVO rvo = new ReserveVO();
		System.out.println("Last : " + info.getCheck_in());
		rvo.setCheck_in(Convert.StringToTimestamp2(info.getCheck_in()));
		rvo.setCheck_out(Convert.StringToTimestamp2(info.getCheck_out()));
		rvo.setM_code(new Long(info.getM_code()));
		rvo.setMber_id(info.getMber_id());
		rvo.setNum_people(reserveInfo.getNum_people());
		rvo.setP_code(new Long(p_code));
		rvo.setR_code(new Long(info.getR_code()));
		rvo.setRe_memo(reserveInfo.getRe_memo());
		reserveService.save(rvo);
		redirectAttrs.addAttribute("message", "予約完了しました。");
		return "redirect:/";
	}


}
