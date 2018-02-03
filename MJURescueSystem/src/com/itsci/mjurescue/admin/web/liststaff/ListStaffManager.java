package com.itsci.mjurescue.admin.web.liststaff;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ListStaffManager {
	public Vector<StaffBean> getAllStaff() {
		Vector<StaffBean> listAllStaff = new Vector<StaffBean>();
		Connection conn = MySQLConnectionPool.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql = "select staffID,name,status from staff";

			ResultSet rs = stmt.executeQuery(sql);

			while ((rs.next())) {

				StaffBean staffBean = new StaffBean();
				staffBean.setStaffID(rs.getString(1));
				staffBean.setName(rs.getString(2));
				staffBean.setStatus(rs.getString(3));
				listAllStaff.add(staffBean);

			}
			return listAllStaff;

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
