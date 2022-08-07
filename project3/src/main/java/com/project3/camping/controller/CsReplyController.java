package com.project3.camping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.project3.camping.domain.CriteriaSum;
import com.project3.camping.domain.PageMaker;
import com.project3.camping.service.CsReplyService;
import com.project3.camping.vo.CsReplyVo;
import com.project3.camping.vo.MemberVo;

@RestController
@RequestMapping("/csReplies")
public class CsReplyController {
	
	public CsReplyController() {
		
		System.out.println("@RestController 스프링 자동 생성");
	}
	
	@Inject
	CsReplyService csReplyService;
	
	@RequestMapping(value="", method = RequestMethod.POST)
	public ResponseEntity<String> register(@SessionAttribute("member") MemberVo memVo, @RequestBody CsReplyVo vo){
		
		ResponseEntity<String> entity = null;
		try {
			System.out.println(vo);
			csReplyService.csReplyInsert(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			System.out.println("Insert success");
		} catch (Exception e) {
			System.out.println("catch");
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/all/{csNum}", method = RequestMethod.GET)
	public ResponseEntity<List<CsReplyVo>> list(@SessionAttribute("member") MemberVo memVo, @PathVariable("csNum") Integer csNum){
		
		ResponseEntity<List<CsReplyVo>> entity = null;
		try {
			entity = new ResponseEntity<>(
					csReplyService.csReplyList(csNum), HttpStatus.OK);
			System.out.println(entity);
					
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{csReplyNum}", method = RequestMethod.POST)
	public ResponseEntity<String> update(@SessionAttribute("member") MemberVo memVo, @PathVariable("csReplyNum") Integer csReplyNum, @RequestBody CsReplyVo vo){
		
		ResponseEntity<String> entity = null;
		try {
			vo.setCsReplyNum(csReplyNum);
			System.out.println("update success "+vo);
			csReplyService.csReplyUpdate(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/{csReplyNum}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@SessionAttribute("member") MemberVo memVo, @PathVariable("csReplyNum") Integer csReplyNum){
		
		ResponseEntity<String> entity = null;
		try {
			System.out.println("delete success");
			csReplyService.csReplyDelete(csReplyNum);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/{csNum}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(
			@SessionAttribute("member") MemberVo memVo,
			@PathVariable("csNum") Integer csNum, @PathVariable("page") Integer page){
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			CriteriaSum cri = new CriteriaSum();
			cri.setPage(page);
			System.out.println("listPage success : page? >>" + page);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			Map<String, Object> map = new HashMap<String, Object>();
			List<CsReplyVo> list = csReplyService.listReplyPage(csNum, cri);
			map.put("list", list);
			System.out.println("List: " + list);
			int replyCount = csReplyService.count(csNum);
			pageMaker.setTotalCount(replyCount);
			map.put("pageMaker", pageMaker);
			System.out.println("pageMaker="+pageMaker);
			
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}


}
