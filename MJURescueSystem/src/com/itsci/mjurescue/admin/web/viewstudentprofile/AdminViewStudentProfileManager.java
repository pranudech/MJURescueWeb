package com.itsci.mjurescue.admin.web.viewstudentprofile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itsci.mjurescue.login.StudentBean;
import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class AdminViewStudentProfileManager {
	public StudentBean geStudentProfileAtID(String studentID) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_student = null;
		String sql_student = "select studentID,studentName, studentIdCode,phoneNumber,phoneReserve,bloodGroup,disease,address,faculty,department from student where studentID = ?";

		try {

			statement_student = conn.prepareStatement(sql_student);
			statement_student.setString(1, studentID);

			ResultSet rs = statement_student.executeQuery();

			if (rs.next()) {
				StudentBean studentBean = new StudentBean();
				studentBean.setStudentID(rs.getString(1));
				studentBean.setStudentName(rs.getString(2));
				studentBean.setStudentIdCode(rs.getString(3));
				studentBean.setPhoneNumber(rs.getString(4));
				studentBean.setPhoneReserve(rs.getString(5));
				studentBean.setBloodGroup(rs.getString(6));
				studentBean.setDisease(rs.getString(7));
				studentBean.setAddress(rs.getString(8));
				studentBean.setFaculty(rs.getString(9));
				studentBean.setDepartment(rs.getString(10));
				return studentBean;
			}

			rs.close();

		} catch (SQLException ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		} finally {

			try {

				statement_student.close();
				conn.close();

			} catch (SQLException ex) {

				ExceptionUtil.messageException(new Throwable(), ex);
			}

		}
		return null;
	}
}
