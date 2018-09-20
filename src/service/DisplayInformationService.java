package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.Dao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.UserInfo;

public class DisplayInformationService {
	private static DisplayInformationService instance = new DisplayInformationService();
	
	public static DisplayInformationService getInstance() {
		return instance;
	}
	
	private DisplayInformationService() {
	}
	
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
