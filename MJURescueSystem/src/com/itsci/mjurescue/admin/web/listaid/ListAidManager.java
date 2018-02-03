package com.itsci.mjurescue.admin.web.listaid;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ListAidManager {
	public Vector<AidBean> getAllTitle() {
		Vector<AidBean> listAllTitle = new Vector<AidBean>();
		Connection conn = MySQLConnectionPool.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql = "select * from aid";

			ResultSet rs = stmt.executeQuery(sql);

			while ((rs.next())) {

				AidBean aidbean = new AidBean();
				aidbean.setAidID(rs.getInt(1));
				aidbean.setTitle(rs.getString(2));
				aidbean.setContent(rs.getString(3));
				listAllTitle.add(aidbean);

			}
			return listAllTitle;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException ex) {
				System.out.println(ex.getMessage());
			}
		}
		return null;
	}
	
	
}
