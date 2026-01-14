package com.formypet.mypage.model.vo;

import java.sql.Date;

public class Order {
	
	private int proNo;
	private String proImage;
    private String proName;
    private int count;
    private int price;
    private Date orderDate;
    
    public Order() {}
	public Order(int proNo, String proImage, String proName, int count, int price, Date orderDate) {
		super();
		this.proNo = proNo;
		this.proImage = proImage;
		this.proName = proName;
		this.count = count;
		this.price = price;
		this.orderDate = orderDate;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	@Override
	public String toString() {
		return "Order [proNo=" + proNo + ", proImage=" + proImage + ", proName=" + proName + ", count=" + count
				+ ", price=" + price + ", orderDate=" + orderDate + "]";
	}
    
   
}
