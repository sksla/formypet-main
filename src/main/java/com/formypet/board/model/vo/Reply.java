package com.formypet.board.model.vo;

public class Reply {
	
	
	private int replyNo;			// 댓글번호
	private String replyWriter;		// 댓글 등록시 회원번호 | 댓글 조회시 회원아이디
	private int refBoardType;	
	private int refBno; 			// REPLY_BNO => 참조하는 게시글번호
	private String replyContent;	// 댓글 내용
	private String enrollDate;		// 등록일 
	private String status;			// 상태 (Y | N)

	public Reply() {}

	public Reply(int replyNo, String replyWriter, int refBoardType, int refBno, String replyContent, String enrollDate,
			String status) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.refBoardType = refBoardType;
		this.refBno = refBno;
		this.replyContent = replyContent;
		this.enrollDate = enrollDate;
		this.status = status;
	}
	
	
	

	public Reply(int replyNo, String replyWriter, String replyContent, String enrollDate) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.enrollDate = enrollDate;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public int getRefBoardType() {
		return refBoardType;
	}

	public void setRefBoardType(int refBoardType) {
		this.refBoardType = refBoardType;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enroll_date) {
		this.enrollDate = enroll_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyWriter=" + replyWriter + ", refBoardType=" + refBoardType
				+ ", refBno=" + refBno + ", replyContent=" + replyContent + ", enrollDate=" + enrollDate + ", status="
				+ status + "]";
	}

	
	
	
}
