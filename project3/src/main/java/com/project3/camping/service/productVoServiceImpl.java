package com.project3.camping.service;

import java.util.List;
import java.util.Map;

import com.project3.camping.dao.productVoDao;
import com.project3.camping.vo.productVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class productVoServiceImpl implements productVoService{
	
	@Autowired
	productVoDao dao;
	
	public productVoServiceImpl() {
		System.out.println("@Service 스프링 자동 생성");
	}
	
	@Override
	public List<productVo> list(Map<String, Object> map) {
		return dao.selectList(map);
	}
	
	@Override
	public int addProduct(productVo productVo) {
		return dao.insert(productVo);
	}
	
	@Override
	public productVo detail(productVo productVo) {
		return dao.selectDetail(productVo);
	}

	@Override
	public boolean remove(productVo productVo) {
		return dao.delete(productVo) == 1;
	}

	@Override
	public boolean edit(productVo productVo) {
		return dao.update(productVo) == 1;
	}

	@Override
	public List<productVo> proUserList(Map<String, Object> map) {
		return dao.selectList(map);
	}

//	@Override
//	public int addCart(cartVo cartVo){
//		return dao.addCart(cartVo);
//	}
//	
//	@Override
//	public List<productVo> listCriteria(Criteria cri) {
//		return dao.listCriteria(cri);
//	}
//
//	@Override
//	public int listCountCriteria(Criteria cri) {
//		return dao.countPaging(cri);
//	}

//	@Override
//	public List<productVo> listSearchCriteria(CriteriaSum cri) {
//		cri.setPerPageNum(10);
//		return dao.listSearch(cri);
//	}
//
//	@Override
//	public int listSearchCount(CriteriaSum cri) {
//		return dao.listSearchCount(cri);
//	}
	
}
