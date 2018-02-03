package com.itsci.mjurescue.mobile.listcasenotification;

public class FormStaffBean {
	
	private String staffID;
	private String statusCase;
	
	
	public FormStaffBean(String staffid,String statusCase) {
		super();
		this.staffID = staffid;
		this.statusCase = statusCase;
		
	}

	public String getStatusCase() {
		return statusCase;
	}

	public void setStatusCase(String statusCase) {
		this.statusCase = statusCase;
	}

	public String getStaffid() {
		return staffID;
	}

	public void setStaffid(String staffid) {
		this.staffID = staffid;
	}

	

}
