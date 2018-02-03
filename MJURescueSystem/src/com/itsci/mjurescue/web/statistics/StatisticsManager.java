package com.itsci.mjurescue.web.statistics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class StatisticsManager {
	
	public int calculateStatistics(String statusCase, String quarterOneStart, String quarterOneEnd) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_statistics = null;
		String sql_statistics = "SELECT COUNT(statusCase) FROM formstaff "+
									"WHERE statusCase = ? and date(formstaff.date) >= ? && date(formstaff.date) <= ?;";

		try {
			statement_statistics = conn.prepareStatement(sql_statistics);
			statement_statistics.setString(1, statusCase);
			statement_statistics.setString(2, quarterOneStart);
			statement_statistics.setString(3, quarterOneEnd);
			ResultSet rs = statement_statistics.executeQuery();

			if (rs.next()) {
				int count  = rs.getInt(1);
				return count;
			}
			
			rs.close();
			
		} catch (SQLException ex) {
			ExceptionUtil.messageException(new Throwable(), ex);
			
		} finally {
			
			try {
				statement_statistics.close();
				conn.close();
				
			} catch (SQLException ex) {
				ExceptionUtil.messageException(new Throwable(), ex);
				
			}
		}
		return 0;
	}
}
