package com.formypet.mypage.model.vo;

import java.sql.Date;

public class Delivery {

	private int deliveryNo; // 배송지 고유넘버 지퀀스
	private int deliveryUserNo;  // 사용자 번호
	private String deliverName; // 배송지 이름
	private String deliveryReceiver; // 수령인 이름
	private String phone; // 전화번호
	private String post; // 우편번허
	private String address; // 주소
	private String addressDetail; // 상세주소
	private Date enrollDate; // 등록일
	private Date modifyDate; // 수정일
	private char status;  // Y기본 배송지|N부가 배송지 
	
	public Delivery() {}
	public Delivery(int deliveryNo, int deliveryUserNo, String deliverName, String deliveryReceiver, String phone,
			String post, String address, String addressDetail, Date enrollDate, Date modifyDate, char status) {
		super();
		this.deliveryNo = deliveryNo;
		this.deliveryUserNo = deliveryUserNo;
		this.deliverName = deliverName;
		this.deliveryReceiver = deliveryReceiver;
		this.phone = phone;
		this.post = post;
		this.address = address;
		this.addressDetail = addressDetail;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public Delivery(int deliveryNo, String deliverName, String deliveryReceiver, String phone, String post,
			String address, String addressDetail, char status) {
		super();
		this.deliveryNo = deliveryNo;
		this.deliverName = deliverName;
		this.deliveryReceiver = deliveryReceiver;
		this.phone = phone;
		this.post = post;
		this.address = address;
		this.addressDetail = addressDetail;
		this.status = status;
	}
	
	
	public Delivery(String deliveryReceiver, String phone, String post, String address, String addressDetail,
			char status) {
		super();
		this.deliveryReceiver = deliveryReceiver;
		this.phone = phone;
		this.post = post;
		this.address = address;
		this.addressDetail = addressDetail;
		this.status = status;
	}
	
	
	public Delivery(String post, String address, String addressDetail) {
		super();
		this.post = post;
		this.address = address;
		this.addressDetail = addressDetail;
	}
	public int getDeliveryNo() {
		return deliveryNo;
	}
	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}
	public int getDeliveryUserNo() {
		return deliveryUserNo;
	}
	public void setDeliveryUserNo(int deliveryUserNo) {
		this.deliveryUserNo = deliveryUserNo;
	}
	public String getDeliverName() {
		return deliverName;
	}
	public void setDeliverName(String deliverName) {
		this.deliverName = deliverName;
	}
	public String getDeliveryReceiver() {
		return deliveryReceiver;
	}
	public void setDeliveryReceiver(String deliveryReceiver) {
		this.deliveryReceiver = deliveryReceiver;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	
	@Override
	public String toString() {
		return "Delivery [deliveryNo=" + deliveryNo + ", deliveryUserNo=" + deliveryUserNo + ", deliverName="
				+ deliverName + ", deliveryReceiver=" + deliveryReceiver + ", phone=" + phone + ", post=" + post
				+ ", address=" + address + ", addressDetail=" + addressDetail + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}

	
	
	
}
