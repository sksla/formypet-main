package com.formypet.product.model.vo;

import java.sql.Date;

public class Stock {

	private int stockNo;
	private int proNo;
	private int count;
	private Date enrollDate;
	private String status;
	private String proMain;
	private String proSub;
	private String proName;
	private int stock;
	
	public Stock() {}

	public Stock(int stockNo, int proNo, int count, Date enrollDate, String status, String proMain, String proSub,
			String proName, int stock) {
		super();
		this.stockNo = stockNo;
		this.proNo = proNo;
		this.count = count;
		this.enrollDate = enrollDate;
		this.status = status;
		this.proMain = proMain;
		this.proSub = proSub;
		this.proName = proName;
		this.stock = stock;
	}

	public int getStockNo() {
		return stockNo;
	}

	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProMain() {
		return proMain;
	}

	public void setProMain(String proMain) {
		this.proMain = proMain;
	}

	public String getProSub() {
		return proSub;
	}

	public void setProSub(String proSub) {
		this.proSub = proSub;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	@Override
	public String toString() {
		return "Stock [stockNo=" + stockNo + ", proNo=" + proNo + ", count=" + count + ", enrollDate=" + enrollDate
				+ ", status=" + status + ", proMain=" + proMain + ", proSub=" + proSub + ", proName=" + proName
				+ ", stock=" + stock + "]";
	}

	
	
}
