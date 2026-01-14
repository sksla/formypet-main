package com.formypet.order.model.vo;

import java.sql.Date;

public class Cart {
	private int cartNo;
	private int cartUser;
	private int cartPro;
	private int cartCount;
	private Date cartDate;
	private int cartPrice;
	
	public Cart() {}
	
	public Cart(int cartNo, int cartUser, int cartPro, int cartCount, Date cartDate, int cartPrice) {
		super();
		this.cartNo = cartNo;
		this.cartUser = cartUser;
		this.cartPro = cartPro;
		this.cartCount = cartCount;
		this.cartDate = cartDate;
		this.cartPrice = cartPrice;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getCartUser() {
		return cartUser;
	}
	public void setCartUser(int cartUser) {
		this.cartUser = cartUser;
	}
	public int getCartPro() {
		return cartPro;
	}
	public void setCartPro(int cartPro) {
		this.cartPro = cartPro;
	}
	public int getCartCount() {
		return cartCount;
	}
	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
	public Date getCartDate() {
		return cartDate;
	}
	public void setCartDate(Date cartDate) {
		this.cartDate = cartDate;
	}
	public int getCartPrice() {
		return cartPrice;
	}
	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}
	
	

}
