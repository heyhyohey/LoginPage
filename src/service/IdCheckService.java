package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.Dao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.UserInfo;

/**
 * <pre>
 * 아이지 중복확인 서비스 클래스
 * </pre>
 * @author hyoje
 * @version 1.0
 * @since 2018-09-21
 */
public class IdCheckService {
	private static IdCheckService instance = new IdCheckService();
	
	public static IdCheckService getInstance() {
		return instance;
	}
	
	private IdCheckService () {
	}
	
	/**
	 * <pre>
	 * 아이디 중복확인 수행 메소드
	 * </pre>
	 * @param userId
	 * @return boolean
	 */
	public boolean isExist(String userId) {
		Connection conn = null;
		UserInfo userInfo = null;
		try {
			conn = ConnectionProvider.getConnection();
			Dao dao = Dao.getInstance();
			userInfo = dao.select(conn, userId);
			
			// 1. 아이디가 존재하는지 검사
			if(userInfo != null)
				return true;
			else
				return false;
		} catch (SQLException e) {
			throw new ServiceException("아이디 체크 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
