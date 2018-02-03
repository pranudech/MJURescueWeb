package com.itsci.mjurescue.mobile.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class LoginManager {

	private LoginBean loginBean = new LoginBean();

	public LoginBean verifyLogin() {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_login = null;
		String sql_login = "SELECT username, password ,role FROM login where username = ? and password = ?";

		try {
			statement_login = conn.prepareStatement(sql_login);
			statement_login.setString(1, loginBean.getUsername());
			statement_login.setString(2, loginBean.getPassword());
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

	public StudentBean getStudentLogins() {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_login = null;
		String sql_login = "SELECT status FROM student WHERE studentID = ? ;";

		try {

			statement_login = conn.prepareStatement(sql_login);
			statement_login.setString(1, loginBean.getStudentBean().getStudentID());

			ResultSet rs = statement_login.executeQuery();

			if (rs.next()) {
				StudentBean studentBean = new StudentBean(rs.getString(1));
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

	public StaffBean getStaffLogins() {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_login = null;
		String sql_login = "SELECT status FROM staff WHERE StaffID = ? ;";

		try {

			statement_login = conn.prepareStatement(sql_login);
			statement_login.setString(1, loginBean.getStaffBean().getStaffID());

			ResultSet rs = statement_login.executeQuery();

			if (rs.next()) {
				StaffBean staffBean = new StaffBean(rs.getString(1));
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

	public synchronized boolean upDateTokenStaff() {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statementStaff = null;
		String sql_Staff = "UPDATE Staff SET token = ? WHERE StaffID = ? ;";
		try {
			conn.setAutoCommit(false);

			statementStaff = conn.prepareStatement(sql_Staff);
			statementStaff.setString(1, loginBean.getStaffBean().getToken());
			statementStaff.setString(2, loginBean.getStaffBean().getStaffID());
			statementStaff.executeUpdate();

			conn.commit();
			return true;

		} catch (SQLException ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

			try {

				conn.rollback();

			} catch (SQLException e) {

				ExceptionUtil.messageException(new Throwable(), ex);

			}
		} finally {
			try {

				statementStaff.close();
				conn.close();

			} catch (SQLException ex) {

				ExceptionUtil.messageException(new Throwable(), ex);

			}
		}

		return false;

	}

	public LoginBean getLoginBean() {
		return loginBean;
	}

	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}

}
