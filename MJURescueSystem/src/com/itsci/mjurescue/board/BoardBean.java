package com.itsci.mjurescue.board;

public class BoardBean {
	private int boardID;
	private String position;
	private String boardName;

	public BoardBean() {
		super();
	}

	public BoardBean(int boardID, String position, String boardName) {
		super();
		this.boardID = boardID;
		this.position = position;
		this.boardName = boardName;
	}

	public int getBoardID() {
		return boardID;
	}

	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

}
