package jdbc;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

/**
 * <pre>
 * MySQL 커넥션 생성 클래스
 * </pre>
 * @author hyoje
 * @version 1.0
 * @since 2018-09-18
 */
public class ConnectionProvider {
	public static Connection getConnection() throws SQLException {
		String jdbcDriver = "jdbc:mysql://localhost:3306/users?"
				+ "useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
		String dbUser = "hyoje420";
		String dbPass = "hyoje420";
		
		return DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	}
}
