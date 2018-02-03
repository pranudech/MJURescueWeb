package com.itsci.mjurescue.mobile.requestassistance;

import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import org.json.simple.JSONObject;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class RequestAssistanceManager {

	// Method to send Notifications from server to client end.
	public final static String AUTH_KEY_FCM = "AAAAg076lGw:APA91bENrA9SOpf__V_ul2mBJ57ovyXTYzMHMMEYytUstDT642aUr12zPP3L4ZWjW7I96vlUzeDybBQdhMo80p8VBSyYPLiZSlapU3uJepdkLsYBJT9YOc9sY6BXlSSk6wxXWQM6IwKuh_XSS73vAGETaCg-KiylsQ";
	public final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";

	// userDeviceIdKey is the device id you will query from your database

	@SuppressWarnings("unchecked")
	public static void pushFCMNotification(String userDeviceIdKey, String body) throws Exception {

		String authKey = AUTH_KEY_FCM; // You FCM AUTH key
		String FMCurl = API_URL_FCM;

		URL url = new URL(FMCurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setUseCaches(false);
		conn.setDoInput(true);
		conn.setDoOutput(true);

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "key=" + authKey);
		conn.setRequestProperty("Content-Type", "application/json");

		JSONObject json = new JSONObject();
		json.put("to", userDeviceIdKey.trim());
		JSONObject info = new JSONObject();
		info.put("title", "MJU Rescue."); // Notification title
		info.put("body", body); // Notification body
		info.put("sound", "default");
		json.put("notification", info);

		OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		wr.write(json.toString());
		wr.flush();
		conn.getInputStream();
	}

	public synchronized boolean isAddRequestData(String latitude, String longitude, String studentID) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statementNotification = null;
		String sql_Notification = "INSERT INTO notifications (statusWorking, date, latitude, longitude, represent, StudentID) VALUES ( ? , Now() , ? , ? , ? , ? );";
		try {
			conn.setAutoCommit(false);
			statementNotification = conn.prepareStatement(sql_Notification);
			statementNotification.setString(1, "รอการช่วยเหลือ");
			statementNotification.setDouble(2, Double.parseDouble(latitude));
			statementNotification.setDouble(3, Double.parseDouble(longitude));
			statementNotification.setString(4, "-");
			statementNotification.setString(5, studentID);
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

	public Vector<StaffBean> getStaffID() {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_staff = null;
		String sql_staff = "SELECT StaffID,token from staff;";
		Vector<StaffBean> listStaffBeans = new Vector<StaffBean>();
		try {

			statement_staff = conn.prepareStatement(sql_staff);
			ResultSet rs = statement_staff.executeQuery();

			while (rs.next()) {
				StaffBean staffBean = new StaffBean(rs.getString(1), rs.getString(2));
				listStaffBeans.add(staffBean);
			}

			rs.close();

		} catch (SQLException ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		} finally {

			try {

				statement_staff.close();
				conn.close();

			} catch (SQLException ex) {

				ExceptionUtil.messageException(new Throwable(), ex);
			}

		}
		return listStaffBeans;
	}
	
	public int getNextIDFormStaffNotificationFK() {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_NotificationFK = null;
		String sql_NotificationFK = "SELECT MAX(NotificationsID) From Notifications;";
		int count = 0;
		try {

			statement_NotificationFK = conn.prepareStatement(sql_NotificationFK);
			ResultSet rs = statement_NotificationFK.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
				//count ++;
			}

			rs.close();

		} catch (SQLException ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		} finally {

			try {

				statement_NotificationFK.close();
				conn.close();

			} catch (SQLException ex) {

				ExceptionUtil.messageException(new Throwable(), ex);
			}

		}
		return count;
	}

	public synchronized boolean onUpdateFormStaff(String status, int NotificationFK) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statementFormStaff = null;
		String sql_FormStaff = "INSERT INTO Formstaff (statusCase, date, NotificationsID) VALUES ( ?, NOW(), ? );";
		try {
			conn.setAutoCommit(false);
			
			statementFormStaff = conn.prepareStatement(sql_FormStaff);
			statementFormStaff.setString(1, status);
			statementFormStaff.setInt(2, NotificationFK);
			statementFormStaff.executeUpdate();
		
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
				
				statementFormStaff.close();
				conn.close();
				
			} catch (SQLException ex) {
				
				ExceptionUtil.messageException(new Throwable(), ex);
				
			}
		}
		
		return false;
		
	}

}
