package model;

/**
 * <pre>
 * 회원정보 클래스
 * </pre>
 * @author hyoje
 * @version 1.0
 * @since 2018-09-18
 */
public class UserInfo {
	private String userId;
	private String userPw;
	private String userName;
	private String phoneNumber;
	private String email;
	private String address;
	private String introduce;
	
	// 아이디
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	// 패스워드
	public String getUserPw() {
		return userPw;
	}
	
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	
	// 이름
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	// 전화번호
	public String getPhoneNumber() {
		return phoneNumber;
	}
	
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	// 이메일
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	// 주소
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	// 자기소개
	public String getIntroduce() {
		return introduce;
	}
	
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	public boolean hasPassword() {
		return userPw != null && !userPw.isEmpty();
	}
	
	public boolean matchPassword(String inputPw) {
		return userPw != null && userPw.equals(inputPw);
	}
}
