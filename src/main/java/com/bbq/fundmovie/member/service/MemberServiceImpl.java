package com.bbq.fundmovie.member.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.vo.MemberVo;

@Service
public class MemberServiceImpl {
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;

	
	
	//SQLmapper의 비즈니스 로직처리
	
	//회원가입 쿼리문
	public void joinMember(MemberVo vo) {
		memberSQLMapper.insert(vo);
	}
	
	//로그인 쿼리문
	public MemberVo login(MemberVo param) {
		
		MemberVo result = memberSQLMapper.selectForLogin(param);
		
		return result;
	}
	
	public boolean searchById(String id) {
		MemberVo result = memberSQLMapper.searchById(id);
		
		if(result != null) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean searchByNick(String nick) {
		MemberVo result = memberSQLMapper.searchByNick(nick);
		
		if(result != null) {
			return true;
		}else {
			return false;
		}
	}
	
	
	
	
	
	
}
