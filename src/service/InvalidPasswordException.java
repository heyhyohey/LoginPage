package service;

/**
 * <pre>
 * 비밀번호 불일치 예외 클래스
 * </pre>
 * @author hyoje
 *
 */
public class InvalidPasswordException extends ServiceException {
	public InvalidPasswordException(String message) {
		super(message);
	}
}
