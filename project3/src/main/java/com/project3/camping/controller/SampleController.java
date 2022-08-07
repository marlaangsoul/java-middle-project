package com.project3.camping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project3.camping.vo.CsReplyVo;

@RestController
@RequestMapping("/sample")
public class SampleController {
	
	public SampleController() {
//		System.out.println("@SampleController 스프링 자동 생성");
	}

	@RequestMapping("/hello")
	public String sayHello() {
		return "Hello world";
	}
	
	@RequestMapping("/sendVo")
	public CsReplyVo replyVo() {
		CsReplyVo vo = new CsReplyVo();
		vo.setCsNum(112);
		vo.setCsReplyNum(1);
		vo.setCsReplyContent("댓글시작해보기");
		vo.setCsReplyWriter("길동길동");
		vo.setCsReplyRegDate("2022-04-26");
		return vo;
		
	}
	
	@RequestMapping("/sendList")
	public List<CsReplyVo> sendList() {
		List<CsReplyVo> list = new ArrayList<CsReplyVo>();
		for(int i = 0; i <10; i++ ) {
			CsReplyVo vo = new CsReplyVo();
			vo.setCsNum(112);
			vo.setCsReplyNum(i);
			vo.setCsReplyContent("댓글test");
			vo.setCsReplyWriter("작성자"+i);
			vo.setCsReplyRegDate("2022-04-26");
			list.add(vo);
		}
		return list;
	}
	
	
	@RequestMapping("/sendMap")
	public Map<Integer, CsReplyVo> sendMap() {
		Map<Integer, CsReplyVo> map = new HashMap<Integer, CsReplyVo>();
		
		for(int i=0; i<10; i++) {
			CsReplyVo vo = new CsReplyVo();
			vo.setCsNum(112);
			vo.setCsReplyNum(i);
			vo.setCsReplyContent("댓글test");
			vo.setCsReplyWriter("작성자"+i);
			vo.setCsReplyRegDate("2022-04-26");
			map.put(i, vo);
		}
		
		return map;
	}
	
	@RequestMapping("/sendErrorAuth") 
	public ResponseEntity<Void> sendListAuth(){
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST); //400 반환
	}

	@RequestMapping("/sendErrorNot")
	public ResponseEntity<List<CsReplyVo>> sendListNot() {	//404일때 string반환
		
		List<CsReplyVo> list = new ArrayList<>();
		for(int i = 0; i< 10; i++) {
			CsReplyVo vo = new CsReplyVo();
			vo.setCsReplyNum(i);
			vo.setCsNum(8);
			vo.setCsReplyContent("내용 들어가라");
			vo.setCsReplyWriter("작성자자");
			vo.setCsReplyRegDate("2022-04-24");
			list.add(vo);
		}
		return  new ResponseEntity<>(list, HttpStatus.NOT_FOUND);
	}

	
	
}
