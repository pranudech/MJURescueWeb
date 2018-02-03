package com.itsci.mjurescue.admin.web.editdataaid;

public class AidBean {
	private int aidID;
	private String title;
	private String content;
	private String image;

	public AidBean() {
		super();
	}

	public AidBean(String title, String content, String image) {
		super();
		this.title = title;
		this.content = content;
		this.image = image;
	}

	public int getAidID() {
		return aidID;
	}

	public void setAidID(int aidID) {
		this.aidID = aidID;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
