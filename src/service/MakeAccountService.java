package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import dao.Dao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.UserInfo;

public class MakeAccountService {
	private static MakeAccountService instance = new MakeAccountService();

	public static MakeAccountService getInstance() {
		return instance;
	}

	private MakeAccountService() {
	}
	
	public void insertUser(UserInfo userInfo) {
		Connection conn = null;	
		try {
			conn = ConnectionProvider.getConnection();
			Dao dao = Dao.getInstance();
			dao.insert(conn, userInfo);
		} catch (SQLException e) {
			throw new ServiceException("유저 등록 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
