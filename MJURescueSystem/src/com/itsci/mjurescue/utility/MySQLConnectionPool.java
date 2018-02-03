package com.itsci.mjurescue.utility;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.apache.tomcat.jdbc.pool.PoolProperties;

public class MySQLConnectionPool {
	private static DataSource datasource;
	private static String driver = "com.mysql.jdbc.Driver";
//	private static String url = "jdbc:mysql://localhost:3306/mju_rescue?useUnicode=true&characterEncoding=UTF-8";
//	private static String username = "root";
//	private static String password = "1234";
	
	private static String url = "jdbc:mysql://sql12.freemysqlhosting.net/sql12219320?useUnicode=true&characterEncoding=UTF-8";
	private static String username = "sql12219320";
	private static String password = "msdyp9B9st";

	private static PoolProperties configurePoolProperties(String driver, String url, String username, String password) {
		PoolProperties properties = new PoolProperties();
		properties.setDriverClassName(driver);
		properties.setUrl(url);
		properties.setUsername(username);
		properties.setPassword(password);
		return properties;
	}

	public static synchronized Connection getConnection() {
		Connection connection = null;
		try {
			if (datasource == null) {
				datasource = new DataSource(configurePoolProperties(driver, url, username, password));
			}
			connection = datasource.getConnection();
		} catch (SQLException ex) {
			ExceptionUtil.messageException(new Throwable(), ex);
		}
		return connection;
	}
}

