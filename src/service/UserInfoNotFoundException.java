package service;

/**
 * <pre>
 * userInfo를 찾을 수 없을때의 예외 클래스
 * </pre>
 * @author hyoje
 * @version 1.0
 * @since 2018-09-21
 */
public class UserInfoNotFoundException extends ServiceException {
	public UserInfoNotFoundException(String message) {
		super(message);
	}
}
