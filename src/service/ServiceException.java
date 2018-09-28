package service;

/**
 * <pre>
 * 서비스 클래스 예외 클래스
 * </pre>
 * @author hyoje
 *
 */
public class ServiceException extends RuntimeException {
	public ServiceException(String message, Exception cause) {
		super(message, cause);
	}
	
	public ServiceException(String message) {
		super(message);
	}
}
