package com.formypet.board.model.vo;

import java.sql.Date;

public class Board {
	
	private int boardNo; // 글번호
	private String boardWriter; // 조회시 작성자 아이디(String) | 작성시 회원번호 (int) == 둘 다 만족하게 String 타입으로
	private int boardType; // 게시글 타입 (1자유 | 2포토)
	private String boardTitle; // 게시글 제목
	private String boardContent; // 게시글 내용
	private int readCount; // 조회수
	private Date enrollDate; // 등록일
	private Date modifyDate; // 수정일
	private String status; //  상태 (Y | N)
	
	private String titleImgURL;
	
	public Board() {
		
	}

	public Board(int boardNo, String boardWriter, int boardType, String boardTitle, String boardContent, int readCount,
			Date enrollDate, Date modifyDate, String status, String titleImgURL) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.readCount = readCount;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.titleImgURL = titleImgURL;
	}
	
	

	public Board(int boardNo, String boardWriter, int boardType, String boardTitle, String boardContent, int readCount,
			Date enrollDate, Date modifyDate, String status) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.readCount = readCount;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	
	

	

	public Board(int boardNo, String boardTitle, String boardWriter, Date enrollDate, int readCount) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.enrollDate = enrollDate;
		this.readCount = readCount;
	}
	
	

	public Board(int boardNo, String boardTitle, String boardWriter, Date enrollDate , int readCount, String boardContent  
			) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.enrollDate = enrollDate;
		this.readCount = readCount;
		this.boardContent = boardContent;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getTitleImgURL() {
		return titleImgURL;
	}

	public void setTitleImgURL(String titleImgURL) {
		this.titleImgURL = titleImgURL;
	}
	
	
	

}
