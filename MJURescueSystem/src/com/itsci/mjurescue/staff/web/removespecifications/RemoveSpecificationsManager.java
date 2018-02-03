package com.itsci.mjurescue.staff.web.removespecifications;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class RemoveSpecificationsManager {

	public int removeAccident(int removeID) {
		Connection conn = MySQLConnectionPool.getConnection();
		String sql_deleteaid = "DELETE FROM formstaff WHERE FormStaffID = " + removeID;

		int result = 0;
		try {
			Statement stmt = conn.createStatement();
			result = stmt.executeUpdate(sql_deleteaid);
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
				ExceptionUtil.messageException(new Throwable(), ex);
			}
		}

		return result;
	}
}
