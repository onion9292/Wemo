package com.naver.wemo.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.wemo.domain.Member;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	MemoDAO memodao;
	
	public void insertMember(Member member) {//첫 회원가입
			System.out.println(member.getUSER_EMAIL());
			System.out.println(member.getUSER_PASS());
			member.setUSER_SUB("STUDY");
			member.setAUTH_TYPE("NONE");
			member.setUSER_NICK(member.getUSER_EMAIL());//처음 닉네임은 ID
			member.setUSER_FORM("STUDY");
			sqlSession.insert("Members.insert", member);//회원정보 입력
			memodao.firstInsert(member);//처음 메모 입력				
		}

	
	public Member isId(Member member) {
		return sqlSession.selectOne("Members.idcheck",member);
	}
	
}
