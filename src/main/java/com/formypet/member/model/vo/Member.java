package com.formypet.member.model.vo;

import java.sql.Date;

public class Member {

	private int userNo;
	private String userId;
	private String userPwd;
    private String userName;
    private String userBirth;
    private String gender;
    private String email; 
    private String phone;
    private String address;
    private String addressDetail;
    private String addressPost;
    private Date enrollDate;
    private Date modifyDate;
    private String status;
    private int statusSns;
    private int statusEmail;
    private Date resignDate;
    private String petType;
    private String petName; 
    private String petKind;
    private int petAge;
    private String petGender;
    
    public Member() {}
    
    public Member(String userName, String email) {
    	super();
    	this.userName = userName;
    	this.email = email;
    	
    }
    
    public Member(int userNo, String userId, String userPwd, String userName, String userBirth, String gender,
    		String email, String phone, String address, String addressDetail, String addressPost, Date enrollDate,
    		Date modifyDate, String status, int statusSns, int statusEmail, Date resignDate, String petType, String petName,
    		String petKind, int petAge, String petGender) {
    	super();
    	this.userNo = userNo;
    	this.userId = userId;
    	this.userPwd = userPwd;
    	this.userName = userName;
    	this.userBirth = userBirth;
    	this.gender = gender;
    	this.email = email;
    	this.phone = phone;
    	this.address = address;
    	this.addressDetail = addressDetail;
    	this.addressPost = addressPost;
    	this.enrollDate = enrollDate;
    	this.modifyDate = modifyDate;
    	this.status = status;
    	this.statusSns = statusSns;
    	this.statusEmail = statusEmail;
    	this.resignDate = resignDate;
    	this.petType = petType;
    	this.petName = petName;
    	this.petKind = petKind;
    	this.petAge = petAge;
    	this.petGender = petGender;
    }
    
    
	public Member(String userId, String userPwd, String userName, String userBirth, String gender,
			String email, String phone, String address, String addressDetail, String addressPost, int statusSns,
			int statusEmail, String petType, String petName, String petKind, int petAge, String petGender) {
		super();
		
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userBirth = userBirth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.addressDetail = addressDetail;
		this.addressPost = addressPost;
		this.statusSns = statusSns;
		this.statusEmail = statusEmail;
		this.petType = petType;
		this.petName = petName;
		this.petKind = petKind;
		this.petAge = petAge;
		this.petGender = petGender;
	}
	
	
	public Member(String userId, String userName, String userBirth, String gender, String email, String phone,
			String address, String addressDetail, String addressPost, int statusSns, int statusEmail, String petType,
			String petName, String petKind, int petAge, String petGender) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userBirth = userBirth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.addressDetail = addressDetail;
		this.addressPost = addressPost;
		this.statusSns = statusSns;
		this.statusEmail = statusEmail;
		this.petType = petType;
		this.petName = petName;
		this.petKind = petKind;
		this.petAge = petAge;
		this.petGender = petGender;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public void get(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getAddressPost() {
		return addressPost;
	}

	public void setAddressPost(String addressPost) {
		this.addressPost = addressPost;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getStatusSns() {
		return statusSns;
	}

	public void setStatusSns(int statusSns) {
		this.statusSns = statusSns;
	}

	public int getStatusEmail() {
		return statusEmail;
	}

	public void setStatusEmail(int statusEmail) {
		this.statusEmail = statusEmail;
	}

	public Date getResignDate() {
		return resignDate;
	}

	public void setResignDate(Date resignDate) {
		this.resignDate = resignDate;
	}

	public String getPetType() {
		return petType;
	}

	public void setPetType(String petType) {
		this.petType = petType;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getPetKind() {
		return petKind;
	}

	public void setPetKind(String petKind) {
		this.petKind = petKind;
	}

	public int getPetAge() {
		return petAge;
	}

	public void setPetAge(int petAge) {
		this.petAge = petAge;
	}

	public String getPetGender() {
		return petGender;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}
	

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userBirth=" + userBirth + ", gender=" + gender + ", email=" + email + ", phone=" + phone
				+ ", address=" + address + ", addressDetail=" + addressDetail + ", addressPost=" + addressPost
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status=" + status + ", statusSns="
				+ statusSns + ", statusEmail=" + statusEmail + ", resignDate=" + resignDate + ", petType=" + petType
				+ ", petName=" + petName + ", petKind=" + petKind + ", petAge=" + petAge + ", petGender=" + petGender
				+ "]";
	}












}

