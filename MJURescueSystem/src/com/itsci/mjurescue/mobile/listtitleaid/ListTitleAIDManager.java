package com.itsci.mjurescue.mobile.listtitleaid;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ListTitleAIDManager {
	
	public Vector<AIDBean> getTitleAID() {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_AID = null;
		String sql_aid = "SELECT aidID,title,detail,image FROM AID;";
		Vector<AIDBean> list_Been = new Vector<AIDBean>();
		
		try {

			statement_AID = conn.prepareStatement(sql_aid);
			ResultSet rs = statement_AID.executeQuery();

			while (rs.next()) {
				AIDBean aidBeen = new AIDBean(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
				list_Been.add(aidBeen);
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
		return list_Been;
	}
}
