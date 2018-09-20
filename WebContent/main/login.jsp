<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/Login/css/main_css.css">
<title>로그인</title>
</head>
<body>
	<%
		String loginId = (String)session.getAttribute("userId");
	
		if(loginId != null) {
	%>
	<script>
		location.href = "/Login/main/main.jsp";
	</script>
	<%
		}
	%>
	<div id="wrap_area">
		<div id="header">
			<h1>Login</h1>
		</div>
		<div id="content">
			<div id="input-area">
				<form action="/Login/main/main.jsp" method="post">
					<input type="text" class="input-form" name="userId" maxlength="10" placeholder="아이디"><br>
					<input type="password" class="input-form" name="userPw" maxlength="10" placeholder="비밀번호"><br>
					<input type="submit" class="submit-button" value="로그인">
				</form>
			</div>
			<div id="menu-area">
				<a href="/Login/main/form.jsp">회원가입</a>
			</div>
		</div>
		<div id="footer">
			<p>&copy;이 페이지는 자유롭게 사용하셔도 됩니다.</p>
		</div>
	</div>
</body>
</html>