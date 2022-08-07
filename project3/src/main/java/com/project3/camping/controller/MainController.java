package com.project3.camping.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.project3.camping.service.MemberService;
import com.project3.camping.vo.MemberVo;

@Controller
public class MainController {
	
	@Autowired
	MemberService memberService;
	
	
	public MainController() {
//		System.out.println("@MainController 스프링 자동 생성");
	}
	
	@GetMapping("/main")
	public ModelAndView main(@SessionAttribute("member") MemberVo vo, HttpServletRequest request) {
//		System.out.println("받아온 memId"+map);
//		MemberVo vo = memberService.memberGet(map);
//		System.out.println("main 받아온 vo"+vo);
		HttpSession session = request.getSession(); //세션 생성
		session.setAttribute("member", vo);
		System.out.println(vo);
		System.out.println("main session====??"+session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		return mav;
	}
	
	@GetMapping("/logout")
	public String logout(@SessionAttribute("member") MemberVo vo, HttpServletRequest request) {	
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/";
	}
}
