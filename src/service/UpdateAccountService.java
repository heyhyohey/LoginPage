package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.Dao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.UserInfo;

/**
 * <pre>
 * 계정정보 수정 서비스 클래스
 * </pre>
 * @author hyoje
 * @version 1.0
 * @since 2018-09-21
 */
public class UpdateAccountService {
	private static UpdateAccountService instance = new UpdateAccountService();
	
	public static UpdateAccountService getInstance() {
		return instance;
	}
	
	private UpdateAccountService() {
	}
	
	/**
	 * <pre>
	 * 회원정보 수정 update연산 메소드
	 * </pre>
	 * @param userInfo
	 */
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
