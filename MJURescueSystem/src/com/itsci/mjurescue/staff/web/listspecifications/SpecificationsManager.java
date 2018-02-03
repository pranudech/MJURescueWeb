package com.itsci.mjurescue.staff.web.listspecifications;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class SpecificationsManager {
	public Vector<SpecificationsBean> getAllSpecifications() {
		Vector<SpecificationsBean> listSpecifications = new Vector<SpecificationsBean>();
		Connection conn = MySQLConnectionPool.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql = "select * from formstaff";

			ResultSet rs = stmt.executeQuery(sql);

			while ((rs.next())) {

				SpecificationsBean specificationsBean = new SpecificationsBean();
				specificationsBean.setFormStaffID(rs.getInt(1));
				specificationsBean.setNumberOperations(rs.getString(2));
				specificationsBean.setReceiveNotification(rs.getString(3));
				specificationsBean.setAccidentLocation(rs.getString(4));
				specificationsBean.setStatusCase(rs.getString(5));
				specificationsBean.setLicensePlate(rs.getString(6));
				specificationsBean.setDate(rs.getString(7));
				specificationsBean.setListOperationsOfficer(rs.getString(8));
				specificationsBean.setNotificationID(rs.getString(9));
				listSpecifications.add(specificationsBean);

			}
			return listSpecifications;

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
