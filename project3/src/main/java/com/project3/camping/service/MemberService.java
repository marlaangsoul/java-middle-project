package com.project3.camping.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.project3.camping.domain.Criteria;
import com.project3.camping.domain.CriteriaSum;
import com.project3.camping.domain.SearchCriteria;
import com.project3.camping.vo.CsBoardVo;
import com.project3.camping.vo.MemberVo;


public interface MemberService {

	public int memberInsert(MemberVo vo);

	public List<MemberVo> memberList(Map<String, Object> map);

	public MemberVo memberGet(MemberVo vo);
	
	public MemberVo memberGet(Map<String, Object> map);

	public int memberUpdate(MemberVo vo);

	public int memberDelete(MemberVo vo);

	public MemberVo memIdCheck(Map<String, Object> map);

	
	//paging
	
	public List<MemberVo> listCriteria(CriteriaSum cri);
	
	public int listCountCriteria(CriteriaSum cri);
	
	//search
	
	public List<MemberVo> listSearchCriteria(CriteriaSum cri);

	public int listSearchCount(CriteriaSum cri);

	public int memPWUpdate(MemberVo vo);


}
