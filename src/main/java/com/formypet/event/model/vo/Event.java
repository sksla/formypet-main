package com.formypet.event.model.vo;

import java.sql.Date;

public class Event {
	private int eventNo;
	private String eventTitle;
	private String startDate;
	private String endDate;
	private String enrollDate;
	private String eventShow;
	private String status;
	private String eventMainImgPath;

	public Event() {}

	public String getEventMainImgPath() {
		return eventMainImgPath;
	}

	public void setEventMainImgPath(String eventMainImgPath) {
		this.eventMainImgPath = eventMainImgPath;
	}

	public Event(int eventNo, String eventTitle, String startDate, String endDate, String enrollDate, String eventShow,
			String status, String eventMainImgPath) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.startDate = startDate;
		this.endDate = endDate;
		this.enrollDate = enrollDate;
		this.eventShow = eventShow;
		this.status = status;
		this.eventMainImgPath = eventMainImgPath;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getEventShow() {
		return eventShow;
	}

	public void setEventShow(String eventShow) {
		this.eventShow = eventShow;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Event [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", startDate=" + startDate + ", endDate="
				+ endDate + ", enrollDate=" + enrollDate + ", eventShow=" + eventShow + ", status=" + status + "]";
	}

}
