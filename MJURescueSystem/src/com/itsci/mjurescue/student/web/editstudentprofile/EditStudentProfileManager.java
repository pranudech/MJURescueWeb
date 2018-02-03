package com.itsci.mjurescue.student.web.editstudentprofile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.itsci.mjurescue.login.StudentBean;
import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class EditStudentProfileManager {
	private Connection conn;
	public synchronized Vector<StudentBean> geStudentProfile() {

		Vector<StudentBean> student = new Vector<StudentBean>();
		conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_stu = null;
		String sql = "SELECT studentID,studentName,studentIdCode,phoneNumber,phoneReserve,bloodGroup,disease,address,status FROM student;";

		if (conn != null) {
			try {
				statement_stu = conn.prepareStatement(sql);
				ResultSet rs = statement_stu.executeQuery();
				while (rs.next()) {
					StudentBean stu = new StudentBean();
					stu.setStudentID(rs.getString("studentID"));
					stu.setStudentName(rs.getString("studentName"));
					stu.setStudentIdCode(rs.getString("studentIdCode"));
					stu.setPhoneNumber(rs.getString("phoneNumber"));
					stu.setPhoneReserve(rs.getString("phoneReserve"));
					stu.setBloodGroup(rs.getString("bloodGroup"));
					stu.setDisease(rs.getString("disease"));
					stu.setAddress(rs.getString("address"));
					stu.setStatus(rs.getString("status"));
					student.add(stu);
				}
				rs.close();
				statement_stu.close();
			} catch (SQLException ex) {
				ExceptionUtil.messageException(new Throwable(), ex);
			} finally {
				try {
					statement_stu.close();
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
					ExceptionUtil.messageException(new Throwable(), ex);
				}
			}
		}
		return student;
	}
	public synchronized boolean isEditProfile(String studentID, String address, String phone1, String phone2,String blood, String disease) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_stuUpdate = null;

		String sql_ProfileUpdate = "UPDATE student SET phoneNumber=?,phoneReserve=?, bloodGroup=?,disease=?,address=? WHERE studentID= ? ";

		boolean result = false;
		try {
			statement_stuUpdate = conn.prepareStatement(sql_ProfileUpdate);

			statement_stuUpdate.setString(1, phone1);
			statement_stuUpdate.setString(2, phone2);
			statement_stuUpdate.setString(3, blood);
			statement_stuUpdate.setString(4, disease);
			statement_stuUpdate.setString(5, address);
			statement_stuUpdate.setString(6, studentID);
			statement_stuUpdate.executeUpdate();

			result = true;

		} catch (SQLException ex) {
			ex.printStackTrace();
			ExceptionUtil.messageException(new Throwable(), ex);
		} finally {
			try {
				statement_stuUpdate.close();
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
				ExceptionUtil.messageException(new Throwable(), ex);
			}

		}
		return result;
	}

	public StudentBean getStudentLogins(String username) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_login = null;
		String sql_login = "select s.studentID, s.studentName, s.studentIdCode,s.phoneNumber,s.phoneReserve,s.bloodGroup,s.disease,s.address,s.faculty,s.department from login l join student s on l.username = s.studentID where l.username = ?";

		try {

			statement_login = conn.prepareStatement(sql_login);
			statement_login.setString(1, username);

			ResultSet rs = statement_login.executeQuery();

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

				statement_login.close();
				conn.close();

			} catch (SQLException ex) {

				ExceptionUtil.messageException(new Throwable(), ex);
			}

		}
		return null;
	}

}
