package com.itsci.mjurescue.staff.web.addnews;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class AddNewsManager {
	private NewsBean addNewsBean = new NewsBean();

	public NewsBean getAidBean() {
		return addNewsBean;
	}

	public synchronized boolean isAddNews(NewsBean addNewsBean) {
		Connection conn = MySQLConnectionPool.getConnection();
		PreparedStatement statement_addnews = null;

		String sql_addnews = "insert into newsfeed (title,content,date,image,staffid) values (? , ?, NOW() , ? , ?);";

		boolean result = false;
		try {
			statement_addnews = conn.prepareStatement(sql_addnews);
			statement_addnews.setString(1, addNewsBean.getTitle());
			statement_addnews.setString(2, addNewsBean.getContent());
			statement_addnews.setString(3, addNewsBean.getImage());
			statement_addnews.setString(4, addNewsBean.getStaffID());

			statement_addnews.executeUpdate();

		} catch (SQLException ex) {
			ex.printStackTrace();
			ExceptionUtil.messageException(new Throwable(), ex);
		} finally {
			try {

				statement_addnews.close();

				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
				ExceptionUtil.messageException(new Throwable(), ex);
			}
		}
		return result;
	}
}
