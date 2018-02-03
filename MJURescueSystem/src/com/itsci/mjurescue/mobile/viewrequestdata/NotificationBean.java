package com.itsci.mjurescue.mobile.viewrequestdata;

public class NotificationBean {
	
	private int notificationID;
	private String statusWorking;
	private String date;
	private Double latitude;
	private Double longitude;
	private String represent;
	private FormStaffBean formStaffBean;
	private StudentBean studentBean;

	public NotificationBean(int notificationID, String date, Double latitude, Double longitude) {
		super();
		this.notificationID = notificationID;
		this.date = date;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
	public FormStaffBean getFormStaffBean() {
		return formStaffBean;
	}

	public void setFormStaffBean(FormStaffBean formStaffBean) {
		this.formStaffBean = formStaffBean;
	}
	
	public StudentBean getStudentBean() {
		return studentBean;
	}

	public void setStudentBean(StudentBean studentBean) {
		this.studentBean = studentBean;
	}

	public int getNotificationID() {
		return notificationID;
	}

	public String getStatusWorking() {
		return statusWorking;
	}

	public void setStatusWorking(String statusWorking) {
		this.statusWorking = statusWorking;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public String getRepresent() {
		return represent;
	}

	public void setRepresent(String represent) {
		this.represent = represent;
	}
	
	
}
