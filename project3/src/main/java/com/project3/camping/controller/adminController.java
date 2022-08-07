package com.project3.camping.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.project3.camping.domain.CriteriaSum;
import com.project3.camping.domain.PageMaker;
import com.project3.camping.service.CsBoardService;
import com.project3.camping.service.MemberService;
import com.project3.camping.service.productVoService;
import com.project3.camping.vo.MemberVo;
import com.project3.camping.vo.productVo;


@Controller
public class adminController {

	@Autowired
	MemberService memberService;
	@Inject
	productVoService productService;
	
	
	public adminController() {
//		System.out.println("@adminController 스프링 자동 생성");
	}

	@GetMapping("/admin")
	public String admin() {
		return "admin/adminMain";
	}
	
//	@GetMapping("/memberList")
//	public String memberList() {
//		return "memberList";
//	}
	
	@RequestMapping(value = "memberList")
	public ModelAndView memberList(@SessionAttribute("member") MemberVo memVo, @RequestParam Map<String, Object> map) {		

		// service
		List<MemberVo> memberList = memberService.memberList(map);
		System.out.println(memberList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", memberList); // request.setAttribute("data",list)
		if (map.containsKey("keyword")) {
			mav.addObject("keyword", map.get("keyword"));
		}
		mav.setViewName("admin/memberList"); // .jsp
		return mav;
	}
	
	@RequestMapping(value = "/productAdmin")
	public ModelAndView list(@SessionAttribute("member") MemberVo memVo, @RequestParam Map<String, Object> map) {		
		// service
		List<productVo> list = productService.list(map);
		System.out.println(list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", list); // request.setAttribute("data",list)
		if (map.containsKey("keyword")) {  
			mav.addObject("keyword", map.get("keyword"));  
		}  
		mav.setViewName("admin/productAdmin"); // list.jsp
		return mav;
	}
	
	
	//Paging

		@RequestMapping(value = "admin/memberList", method = RequestMethod.GET)
		public void listPage(@SessionAttribute("member") MemberVo memVo, @ModelAttribute("cri") CriteriaSum cri, Model model) {
			
			System.out.println(cri.toString()+"  page="+cri.getPage()+"  perPageNum="+cri.getPerPageNum());
			
			model.addAttribute("data", memberService.listSearchCriteria(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(memberService.listSearchCount(cri));
			System.out.println(cri.toString()+"  page="+cri.getPage()+"  perPageNum="+cri.getPerPageNum());
//			System.out.println("pageMaker??" + pageMaker);
			model.addAttribute("pageMaker", pageMaker);
		}
	
		
		
//	
//	@GetMapping("/productAdmin")
//	public String productAdmin() {
//		return "productAdmin";
//	}
//	
//	@GetMapping("/addProduct")
//	public String addProduct() {
//		return "addProduct";
//	}
//
//	//addProduct Post() -> 성공시 productAdmin이동
//	
//	@GetMapping("/updateProduct")
//	public String updateProduct() {
//		return "updateProduct";
//	}
//	
//	@GetMapping("/orderList")
//	public String orderList() {
//		return "orderList";
//	}
//	
//	
//	@PostMapping("/join")
//	public ModelAndView joinPost(@RequestParam memberVO vo) {
//		System.out.println(vo);
//		int rs = campingService.join(vo);
//		
//		ModelAndView mav = new ModelAndView();
//		if(rs == 1) {
//			mav.setViewName("redirect:/list");			
//		}else {
//			mav.setViewName("redirect:/create");
//		}		
//
//		return mav;
//	}
	
	
}
