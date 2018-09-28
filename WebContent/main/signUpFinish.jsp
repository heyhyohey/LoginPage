<%@page import="service.IdCheckService"%>
<%@page import="service.DisplayInformationService"%>
<%@ page import="service.MakeAccountService"%>
<%@ page import="model.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%-- 1. 폼 데이터를 useBean으로 받음 --%>
<jsp:useBean id="userInfo" class="model.UserInfo">
	<jsp:setProperty name="userInfo" property="*" />
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/Login/css/main_css.css">
<title>회원가입 완료</title>
</head>
<body>
	<%
		// 2. 필수입력란이 null인지 검사
		if(userInfo.getUserId() == null || userInfo.getUserPw() == null || userInfo.getUserName() == null) {
	%>
	<script>
		alert("필수 입력정보를 입력해주세요.");
		history.go(-1);
	</script>
	<%
		}
		// 3. 이미 존재하는 id가 있는지 검사
		IdCheckService checkId = IdCheckService.getInstance();
		
		if(!checkId.isExist(userInfo.getUserId())) {
	%>
	<script>
		alert("이미 존재하는 아이디입니다.");
		location.href("/Login/main/form.jsp");
	</script>
	<%
		}
		// 4. 비밀번호오 중복되었는지 검사
		
		
		// 5. 회원생성
		MakeAccountService makeAccountService = MakeAccountService.getInstance();
		makeAccountService.insertUser(userInfo);
	%>
	<div id="wrap_area">
		<div id="header">
			<h1>Welcome!</h1>
		</div>
		<div id="content">
			<div id="input-area">
				<p>회원가입이 완료되었습니다!</p>
			</div>
			<div id="menu-area">
				<button onclick="location.href='/Login/main/login.jsp'"
					class="submit-button">로그인 화면으로</button>
			</div>
		</div>
		<div id="footer">
			<p>&copy;이 페이지는 자유롭게 사용하셔도 됩니다.</p>
		</div>
	</div>
</body>
</html>