package com.formypet.cs.model.vo;

public class Qna {
	
	private int qnaNo;
	private String qnaWriter;	// insert(작성시)=> 회원번호 | select(조회시) => 회원아이디
	private String category;	// insert(작성시)=> 카테고리번호 | select(조회시) => 카테고리명
	private String qnaTitle;	
	private String qnaContent;
	private String enrollDate;
	private String modifyDate;
	private String status; // Y|N|D
	private String answerWriter;	// 답변자 insert(작성시)=> 회원번호 | select(조회시) => 회원아이디
	private String answerContent;	
	private String answerDate;
	
	public Qna() {}

	public Qna(int qnaNo, String qnaWriter, String category, String qnaTitle, String qnaContent, String enrollDate,
			String modifyDate, String status, String answerWriter, String answerContent, String answerDate) {
		super();
		this.qnaNo = qnaNo;
		this.qnaWriter = qnaWriter;
		this.category = category;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.answerWriter = answerWriter;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
	}
	
	

	public Qna(int qnaNo, String qnaWriter, String category, String qnaTitle, String qnaContent, String enrollDate,
			String status) {
		super();
		this.qnaNo = qnaNo;
		this.qnaWriter = qnaWriter;
		this.category = category;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.enrollDate = enrollDate;
		this.status = status;
	}
	
	

	public Qna(String qnaWriter, String category, String qnaTitle, String qnaContent) {
		super();
		this.category = category;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWriter = qnaWriter;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAnswerWriter() {
		return answerWriter;
	}

	public void setAnswerWriter(String answerWriter) {
		this.answerWriter = answerWriter;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}

	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", qnaWriter=" + qnaWriter + ", category=" + category + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", status=" + status + ", answerWriter=" + answerWriter + ", answerContent=" + answerContent
				+ ", answerDate=" + answerDate + "]";
	}
	

}
