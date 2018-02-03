package com.itsci.mjurescue.mobile.login;

public class LoginBean {
	private String username;
	private String password;
	private String role;
	private StudentBean studentBean = new StudentBean();
	private StaffBean staffBean = new StaffBean();;

	public LoginBean() {
		super();
	}

	public LoginBean(String username, String password, String role) {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public StudentBean getStudentBean() {
		return studentBean;
	}

	public void setStudentBean(StudentBean studentBean) {
		this.studentBean = studentBean;
	}

	public StaffBean getStaffBean() {
		return staffBean;
	}

	public void setStaffBean(StaffBean staffBean) {
		this.staffBean = staffBean;
	}

	
}
