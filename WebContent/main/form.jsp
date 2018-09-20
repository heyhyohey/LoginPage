<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/Login/css/main_css.css">
<title>회원가입</title>
</head>
<body>
	<div id="wrap_area">
		<div id="header">
			<h1>Sign Up</h1>
		</div>
		<div id="content">
			<div id="input-area">
				<form action="/Login/main/signUpFinish.jsp" method="post">
					<div class="input-group">
						<b>아이디</b><br> <input type="text" class="input-form"
							name="userId" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
					</div>
					<div class="input-group">
						<b>비밀번호</b><br> <input type="password" class="input-form"
							name="userPw" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
					</div>
					<div class="input-group">
						<b>비밀번호 재확인</b><br> <input type="password" class="input-form"
							name="userpw-confirm" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
					</div>
					<div class="input-group">
						<b>이름</b><br> <input type="text" class="input-form"
							name="userName" maxlength="6" placeholder="6자 이내 한글 "><br>
					</div>
					<div class="input-group">
						<b>전화번호</b><br> <input type="tel" class="input-form"
							name="phoneNumber" maxlength="11"
							placeholder="- 없이 입력 ex) 01012345678"><br>
					</div>
					<div class="input-group">
						<b>이메일</b><br> <input type="email" class="input-form"
							name="email" maxlength="80" placeholder="ex) example@example.com"><br>
					</div>
					<div class="input-group">
						<b>주소</b><br> <input type="text" class="input-form"
							name="address" maxlength="50" placeholder="50자 이내"><br>
					</div>
					<div class="input-group">
						<b>자기소개</b><br>
						<textarea class="input-form-long" rows="5" cols="60"
							name="introduce"></textarea>
					</div>
					<input type="submit" class="submit-button" value="회원가입">
				</form>
			</div>
		</div>
		<div id="footer">
			<p>&copy;이 페이지는 자유롭게 사용하셔도 됩니다.</p>
		</div>
	</div>
</body>
</html>