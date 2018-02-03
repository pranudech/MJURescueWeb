package com.itsci.mjurescue.student.web.changepassword;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ChangePasswordManager {
	public synchronized boolean isChangePassword(String username, String oldpassword, String password) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_passwordUpdate = null;
		String sql_passwordUpdate = "UPDATE login SET password= ? WHERE username= ? and password= ? ";
		
		try {
			conn.setAutoCommit(false);
			statement_passwordUpdate = conn.prepareStatement(sql_passwordUpdate);

			statement_passwordUpdate.setString(1, password);
			statement_passwordUpdate.setString(2, username);
			statement_passwordUpdate.setString(3, oldpassword);
			statement_passwordUpdate.executeUpdate();

			conn.commit();
			return true;

		} catch (SQLException ex) {
			try {
				conn.rollback();

			} catch (SQLException e1) {
				ExceptionUtil.messageException(new Throwable(), e1);

			}
			ex.printStackTrace();
			ExceptionUtil.messageException(new Throwable(), ex);
			return false;

		} finally {
			try {
				statement_passwordUpdate.close();
				conn.close();

			} catch (SQLException e) {
				ExceptionUtil.messageException(new Throwable(), e);

			}
		
		}
	}
}
