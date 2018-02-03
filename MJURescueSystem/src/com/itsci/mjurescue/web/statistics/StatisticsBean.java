package com.itsci.mjurescue.web.statistics;

import com.itsci.mjurescue.notification.NotificationBean;

public class StatisticsBean {
	private String year = "";
	private int green;
	private int red;
	private int yellow;
	private String quarter = "";
	private NotificationBean notificationBean;
	
	public StatisticsBean() {
		super();
	}
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}

	
	
	public int getGreen() {
		return green;
	}

	public void setGreen(int green) {
		this.green = green;
	}

	public int getRed() {
		return red;
	}

	public void setRed(int red) {
		this.red = red;
	}

	public int getYellow() {
		return yellow;
	}

	public void setYellow(int yellow) {
		this.yellow = yellow;
	}
	
	

	public String getQuarter() {
		return quarter;
	}

	public void setQuarter(String quarter) {
		this.quarter = quarter;
	}

	public NotificationBean getNotificationBean() {
		return notificationBean;
	}
	public void setNotificationBean(NotificationBean notificationBean) {
		this.notificationBean = notificationBean;
	}
	
	

}
