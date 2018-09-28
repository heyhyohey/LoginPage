<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link type="text/css" rel="stylesheet" href="/Login/css/main_css.css">
<link type="text/css" rel="stylesheet" href="/Login/css/form_css.css">
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
	%>
	<div id="wrap_area">
		<div id="header">
			<h1>Update Account</h1>
		</div>
		<div id="content">
			<div id="input-area">
				<form action="/Login/main/updateFinish.jsp" method="post">
					<p>수정할 회원정보를 입력하세요. 입력하지 않는 회원정보는 바뀌지 않습니다.</p>
					<p>*는 필수입력 항목입니다.</p>
					<div class="input-group">
						<b>* 현재 비밀번호</b><br> <input type="password" class="input-form"
							name="userPw-now" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
					</div>
					<div class="input-group">
						<b>변경할 비밀번호</b><br> 
						<input type="password" class="input-form" name="userPw" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
					</div>
					<div class="input-group">
						<b>변경할 비밀번호 재확인</b><br> <input type="password" class="input-form"
							name="userPw-confirm" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
					</div>
					<div class="input-group">
						<b>변경할 이름</b><br> <input type="text" class="input-form"
							name="userName" maxlength="6" placeholder="6자 이내 한글 "><br>
					</div>
					<div class="input-group">
						<b>변경할 전화번호</b><br> <input type="tel" class="input-form"
							name="phoneNumber" maxlength="11"
							placeholder="- 없이 입력 ex) 01012345678"><br>
					</div>
					<div class="input-group">
						<b>변경할 이메일</b><br> <input type="email" class="input-form"
							name="email" maxlength="80" placeholder="ex) example@example.com"><br>
					</div>
					<div class="input-group">
						<b>변경할 주소</b><br> <input type="text" class="input-form"
							name="address" maxlength="50" placeholder="50자 이내"><br>
					</div>
					<div class="input-group">
						<b>변경할 자기소개</b><br>
						<textarea class="input-form-long" rows="5" cols="60"
							name="introduce"></textarea>
					</div>
					<input type="submit" class="submit-button" value="회원정보수정">
				</form>
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