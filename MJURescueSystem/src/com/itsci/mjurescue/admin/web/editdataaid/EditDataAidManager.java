package com.itsci.mjurescue.admin.web.editdataaid;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class EditDataAidManager {

	public AidBean getAidByID(String aidID) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_AID = null;
		String sql_aid = " SELECT * FROM aid  where aidID = ?";

		try {

			statement_AID = conn.prepareStatement(sql_aid);
			statement_AID.setInt(1, Integer.parseInt(aidID));

			ResultSet rs = statement_AID.executeQuery();

			if (rs.next()) {
				AidBean aidBean = new AidBean();
				aidBean.setAidID(rs.getInt(1));
				aidBean.setTitle(rs.getString(2));
				aidBean.setContent(rs.getString(3));

				return aidBean;
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
		return null;
	}

	public synchronized boolean isEditAID(int aidID, String titleAID, String contentAID) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_aidUpdate = null;

		String sql_AidUpdate = "UPDATE aid SET title=?,detail=? where aidID = ?";

		boolean result = false;
		try {
			statement_aidUpdate = conn.prepareStatement(sql_AidUpdate);

			statement_aidUpdate.setString(1, titleAID);
			statement_aidUpdate.setString(2, contentAID);
			statement_aidUpdate.setInt(3, aidID);
			statement_aidUpdate.executeUpdate();

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
				statement_aidUpdate.close();
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
				ExceptionUtil.messageException(new Throwable(), ex);
			}

		}
		return result;
	}
}
