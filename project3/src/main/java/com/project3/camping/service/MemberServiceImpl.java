package com.project3.camping.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.camping.dao.CsBoardDao;
import com.project3.camping.dao.MemberDao;
import com.project3.camping.domain.Criteria;
import com.project3.camping.domain.CriteriaSum;
import com.project3.camping.domain.SearchCriteria;
import com.project3.camping.vo.CsBoardVo;
import com.project3.camping.vo.CsReplyVo;
import com.project3.camping.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{

	public MemberServiceImpl() {
		System.out.println("@Service 스프링 자동 생성");
	}
	
	@Autowired
	MemberDao dao;

	@Override
	public int memberInsert(MemberVo vo) {
		return dao.memberInsert(vo);
	}

	@Override
	public List<MemberVo> memberList(Map<String, Object> map) {
		return dao.memberList(map);
	}

	@Override
	public MemberVo memberGet(MemberVo vo) {
		return dao.memberGet(vo);
	}

	@Override
	public int memberUpdate(MemberVo vo) {
		return dao.memberUpdate(vo);
	}

	@Override
	public int memberDelete(MemberVo vo) {
		return dao.memberDelete(vo);
	}

	@Override
	public List<MemberVo> listCriteria(CriteriaSum cri) {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(CriteriaSum cri) {
		return dao.countPaging(cri);
	}

	@Override
	public List<MemberVo> listSearchCriteria(CriteriaSum cri) {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(CriteriaSum cri) {
		return dao.listSearchCount(cri);
	}

	@Override
	public MemberVo memberGet(Map<String, Object> map) {
		return dao.memberGet(map);
	}

	@Override
	public MemberVo memIdCheck(Map<String, Object> map) {
		return dao.memIdCheck(map);
	}

	@Override
	public int memPWUpdate(MemberVo vo) {
		return dao.memPWUpdate(vo);
	}


	
	
}
