package com.project3.camping.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project3.camping.domain.Criteria;
import com.project3.camping.domain.CriteriaSum;
import com.project3.camping.domain.SearchCriteria;
import com.project3.camping.vo.CsBoardVo;
import com.project3.camping.vo.CsReplyVo;
import com.project3.camping.vo.MemberVo;

@Repository
public class MemberDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	

	public MemberDao() {
//		System.out.println("@Repository 스프링 자동 생성");
	}
	
	public int memberInsert(MemberVo vo) {
		return sqlSessionTemplate.insert("memberVo.insert", vo);
	}

	public List<MemberVo> memberList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("memberVo.select_list", map) ;
	}

	public MemberVo memberGet(MemberVo vo) {
		return sqlSessionTemplate.selectOne("memberVo.select_get", vo) ;
	}

	public int memberUpdate(MemberVo vo) {
		return sqlSessionTemplate.update("memberVo.update", vo);
	}

	public int memberDelete(MemberVo vo) {
		return sqlSessionTemplate.delete("memberVo.delete", vo);
	}

	public int memberViewCnt(MemberVo vo) {
		return sqlSessionTemplate.update("memberVo.cnt", vo);
	}

	//listPage
	public List<MemberVo> csListPage(int page) {
		if(page <= 0) {
			page = 1;
		}
		page = (page-1)*10;
		return sqlSessionTemplate.selectList("memberVo.list_page", page);
	}
	
	public List<MemberVo> listCriteria(CriteriaSum cri) {
		return sqlSessionTemplate.selectList("memberVo.list_criteria", cri);
	}
	
	public int countPaging(CriteriaSum cri) {
		return sqlSessionTemplate.selectOne("memberVo.count_paging", cri);
	}
	
	//search
	public List<MemberVo> listSearch(CriteriaSum cri){
		return sqlSessionTemplate.selectList("memberVo.list_search", cri);
	}
	
	public int listSearchCount(CriteriaSum cri) {
		return sqlSessionTemplate.selectOne("csBoardVo.list_search_count", cri);
	}

	public MemberVo memberGet(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("memberVo.select_get", map) ;
	}

	public MemberVo memIdCheck(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("memberVo.id_check", map);
	}

	public int memPWUpdate(MemberVo vo) {
		return sqlSessionTemplate.update("memberVo.pwUpdate", vo);
	}

	
} //dao end
