package com.itsci.mjurescue.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class LoginManager {
	
	public LoginBean login  = new LoginBean();
	
	
	public LoginBean verifyLogin() {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_login = null;
		String sql_login = "SELECT username, password ,role FROM login where username = ? and password = ?";

		try {
			statement_login = conn.prepareStatement(sql_login);
			statement_login.setString(1, login.getUsername());
			statement_login.setString(2, login.getPassword());
			ResultSet rs = statement_login.executeQuery();

			if (rs.next()) {
				LoginBean login = new LoginBean(rs.getString(1), rs.getString(2), rs.getString(3));
				return login;
			}
			rs.close();
		} catch (SQLException ex) {
			ExceptionUtil.messageException(new Throwable(), ex);
		} finally {
			try {
				statement_login.close();
				conn.close();
			} catch (SQLException ex) {
				ExceptionUtil.messageException(new Throwable(), ex);
			}
		}
		return null;
	}

	public StudentBean getStudentLogins(String username) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_login = null;
		String sql_login = "select s.studentID, s.studentName, s.studentIdCode,s.phoneNumber,s.phoneReserve,s.bloodGroup,s.disease,s.address,s.faculty,s.department,s.status from login l join student s on l.username = s.studentID where l.username = ?";

		try {

			statement_login = conn.prepareStatement(sql_login);
			statement_login.setString(1, username);

			ResultSet rs = statement_login.executeQuery();

			if (rs.next()) {
				StudentBean studentBean = new StudentBean();
				studentBean.setStudentID(rs.getString(1));
				studentBean.setStudentName(rs.getString(2));
				studentBean.setStudentIdCode(rs.getString(3));
				studentBean.setPhoneNumber(rs.getString(4));
				studentBean.setPhoneReserve(rs.getString(5));
				studentBean.setBloodGroup(rs.getString(6));
				studentBean.setDisease(rs.getString(7));
				studentBean.setAddress(rs.getString(8));
				studentBean.setFaculty(rs.getString(9));
				studentBean.setDepartment(rs.getString(10));
				studentBean.setStatus(rs.getString(11));
				return studentBean;
			}

			rs.close();

		} catch (SQLException ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		} finally {

			try {

				statement_login.close();
				conn.close();

			} catch (SQLException ex) {

				ExceptionUtil.messageException(new Throwable(), ex);
			}

		}
		return null;
	}
	
	public StaffBean getStaffLogins(String username, String password) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_login = null;
		String sql_login = "select s.staffID, s.name ,s.status from login l join staff s on l.username = s.staffID where l.username = ?";

		try {

			statement_login = conn.prepareStatement(sql_login);
			statement_login.setString(1, username);

			ResultSet rs = statement_login.executeQuery();

			if (rs.next()) {
				StaffBean staffBean = new StaffBean();
				staffBean.setStaffID(rs.getString(1));
				staffBean.setName(rs.getString(2));
				staffBean.setStatus(rs.getString(3));
				return staffBean;
			}

			rs.close();

		} catch (SQLException ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		} finally {

			try {

				statement_login.close();
				conn.close();

			} catch (SQLException ex) {

				ExceptionUtil.messageException(new Throwable(), ex);
			}

		}
		return null;
	}

	public LoginBean getLogin() {
		return login;
	}

	public void setLogin(LoginBean login) {
		this.login = login;
	}	
	
}
