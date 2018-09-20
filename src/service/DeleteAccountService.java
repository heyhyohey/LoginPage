package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.Dao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class DeleteAccountService {
	private static DeleteAccountService instance = new DeleteAccountService();
	
	public static DeleteAccountService getInstance() {
		return instance;
	}
	
	private DeleteAccountService() {
	}
	
	public void deleteUser(String userId) {
		Connection conn = null;	
		try {
			conn = ConnectionProvider.getConnection();
			Dao dao = Dao.getInstance();
			dao.delete(conn, userId);
		} catch (SQLException e) {
			throw new ServiceException("유저 삭제 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
