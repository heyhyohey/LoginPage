package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import dao.Dao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.UserInfo;

/**
 * <pre>
 * 계정생성 서비스 클래스
 * </pre>
 * @author hyoje
 * @version 1.0
 * @since 2018-09-21
 */
public class MakeAccountService {
	private static MakeAccountService instance = new MakeAccountService();

	public static MakeAccountService getInstance() {
		return instance;
	}

	private MakeAccountService() {
	}
	
	/**
	 * <pre>
	 * 계정정보를 바탕으로 insert연산 수행 메소드
	 * </pre>
	 * @param userInfo
	 */
	public void insertUser(UserInfo userInfo) {
		Connection conn = null;	
		try {
			System.out.println("user id is " + userInfo.getUserId());
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
