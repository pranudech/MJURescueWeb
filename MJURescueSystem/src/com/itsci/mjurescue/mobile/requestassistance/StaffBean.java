package com.itsci.mjurescue.mobile.requestassistance;

public class StaffBean {
	private String staffID;
	private String name;
	private String token;
	
	public StaffBean(String staffID, String token) {
		super();
		this.staffID = staffID;
		this.token = token;
	}
	
	public StaffBean() {
		super();
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
	
	

}
