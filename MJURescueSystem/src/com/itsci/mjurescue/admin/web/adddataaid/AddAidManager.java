package com.itsci.mjurescue.admin.web.adddataaid;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class AddAidManager {
	
	private AidBean aidBean = new AidBean();

	public AidBean getAidBean() {
		return aidBean;
	}
	
	public synchronized boolean isAddAid(AidBean addaid) {

		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_addaid = null;
		String sql_addaid = "insert into aid(title,detail,image) values (?,?,?)";
		
		try {
			conn.setAutoCommit(false);
			statement_addaid = conn.prepareStatement(sql_addaid);
			statement_addaid.setString(1, addaid.getTitle());
			statement_addaid.setString(2, addaid.getContent());
			statement_addaid.setString(3, addaid.getImage());

			statement_addaid.executeUpdate();

			conn.commit();
			return true;

		} catch (SQLException e) {
			try {
				
				conn.rollback();
				
			} catch (SQLException e1) {
				ExceptionUtil.messageException(new Throwable(), e);

			}
			ExceptionUtil.messageException(new Throwable(), e);
			return false;

		} finally {
			try {
				statement_addaid.close();
				conn.close();

			} catch (SQLException e) {
				ExceptionUtil.messageException(new Throwable(), e);

			}
		}
	}
}
