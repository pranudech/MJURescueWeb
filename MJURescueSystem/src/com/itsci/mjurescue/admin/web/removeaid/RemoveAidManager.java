package com.itsci.mjurescue.admin.web.removeaid;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class RemoveAidManager {

	public int removeAID(int aid_id) {
		Connection conn = MySQLConnectionPool.getConnection();
		String sql_deleteaid = "DELETE FROM aid WHERE aidID = " + aid_id;

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

				ExceptionUtil.messageException(new Throwable(), ex);
			}

		}
		return result;
	}

}
