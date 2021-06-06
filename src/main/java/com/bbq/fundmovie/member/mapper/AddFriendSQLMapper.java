package com.bbq.fundmovie.member.mapper;

import java.util.ArrayList;

import com.bbq.fundmovie.vo.AddFriendVo;
import com.bbq.fundmovie.vo.MemberVo;


public interface AddFriendSQLMapper {
	
	//친구 목록
	public ArrayList<AddFriendVo> selectByNo(int no);
	public ArrayList<AddFriendVo> selectByMyNo(int no);

	
	//친구 등록
	public void addFriend(AddFriendVo vo); 
	
	//친구 삭제
	public void deleteByFriendNo(AddFriendVo vo);	

	//전체 출력..
	public ArrayList<MemberVo> selectAll(int page_num);
	
	//닉네임 검색...
	public ArrayList<MemberVo> selectByNick(String search_word);
	
	//아이디 검색
	public ArrayList<MemberVo> selectById(String search_word);
	
	//이메일 검색
	public ArrayList<MemberVo> selectByEmail(String search_word);
	
	//페이지 개수
	public int getPageCount();
}
