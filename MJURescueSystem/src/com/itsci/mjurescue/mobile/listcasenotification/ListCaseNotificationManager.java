package com.itsci.mjurescue.mobile.listcasenotification;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ListCaseNotificationManager {

	public List<NotificationBean> getDataNotification() {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_AID = null;
		String sql_aid = "SELECT Notifications.NotificationsID,statusWorking,Notifications.date,latitude,longitude,represent,staffID,statusCase "+
							"FROM Notifications INNER JOIN formstaff ON (Notifications.NotificationsID = formstaff.NotificationsID)"+
							"WHERE statusWorking = 'รอการช่วยเหลือ' and staffID IS NOT NULL;";
		Vector<NotificationBean> list_NotificationBean = new Vector<NotificationBean>();
		
		try {

			statement_AID = conn.prepareStatement(sql_aid);
			ResultSet rs = statement_AID.executeQuery();

			while (rs.next()) {
				NotificationBean notificationBean = new NotificationBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), rs.getString(6));
				FormStaffBean formStaff = new FormStaffBean(rs.getString(7),rs.getString(8));
				notificationBean.setFormStaffBean(formStaff);
				list_NotificationBean.add(notificationBean);
			}
			
			rs.close();
			
		} catch (SQLException ex) {
			
			ExceptionUtil.messageException(new Throwable(), ex);
			
		} finally {

			try {

				statement_AID.close();
				conn.close();

			} catch (SQLException ex) {
				
				ExceptionUtil.messageException(new Throwable(), ex);
			}
			
		}
		return list_NotificationBean;
	}

	public  synchronized boolean setUpdateStatus(String notificationID) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statementNotification = null;
		String sql_Notification = "UPDATE notifications SET statusWorking = 'ช่วยเหลือแล้ว' WHERE NotificationsID = ? ;";
		try {
			conn.setAutoCommit(false);
			statementNotification = conn.prepareStatement(sql_Notification);
			statementNotification.setInt(1, Integer.parseInt(notificationID));
			statementNotification.executeUpdate();
			
			conn.commit();
			return true;
			
		} catch (SQLException ex) {
			
			ExceptionUtil.messageException(new Throwable(), ex);
			
			try {
				
				conn.rollback();
				
			} catch (SQLException e) {
				
				ExceptionUtil.messageException(new Throwable(), ex);
				
			}
		} finally {
			try {
				
				statementNotification.close();
				conn.close();
				
			} catch (SQLException ex) {
				
				ExceptionUtil.messageException(new Throwable(), ex);
				
			}
		}
		
		return false;
	}

}
