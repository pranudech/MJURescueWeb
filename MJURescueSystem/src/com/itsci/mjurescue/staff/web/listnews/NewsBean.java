package com.itsci.mjurescue.staff.web.listnews;

import java.util.Vector;

public class NewsBean {
	private int newsFeedID;
	private String title;
	private String content;
	private String date;
	private String image;
	private String staffID;
	Vector<NewsBean> vNewsBeans = new Vector<NewsBean>();
	
	public NewsBean() {
		super();
	}
	
	public NewsBean(String title, String content, String date,String image) {
		super();
		
		this.title = title;
		this.content = content;
		this.date=date;
		this.image = image;
	}

	

	public int getNewsFeddID() {
		return newsFeedID;
	}

	public void setNewsFeddID(int newsFeedID) {
		this.newsFeedID = newsFeedID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getStaffID() {
		return staffID;
	}

	public void setStaffID(String staffID) {
		this.staffID = staffID;
	}

	public Vector<NewsBean> getvNewsBeans() {
		return vNewsBeans;
	}

	public void setvNewsBeans(Vector<NewsBean> vNewsBeans) {
		this.vNewsBeans = vNewsBeans;
	}

}