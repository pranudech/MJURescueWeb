package com.itsci.mjurescue.mobile.viewstudentprofile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ViewStudentProfileManager {
	
	public StudentBean getStudentProfile(String studentId) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_login = null;
		String sql_login = "SELECT studentID, studentName, studentIdCode, phoneNumber, phoneReserve, bloodGroup, disease, address, Faculty, Department, status FROM student where studentID = ?;";
		
		try {

			statement_login = conn.prepareStatement(sql_login);
			statement_login.setString(1, studentId);
			ResultSet rs = statement_login.executeQuery();

			if (rs.next()) {
				StudentBean studentBeen = new StudentBean(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11));
				return studentBeen;
			}
			
			rs.close();
			
		} catch (SQLException ex) {
			
			ExceptionUtil.messageException(new Throwable(), ex);
			
		} finally {

			try {

				statement_login.close();
				conn.close();

			} catch (SQLException ex) {
				
				ExceptionUtil.messageException(new Throwable(), ex);
			}
			
		}
		return null;
	}

}
