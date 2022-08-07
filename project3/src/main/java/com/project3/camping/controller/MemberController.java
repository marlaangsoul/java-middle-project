package com.project3.camping.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.google.protobuf.TextFormat.ParseException;
import com.project3.camping.service.MemberService;
import com.project3.camping.vo.MemberVo;

@Controller
public class MemberController {

	
	@Autowired
	MemberService memberService;

	@RequestMapping("/")
	public String login(HttpServletRequest request) { 
		HttpSession session = request.getSession(false);
		return "logInfo/login";
	}
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	public ModelAndView login(MemberVo vo, HttpServletRequest request) {
//		System.out.println(vo);
		String userId = vo.getMemId();
		String userPW = vo.getMemPW();
		ModelAndView mav = new ModelAndView();
		
		MemberVo memberVo = memberService.memberGet(vo);
		System.out.println("받아온값:" + memberVo);
		
		if(memberVo==null) {
			mav.addObject("msg","없는 회원입니다.");
			mav.addObject("url","/camping");
			mav.setViewName("alert");
		}else {
			String memId = memberVo.getMemId();
			String memPW = memberVo.getMemPW();
//			System.out.println("memberVo null 넘어오는지 확인");
			
			if(memId != null) {
//				System.out.println(userId + ":" + userPW);
//				System.out.println(memId + ":" + memPW);
				if(userId.equals(memId)) {
					if(userPW.equals(memPW)) {
						if(memId.equals("admin")) {	//admin login
							HttpSession session = request.getSession(); //세션 생성
							session.setAttribute("member", memberVo);
							System.out.println("session=="+session);
//							mav.addObject("member", memberVo);
							mav.setViewName("redirect:/admin");
						}else {	//memberlogin
//							mav.addObject("member", memberVo);
							HttpSession session = request.getSession(); //세션 생성
							session.setAttribute("member", memberVo);
							System.out.println("session=="+session);
							mav.setViewName("main");
						}
					}else {
						System.out.println("비번틀림");
						mav.addObject("msg","입력이 틀렸거나 없는 회원입니다.");
						mav.addObject("url","/camping"); //string그대로 반환
						mav.setViewName("alert");
					}
				}else {
				System.out.println("아이디틀림");
				mav.addObject("msg","입력이 틀렸거나 없는 회원입니다.");
				mav.addObject("url","/camping");
				mav.setViewName("alert");
				}
			};
		};
		return mav; 		
	}
	
	@RequestMapping("/alert")
	public String alert() { 
		return "alert";
	}

	@GetMapping("/join")
	public String join() {
		return "logInfo/join";
	}

	@GetMapping("/pwSearch")
	public String pwSearch() {
		return "logInfo/pwSearch";
	}

	@GetMapping("/pwChange")
	public ModelAndView pwChange(MemberVo vo) {
		System.out.println(vo);
		MemberVo memCheck = memberService.memberGet(vo);
		System.out.println("가져온값"+memCheck);
		ModelAndView mav = new ModelAndView();
		if(memCheck != null) {
			if(memCheck.getMemName().equals(vo.getMemName())) {
				mav.addObject("data",memCheck);
				mav.setViewName("logInfo/pwChange");
			}else {
				mav.addObject("msg","정보가 일치하지 않습니다.");
				mav.addObject("url","/camping/pwChange");
				mav.setViewName("alert");
			}
		}else{
			mav.addObject("msg","없는 ID입니다.");
			mav.addObject("url","/camping/pwSearch");
			mav.setViewName("alert");
		}
		return mav;
	}
	
	@PostMapping("/pwChange")
	public ModelAndView pwChangePost(MemberVo vo) {
		System.out.println("--Post 비번수정할 vo="+vo);
		int rs = memberService.memPWUpdate(vo);
		System.out.println("rs="+rs);
		ModelAndView mav = new ModelAndView();
		if(rs == 1) {
			System.out.println("비밀번호 변경 성공");
			mav.addObject("msg","비밀번호가 변경되었습니다. 로그인 해주세요.");
			mav.addObject("url","/camping");
			mav.setViewName("alert");
		}else {
			System.out.println("수정실패");
			mav.addObject("msg","수정에 실패했습니다. 로그인 페이지로 돌아갑니다.");
			mav.addObject("url","/camping");
			mav.setViewName("alert");
		}
		return mav;
	}


		
	@PostMapping("/join")
	public ModelAndView joinPost(MemberVo vo) {
		// 값 받기 : @RequestParam 스프링이 자동으로 넣어줌
		System.out.println("vo="+vo);
		// service
		int rs = memberService.memberInsert(vo);
		ModelAndView mav = new ModelAndView();
		if(rs == 1) {
			mav.addObject("msg","가입을 환영합니다. 로그인해주세요.");
			mav.addObject("url","/camping");
			mav.setViewName("alert");
		}else {
			System.out.println("회원가입 실패!");
			mav.setViewName("alert");
		}		
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/memIdCheck", method = RequestMethod.POST)
	public String memIdCheck(@RequestBody Map<String, Object> map) throws ParseException {
		//클라이언트가 보낸 ID값
		System.out.println(map);
		MemberVo member = memberService.memIdCheck(map);
		if(member != null) {//결과 값이 있으면 아이디 존재	
			return "-1";
		} else {		//없으면 아이디 존재 X
			System.out.println("null");
			return "0";
		}
	}
	
	@RequestMapping("/myPage")
	public ModelAndView myPage(@SessionAttribute("member") MemberVo vo) {
		System.out.println(vo);
		MemberVo memberGet = memberService.memberGet(vo);
		System.out.println("session member>>>>"+memberGet);		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", memberGet); // request.setAttribute("data",list)
		mav.setViewName("myPage"); //.jsp
		return mav;
	}
	
	@GetMapping("/memberUpdate")
	public ModelAndView memberUpdate(@SessionAttribute("member") MemberVo vo) {
		System.out.println("--Get update vo>>>>>" + vo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", vo); // request.setAttribute("data",list)
		mav.setViewName("/memberUpdate"); // list.jsp
		return mav;
	}

	@PostMapping("/memberUpdate")
	public ModelAndView memberUpdatePost(@SessionAttribute("member") MemberVo memVo, MemberVo vo) {
		System.out.println("--Post 수정 될 vo="+vo);
		int rs = memberService.memberUpdate(vo);
		System.out.println("rs="+rs);
		ModelAndView mav = new ModelAndView();
		if(rs == 1) {
			mav.addObject("msg","정보가 수정되었습니다.");
			mav.addObject("url","/camping/myPage");
			mav.setViewName("alert");
		}else {
			mav.addObject("msg","수정에 실패했습니다.");
			mav.addObject("url","/camping/memberUpdate");
			mav.setViewName("alert");
		}		

		return mav;
	}
	
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)   //admin 권한줄것
	public ModelAndView memberDelete(@SessionAttribute("member") MemberVo vo, HttpServletRequest request) {  
		System.out.println("--POST 탈퇴될 ID>>>>>"+ vo);
		ModelAndView mav = new ModelAndView();  

		int rs = memberService.memberDelete(vo);
		HttpSession session = request.getSession();
		session.invalidate();
		if (rs == 1) {  
			System.out.println("회원탈퇴 성공");
			mav.addObject("msg","성공적으로 탈퇴되었습니다. 또 만나요!");
			mav.addObject("url","/camping");
			mav.setViewName("alert");
		}else {
			System.out.println("회원탈퇴 실패");
			mav.setViewName("redirect:/mypage");  
		}  

		return mav;  
	} 


	@PostMapping("/memberPWUpdate")
	public ModelAndView memberPWUpdate(@SessionAttribute("member") MemberVo memVo, MemberVo vo) {
		System.out.println("--Post 비번수정할 vo="+vo);
		int rs = memberService.memPWUpdate(vo);
		System.out.println("rs="+rs);
		ModelAndView mav = new ModelAndView();
		if(rs == 1) {
			System.out.println("비밀번호 변경 성공");
			mav.addObject("msg","비밀번호가 변경되었습니다. 다시 로그인 해주세요.");
			mav.addObject("url","/camping");
			mav.setViewName("alert");
		}else {
			System.out.println("수정에 실패했습니다");
			mav.setViewName("redirect:/myPage");
		}		

		return mav;
	}
	
}










