<%@page import="service.DisplayInformationService"%>
<%@page import="model.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/Login/css/main_css.css">
<title>회원정보 확인</title>
</head>
<body>
	<%
		// 1. 세션이 존재하는지 검사
		String loginId = (String)session.getAttribute("userId");
	
		if(loginId == null) {
	%>
	<script>
		alert("세션이 만료되었습니다.")
		location.href = "/Login/main/login.jsp";
	</script>
	<%
		}
		
		// 2. 세션에 저장된 아이디로 유저정보를 읽음
		DisplayInformationService displayService = DisplayInformationService.getInstance();
		UserInfo userInfo = displayService.getInformation(loginId);
	%>
	<div id="wrap_area">
		<div id="header">
			<h1>Information</h1>
		</div>
		<div id="content">
			<div id="input-area">
				<div class="input-group">
						<b>아이디</b><br>
						<%= userInfo.getUserId() %>
				</div>
				<div class="input-group">
						<b>이름</b><br>
						<%= userInfo.getUserName() %>
				</div>
				<div class="input-group">
						<b>전화번호</b><br>
						<%= userInfo.getPhoneNumber() %>
				</div>
				<div class="input-group">
						<b>이메일</b><br>
						<%= userInfo.getEmail() %>
				</div>
				<div class="input-group">
						<b>주소</b><br>
						<%= userInfo.getAddress() %>
				</div>
				<div class="input-group">
						<b>자기소개</b><br>
						<%= userInfo.getIntroduce() %>
				</div>
			</div>
			<div id="menu-area">
				<button onclick="location.href='/Login/main/updateAccount.jsp'"
					class="submit-button">회원정보 수정</button><br>
				<button onclick="location.href='/Login/main/main.jsp'"
					class="submit-button logout-button">이전으로</button>
			</div>
		</div>
		<div id="footer">
			<p>&copy;이 페이지는 자유롭게 사용하셔도 됩니다.</p>
		</div>
	</div>
</body>
</html>