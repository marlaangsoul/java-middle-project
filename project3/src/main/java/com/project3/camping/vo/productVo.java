package com.project3.camping.vo;

public class productVo {

	
//	  proNum INT NOT NULL AUTO_INCREMENT ,
//	  proName VARCHAR(50) NOT NULL,
//	  proPrice INT NOT NULL,
//	  proDes VARCHAR(500) NULL,
//	  proImg VARCHAR(200) NULL,
//	  proDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
//	  PRIMARY KEY (proNum));
	
	private int proNum;
	private String proName;
	private int proPrice;
	private String proDes;
	private String proImg;
	private String proDate ;
	private String proThumbImg;
	
	public productVo() {
		}
	public productVo (int proNum, String proName, int proPrice, String proDes, String proImg, String proDate, String proThumbImg) {
		super();
		this.proNum = proNum;
		this.proName = proName;
		this.proPrice = proPrice;
		this.proDes = proDes;
		this.proImg = proImg;
		this.proDate = proDate;
		this.proThumbImg = proThumbImg;
	
	}

	public productVo (String proName, String proDes) {
		super();
		this.proName = proName;
		this.proDes = proDes;
	
	}
	
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public String getProThumbImg() {
		return proThumbImg;
	}
	public void setProThumbImg(String proThumbImg) {
		this.proThumbImg = proThumbImg;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public String getProDes() {
		return proDes;
	}
	public void setProDes(String proDes) {
		this.proDes = proDes;
	}
	public String getProImg() {
		return proImg;
	}
	public void setProImg(String proImg) {
		this.proImg = proImg;
	}
	public String getProDate() {
		return proDate;
	}
	public void setProDate(String proDate) {
		this.proDate = proDate;
	}
	@Override
	public String toString() {
		return "productVo [proNum=" + proNum + ", proName=" + proName + ", proPrice=" + proPrice + ", proDes=" + proDes
				+ ", proImg=" + proImg + ", proThumbImg= " + proThumbImg + ", proDate=" + proDate + "]";
	}
}
