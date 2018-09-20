package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.Dao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.UserInfo;

public class UpdateAccountService {
	private static UpdateAccountService instance = new UpdateAccountService();
	
	public static UpdateAccountService getInstance() {
		return instance;
	}
	
	private UpdateAccountService() {
	}
	
	public void updateUser(UserInfo userInfo) {
		Connection conn = null;	
		try {
			conn = ConnectionProvider.getConnection();
			Dao dao = Dao.getInstance();
			dao.update(conn, userInfo);
		} catch (SQLException e) {
			throw new ServiceException("정보 수정 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
