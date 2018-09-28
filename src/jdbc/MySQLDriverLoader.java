package jdbc;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

/**
 * <pre>
 * JDBC 드라이버 로드 클래스
 * </pre>
 * @author hyoje
 * @since 2018-09-18
 * @version 1.0
 */
public class MySQLDriverLoader extends HttpServlet {
	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}
}
