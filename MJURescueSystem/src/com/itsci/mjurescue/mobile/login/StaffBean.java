package com.itsci.mjurescue.mobile.login;

public class StaffBean {
	private String staffID;
	private String name;
	private String token;
	private String status;

	public StaffBean() {
		super();
	}

	public StaffBean(String status) {
		super();
		this.status = status;
	}

	public String getStaffID() {
		return staffID;
	}

	public void setStaffID(String staffID) {
		this.staffID = staffID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	
}
