package com.formypet.order.model.vo;

public class Order {
	private int orderNo;
	private int userNo;
	private String orderDate;
	private String post;
	private String address;
	private String addressDetail;
	private String receiver;
	private String phone;
	private int paymentNo;
	private String paymentType;
	private String paymentStatus;
	private String orderMessage;
	private int totalAmount;
	private int pointUse;
	
	public Order() {}
	
	public Order(int orderNo, int userNo, String orderDate, String post, String address, String addressDetail,
			String receiver, String phone, int paymentNo, String paymentType, String paymentStatus, String orderMessage,
			int totalAmount, int pointUse) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.orderDate = orderDate;
		this.post = post;
		this.address = address;
		this.addressDetail = addressDetail;
		this.receiver = receiver;
		this.phone = phone;
		this.paymentNo = paymentNo;
		this.paymentType = paymentType;
		this.paymentStatus = paymentStatus;
		this.orderMessage = orderMessage;
		this.totalAmount = totalAmount;
		this.pointUse = pointUse;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userNo=" + userNo + ", orderDate=" + orderDate + ", post=" + post
				+ ", address=" + address + ", addressDetail=" + addressDetail + ", receiver=" + receiver + ", phone="
				+ phone + ", paymentNo=" + paymentNo + ", paymentType=" + paymentType + ", paymentStatus="
				+ paymentStatus + ", orderMessage=" + orderMessage + ", totalAmount=" + totalAmount + ", pointUse="
				+ pointUse + "]";
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getOrderMessage() {
		return orderMessage;
	}

	public void setOrderMessage(String orderMessage) {
		this.orderMessage = orderMessage;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public int getPointUse() {
		return pointUse;
	}

	public void setPointUse(int pointUse) {
		this.pointUse = pointUse;
	}
	
}
