package com.itsci.mjurescue.admin.web.liststaff;

import java.util.Vector;

import com.itsci.mjurescue.report.ReportBean;

public class StaffBean {
	private String staffID;
	private String name;
	private ReportBean token;
	private String status;
	Vector<StaffBean> staffBeans = new Vector<StaffBean>();

	public StaffBean() {
		super();
	}

	public StaffBean(String staffID, String name, String status,ReportBean token) {
		super();
		this.staffID = staffID;
		this.name = name;
		this.status = status;
		this.token = token;
	}

	public String getStaffID() {return staffID;}
	public void setStaffID(String staffID) {this.staffID = staffID;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public ReportBean getToken() {return token;}
	public void setToken(ReportBean token) {this.token = token;}
	public Vector<StaffBean> getStaffBeans() {return staffBeans;}
	public void setStaffBeans(Vector<StaffBean> staffBeans) {this.staffBeans = staffBeans;}
}
