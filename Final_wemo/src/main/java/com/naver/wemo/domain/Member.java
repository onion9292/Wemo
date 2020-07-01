package com.naver.wemo.domain;

public class Member {
	private String USER_EMAIL;	//아이디
	private String USER_PASS;	//비밀번호
	private String USER_SUB;	//마지막 section
	private String AUTH_TYPE;	//카카오, 다음 등 로그인 플랫폼 확인
	private String USER_NICK;	//사용자 닉네임
	private String USER_FORM; 	//사용자 설정 자동완성 폼
	
	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}
	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}
	public String getUSER_PASS() {
		return USER_PASS;
	}
	public void setUSER_PASS(String uSER_PASS) {
		USER_PASS = uSER_PASS;
	}
	public String getUSER_SUB() {
		return USER_SUB;
	}
	public void setUSER_SUB(String uSER_SUB) {
		USER_SUB = uSER_SUB;
	}
	public String getAUTH_TYPE() {
		return AUTH_TYPE;
	}
	public void setAUTH_TYPE(String aUTH_TYPE) {
		AUTH_TYPE = aUTH_TYPE;
	}
	public String getUSER_NICK() {
		return USER_NICK;
	}
	public void setUSER_NICK(String uSER_NICK) {
		USER_NICK = uSER_NICK;
	}
	public String getUSER_FORM() {
		return USER_FORM;
	}
	public void setUSER_FORM(String uSER_FORM) {
		USER_FORM = uSER_FORM;
	}

	
}
