package com.naver.wemo.DAO;

import java.util.List;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.wemo.domain.Member;
import com.naver.wemo.domain.Memo;

@Repository
public class MemoDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void firstInsert(Member member) {
		// 회원 가입시 한 번만 입력되게 한다.
		Memo memo= new Memo();
		memo.setUSER_EMAIL(member.getUSER_EMAIL());	//회원 EMAIL
		// memo.setMEMO_NUM => xml 에서 memo colum 최대값 찾아서 셋팅해줌
		memo.setMEMO_SUB("STUDY");					//최초 STUDY
		memo.setMEMO_POSITION("absolute");			//최초 style = position
		memo.setMEMO_TOP("100px");					//최초 TOP 좌표
		memo.setMEMO_LEFT("100px");					//최초 LEFT 좌표
		memo.setMEMO_COLOR(""); 					//최초 메모 배경색
		memo.setMEMO_ZIN(1000); 					//최초 zindex
		memo.setMEMO_WIDTH("350px");				//최초 메모 폭
		memo.setMEMO_HEIGHT("200px");				//최초 메모 높이
		memo.setMEMO_TEX("새로운 메모를 작성해 보세요!");	//최초 TEXT
		// 최초 작성일, 최종 수정일은 xml에서 sysdate로 처리
		// 최초 PREV_TEX == MEMO_TEX 와 동일
		memo.setMEMO_FAV("Y");						//최초 즐겨찾기 Yes
		memo.setMEMO_LOC("N"); 						//최초 잠금 No
		sqlSession.insert("Memoes.firstinsert", memo);
	}
	public void newInsert(Memo memo) {
		
		System.out.println(memo.getMEMO_TOP());
		memo.setMEMO_POSITION("absolute");
		if(memo.getMEMO_SUB().equals("STUDY")){
			memo.setMEMO_COLOR("#010101");
		}else if(memo.getMEMO_SUB().equals("MONEY")){
			memo.setMEMO_COLOR("#4266f5");
		}else if(memo.getMEMO_SUB().equals("HEALTH")){
			memo.setMEMO_COLOR("#de8e73");
		};
		memo.setMEMO_TEX("");	
		memo.setPREV_TEX("");
		memo.setMEMO_FAV("N");
		memo.setMEMO_LOC("N");
		memo.setMEMO_WIDTH("350px");				//최초 메모 폭
		memo.setMEMO_HEIGHT("200px");				//최초 메모 높이
		sqlSession.insert("Memoes.newinsert",memo);
	}
	
	public List<Memo> selectStudy(Member member) {
		System.out.println(member.getUSER_EMAIL());
		return sqlSession.selectList("Memoes.selectstudy", member);
	}
	
	public List<Memo> selectMoney(Member member) {
		return sqlSession.selectList("Memoes.selectmoney", member);
	}
	public List<Memo> selectHealth(Member member) {
		return sqlSession.selectList("Memoes.selecthealth", member);
	}
	
	
}
