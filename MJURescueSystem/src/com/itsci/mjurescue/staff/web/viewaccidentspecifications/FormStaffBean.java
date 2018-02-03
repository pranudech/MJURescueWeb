package com.itsci.mjurescue.staff.web.viewaccidentspecifications;

import java.util.Vector;

import com.itsci.mjurescue.login.StaffBean;



public class FormStaffBean {
	private String FormStaff_ID;
	private String numberOperation;
	private String receiveNotification;
	private String accidentLocation;
	private String statusCase;
	private String licensePlate;
	private String date;
	private String listOperationsOfficer;
	Vector<StaffBean> staffBeans = new Vector<StaffBean>();

	public FormStaffBean() {
		super();
	}

	public String getFormStaff_ID() {
		return FormStaff_ID;
	}

	public void setFormStaff_ID(String formStaff_ID) {
		FormStaff_ID = formStaff_ID;
	}

	public String getNumberOperation() {
		return numberOperation;
	}

	public void setNumberOperation(String numberOperation) {
		this.numberOperation = numberOperation;
	}

	public String getReceiveNotification() {
		return receiveNotification;
	}

	public void setReceiveNotification(String receiveNotification) {
		this.receiveNotification = receiveNotification;
	}

	public String getAccidentLocation() {
		return accidentLocation;
	}

	public void setAccidentLocation(String accidentLocation) {
		this.accidentLocation = accidentLocation;
	}

	public String getStatusCase() {
		return statusCase;
	}

	public void setStatusCase(String statusCase) {
		this.statusCase = statusCase;
	}

	public String getLicensePlate() {
		return licensePlate;
	}

	public void setLicensePlate(String licensePlate) {
		this.licensePlate = licensePlate;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getListOperationsOfficer() {
		return listOperationsOfficer;
	}

	public void setListOperationsOfficer(String listOperationsOfficer) {
		this.listOperationsOfficer = listOperationsOfficer;
	}

	

}

