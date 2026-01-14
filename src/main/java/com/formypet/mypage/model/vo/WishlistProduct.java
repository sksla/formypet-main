package com.formypet.mypage.model.vo;

public class WishlistProduct {

	private int proNo; // 상품 번호
	private String proImage; // 상품 이미지
	private String proName; // 상품 이름
	private int price; // 상품 가격
	private	int stock; // 상품 재고
	private	String status; // 상품 상태
	
	
	public WishlistProduct() {}


	public WishlistProduct(int proNo, String proImage, String proName, int price, int stock, String status) {
		super();
		this.proNo = proNo;
		this.proImage = proImage;
		this.proName = proName;
		this.price = price;
		this.stock = stock;
		this.status = status;
	}


	public int getProNo() {
		return proNo;
	}


	public void setProNo(int proNo) {
		this.proNo = proNo;
	}


	public String getProImage() {
		return proImage;
	}


	public void setProImage(String proImage) {
		this.proImage = proImage;
	}


	public String getProName() {
		return proName;
	}


	public void setProName(String proName) {
		this.proName = proName;
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


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "WishlistProduct [proNo=" + proNo + ", proImage=" + proImage + ", proName=" + proName + ", price="
				+ price + ", stock=" + stock + ", status=" + status + "]";
	}

	
	
}
