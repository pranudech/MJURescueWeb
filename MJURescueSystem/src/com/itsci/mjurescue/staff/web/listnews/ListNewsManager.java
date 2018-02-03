package com.itsci.mjurescue.staff.web.listnews;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import com.itsci.mjurescue.utility.MySQLConnectionPool;

public class ListNewsManager {
	public Vector<NewsBean> getAllTitleNews() {
		Vector<NewsBean> listAllTitleNews = new Vector<NewsBean>();
		Connection conn = MySQLConnectionPool.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql = "select * from newsfeed";

			ResultSet rs = stmt.executeQuery(sql);

			while ((rs.next())) {

				NewsBean newsBean = new NewsBean();
				newsBean.setNewsFeddID(rs.getInt(1));
				newsBean.setTitle(rs.getString(2));
				newsBean.setContent(rs.getString(3));
				newsBean.setDate(rs.getString(4));
				listAllTitleNews.add(newsBean);

			}
			return listAllTitleNews;

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
