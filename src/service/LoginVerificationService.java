package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.Dao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.UserInfo;

public class LoginVerificationService {
	private static LoginVerificationService instance = new LoginVerificationService();
	
	public static LoginVerificationService getInstance() {
		return instance;
	}
	
	private LoginVerificationService() {
	}
	
	public boolean verifyLogin(String userId, String userPw) {
		Connection conn = null;
		UserInfo userInfo = null;
		try {
			conn = ConnectionProvider.getConnection();
			Dao dao = Dao.getInstance();
			userInfo = dao.select(conn, userId);
			
			// 1. 아이디가 존재하는지 검사
			if(userInfo == null)
				return false;
			
			// 2. 아이디 비밀번호 일치 검사
			if(userInfo.getUserPw().equals(userPw))
				return true;
			else
				return false;
		} catch (SQLException e) {
			throw new ServiceException("로그인 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
