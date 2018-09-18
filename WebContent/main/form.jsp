<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/Login/css/main_css.css">
<title>회원가입</title>

<!-- 유효성 검사 코드 -->
<!--
<script type="text/javascript" src="<c:url value="/resource/js/jquery-1.12.1.js"/> "></script>
<script type="text/javascript">  
    $(document).ready( function() {       
        $("#addNewMovie").click(function() {
            
            //Validation Check
            // input 태그는 반드시 val()을 써준다.
            var movieTitle = $("#movieTitle").val();
            movieTitle = $.trim( movieTitle );
            if( movieTitle == "" ){
                alert("영화명을 입력하세요!");
                $("#movieTitle").focus();
                return; // 밑의 내용은 실행이 되지 않는다.
            }
            
            var rate = $("#rate").val();
            rate = $.trim( rate );
            if( rate == "" ){
                alert("평점을 입력하세요!");
                $("#rate").focus();
                return; 
            }            
            
            // == : 데이터가 같은지 본다.
            // === : 데이터의 타입까지 같은지 본다.
            // isNaN() : Not a Number
            if( isNaN(rate) ){
                alert("평점을 올바르게 입력하세요!\n평점은 소수점을 포함한 숫자로 적을 수 있습니다.");
                $("#rate").focus();
                return;
            }
                
            var runningTime = $("#runningTime").val();
            runningTime = $.trim( runningTime );
            if( runningTime == "" ){
                alert("상영 시간을 입력하세요!");
                $("#runningTime").focus();
                return; 
            }    
            // 자바스크립트는 한 글자의 length 를 1로 본다. (한글, 영어 무관)
            if ( runningTime.length > 5 ){
                alert("상영시간을 올바르게 입력하세요!");
                $("#runningTime").focus();
                return;
            } 
            
            //^문자열이 시작한다.
            //$문자열이 끝난다.
            // [부터-까지]{최소반복횟수,최대반복횟수}
            var regExp = new RegExp("^[0-2][0-9]:[0-5][0-9]$");
            var isValidrunningTime = regExp.test(runningTime);
            if( isValidrunningTime == false ){
                alert("상영시간을 올바르게 입력하세요!");
                $("#runningTime").focus();
                return;
            }
            
            
            var openDate = $("#openDate").val();
            openDate = $.trim( openDate );
            if( openDate == "" ){
                alert("개봉일을 입력하세요!");
                return; 
            }    
 
            var grade = $(".grade:checked").val();
             grade = $.trim( grade );
             if ( grade == "" ) {
                alert("등급을 입력하세요!");
                $(".grade").fadeOut().fadeIn().fadeOut().fadeIn();
                return;
             }
             
            var directors = $("#directors option:selected").val();
            directors = $.trim( directors );
            if( directors == "" ){
                alert("감독을 선택하세요!");
                $("#directors").fadeOut().fadeIn().fadeOut().fadeIn();
                return; 
            }    
            
            var actors = $("#actors option:selected").val();
            actors = $.trim( actors );
            if( actors == "" ){
                alert("출연진을 선택하세요!");
                $("#actors").fadeOut().fadeIn().fadeOut().fadeIn();
                return; 
            }    
            
            var genres = $(".genres:checked").val();
            genres = $.trim( genres );
            if( genres == "" ){
                alert("장르를 선택하세요!");
                return; 
            }    
                        
            var form = $("#addNewMovieForm");
            form.attr("metod", "post");
            form.attr("action", "<c:url value="/addNewMovieAction" />");
            form.submit();
            
        });
        
 
     } );
    
 
</script>
-->
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
							name="userid" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
					</div>
					<div class="input-group">
						<b>비밀번호</b><br> <input type="password" class="input-form"
							name="userpw" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
					</div>
					<div class="input-group">
						<b>비밀번호 재확인</b><br> <input type="password" class="input-form"
							name="userpw" maxlength="10" placeholder="10자 이내 영문,숫자"><br>
					</div>
					<div class="input-group">
						<b>이름</b><br> <input type="text" class="input-form"
							name="username" maxlength="6" placeholder="6자 이내 한글 "><br>
					</div>
					<div class="input-group">
						<b>전화번호</b><br> <input type="tel" class="input-form"
							name="phonenumber" maxlength="11" placeholder="- 없이 입력 ex) 01012345678"><br>
					</div>
					<div class="input-group">
						<b>이메일</b><br> <input type="email" class="input-form-small"
							name="email-id" maxlength="40" placeholder="ex) id"><b>@</b>
						<input type="email" class="input-form-small" name="email-site"
							maxlength="40" placeholder="ex) naver.com"><br>
					</div>
					<div class="input-group">
						<b>주소</b><br> <input type="text" class="input-form"
							name="username" maxlength="50" placeholder="50자 이내"><br>
					</div>
					<div class="input-group">
						<b>자기소개</b><br>
						<textarea class="input-form-long" rows="5" cols="60" name="introduce"></textarea>
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