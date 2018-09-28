package dao;

// 자바 패키지
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// 커스텀 패키지
import jdbc.JdbcUtil;
import model.UserInfo;

/**
 * <pre>
 * Dao객체
 * </pre>
 * 
 * @author hyoje
 * @version 1.0
 * @since 2018-09-18
 */
public class Dao {
	private static Dao dao = new Dao();

	public static Dao getInstance() {
		return dao;
	}

	private Dao() {
	}

	/**
	 * <pre>
	 * insert
	 * </pre>
	 * 
	 * @param conn
	 * @param userInfo
	 * @return status number
	 * @throws SQLException
	 */
	public int insert(Connection conn, UserInfo userInfo) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into users "
					+ "values(?, password(?), ?, ?, ?, ?, ?)");
			pstmt.setString(1, userInfo.getUserId());
			pstmt.setString(2, userInfo.getUserPw());
			pstmt.setString(3, userInfo.getUserName());
			pstmt.setString(4, userInfo.getPhoneNumber());
			pstmt.setString(5, userInfo.getEmail());
			pstmt.setString(6, userInfo.getAddress());
			pstmt.setString(7, userInfo.getIntroduce());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	/**
	 * <pre>
	 * select
	 * </pre>
	 * 
	 * @param conn
	 * @param userId
	 * @return UserInfo instance
	 * @throws SQLException
	 */
	public UserInfo select(Connection conn, String userId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from users where userid = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	/**
	 * <pre>
	 * delete
	 * </pre>
	 * 
	 * @param conn
	 * @param userId
	 * @return status number
	 * @throws SQLException
	 */
	public int delete(Connection conn, String userId) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from users where userid = ?");
			pstmt.setString(1, userId);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	/**
	 * <pre>
	 * update
	 * </pre>
	 * 
	 * @param inputInfo
	 * @return status number
	 * @throws SQLException
	 */
	public int update(Connection conn, UserInfo inputInfo) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update users set userpw = ?, username = ?, phonenumber = ?," +
					"email = ?, address = ?, introduce = ? where userid = ?");
			pstmt.setString(1, inputInfo.getUserPw());
			pstmt.setString(2, inputInfo.getUserName());
			pstmt.setString(3, inputInfo.getPhoneNumber());
			pstmt.setString(4, inputInfo.getEmail());
			pstmt.setString(5, inputInfo.getAddress());
			pstmt.setString(6, inputInfo.getIntroduce());
			pstmt.setString(7, inputInfo.getUserId());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	/**
	 * <pre>
	 * ResultSet 생성 메소드
	 * </pre>
	 * 
	 * @param rs
	 * @return UserInfo instance
	 */
	private UserInfo makeResultSet(ResultSet rs) throws SQLException {
		UserInfo userInfo = new UserInfo();

		userInfo.setUserId(rs.getString("userid"));
		userInfo.setUserPw(rs.getString("userpw"));
		userInfo.setUserName(rs.getString("username"));
		userInfo.setPhoneNumber(rs.getString("phonenumber"));
		userInfo.setEmail(rs.getString("email"));
		userInfo.setAddress(rs.getString("address"));
		userInfo.setIntroduce(rs.getString("introduce"));

		return userInfo;
	}
}
