package dao;

// 자바 패키지
import java.sql.*;
import java.util.*;

// 커스텀 패키지
import jdbc.JdbcUtil;
import model.UserInfo;

/**
 * <pre>
 * Dao객체
 * </pre>
 * @author hyoje
 * @version 1.0
 * @since 2018-09-18
 */
public class Dao {
	private static Dao dao = new Dao();
	
	public static Dao getInstance() {
		return dao;
	}
	
	private Dao() {}
	
	
}
