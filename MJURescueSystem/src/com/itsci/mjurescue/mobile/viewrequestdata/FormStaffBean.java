package com.itsci.mjurescue.mobile.viewrequestdata;

public class FormStaffBean {
	
	private String statusCase;
	private String staffID;

	public FormStaffBean(String statusCase,String staffID) {
		super();
		this.statusCase = statusCase;
		this.staffID = staffID;
	}

	public String getStatusCase() {
		return statusCase;
	}

	public void setStatusCase(String statusCase) {
		this.statusCase = statusCase;
	}

	public String getStaffID() {
		return staffID;
	}

	public void setStaffID(String staffID) {
		this.staffID = staffID;
	}
	
	

}
