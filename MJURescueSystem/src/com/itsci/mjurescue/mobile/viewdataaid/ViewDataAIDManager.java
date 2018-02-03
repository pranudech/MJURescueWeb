package com.itsci.mjurescue.mobile.viewdataaid;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ViewDataAIDManager {

	public List<AIDBean> getContentAidByTitle(String title) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_aid = null;
		String sql_aid = "SELECT aidID,title,detail,image FROM AID where aidID = ?;";
		Vector<AIDBean> list_aidBeen = new Vector<AIDBean>();
		
		try {

			statement_aid = conn.prepareStatement(sql_aid);
			statement_aid.setString(1, title);
			ResultSet rs = statement_aid.executeQuery();

			while (rs.next()) {
				AIDBean aidBeen = new AIDBean(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
				list_aidBeen.add(aidBeen);
			}
			
			rs.close();
			
		} catch (SQLException ex) {
			
			ExceptionUtil.messageException(new Throwable(), ex);
			
		} finally {

			try {

				statement_aid.close();
				conn.close();

			} catch (SQLException ex) {
				
				ExceptionUtil.messageException(new Throwable(), ex);
			}
			
		}
		return list_aidBeen;
	}

}
