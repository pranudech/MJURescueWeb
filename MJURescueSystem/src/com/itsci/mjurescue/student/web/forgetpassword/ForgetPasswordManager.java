package com.itsci.mjurescue.student.web.forgetpassword;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itsci.mjurescue.login.LoginBean;
import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ForgetPasswordManager {
	public String getPassword(String studentID, String studentIDCode) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_getpassword = null;
		LoginBean login = new LoginBean();
		String password = "";
		String sql = "select password from login log join student stu on log.username = stu.studentID where studentID=? and studentIdCode=?";

		if (conn != null) {
			try {
				statement_getpassword = conn.prepareStatement(sql);
				statement_getpassword.setString(1, studentID);
				statement_getpassword.setString(2, studentIDCode);
				ResultSet rs = statement_getpassword.executeQuery();

				while (rs.next()) {
					login.setPassword(rs.getString("password"));
					password = login.getPassword();
				}
				rs.close();
				statement_getpassword.close();
			} catch (SQLException ex) {
				ExceptionUtil.messageException(new Throwable(), ex);
			} finally {
				try {
					statement_getpassword.close();
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
					ExceptionUtil.messageException(new Throwable(), ex);
				}
			}
		}
		return password;

	}

}
