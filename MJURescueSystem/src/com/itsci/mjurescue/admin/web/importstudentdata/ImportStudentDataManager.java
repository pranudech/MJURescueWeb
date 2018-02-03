package com.itsci.mjurescue.admin.web.importstudentdata;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Vector;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;


public class ImportStudentDataManager {
	
	private String errorMessage = null;
	private int errorCode = 0;
	
	public synchronized boolean isAddStudent(Vector<LoginBean> login) {

		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_add_student_login = null;
		PreparedStatement statement_add_student = null;
		String sql_add_student_login = "INSERT INTO login (Username, password, role) VALUES (?, ?, ?);";
		String sql_add_student = "INSERT INTO student (StudentID, studentName, studentIdCode, Faculty, Department, status,year) VALUES (?, ?, ?, ?, ?, ?, ?);";
		String stuID = null;
		
		try {
			conn.setAutoCommit(false);
			for (LoginBean logins : login) {
				statement_add_student_login = conn.prepareStatement(sql_add_student_login);
				stuID = logins.getStudentBean().getStudentID();
				statement_add_student_login.setString(1, logins.getStudentBean().getStudentID());
				statement_add_student_login.setString(2, logins.getPassword());
				statement_add_student_login.setString(3, "student");
				statement_add_student_login.executeUpdate();
				
				statement_add_student = conn.prepareStatement(sql_add_student);
				statement_add_student.setString(1, logins.getStudentBean().getStudentID());
				statement_add_student.setString(2, logins.getStudentBean().getStudentName());
				statement_add_student.setString(3, logins.getStudentBean().getStudentIdCode());
				statement_add_student.setString(4, logins.getStudentBean().getFaculty());
				statement_add_student.setString(5, logins.getStudentBean().getDepartment());
				statement_add_student.setString(6, logins.getStudentBean().getStatus());
				statement_add_student.setString(7, logins.getStudentBean().getYear());
				statement_add_student.executeUpdate();
			}

			conn.commit();
			return true;

		} catch (SQLException e) {
			try {
				conn.rollback();

			} catch (SQLException e1) {
				ExceptionUtil.messageException(new Throwable(), e);

			}
			if (e.getErrorCode() == 1062) {
				setErrorCode(e.getErrorCode());
				setErrorMessage("รหัสนักศึกษา  \"" + stuID+ "\" มีข้อมูลอยู่ในระบบแล้ว");
			}
			ExceptionUtil.messageException(new Throwable(), e);
			return false;

		} finally {
			try {
				statement_add_student_login.close();
				statement_add_student.close();
				conn.close();

			} catch (SQLException e) {
				ExceptionUtil.messageException(new Throwable(), e);

			}
		}
	}
	
	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public int getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}

}
