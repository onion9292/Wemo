package com.naver.wemo.domain;

import java.util.Date;

public class Memo {
	private String USER_EMAIL; 	//ID
	private int MEMO_NUM;		//메모 넘버
	private String MEMO_SUB;	//메모 주제
	private String MEMO_POSITION;	//메모 위치(absolute, relative 등)
	private String MEMO_TOP;	//메모 top 좌표
	private String MEMO_LEFT;	//메모 left 좌표
	private String MEMO_COLOR;	//메모 색깔
	private int MEMO_ZIN;		//메모 z 위치
	private String MEMO_WIDTH;	//메모 폭
	private String MEMO_HEIGHT;	//메모 높이
	private String MEMO_TEX;	//메모 내용
	private Date MEMO_DATE;		//메모 최초 작성일
	private Date MEMO_PRE;		//메모 최종 수정일
	private String PREV_TEX;	//이전 메모 내용
	private String MEMO_FAV;	//메모 즐겨찾기 Y, N
	private String MEMO_LOC;	//메모 잠금 Y, N
	
	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}
	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}
	public int getMEMO_NUM() {
		return MEMO_NUM;
	}
	public void setMEMO_NUM(int mEMO_NUM) {
		MEMO_NUM = mEMO_NUM;
	}
	public String getMEMO_SUB() {
		return MEMO_SUB;
	}
	public void setMEMO_SUB(String mEMO_SUB) {
		MEMO_SUB = mEMO_SUB;
	}
	public String getMEMO_POSITION() {
		return MEMO_POSITION;
	}
	public void setMEMO_POSITION(String mEMO_POSITION) {
		MEMO_POSITION = mEMO_POSITION;
	}
	public String getMEMO_TOP() {
		return MEMO_TOP;
	}
	public void setMEMO_TOP(String mEMO_TOP) {
		MEMO_TOP = mEMO_TOP;
	}
	public String getMEMO_LEFT() {
		return MEMO_LEFT;
	}
	public void setMEMO_LEFT(String mEMO_LEFT) {
		MEMO_LEFT = mEMO_LEFT;
	}
	public String getMEMO_COLOR() {
		return MEMO_COLOR;
	}
	public void setMEMO_COLOR(String mEMO_COLOR) {
		MEMO_COLOR = mEMO_COLOR;
	}
	public int getMEMO_ZIN() {
		return MEMO_ZIN;
	}
	public void setMEMO_ZIN(int mEMO_ZIN) {
		MEMO_ZIN = mEMO_ZIN;
	}
	public String getMEMO_TEX() {
		return MEMO_TEX;
	}
	public void setMEMO_TEX(String mEMO_TEX) {
		MEMO_TEX = mEMO_TEX;
	}
	public Date getMEMO_DATE() {
		return MEMO_DATE;
	}
	public void setMEMO_DATE(Date mEMO_DATE) {
		MEMO_DATE = mEMO_DATE;
	}
	public Date getMEMO_PRE() {
		return MEMO_PRE;
	}
	public void setMEMO_PRE(Date mEMO_PRE) {
		MEMO_PRE = mEMO_PRE;
	}
	public String getPREV_TEX() {
		return PREV_TEX;
	}
	public void setPREV_TEX(String pREV_TEX) {
		PREV_TEX = pREV_TEX;
	}
	public String getMEMO_FAV() {
		return MEMO_FAV;
	}
	public void setMEMO_FAV(String mEMO_FAV) {
		MEMO_FAV = mEMO_FAV;
	}
	public String getMEMO_LOC() {
		return MEMO_LOC;
	}
	public void setMEMO_LOC(String mEMO_LOC) {
		MEMO_LOC = mEMO_LOC;
	}
	public String getMEMO_WIDTH() {
		return MEMO_WIDTH;
	}
	public void setMEMO_WIDTH(String mEMO_WIDTH) {
		MEMO_WIDTH = mEMO_WIDTH;
	}
	public String getMEMO_HEIGHT() {
		return MEMO_HEIGHT;
	}
	public void setMEMO_HEIGHT(String mEMO_HEIGHT) {
		MEMO_HEIGHT = mEMO_HEIGHT;
	}
	
}
