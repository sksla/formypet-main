package com.formypet.mypage.model.vo;

import java.sql.Date;

/**
 * @author GD
 *
 */
public class Point {

	private int userNo; // 회원 번호
	private int orderNo; // 주문 번호
	private Date pointDate; // 포인트 날짜
	private int pointAdd; // 포인트 추가 금액
	private int pointUse; // 포인트 사용 금액
	private int pointReason; // 포인트 사유 (1회원가입, 2주문)
	
	public Point() {}
	public Point(int userNo, int orderNo, Date pointDate, int pointAdd, int pointUse, int pointReason) {
		super();
		this.userNo = userNo;
		this.orderNo = orderNo;
		this.pointDate = pointDate;
		this.pointAdd = pointAdd;
		this.pointUse = pointUse;
		this.pointReason = pointReason;
	}
	
	
	public Point(int pointAdd, int pointUse) {
		super();
		this.pointAdd = pointAdd;
		this.pointUse = pointUse;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public Date getPointDate() {
		return pointDate;
	}
	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}
	public int getPointAdd() {
		return pointAdd;
	}
	public void setPointAdd(int pointAdd) {
		this.pointAdd = pointAdd;
	}
	public int getPointUse() {
		return pointUse;
	}
	public void setPointUse(int pointUse) {
		this.pointUse = pointUse;
	}
	public int getPointReason() {
		return pointReason;
	}
	public void setPointReason(int pointReason) {
		this.pointReason = pointReason;
	}
	
	@Override
	public String toString() {
		return "Point [userNo=" + userNo + ", orderNo=" + orderNo + ", pointDate=" + pointDate + ", pointAdd="
				+ pointAdd + ", pointUse=" + pointUse + ", pointReason=" + pointReason + "]";
	}
	
	
	
	
	
}
