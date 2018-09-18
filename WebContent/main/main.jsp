<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<p>님 안녕하세요!</p>
			</div>
			<div id="menu-area">
				<button onclick="location.href='/Login/main/login.jsp'"
					class="submit-button">로그아웃</button>
				<br>
				<button onclick="location.href='/Login/main/updateAccount.jsp'"
					class="submit-button">회원정보수정</button>
				<br>
				<button onclick="location.href='/Login/main/deleteAccount.jsp'"
					class="submit-button">회원삭제</button>
			</div>
		</div>
		<div id="footer">
			<p>&copy;이 페이지는 자유롭게 사용하셔도 됩니다.</p>
		</div>
	</div>
</body>
</html>