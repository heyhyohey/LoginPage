<%@page import="service.UpdateAccountService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String loginId = (String)session.getAttribute("userId");
%>
<jsp:useBean id="userInfo" class="model.UserInfo">
	<jsp:setProperty name="userInfo" property="*" />	
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
	if(loginId != null) {
		userInfo.setUserId(loginId);
		
		String userPwConfirm = request.getParameter("userPw-confirm");
		
		if(!userInfo.getUserPw().equals(userPwConfirm)) {
%>
<script>
	alert("비밀번호와 비밀번호를 재입력한 값이 다릅니다.");
	location.href = "/Login/main/deleteAccount.jsp";
</script>
<%
		} else {
			UpdateAccountService updateService = UpdateAccountService.getInstance();
			updateService.updateUser(userInfo);
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
