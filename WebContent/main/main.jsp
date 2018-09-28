<%@page import="service.LoginVerificationService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link type="text/css" rel="stylesheet" href="/Login/css/main_css.css">
</head>
<body>
	<%@ include file="/jspf/checkLoginSession.jspf" %>
	<%	
		request.setCharacterEncoding("utf-8");
	
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");

		// 1. userId에 따른 userPw 비교
		LoginVerificationService loginService = LoginVerificationService.getInstance();
		boolean isMatch = loginService.verifyLogin(userId, userPw);
		
		if(isMatch) {
			session.setAttribute("userId", userId);
		} else {
	%>
	<script>
		alert("아이디와 비밀번호를 확인해주세요.");
		location.href = "/Login/main/login.jsp";
	</script>
	<%
		}
	%>
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
