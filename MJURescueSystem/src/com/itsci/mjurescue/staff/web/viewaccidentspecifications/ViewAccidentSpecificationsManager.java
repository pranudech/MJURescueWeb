package com.itsci.mjurescue.staff.web.viewaccidentspecifications;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itsci.mjurescue.staff.web.listspecifications.SpecificationsBean;
import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ViewAccidentSpecificationsManager {
	
	private FormStaffBean formStaffBean = new FormStaffBean();

	public SpecificationsBean getSpecificationsByID(String specificationID) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_staff = null;
		try {
			
			String sql = " SELECT * FROM formstaff  where FormStaffID = ?";			
			statement_staff = conn.prepareStatement(sql);
			statement_staff.setString(1, specificationID);
			ResultSet rs = statement_staff.executeQuery();

			while (rs.next()) {
				SpecificationsBean spBean = new SpecificationsBean();
				spBean.setFormStaffID(rs.getInt(1));
				spBean.setNumberOperations(rs.getString(2));
				spBean.setReceiveNotification(rs.getString(3));
				spBean.setAccidentLocation(rs.getString(4));
				spBean.setStatusCase(rs.getString(5));
				spBean.setLicensePlate(rs.getString(6));
				spBean.setDate(rs.getString(7));
				spBean.setListOperationsOfficer(rs.getString(8));
				spBean.setNotificationID(rs.getString(9));
				return spBean;
			}
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				statement_staff.close();
				conn.close();
			} catch (SQLException ex) {
				ExceptionUtil.messageException(new Throwable(), ex);
			}
		}
		return null;
	}
}
