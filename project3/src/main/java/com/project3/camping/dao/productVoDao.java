package com.project3.camping.dao;

import java.util.List;
import java.util.Map;

import com.project3.camping.vo.productVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class productVoDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public productVoDao() {
		System.out.println("@Repository 스프링 자동생성");
	}

	public List<productVo> selectList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("productVo.select_list", map);
	}
	public int insert(productVo productVo) {		
		return sqlSessionTemplate.insert("productVo.insert",productVo);		
	}

	public productVo selectDetail(productVo productVo) {
		return sqlSessionTemplate.selectOne("productVo.select_detail", productVo);
	}

//	public List<productVo> proListPage(int page) {
//		if(page <= 0) {
//			page = 1;
//		}
//		page = (page-1)*10;
//		return sqlSessionTemplate.selectList("productVo.list_page", page);
//	}
//	
//	public List<productVo> listCriteria(Criteria cri) {
//		return sqlSessionTemplate.selectList("productVo.list_criteria", cri);
//	}
//	
//	public int countPaging(Criteria cri) {
//		return sqlSessionTemplate.selectOne("productVo.count_paging", cri);
//	}
//	
//	public List<productVo> listSearch(CriteriaSum cri){
//		return sqlSessionTemplate.selectList("productVo.list_search", cri);
//	}
//	
//	public int listSearchCount(CriteriaSum cri) {
//		return sqlSessionTemplate.selectOne("productVo.list_search_count", cri);
//	}

	public int delete(productVo productVo) {
		return this.sqlSessionTemplate.delete("productVo.delete", productVo);
	}

	public int update(productVo productVo) {
		return sqlSessionTemplate.update("productVo.update", productVo);
	}
//	내가 하는 것. 
//	public void addCart(cartVo cartVo) throws Exception {
//		return sqlSessionTemplate.insert("cartVo.addcart", cartVo);	
//	}
	
}
