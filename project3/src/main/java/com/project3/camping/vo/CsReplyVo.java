package com.project3.camping.vo;

public class CsReplyVo {
	
	
//			  `csReplyNum` int NOT NULL AUTO_INCREMENT,
//			  `csNum` int NOT NULL,
//			  `csReplyContent` varchar(400) DEFAULT NULL,
//			  `csReplyWriter` varchar(30) DEFAULT NULL,
//			  `csReplyRegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
//			  PRIMARY KEY (`csReplyNum`),
	
	
	private int csReplyNum;
	private int csNum;
	private String csReplyContent;
	private String csReplyWriter;
	private String csReplyRegDate;
	private String csReplyUpdateDate;
	
	public CsReplyVo() {
		// TODO Auto-generated constructor stub
	}
	
	public CsReplyVo(int csReplyNum, int csNum, String csReplyContent, String csReplyWriter, String csReplyRegDate,
			String csReplyUpdateDate) {
		super();
		this.csReplyNum = csReplyNum;
		this.csNum = csNum;
		this.csReplyContent = csReplyContent;
		this.csReplyWriter = csReplyWriter;
		this.csReplyRegDate = csReplyRegDate;
		this.csReplyUpdateDate = csReplyUpdateDate;
	}

	public int getCsReplyNum() {
		return csReplyNum;
	}

	public void setCsReplyNum(int csReplyNum) {
		this.csReplyNum = csReplyNum;
	}

	public int getCsNum() {
		return csNum;
	}

	public void setCsNum(int csNum) {
		this.csNum = csNum;
	}

	public String getCsReplyContent() {
		return csReplyContent;
	}

	public void setCsReplyContent(String csReplyContent) {
		this.csReplyContent = csReplyContent;
	}

	public String getCsReplyWriter() {
		return csReplyWriter;
	}

	public void setCsReplyWriter(String csReplyWriter) {
		this.csReplyWriter = csReplyWriter;
	}

	public String getCsReplyRegDate() {
		return csReplyRegDate;
	}

	public void setCsReplyRegDate(String csReplyRegDate) {
		this.csReplyRegDate = csReplyRegDate;
	}

	public String getCsReplyUpdateDate() {
		return csReplyUpdateDate;
	}

	public void setCsReplyUpdateDate(String csReplyUpdateDate) {
		this.csReplyUpdateDate = csReplyUpdateDate;
	}

	@Override
	public String toString() {
		return "CsReplyVo [csReplyNum=" + csReplyNum + ", csNum=" + csNum + ", csReplyContent=" + csReplyContent
				+ ", csReplyWriter=" + csReplyWriter + ", csReplyRegDate=" + csReplyRegDate + ", csReplyUpdateDate="
				+ csReplyUpdateDate + "]";
	}
	
	
	
	
	
			

}
