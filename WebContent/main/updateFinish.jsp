<%@page import="service.DisplayInformationService"%>
<%@page import="service.UpdateAccountService"%>
<%@page import="model.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%-- 1. useBean으로 파라미터 값을 inputInfo에 저장 --%>
<jsp:useBean id="inputInfo" class="model.UserInfo">
	<jsp:setProperty name="inputInfo" property="*" />
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/Login/css/main_css.css">
<title>회원정보 수정 완료</title>
</head>
<body>
	<%
		// 2. 세션이 존재하는지 검사
		String loginId = (String)session.getAttribute("userId");
	
		if(loginId == null) {
	%>
	<script>
		alert("세션이 만료되었습니다.")
		location.href = "/Login/main/login.jsp";
	</script>
	<%
		}
		request.setCharacterEncoding("utf-8");
		
		DisplayInformationService selectService = DisplayInformationService.getInstance();
		UserInfo userInfo = selectService.getInformation(loginId);
		
		inputInfo.setUserId(loginId);
		inputInfo.setUserName(userInfo.getUserName());
		
		// 3. 로그인이 되어있는지 확인
		if (loginId != null) {
			inputInfo.setUserId(loginId);

			String userPwConfirm = request.getParameter("userPw-confirm");
			String userPwNow = request.getParameter("userPw-now");

			// 3-1. 비밀번호가 맞는지 확인
			if (userPwNow != null && userPwNow.equals(userInfo.getUserPw())) {
				// 3-2. 변경할 비밀번호가 존재하는지 확인
				if (inputInfo.getUserPw() != null && !inputInfo.getUserPw().equals(userPwConfirm)) {
	%>
	<script>
		alert("비밀번호와 비밀번호를 재입력한 값이 다릅니다.");
		location.href = "/Login/main/updateAccount.jsp";
	</script>
	<%
				}
				// 3-3. null이 아닌 값만 기존의 값에서 교체
				userInfo.setUserPw((inputInfo.getUserPw() != null)?inputInfo.getUserPw():userInfo.getUserPw());
				userInfo.setUserName((inputInfo.getUserName() != null)?inputInfo.getUserName():userInfo.getUserName());
				userInfo.setPhoneNumber((inputInfo.getPhoneNumber() != null)?inputInfo.getPhoneNumber():userInfo.getPhoneNumber());
				userInfo.setEmail((inputInfo.getEmail() != null)?inputInfo.getEmail():userInfo.getEmail());
				userInfo.setAddress((inputInfo.getAddress() != null)?inputInfo.getAddress():userInfo.getAddress());
				userInfo.setIntroduce((inputInfo.getIntroduce() != null)?inputInfo.getIntroduce():userInfo.getIntroduce());
				
				// 3-4. 완성된 유저정보를 업데이트
				UpdateAccountService updateService = UpdateAccountService.getInstance();
				updateService.updateUser(userInfo);
			} else {
	%>
	<script>
		alert("비밀번호를 확인해주세요.");
		location.href = "/Login/main/updateAccount.jsp";
	</script>
	<%
			}
	%>
	<div id="wrap_area">
		<div id="header">
			<h1>Updated!</h1>
		</div>
		<div id="content">
			<div id="input-area">
				<p>회원정보 수정이 완료되었습니다!</p>
			</div>
			<div id="menu-area">
				<button onclick="location.href='/Login/main/main.jsp'"
					class="submit-button">메인 화면으로</button>
			</div>
		</div>
		<div id="footer">
			<p>&copy;이 페이지는 자유롭게 사용하셔도 됩니다.</p>
		</div>
	</div>
	<%
		} else {
	%>
	<script>
		alert("로그인 후 이용 가능합니다.");
		location.href = "/Login/main/login.jsp";
	</script>
	<%
		}
	%>
</body>
</html>
