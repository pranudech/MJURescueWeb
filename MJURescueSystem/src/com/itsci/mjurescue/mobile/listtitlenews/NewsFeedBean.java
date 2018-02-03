package com.itsci.mjurescue.mobile.listtitlenews;

public class NewsFeedBean {
	
	private String newFeedID;
	private String title;
	private String content;
	private String date;
	private String image = "";
	
	public NewsFeedBean(String newFeedID, String title, String content, String date, String image) {
		super();
		this.newFeedID = newFeedID;
		this.title = title;
		this.content = content;
		this.date = date;
		this.image = image;
	}

	public String getNewFeedID() {
		return newFeedID;
	}

	public void setNewFeedID(String newFeedID) {
		this.newFeedID = newFeedID;
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
	
	

}
