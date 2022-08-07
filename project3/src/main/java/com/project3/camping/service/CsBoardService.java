package com.project3.camping.service;

import java.util.List;
import java.util.Map;

import com.project3.camping.domain.Criteria;
import com.project3.camping.domain.CriteriaSum;
import com.project3.camping.domain.SearchCriteria;
import com.project3.camping.vo.CsBoardVo;


public interface CsBoardService {

	public int csBoardInsert(CsBoardVo vo);

	public List<CsBoardVo> csboardList(Map<String, Object> map);

	public CsBoardVo csBoardGet(CsBoardVo vo);

	public int csBoardUpdate(CsBoardVo vo);

	public int csBoardDelete(CsBoardVo vo);

	public int csBoardViewCnt(CsBoardVo vo);

	
	//paging
	
	public List<CsBoardVo> listCriteria(Criteria cri);
	
	public int listCountCriteria(Criteria cri);
	
	//search
	
	public List<CsBoardVo> listSearchCriteria(CriteriaSum cri);
	
	public int listSearchCount(CriteriaSum cri);
	
	
}
