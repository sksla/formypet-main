package com.formypet.product.model.vo;

public class Wish {

	private int wishNo;
	private int userNo;
	private int proNo;
	
	public Wish() {}

	public Wish(int wishNo, int userNo, int proNo) {
		super();
		this.wishNo = wishNo;
		this.userNo = userNo;
		this.proNo = proNo;
	}

	public int getWishNo() {
		return wishNo;
	}

	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	
	
	
}
