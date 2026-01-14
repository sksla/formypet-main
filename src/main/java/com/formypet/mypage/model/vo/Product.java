package com.formypet.mypage.model.vo;

import java.sql.Date;

public class Product {

	
	private int proNo; // 상품 번호
	private String proName; // 상품 명
	private char proCateCode; // 상품 카테고리 대분류 번호 (A|C|D)
	private int PRO_MIDD_NO; // 상품 카테고리 중분류 번호 (1|2|3)
	private int price; // 상품 가격
	private int stock; // 상품 재고
	private Date enrollDate; // 상품 등록일
	private Date modifyDate; // 상품 변경일
	private char status; // 상품 상태 (Y|N|E)
	private String proMainImage; // 상품 이미지 경로
	private String keyWord; // 키워드
	
	
	public Product() {}

	public Product(int proNo, String proName, char proCateCode, int pRO_MIDD_NO, int price, int stock, Date enrollDate,
			Date modifyDate, char status, String proMainImage, String keyWord) {
		super();
		this.proNo = proNo;
		this.proName = proName;
		this.proCateCode = proCateCode;
		PRO_MIDD_NO = pRO_MIDD_NO;
		this.price = price;
		this.stock = stock;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.proMainImage = proMainImage;
		this.keyWord = keyWord;
	}
	
	public Product(int stock) {
		super();
		this.stock = stock;
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


	public char getProCateCode() {
		return proCateCode;
	}


	public void setProCateCode(char proCateCode) {
		this.proCateCode = proCateCode;
	}


	public int getPRO_MIDD_NO() {
		return PRO_MIDD_NO;
	}


	public void setPRO_MIDD_NO(int pRO_MIDD_NO) {
		PRO_MIDD_NO = pRO_MIDD_NO;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getStock() {
		return stock;
	}


	public void setStock(int stock) {
		this.stock = stock;
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


	public char getStatus() {
		return status;
	}


	public void setStatus(char status) {
		this.status = status;
	}


	public String getProMainImage() {
		return proMainImage;
	}


	public void setProMainImage(String proMainImage) {
		this.proMainImage = proMainImage;
	}


	public String getKeyWord() {
		return keyWord;
	}


	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}


	@Override
	public String toString() {
		return "PRODUCT [proNo=" + proNo + ", proName=" + proName + ", proCateCode=" + proCateCode + ", PRO_MIDD_NO="
				+ PRO_MIDD_NO + ", price=" + price + ", stock=" + stock + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", status=" + status + ", proMainImage=" + proMainImage + ", keyWord=" + keyWord + "]";
	}
	
	
	
}
