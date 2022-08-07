package com.project3.camping.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.camping.dao.CsBoardDao;
import com.project3.camping.domain.Criteria;
import com.project3.camping.domain.CriteriaSum;
import com.project3.camping.domain.SearchCriteria;
import com.project3.camping.vo.CsBoardVo;
import com.project3.camping.vo.CsReplyVo;

@Service
public class CsBoardServiceImpl implements CsBoardService{

	public CsBoardServiceImpl() {
		System.out.println("@Service 스프링 자동 생성");
	}
	
	@Autowired
	CsBoardDao dao;

	@Override
	public int csBoardInsert(CsBoardVo vo) {
		return dao.csBoardInsert(vo);
	}

	@Override
	public List<CsBoardVo> csboardList(Map<String, Object> map) {
		return dao.csBoardList(map);
	}


	@Override
	public CsBoardVo csBoardGet(CsBoardVo vo) {
		return dao.csBoardGet(vo);
	}

	@Override
	public int csBoardUpdate(CsBoardVo vo) {
		return dao.csBoardUpdate(vo);
	}

	@Override
	public int csBoardDelete(CsBoardVo vo) {
		return dao.csBoardDelete(vo);
	}

	@Override
	public int csBoardViewCnt(CsBoardVo vo) {
		return dao.csBoardViewCnt(vo);
	}

	//Paging

	@Override
	public List<CsBoardVo> listCriteria(Criteria cri) {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) {
		return dao.countPaging(cri);
	}

	
	//search
	
	@Override
	public List<CsBoardVo> listSearchCriteria(CriteriaSum cri) {
		cri.setPerPageNum(10);
//		int page = cri.getPage();
//		if(page <= 0) {
//			page = 1;
//		}
//		page = (page-1)*10;
//		System.out.println("page=" +page);
//		cri.setPage(page);
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(CriteriaSum cri) {
		return dao.listSearchCount(cri);
	}


	
	
	
	
	
}
