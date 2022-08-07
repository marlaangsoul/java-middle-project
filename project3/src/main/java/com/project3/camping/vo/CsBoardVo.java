package com.project3.camping.vo;

import java.util.Map;

public class CsBoardVo {

	/*
	 * CREATE TABLE camping.csboard ( csNum INT NOT NULL AUTO_INCREMENT, csTitle
	 * VARCHAR(50) NOT NULL, csContent TEXT NOT NULL, csWriter VARCHAR(30) NOT NULL,
	 * csRegDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, csViewCnt INT NULL
	 * DEFAULT 0, PRIMARY KEY (csNum));
	 */	
	
	private int csNum;
	private String csTitle;
	private String csContent;
	private String csWriter;
	private String csRegDate;
	private int csViewCnt;
	
	public CsBoardVo() {
	}
	
	public CsBoardVo(int csNum,String csWriter) 
	{
		super();
		this.csNum = csNum;
		this.csWriter = csWriter;
		}
	
	public CsBoardVo(int csNum, String csTitle, String csContent, String csWriter, String csRegDate, int csViewCnt) 
	{
		super();
		this.csNum = csNum;
		this.csTitle = csTitle;
		this.csContent = csContent;
		this.csWriter = csWriter;
		this.csRegDate = csRegDate;
		this.csViewCnt = csViewCnt;
		}
	
	public CsBoardVo(String csTitle, String csContent, String csWriter)
	{
		super();
		this.csTitle = csTitle;
		this.csContent = csContent;
		this.csWriter = csWriter;

		}
	
	
	public int getCsNum() {
		return csNum;
	}
	
	
	public void setCsNum(int csNum) {
		this.csNum = csNum;
	}
	public String getCsTitle() {
		return csTitle;
	}
	public void setCsTitle(String csTitle) {
		this.csTitle = csTitle;
	}
	public String getCsContent() {
		return csContent;
	}
	public void setCsContent(String csContent) {
		this.csContent = csContent;
	}
	public String getCsWriter() {
		return csWriter;
	}
	public void setCsWriter(String csWriter) {
		this.csWriter = csWriter;
	}
	public String getCsRegDate() {
		return csRegDate;
	}
	public void setCsRegDate(String csRegDate) {
		this.csRegDate = csRegDate;
	}
	public int getCsViewCnt() {
		return csViewCnt;
	}
	public void setCsViewCnt(int csViewCnt) {
		this.csViewCnt = csViewCnt;
	}	
	
	@Override
	public String toString() {
		return "csBoardVo [csNum=" + csNum + ", csTitle=" + csTitle + ", csContent=" + csContent + ", csWriter=" + csWriter
				+ ", csRegDate=" + csRegDate + ", csViewCnt=" + csViewCnt + "]";
	}
	
}
