package com.project3.camping.service;

import java.util.List;
import java.util.Map;

import com.project3.camping.vo.productVo;

public interface productVoService {
		
	public List<productVo> list(Map<String, Object> map);

	public List<productVo> proUserList(Map<String, Object> map);

	public int addProduct(productVo productVo);

	public productVo detail(productVo productVo);

	public boolean remove(productVo productVo);

	public boolean edit(productVo productVo);

//	public int addCart(cartVo cartVo) throws Exception;


//	
//	public List<productVo> listCriteria(Criteria cri);
//	
//	public int listCountCriteria(Criteria cri);
//	
//	public List<productVo> listSearchCriteria(CriteriaSum cri);
//	
//	public int listSearchCount(CriteriaSum cri);
//	
}


