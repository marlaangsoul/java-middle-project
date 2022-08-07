package com.project3.camping.service;

import java.util.List;
import java.util.Map;

import com.project3.camping.domain.CriteriaSum;
import com.project3.camping.vo.CsBoardVo;
import com.project3.camping.vo.CsReplyVo;

public interface CsReplyService {

	//reply
	public void csReplyInsert(CsReplyVo vo);
	
	public List<CsReplyVo> csReplyList(Integer csNum);

	public void csReplyUpdate(CsReplyVo vo);
	
	public void csReplyDelete(Integer csReplyNum);
	
	public List<CsReplyVo> listReplyPage(Integer csNum, CriteriaSum cri);
	
	public int count(Integer csNum);

}
