package com.project3.camping.domain;

//검색기준, 분류기준
public class CriteriaSum {
	
	private int page;
	private int perPageNum;
	private String searchType;
	private String keyword;
	
	
	public CriteriaSum() {
	}
	
	public CriteriaSum(int page, int perPageNum, String searchType, String keyword) {
		super();
		this.page = 1;
		this.perPageNum = 10;
		this.searchType = searchType;
		this.keyword = keyword;
	}

	public void setPage(int page) {
		if(page<=0) {
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	//method for MyBatis SQL Mapper
	
	public int getPageStart() {
		return (this.page - 1)*perPageNum;
	}
	
	//method for MyBatis SQL Mapper
	
	public int getPerPageNum() {
		return this.perPageNum;
	}


	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "CriteriaSum [page=" + page + ", perPageNum=" + perPageNum + ", searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}

	
	

	
	


}
