package com.formypet.order.model.vo;

public class OrderDetail {
	private int odDetailNo;
	private int orderNo;
	private int proNo;
	private int count;
	private int price;
	private String refund;
	private int deliStatus;
	private int status;
	private int packageNo;
	private int trackingNo;
	private String orderDate;
	private String userName;
	private String userId;
	private String phone;
	private String address;
	private String code;
	private String proName;
	
	
	public OrderDetail() {}


	public OrderDetail(int odDetailNo, int orderNo, int proNo, int count, int price, String refund, int deliStatus,
			int status, int packageNo, int trackingNo, String orderDate, String userName, String userId, String phone,
			String address, String code, String proName) {
		super();
		this.odDetailNo = odDetailNo;
		this.orderNo = orderNo;
		this.proNo = proNo;
		this.count = count;
		this.price = price;
		this.refund = refund;
		this.deliStatus = deliStatus;
		this.status = status;
		this.packageNo = packageNo;
		this.trackingNo = trackingNo;
		this.orderDate = orderDate;
		this.userName = userName;
		this.userId = userId;
		this.phone = phone;
		this.address = address;
		this.code = code;
		this.proName = proName;
	}


	public int getOdDetailNo() {
		return odDetailNo;
	}


	public void setOdDetailNo(int odDetailNo) {
		this.odDetailNo = odDetailNo;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getRefund() {
		return refund;
	}


	public void setRefund(String refund) {
		this.refund = refund;
	}


	public int getDeliStatus() {
		return deliStatus;
	}


	public void setDeliStatus(int deliStatus) {
		this.deliStatus = deliStatus;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getPackageNo() {
		return packageNo;
	}


	public void setPackageNo(int packageNo) {
		this.packageNo = packageNo;
	}


	public int getTrackingNo() {
		return trackingNo;
	}


	public void setTrackingNo(int trackingNo) {
		this.trackingNo = trackingNo;
	}


	public String getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getProName() {
		return proName;
	}


	public void setProName(String proName) {
		this.proName = proName;
	}


	@Override
	public String toString() {
		return "OrderDetail [odDetailNo=" + odDetailNo + ", orderNo=" + orderNo + ", proNo=" + proNo + ", count="
				+ count + ", price=" + price + ", refund=" + refund + ", deliStatus=" + deliStatus + ", status="
				+ status + ", packageNo=" + packageNo + ", trackingNo=" + trackingNo + ", orderDate=" + orderDate
				+ ", userName=" + userName + ", userId=" + userId + ", phone=" + phone + ", address=" + address
				+ ", code=" + code + ", proName=" + proName + "]";
	}

	
}
