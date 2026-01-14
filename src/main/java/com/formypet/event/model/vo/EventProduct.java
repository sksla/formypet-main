package com.formypet.event.model.vo;

public class EventProduct {
	private int eventNo;
	private int proNo;
	private int discount;
	
	public EventProduct(){}

	public EventProduct(int eventNo, int proNo, int discount) {
		super();
		this.eventNo = eventNo;
		this.proNo = proNo;
		this.discount = discount;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "EventProduct [eventNo=" + eventNo + ", proNo=" + proNo + ", discount=" + discount + "]";
	}
	
}
