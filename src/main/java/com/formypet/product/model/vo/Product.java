package com.formypet.product.model.vo;

public class Product {
	private int proNo;
	private String proName;
	private String proCateCode;
	private int proMiddNo;
	private int price;
	private int stock;
	private String enrollDate;
	private String modifyDate;
	private String status;
	private String proMainImage;
	private String keyword;
	private int discount;
	
	private int star;
	private int reCount;
	
	public Product() {}

	
	public Product(int proNo, String proName, String proCateCode, int proMiddNo, int price, int stock,
			String enrollDate, String modifyDate, String status, String proMainImage, String keyword, int discount,
			int star, int reCount) {
		super();
		this.proNo = proNo;
		this.proName = proName;
		this.proCateCode = proCateCode;
		this.proMiddNo = proMiddNo;
		this.price = price;
		this.stock = stock;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.proMainImage = proMainImage;
		this.keyword = keyword;
		this.discount = discount;
		this.star = star;
		this.reCount = reCount;
	}


	public Product(int proNo, String proName, String proCateCode, int proMiddNo, int price, int stock, int discount, String status) {
		super();
		this.proNo = proNo;
		this.proName = proName;
		this.proCateCode = proCateCode;
		this.proMiddNo = proMiddNo;
		this.price = price;
		this.stock = stock;
		this.discount = discount;
		this.status = status;
	}

	public Product(int proNo, String proName, String proCateCode, int proMiddNo, int price, int stock,
			String enrollDate, String modifyDate, String status, String proMainImage, String keyword, int discount) {
		super();
		this.proNo = proNo;
		this.proName = proName;
		this.proCateCode = proCateCode;
		this.proMiddNo = proMiddNo;
		this.price = price;
		this.stock = stock;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.proMainImage = proMainImage;
		this.keyword = keyword;
		this.discount = discount;
	}
	


	public Product(int proNo, String proName, int price, int stock, String status, String proMainImage, int discount,
			int star, int reCount) {
		super();
		this.proNo = proNo;
		this.proName = proName;
		this.price = price;
		this.stock = stock;
		this.status = status;
		this.proMainImage = proMainImage;
		this.discount = discount;
		this.star = star;
		this.reCount = reCount;
	}


	public int getStar() {
		return star;
	}


	public void setStar(int star) {
		this.star = star;
	}


	public int getReCount() {
		return reCount;
	}


	public void setReCount(int reCount) {
		this.reCount = reCount;
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

	public String getProCateCode() {
		return proCateCode;
	}

	public void setProCateCode(String proCateCode) {
		this.proCateCode = proCateCode;
	}

	public int getProMiddNo() {
		return proMiddNo;
	}

	public void setProMiddNo(int proMiddNo) {
		this.proMiddNo = proMiddNo;
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

	public String getProMainImage() {
		return proMainImage;
	}

	public void setProMainImage(String proMainImage) {
		this.proMainImage = proMainImage;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getDiscount() {
		return discount;
	}
	
	
	
	public void setDiscount(int discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "Product [proNo=" + proNo + ", proName=" + proName + ", proCateCode=" + proCateCode + ", proMiddNo="
				+ proMiddNo + ", price=" + price + ", stock=" + stock + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", status=" + status + ", proMainImage=" + proMainImage + ", keyword=" + keyword
				+ ", discount=" + discount + "]";
	}
	
}
