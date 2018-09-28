package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.Dao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

/**
 * <pre>
 * 계정 삭제 서비스 클래스
 * </pre>
 * @author hyoje
 * @version 1.0
 * @since 2018-09-20
 */
public class DeleteAccountService {
	private static DeleteAccountService instance = new DeleteAccountService();
	
	public static DeleteAccountService getInstance() {
		return instance;
	}
	
	private DeleteAccountService() {
	}
	
	/**
	 * <pre>
	 * 계정 삭제 메소드
	 * </pre>
	 * @param userId
	 */
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
