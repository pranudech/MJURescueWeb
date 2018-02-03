package com.itsci.mjurescue.login;
import java.util.Vector;

public class StudentBean {
	private String studentID="";
	private String studentName="";
	private String studentIdCode="";
	private String address="";
	private String phoneNumber="";
	private String phoneReserve="";
	private String bloodGroup="";
	private String disease="";
	private String status="";
	private String faculty="";
	private String department="";
	Vector<StudentBean> stuBean = new Vector<StudentBean>();
	
	public StudentBean() {
		super();
	}

	public StudentBean(String studentID, String studentName, String studentIdCode, String phoneNumber,
			String phoneReserve, String bloodGroup, String disease, String address, String status,
			String faculty,String department, Vector<StudentBean> stuBean) {
		super();
		this.studentID = studentID;
		this.studentName = studentName;
		this.studentIdCode = studentIdCode;
		this.phoneNumber = phoneNumber;
		this.phoneReserve = phoneReserve;
		this.bloodGroup = bloodGroup;
		this.disease = disease;
		this.address = address;
		this.status = status;
		this.faculty = faculty;
		this.department = department;
		this.stuBean = stuBean;
	}
	
	public StudentBean(String studentID, String studentName){
		this.studentID = studentID;
		this.studentName = studentName;
	}

	public Vector<StudentBean> getStuBean() {
		return stuBean;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentIdCode() {
		return studentIdCode;
	}

	public void setStudentIdCode(String studentIdCode) {
		this.studentIdCode = studentIdCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPhoneReserve() {
		return phoneReserve;
	}

	public void setPhoneReserve(String phoneReserve) {
		this.phoneReserve = phoneReserve;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFaculty() {
		return faculty;
	}

	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
}
