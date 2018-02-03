package com.itsci.mjurescue.staff.web.editspecifications;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import com.itsci.mjurescue.staff.web.listspecifications.SpecificationsBean;
import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class EditSpecificationsManager {
	private SpecificationsBean specificationsBean = new SpecificationsBean();

	public SpecificationsBean getSpecificationsBean() {
		return specificationsBean;
	}

	public SpecificationsBean getSpecificationsByID(String editID) {
		Vector<SpecificationsBean> listSpecifications = new Vector<SpecificationsBean>();
		Connection conn = MySQLConnectionPool.getConnection();
		try {

			String sql1 = " SELECT * FROM formstaff  where FormStaffID = " + editID + "";
			Statement stmt1 = conn.createStatement();
			ResultSet rs = stmt1.executeQuery(sql1);

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
				listSpecifications.add(spBean);
			}
			rs.close();
			stmt1.close();

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
		return listSpecifications.get(0);
	}

	public synchronized boolean isEditAccidentData(int formID, String numberOperations,String receiveNotification, String location, String license,
			String namestaff) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_spUpdate = null;

		String sql = "UPDATE formstaff SET numberOperations = ?, receiveNotification = ?, accidentLocation = ?, licensePlate = ?, listOperationsOfficer = ? where formstaffID = ?";

		boolean result = false;
		try {
			statement_spUpdate = conn.prepareStatement(sql);

			statement_spUpdate.setString(1, numberOperations);
			statement_spUpdate.setString(2, receiveNotification);
			statement_spUpdate.setString(3, location);
			statement_spUpdate.setString(4, license);
			statement_spUpdate.setString(5, namestaff);
			statement_spUpdate.setInt(6, formID);
			statement_spUpdate.executeUpdate();

			result = true;

		} catch (SQLException ex) {
			ex.printStackTrace();
			ExceptionUtil.messageException(new Throwable(), ex);
		} finally {
			try {
				statement_spUpdate.close();
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
				ExceptionUtil.messageException(new Throwable(), ex);
			}

		}
		return result;
	}
}
