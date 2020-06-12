package com.gwak.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gwak.dto.ReserveVO;
import com.gwak.service.ReserveService;
import com.gwak.service.RoomService;

@Controller
@RequestMapping("/room")
public class RoomController {
	@Autowired
	private RoomService roomService;
	@Autowired
	private ReserveService reserveService;
	
	@GetMapping("/list")
	public String roomList(Model model,@RequestParam(required = false) String checkIn,@RequestParam(required = false) String checkOut) {
		model.addAttribute("roomList", roomService.getRoomList());
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		return "rooms/room_list";
	}
	@GetMapping("/sub")
	public String roomSub(Model model,@RequestParam String r_code,@RequestParam(required = false) String checkIn,@RequestParam(required = false) String checkOut) {
		int r_code2 = Integer.parseInt(r_code);
		model.addAttribute("roomVO", roomService.getRoomOne(r_code2));
		List<ReserveVO>reserveList = reserveService.getRoomReserveList(r_code2);
		List<String>dateList = utils.ReserveManange.reservedDays(reserveList);
		model.addAttribute("dateList", utils.ReserveManange.reservedDays(reserveList));
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		return "rooms/room_sub";
	}
	
	
}
