package com.itsci.mjurescue.mobile.listcasenotification;

public class NotificationBean {
	
	private String NotificationID;
	private String statusWorking;
	private String date;
	private Double latitude;
	private Double longitude;
	private String represent;
	private FormStaffBean formStaffBean;

	public NotificationBean(String notificationID, String statusWorking, String date, Double latitude, Double longitude,
			String represent) {
		super();
		NotificationID = notificationID;
		this.statusWorking = statusWorking;
		this.date = date;
		this.latitude = latitude;
		this.longitude = longitude;
		this.represent = represent;
	}

	public FormStaffBean getFormStaffBean() {
		return formStaffBean;
	}

	public void setFormStaffBean(FormStaffBean formStaffBean) {
		this.formStaffBean = formStaffBean;
	}

	public String getNotificationID() {
		return NotificationID;
	}

	public void setNotificationID(String notificationID) {
		NotificationID = notificationID;
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
