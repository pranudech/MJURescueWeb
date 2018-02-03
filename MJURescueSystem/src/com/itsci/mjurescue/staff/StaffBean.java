package com.itsci.mjurescue.staff;

import java.util.Vector;
import com.itsci.mjurescue.report.ReportBean;

public class StaffBean {
	private String staffID;
	private String name;
	private ReportBean token;
	Vector<StaffBean> staffBeans = new Vector<StaffBean>();

	public StaffBean() {
		super();
	}

	public StaffBean(String staffID, String name, ReportBean token) {
		super();
		this.staffID = staffID;
		this.name = name;
		this.token = token;
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

	public ReportBean getToken() {
		return token;
	}

	public void setToken(ReportBean token) {
		this.token = token;
	}

	public Vector<StaffBean> getStaffBeans() {
		return staffBeans;
	}

	public void setStaffBeans(Vector<StaffBean> staffBeans) {
		this.staffBeans = staffBeans;
	}

}
