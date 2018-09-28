package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.Dao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.UserInfo;

/**
 * <pre>
 * 계정정보 출력 서비스 클래스
 * </pre>
 * @author hyoje
 * @version 1.0
 * @since 2018-09-19
 */
public class DisplayInformationService {
	private static DisplayInformationService instance = new DisplayInformationService();
	
	public static DisplayInformationService getInstance() {
		return instance;
	}
	
	private DisplayInformationService() {
	}
	
	/**
	 * <pre>
	 * 계정정보 select 메소드
	 * </pre>
	 * @param userId
	 * @return UserInfo
	 */
	public UserInfo getInformation(String userId) {
		Connection conn = null;
		UserInfo userInfo = null;
		try {
			conn = ConnectionProvider.getConnection();
			Dao dao = Dao.getInstance();
			userInfo = dao.select(conn, userId);
			return userInfo;
		} catch (SQLException e) {
			throw new ServiceException("회원정보 가져오기 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
