package com.itsci.mjurescue.admin.web.changestudentstatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ChangeStudentStatusManager {

	public Vector<StudentBean> getStudentToChange(String faculty, String year, String status) {

		Vector<StudentBean> listAllStudent = new Vector<StudentBean>();
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_student = null;
		String sql_student = "select StudentID, studentName,year,status from student where Faculty = ? and year = ? and status = ? ;";

		try {
			statement_student = conn.prepareStatement(sql_student);
			statement_student.setString(1, faculty);
			statement_student.setString(2, year);
			statement_student.setString(3, status);
			ResultSet rs = statement_student.executeQuery();

			while (rs.next()) {
				StudentBean studentBean = new StudentBean();
				studentBean.setStudentID(rs.getString(1));
				studentBean.setStudentName(rs.getString(2));
				studentBean.setStatus(rs.getString(4));

				listAllStudent.add(studentBean);
			}
			
			return listAllStudent;
			
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

	public synchronized boolean upDateStudentStatus(String studentid,String change) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_StudentUpdate = null;

		String sql_StudentUpdate = "UPDATE student SET status = ? WHERE StudentID = ? ;";

		boolean result = false;
		try {
			statement_StudentUpdate = conn.prepareStatement(sql_StudentUpdate);
			statement_StudentUpdate.setString(1, change);
			statement_StudentUpdate.setString(2, studentid);
			statement_StudentUpdate.executeUpdate();

			result = true;

		} catch (SQLException ex) {
			ex.printStackTrace();
			ExceptionUtil.messageException(new Throwable(), ex);
		} finally {
			try {
				statement_StudentUpdate.close();
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
				ExceptionUtil.messageException(new Throwable(), ex);
			}

		}
		return result;
		
	}
}
