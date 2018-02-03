package com.itsci.mjurescue.admin.web.changestaffstatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import com.itsci.mjurescue.admin.web.liststaff.StaffBean;
import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ChangeStaffStatusManager {

	public synchronized boolean upDateStaffStatus(String staffid, String status) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_staffUpdate = null;

		String sql_StudentUpdate = "UPDATE staff SET status = ? WHERE StaffID = ? ;";

		boolean result = false;
		try {
			statement_staffUpdate = conn.prepareStatement(sql_StudentUpdate);


			statement_staffUpdate.setString(1, status);
			statement_staffUpdate.setString(2, staffid);
			statement_staffUpdate.executeUpdate();

			result = true;

		} catch (SQLException e) {
			try {
				
				conn.rollback();
				
			} catch (SQLException e1) {
				ExceptionUtil.messageException(new Throwable(), e);

			}
			ExceptionUtil.messageException(new Throwable(), e);
			return false;

		}  finally {
			try {
				statement_staffUpdate.close();
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
				ExceptionUtil.messageException(new Throwable(), ex);
			}

		}
		return result;
		
	}
	
	public Vector<StaffBean> getAllStaff() {
		Vector<StaffBean> listAllStaff = new Vector<StaffBean>();
		Connection conn = MySQLConnectionPool.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql = "select staffID,name,status from staff";

			ResultSet rs = stmt.executeQuery(sql);

			while ((rs.next())) {

				StaffBean staffBean = new StaffBean();
				staffBean.setStaffID(rs.getString(1));
				staffBean.setName(rs.getString(2));
				staffBean.setStatus(rs.getString(3));
				listAllStaff.add(staffBean);

			}
			return listAllStaff;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException ex) {
				System.out.println(ex.getMessage());
			}
		}
		return null;
	}
}
