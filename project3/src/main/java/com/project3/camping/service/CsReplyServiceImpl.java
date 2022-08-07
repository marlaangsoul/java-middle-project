package com.project3.camping.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.camping.dao.CsBoardDao;
import com.project3.camping.dao.CsReplyDao;
import com.project3.camping.domain.CriteriaSum;
import com.project3.camping.vo.CsBoardVo;
import com.project3.camping.vo.CsReplyVo;

@Service
public class CsReplyServiceImpl implements CsReplyService{

	public CsReplyServiceImpl() {
		System.out.println("@Service 스프링 자동 생성");
	}
	
	@Inject
	CsReplyDao dao;

	
	@Override
	public List<CsReplyVo> csReplyList(Integer csNum) {
		return dao.csReplyList(csNum);
	}

	@Override
	public void csReplyInsert(CsReplyVo vo) {
		dao.csReplyInsert(vo);
	}

	@Override
	public void csReplyUpdate(CsReplyVo vo) {
		dao.csReplyUpdate(vo);
	}
	
	@Override
	public void csReplyDelete(Integer csReplyNum) {
		dao.csReplyDelete(csReplyNum);
	}

	@Override
	public List<CsReplyVo> listReplyPage(Integer csNum, CriteriaSum cri) {
		return dao.listPage(csNum, cri);
	}

	@Override
	public int count(Integer csNum) {
		return dao.count(csNum);
	}



	
	
	
	
	
}
