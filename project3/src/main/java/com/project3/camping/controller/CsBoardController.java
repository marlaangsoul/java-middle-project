package com.project3.camping.controller;

import java.util.List;
import java.util.Map;

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

import com.project3.camping.service.CsBoardService;
import com.project3.camping.domain.CriteriaSum;
import com.project3.camping.domain.PageMaker;
import com.project3.camping.vo.CsBoardVo;
import com.project3.camping.vo.MemberVo;

@Controller
public class CsBoardController {

	@Autowired
	CsBoardService csBoardService;


	public CsBoardController() {
		System.out.println("@csBoardController 스프링 자동 생성");
	}
	
//	@GetMapping("/")
//	public String csIndex() {
//		return "csIndex";
//	}
	
	@GetMapping("/csBoardInsert")
	public String csBoardInsert(@SessionAttribute("member") MemberVo memVo) {
		System.out.println("board session====??"+memVo);
		return "csBoardInsert";
	}
	
	@PostMapping("/csBoardInsert")
	public ModelAndView csBoardInsertPost(@SessionAttribute("member") MemberVo memVo ,CsBoardVo vo, Map<String, Object> map) {
		// 값 받기 : @RequestParam 스프링이 자동으로 넣어줌
		System.out.println("vo="+vo);
		System.out.println("session===?"+memVo);
		String content = vo.getCsContent().replaceAll("\r\n","<br>");
		System.out.println("치환 === >"+content);
		vo.setCsContent(content);
		System.out.println("vo="+vo);
		
		System.out.println();
		// service
		int rs = csBoardService.csBoardInsert(vo);
		
		ModelAndView mav = new ModelAndView();
		if(rs == 1) {
			mav.addObject("msg","글이 등록되었습니다.");
			mav.addObject("url","/camping/csBoardList?page=1&perPageNum=10&searchType=&keyword=");
			mav.addObject("memId",map);
			mav.setViewName("alert");
		}else {
			mav.addObject("msg","등록에 실패했습니다");
			mav.addObject("url","/camping/csBoardInsert");
			mav.setViewName("alert");
		}		
		return mav;
	}
	
	@RequestMapping(value = "/csBoardList")
	public ModelAndView csBoardList(@SessionAttribute("member") MemberVo memVo, @RequestParam Map<String, Object> map) {		
//		System.out.println(map);
		System.out.println("session====?"+memVo);
		// service
		List<CsBoardVo> csBoardList = csBoardService.csboardList(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", csBoardList); // request.setAttribute("data",list)
//		mav.addObject("memId",map);
		if (map.containsKey("keyword")) {
			mav.addObject("keyword", map.get("keyword"));
		}
		mav.setViewName("csBoardList"); // csBoardList.jsp
		
		return mav;
	}
	
	@RequestMapping(value = {"/csBoardGet"})
	public ModelAndView csBoardGet(@SessionAttribute("member") MemberVo memVo, @ModelAttribute("cri") CriteriaSum cri, CsBoardVo vo) {		
		System.out.println("csBoardGet param >>>>>>>" + cri);
		System.out.println("csBoardGet session >>>>>>>" + memVo);
		CsBoardVo csBoardGetVo = csBoardService.csBoardGet(vo);
//		String content = csBoardGetVo.getCsContent().replaceAll("<br>","\r\n");
//		System.out.println("치환 === >"+content);
//		csBoardGetVo.setCsContent(content);
//		System.out.println("vo="+csBoardGetVo);
		
		
		//cnt
		csBoardService.csBoardViewCnt(vo);
		//System.out.println("cri param >>>" + cri);
		ModelAndView mav1 = new ModelAndView();
		mav1.addObject("data", csBoardGetVo); // request.setAttribute("data",list)
		mav1.addObject("cri", cri);
		mav1.setViewName("csBoardGet"); //.jsp
		return mav1;
	}
	
	@GetMapping("/csBoardUpdate")
	public ModelAndView csBoardUpdate(@SessionAttribute("member") MemberVo memVo, @ModelAttribute("cri") CriteriaSum cri, CsBoardVo vo) {
		System.out.println("--Get update vo>>>>>" + vo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("csdata", vo); // request.setAttribute("data",list)
		mav.addObject("cri", cri);
		mav.setViewName("/csBoardUpdate"); // list.jsp
		return mav;
	}

	@PostMapping("/csBoardUpdate")
	public ModelAndView csBoardUpdatePost(@ModelAttribute("cri") CriteriaSum cri, CsBoardVo vo) {
		System.out.println("수정 될 vo="+vo);
//		System.out.println("수정될 cri>>>>>" + cri);
		int rs = csBoardService.csBoardUpdate(vo);
//		CsBoardVo csVo = csBoardService.csBoardGet(vo);
		
		ModelAndView mav = new ModelAndView();
		if(rs == 1) {
			mav.addObject("msg","수정되었습니다.");
			mav.addObject("url","/camping/csBoardGet?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()+"&searchType=&keyword=&csNum="+vo.getCsNum());
			mav.addObject("cri",cri);
			mav.setViewName("alert");
//			mav.addObject("data",csVo);
//			mav.setViewName("redirect:/csBoardGet?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()+"&searchType=&keyword=&csNum="+vo.getCsNum());	
		}else {
			System.out.println("수정 실패");
			mav.setViewName("redirect:/csBoardUpdate");
		}		

		return mav;
	}
	
	@RequestMapping(value = "/csBoardDelete", method = RequestMethod.POST)  
	public ModelAndView csBoardDelete(@SessionAttribute("member") MemberVo memVo, @ModelAttribute("cri") CriteriaSum cri, CsBoardVo vo) {  
	
		System.out.println("--POST 삭제될 글 >>>>>"+ vo + cri);
		ModelAndView mav = new ModelAndView();  

		int rs = csBoardService.csBoardDelete(vo);
		if (rs == 1) {  
			mav.setViewName("redirect:/csBoardList?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()+"&searchType=&keyword=");
		}else {  
			mav.setViewName("redirect:/csBoardGet?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()+"&searchType=&keyword=&csNum="+vo.getCsNum());  
		}  

		return mav;  
	} 


	//Paging

	@RequestMapping(value = "/csBoardList", method = RequestMethod.GET)
	public void listPage(@SessionAttribute("member") MemberVo memVo, @ModelAttribute("cri") CriteriaSum cri, Model model) {
		System.out.println(cri.toString()+"  page="+cri.getPage()+"  perPageNum="+cri.getPerPageNum());
		//model.addAttribute("data", csBoardService.listCriteria(cri));
		System.out.println("session====?"+memVo);
		model.addAttribute("data", csBoardService.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(csBoardService.listCountCriteria(cri));
		pageMaker.setTotalCount(csBoardService.listSearchCount(cri));
		//System.out.println(cri.toString()+"  page="+cri.getPage()+"  perPageNum="+cri.getPerPageNum());
//		System.out.println("pageMaker??" + pageMaker);
		model.addAttribute("pageMaker", pageMaker);
	}
	

	
	//reply test
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void ajaxTest() {
		System.out.println("test");
	}
	
}
