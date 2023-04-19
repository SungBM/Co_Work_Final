package com.naver.cowork.service;

public enum LoginResult {
    SUCCESS("1","정상적으로 로그인 성공."),
    WRONG_PASSWORD("0","비밀번호가 맞지 않습니다."),
    USER_NOT_FOUND("-1","입력한 id에 멤버정보가 없습니다.");

    private String loginCode;
    private String message;

    LoginResult(String loginCode,String message){
        this.loginCode=loginCode;
        this.message=message;
    }

    public String getLoginCode() {
        return loginCode;
    }

    public void setLoginCode(String loginCode) {
        this.loginCode = loginCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
