package com.itsci.mjurescue.staff.web.listspecifications;

import java.util.Vector;

public class SpecificationsBean {
	private int FormStaffID ;
	private String numberOperations = "";
	private String receiveNotification= "";
	private String accidentLocation= "";
	private String statusCase= "";
	private String licensePlate= "";
	private String date= "";
	private String listOperationsOfficer= "";
	private String NotificationID;
	Vector<SpecificationsBean> specificationsBeans = new Vector<SpecificationsBean>();

	public SpecificationsBean() {
		super();
	}

	public SpecificationsBean(int formStaffID, String numberOperations, String receiveNotification,
			String accidentLocation, String statusCase, String licensePlate, String date, String listOperationsOfficer,
			String notificationID, Vector<SpecificationsBean> specificationsBeans) {
		super();
		FormStaffID = formStaffID;
		this.numberOperations = numberOperations;
		this.receiveNotification = receiveNotification;
		this.accidentLocation = accidentLocation;
		this.statusCase = statusCase;
		this.licensePlate = licensePlate;
		this.date = date;
		this.listOperationsOfficer = listOperationsOfficer;
		NotificationID = notificationID;
		this.specificationsBeans = specificationsBeans;
	}

	public int getFormStaffID() {
		return FormStaffID;
	}

	public void setFormStaffID(int formStaffID) {
		FormStaffID = formStaffID;
	}

	public String getNumberOperations() {
		return numberOperations;
	}

	public void setNumberOperations(String numberOperations) {
		this.numberOperations = numberOperations;
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

	public String getNotificationID() {
		return NotificationID;
	}

	public void setNotificationID(String notificationID) {
		NotificationID = notificationID;
	}

	public Vector<SpecificationsBean> getSpecificationsBeans() {
		return specificationsBeans;
	}

	public void setSpecificationsBeans(Vector<SpecificationsBean> specificationsBeans) {
		this.specificationsBeans = specificationsBeans;
	}

	

}
