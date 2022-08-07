package com.project3.camping.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project3.camping.domain.CriteriaSum;
import com.project3.camping.vo.CsBoardVo;
import com.project3.camping.vo.CsReplyVo;

@Repository
public class CsReplyDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//reply
	public List<CsReplyVo> csReplyList(Integer csNum) {
		return sqlSessionTemplate.selectList("csReplyVo.select_list", csNum);
	}

	public void csReplyInsert(CsReplyVo vo) {
		sqlSessionTemplate.insert("csReplyVo.insert",vo);
	}

	public void csReplyUpdate(CsReplyVo vo) {
		sqlSessionTemplate.update("csReplyVo.update", vo);
	}
	
	public void csReplyDelete(Integer csReplyNum) {
		sqlSessionTemplate.delete("csReplyVo.delete",csReplyNum);
	}
	

	//paging
	
	public List<CsReplyVo> listPage(Integer csNum, CriteriaSum cri) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("csNum", csNum);
		paramMap.put("cri", cri);
		
		return sqlSessionTemplate.selectList("csReplyVo.list_page", paramMap);
	}
	
	public int count(Integer csNum) {
		return sqlSessionTemplate.selectOne("csReplyVo.count", csNum);
	}
	

} //dao end
