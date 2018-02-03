package com.itsci.mjurescue.admin.web.addstaff;

import java.util.Vector;


public class StaffBean {
	private String staffID;
	private String name;
	private String token;
	Vector<StaffBean> staffBeans = new Vector<StaffBean>();

	public StaffBean() {

	}

	public StaffBean(String staffID, String name) {
		super();
		this.staffID = staffID;
		this.name = name;
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
