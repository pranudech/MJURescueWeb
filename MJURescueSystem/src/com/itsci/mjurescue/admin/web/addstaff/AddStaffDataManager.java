package com.itsci.mjurescue.admin.web.addstaff;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class AddStaffDataManager {
	
	private String errorMessage = null;
	private int errorCode = 0;
	
	public synchronized boolean isAddStaffData(String staffID, String password, String staffName) {

		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_add_staff_login = null;
		PreparedStatement statement_add_staff = null;
		String sql_add_staff_login = "INSERT INTO login (Username, password, role) VALUES (?, ?, ?);";
		String sql_add_staff = "INSERT INTO staff (StaffID, name,token, status) VALUES (?, ?, ?, ?);";
		
		try {
			conn.setAutoCommit(false);
			
				statement_add_staff_login = conn.prepareStatement(sql_add_staff_login);
				statement_add_staff_login.setString(1, staffID);
				statement_add_staff_login.setString(2, password);
				statement_add_staff_login.setString(3, "staff");
				statement_add_staff_login.executeUpdate();
				
				statement_add_staff = conn.prepareStatement(sql_add_staff);
				statement_add_staff.setString(1, staffID);
				statement_add_staff.setString(2, staffName);
				statement_add_staff.setString(3, "-");
				statement_add_staff.setString(4, "Available");
				statement_add_staff.executeUpdate();

			conn.commit();
			return true;

		} catch (SQLException e) {
			try {
				conn.rollback();

			} catch (SQLException e1) {
				ExceptionUtil.messageException(new Throwable(), e);

			}
			if (e.getErrorCode() == 1062) {
				setErrorCode(e.getErrorCode());
				setErrorMessage("Duplicate entry '" + staffID+ "' for staff ID");
			}
			ExceptionUtil.messageException(new Throwable(), e);
			return false;

		} finally {
			try {
				statement_add_staff_login.close();
				statement_add_staff.close();
				conn.close();

			} catch (SQLException e) {
				ExceptionUtil.messageException(new Throwable(), e);

			}
		}
	}
	
	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public int getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}

}
