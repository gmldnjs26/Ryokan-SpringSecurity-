package com.gwak.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gwak.service.PlanService;

@Controller
public class PlanController {
	@Autowired
	PlanService planService;
	
	@GetMapping("/meal/list")
	public String getAllMealList(Model model) {
		model.addAttribute("mealList", planService.getAllMealList());
		return "meal/meal_list";
	}
	@GetMapping("/meal/sub")
	public String getOneMeal(Model model,@RequestParam String m_code) {
		model.addAttribute("mealVO", planService.getMeal(Integer.parseInt(m_code)));
		return "meal/meal_sub";
	}
	
	
}
