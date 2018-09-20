<%@page import="service.DeleteAccountService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String loginId = (String)session.getAttribute("userId");
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/Login/css/main_css.css">
<title>회원탈퇴 완료</title>
</head>
<body>
<%	
	if(loginId != null) {
		String userPw = request.getParameter("userPw");
		String userPwConfirm = request.getParameter("userPw-confirm");
		String userReal = request.getParameter("real");
		
		if(!userPw.equals(userPwConfirm)) {
%>
<script>
	alert("비밀번호와 비밀번호를 재입력한 값이 다릅니다.");
	location.href = "/Login/main/deleteAccount.jsp";
</script>
<%
		} else if(!"정말 탈퇴하겠습니다".equals(userReal)){
%>
<script>
	alert("\"정말 탈퇴하겠습니다\"를 정확히 입력해 주세요.");
	location.href = "/Login/main/deleteAccount.jsp";
</script>
<%
		} else {
			session.invalidate();
			DeleteAccountService deleteService = DeleteAccountService.getInstance();
			deleteService.deleteUser(loginId);
		}
%>
	<div id="wrap_area">
		<div id="header">
			<h1>Good Bye!</h1>
		</div>
		<div id="content">
			<div id="input-area">
				<p>회원탈퇴가 완료되었습니다!</p>
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
