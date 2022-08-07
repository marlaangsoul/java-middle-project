package com.project3.camping.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project3.camping.domain.Criteria;
import com.project3.camping.domain.CriteriaSum;
import com.project3.camping.domain.SearchCriteria;
import com.project3.camping.vo.CsBoardVo;
import com.project3.camping.vo.CsReplyVo;

@Repository
public class CsBoardDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	

	public CsBoardDao() {
		System.out.println("@Repository 스프링 자동 생성");
	}
	
	public int csBoardInsert(CsBoardVo vo) {
		return sqlSessionTemplate.insert("csBoardVo.insert", vo);
	}

	public List<CsBoardVo> csBoardList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("csBoardVo.select_list", map) ;
	}

	public CsBoardVo csBoardGet(CsBoardVo vo) {
		return sqlSessionTemplate.selectOne("csBoardVo.select_get", vo) ;
	}

	public int csBoardUpdate(CsBoardVo vo) {
		return sqlSessionTemplate.update("csBoardVo.update", vo);
	}

	public int csBoardDelete(CsBoardVo vo) {
		return sqlSessionTemplate.delete("csBoardVo.delete", vo);
	}

	public int csBoardViewCnt(CsBoardVo vo) {
		return sqlSessionTemplate.update("csBoardVo.cnt", vo);
	}

	//listPage
	public List<CsBoardVo> csListPage(int page) {
		if(page <= 0) {
			page = 1;
		}
		page = (page-1)*10;
		return sqlSessionTemplate.selectList("csBoardVo.list_page", page);
	}
	
	public List<CsBoardVo> listCriteria(Criteria cri) {
		return sqlSessionTemplate.selectList("csBoardVo.list_criteria", cri);
	}
	
	public int countPaging(Criteria cri) {
		return sqlSessionTemplate.selectOne("csBoardVo.count_paging", cri);
	}
	
	//search
	public List<CsBoardVo> listSearch(CriteriaSum cri){
		return sqlSessionTemplate.selectList("csBoardVo.list_search", cri);
	}
	
	public int listSearchCount(CriteriaSum cri) {
		return sqlSessionTemplate.selectOne("csBoardVo.list_search_count", cri);
	}
	
	
} //dao end
