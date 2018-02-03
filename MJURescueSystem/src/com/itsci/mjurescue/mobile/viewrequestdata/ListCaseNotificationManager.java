package com.itsci.mjurescue.mobile.viewrequestdata;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ListCaseNotificationManager {

	public List<NotificationBean> getRequestData(int notificationID) {
		
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_ListCaseNotification = null;
		String sql_ListCaseNotification = "SELECT studentName, studentIdCode, phoneNumber, phoneReserve, bloodGroup, disease, statusCase,staffID, Notifications.NotificationsID,"+
											"Notifications.date, latitude, longitude FROM Notifications LEFT JOIN Student ON (Notifications.StudentID = Student.StudentID)"+
											"RIGHT JOIN formstaff ON (Notifications.NotificationsID = formstaff.NotificationsID)"+
											"WHERE Notifications.NotificationsID = ? ;";
		Vector<NotificationBean> list_NotificationBean = new Vector<NotificationBean>();
		
		try {

			statement_ListCaseNotification = conn.prepareStatement(sql_ListCaseNotification);
			statement_ListCaseNotification.setInt(1, notificationID);
			ResultSet rs = statement_ListCaseNotification.executeQuery();

			while (rs.next()) {
				StudentBean studentBean = new StudentBean(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
				FormStaffBean formStaff = new FormStaffBean(rs.getString(7),rs.getString(8));
				NotificationBean notificationBean = new NotificationBean(rs.getInt(9),rs.getString(10),rs.getDouble(11),rs.getDouble(12));
				
				notificationBean.setStudentBean(studentBean);
				notificationBean.setFormStaffBean(formStaff);
				list_NotificationBean.add(notificationBean);
			}
			
			rs.close();
			
		} catch (SQLException ex) {
			
			ExceptionUtil.messageException(new Throwable(), ex);
			
		} finally {

			try {

				statement_ListCaseNotification.close();
				conn.close();

			} catch (SQLException ex) {
				
				ExceptionUtil.messageException(new Throwable(), ex);
			}
			
		}
		return list_NotificationBean;
	}

	public synchronized boolean setUpdateStatus(String notificationID, String staffID) {
		
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statementNotification = null;
		String sql_Notification = "UPDATE notifications SET StaffID = ? WHERE NotificationsID = ? ;";
		try {
			conn.setAutoCommit(false);
			statementNotification = conn.prepareStatement(sql_Notification);
			statementNotification.setString(1, staffID);
			statementNotification.setInt(2, Integer.parseInt(notificationID));
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
