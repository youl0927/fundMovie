package com.bbq.fundmovie.member.mapper;

import com.bbq.fundmovie.vo.MemberVo;

public interface MemberSQLMapper {
	
	//닉네임 중복 확인
	public MemberVo searchByNick(String nick);
	
	//id로 회원 조회
	public MemberVo searchById(String id);
	
	//회원가입
	public void insert(MemberVo vo);
	
	//로그인
	public MemberVo selectForLogin(MemberVo vo);

	//member pk순으로
	public MemberVo selectByNo(int no);
	

	
}
