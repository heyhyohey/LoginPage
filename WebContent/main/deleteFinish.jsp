<%@page import="service.DeleteAccountService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
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
		
		// 2. 비밀번호 및 확인문자 검사
		if(loginId != null) {
			String userPw = request.getParameter("userPw");
			String userPwConfirm = request.getParameter("userPw-confirm");
			String userReal = request.getParameter("real");
			
			// 2-1. 비밀번호와 비밀번호 재입력된 값이 같은지 검사
			if(!userPw.equals(userPwConfirm)) {
	%>
	<script>
		alert("비밀번호와 비밀번호를 재입력한 값이 다릅니다.");
		location.href = "/Login/main/deleteAccount.jsp";
	</script>
	<%
			// 2-2. 확인문자가 올바른지 검사
			} else if(!"정말 탈퇴하겠습니다".equals(userReal)){
	%>
	<script>
		alert("\"정말 탈퇴하겠습니다\"를 정확히 입력해 주세요.");
		location.href = "/Login/main/deleteAccount.jsp";
	</script>
	<%
			// 2-3. 세션삭제 및 계정삭제
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
	alert("세션이 만료되었습니다.");
	location.href = "/Login/main/login.jsp";
</script>
<%
	}
%>
</body>
</html>
