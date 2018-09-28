function checkForm(formElement) {
    var errorMessage = null;
    var objFocus = null;
    var userId = formElement.userId.value;

    if (userId.length == 0) {
        errorMessage = "아이디를 입력해주세요.";
        objFocus = formElement.userId;
    }
    else if (formElement.userPw.value.length == 0) {
        errorMessage = "비밀번호를 입력해주세요.";
        objFocus = formElement.userPw;
    }
    else if (form)

    if(errorMessage != null) {
        alert(errorMessage);
        objFocus.focus();
        return false;
    }
    return true;
}