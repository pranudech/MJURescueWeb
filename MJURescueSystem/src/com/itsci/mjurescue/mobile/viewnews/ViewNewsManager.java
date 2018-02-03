package com.itsci.mjurescue.mobile.viewnews;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;


import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ViewNewsManager {

	public List<NewsFeedBean> getContentNews(int newsFeedId) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_newsFeed = null;
		String sql_newsFeed = "SELECT NewsFeedID,title,content,date,image FROM newsfeed where NewsFeedID = ?;";
		Vector<NewsFeedBean> list_newsFeed = new Vector<NewsFeedBean>();
		
		try {

			statement_newsFeed = conn.prepareStatement(sql_newsFeed);
			
			statement_newsFeed.setInt(1, newsFeedId);
			ResultSet rs = statement_newsFeed.executeQuery();

			while (rs.next()) {
				NewsFeedBean newsFeedBean = new NewsFeedBean(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
				list_newsFeed.add(newsFeedBean);
			}
			
			rs.close();
			
		} catch (SQLException ex) {
			
			ExceptionUtil.messageException(new Throwable(), ex);
			
		} finally {

			try {

				statement_newsFeed.close();
				conn.close();

			} catch (SQLException ex) {
				
				ExceptionUtil.messageException(new Throwable(), ex);
			}
			
		}
		return list_newsFeed;
	}

}
