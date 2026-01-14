package com.formypet.board.model.vo;

import java.util.List;

import com.formypet.common.model.vo.Attachment;

public class Review {
	
	private int reNo; // 리뷰번호
	private int proNo; // 상품번호
	private String proName; // 상품명
	private String reWriter; // 등록시 회원번호 | 조회시 회원아이디
	private String reTitle; // 리뷰 제목
	private String reContent; // 리뷰 내용
	private int reStar; // 별점
	private String enrollDate; // 등록일
	private String modifyDate; // 수정일
	private int readCount;	// 조회수
	private String status;	// 리뷰글상태
	private int macroNo;	// 매크로번호
	private String review;	// 리뷰답변내용
	private List<Attachment> atList;	// 첨부파일 
	
	public Review() {}

	
	
	public Review(int reNo, int reStar, String reTitle, String reWriter,  String enrollDate, String reContent, String review) {

		super();
		this.reNo = reNo;
		this.reStar = reStar;
		this.reTitle = reTitle;
		this.reWriter = reWriter;
		this.enrollDate = enrollDate;
		this.reContent = reContent;
		this.review = review;
	}



	public Review(int reNo, int proNo, String proName, String reWriter, String reTitle, String reContent, int reStar,
			String enrollDate, String modifyDate, int readCount, String status, int macroNo, String review,
			List<Attachment> atList) {
		super();
		this.reNo = reNo;
		this.proNo = proNo;
		this.proName = proName;
		this.reWriter = reWriter;
		this.reTitle = reTitle;
		this.reContent = reContent;
		this.reStar = reStar;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.readCount = readCount;
		this.status = status;
		this.macroNo = macroNo;
		this.review = review;
		this.atList = atList;
	}

	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
		this.reNo = reNo;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getReWriter() {
		return reWriter;
	}

	public void setReWriter(String reWriter) {
		this.reWriter = reWriter;
	}

	public String getReTitle() {
		return reTitle;
	}

	public void setReTitle(String reTitle) {
		this.reTitle = reTitle;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public int getReStar() {
		return reStar;
	}

	public void setReStar(int reStar) {
		this.reStar = reStar;
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

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMacroNo() {
		return macroNo;
	}

	public void setMacroNo(int macroNo) {
		this.macroNo = macroNo;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public List<Attachment> getAtList() {
		return atList;
	}

	public void setAtList(List<Attachment> atList) {
		this.atList = atList;
	}

	@Override
	public String toString() {
		return "Review [reNo=" + reNo + ", proNo=" + proNo + ", proName=" + proName + ", reWriter=" + reWriter
				+ ", reTitle=" + reTitle + ", reContent=" + reContent + ", reStar=" + reStar + ", enrollDate="
				+ enrollDate + ", modifyDate=" + modifyDate + ", readCount=" + readCount + ", status=" + status
				+ ", macroNo=" + macroNo + ", review=" + review + ", atList=" + atList + "]";
	}

	
	
	
	
	
	
	
	
}
