<%@page import="service.LoginVerificationService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String loginId = (String)session.getAttribute("userId");
	
	if(loginId == null) {
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		LoginVerificationService loginService = LoginVerificationService.getInstance();
		boolean isMatch = loginService.verifyLogin(userId, userPw);
		
		if(isMatch) {
			session.setAttribute("userId", userId);
			loginId = (String)session.getAttribute("userId");
		} else {
%>
<script>
	alert("로그인에 실패하였습니다.");
	location.href = "/Login/main/login.jsp";
</script>
<%
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link type="text/css" rel="stylesheet" href="/Login/css/main_css.css">
</head>
<body>
	<div id="wrap_area">
		<div id="header">
			<h1>My Page</h1>
		</div>
		<div id="content">
			<div id="input-area">
				<p><%= loginId %>님 안녕하세요!</p>
			</div>
			<div id="menu-area">
				<button onclick="location.href='/Login/main/displayInfo.jsp'"
					class="submit-button">회원정보 확인</button>
				<br>
				<button onclick="location.href='/Login/main/updateAccount.jsp'"
					class="submit-button">회원정보 수정</button>
				<br>
				<button onclick="location.href='/Login/main/deleteAccount.jsp'"
					class="submit-button">회원삭제</button>
				<br>
				<button onclick="location.href='/Login/main/logout.jsp'"
					class="submit-button logout-button">로그아웃</button>
			</div>
		</div>
		<div id="footer">
			<p>&copy;이 페이지는 자유롭게 사용하셔도 됩니다.</p>
		</div>
	</div>
</body>
</html>
