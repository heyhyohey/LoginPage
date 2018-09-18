<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link type="text/css" rel="stylesheet" href="/Login/css/main_css.css">
</head>
<body>
	<div id="wrap_area">
		<div id="header">
			<h1>Delete Account</h1>
		</div>
		<div id="content">
			<div id="input-area">
				<form action="/Login/main/deleteFinish.jsp" method="post">
					<div class="input-group">
						<b>아이디</b><br> <input type="text" class="input-form"
							name="userid" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
					</div>
					<div class="input-group">
						<b>비밀번호</b><br> <input type="password" class="input-form"
							name="userpw" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
					</div>
					<div class="input-group">
						<b>"정말 탈퇴하겠습니다"를 입력하세요</b><br> <input type="text" class="input-form"
							name="real" maxlength="20"><br>
					</div>
					<div id="menu-area">
						<button onclick="location.href='/Login/main/main.jsp'"
							class="submit-button">회원탈퇴</button>
					</div>
				</form>
			</div>
		</div>
		<div id="footer">
			<p>&copy;이 페이지는 자유롭게 사용하셔도 됩니다.</p>
		</div>
	</div>
</body>
</html>