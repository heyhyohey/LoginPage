package jdbc;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class ConnectionProvider {
	public static Connection getConnection() throws SQLException {
		String jdbcDriver = "jdbc:mysql://localhost:3306/users?"
				+ "useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
		String dbUser = "hyoje420";
		String dbPass = "hyoje420";
		
		return DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	}
}
