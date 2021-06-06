package com.bbq.fundmovie.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbq.fundmovie.member.mapper.AddFriendSQLMapper;
import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.vo.AddFriendVo;
import com.bbq.fundmovie.vo.MemberVo;


@Service
public class AddFriendServiceImpl {
	
	@Autowired
	private AddFriendSQLMapper addFriendSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper; 

	
	public ArrayList<HashMap<String,Object>> getFriendList(int user_no){
		ArrayList<HashMap<String, Object>> addFriendList =
				new ArrayList<HashMap<String, Object>>(); 
		//출력 데이터 받아 오기...
		ArrayList<AddFriendVo> friendList =
				addFriendSQLMapper.selectByNo(user_no);
		
		
		for(AddFriendVo addFriendVo : friendList) {
			int member_no = addFriendVo.getFriend_user_no();
						
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			map.put("addFriendVo", addFriendVo);
			
			addFriendList.add(map);
		}
		
	
		return addFriendList;
		
	}
	
	public ArrayList<HashMap<String,Object>> getMyFriendList(int user_no){
		ArrayList<HashMap<String, Object>> myFriendList =
				new ArrayList<HashMap<String, Object>>(); 
		//출력 데이터 받아 오기...
		ArrayList<AddFriendVo> myfriendList =
				addFriendSQLMapper.selectByMyNo(user_no);
		
		
		for(AddFriendVo addMyFriendVo : myfriendList) {
			int member_no = addMyFriendVo.getUser_no();
						
			MemberVo memberMyVo = memberSQLMapper.selectByNo(member_no);
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberMyVo", memberMyVo);
			map.put("addMyFriendVo", addMyFriendVo);
			
			myFriendList.add(map);
		}
		
	
		return myFriendList;
		
	}
	
	public void addFriend(AddFriendVo vo) {
		
		addFriendSQLMapper.addFriend(vo);
		
	}
	
	
	public ArrayList<HashMap<String, Object>> getMemberList(String search_word , String search_type ,int page_num){
		ArrayList<HashMap<String, Object>> searchList =
				new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<MemberVo> memberList = null;
		
		if(search_word == null || search_type == null) {
			memberList = addFriendSQLMapper.selectAll(page_num);
		}else {
			if(search_type.equals("user_nick")) {
				memberList = addFriendSQLMapper.selectByNick(search_word);
			}else if(search_type.equals("user_id")) {
				memberList = addFriendSQLMapper.selectById(search_word);
			}else if(search_type.equals("user_email")) {
				memberList = addFriendSQLMapper.selectByEmail(search_word);
			}else {
				memberList = addFriendSQLMapper.selectAll(page_num);
			}
		}
		
		for(MemberVo memberVo : memberList) {
			int member_no = memberVo.getUser_no();
			
			MemberVo memberVo1 = memberSQLMapper.selectByNo(member_no);
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			//map.put("memberVo1", memberVo1);
			map.put("isMyFrend", true);
			
			searchList.add(map);
		}
		
		return searchList;
	}
	
	public int getPageCount() {
		return addFriendSQLMapper.getPageCount();
	}
	
	public void deleteFriend(AddFriendVo vo) {
		System.out.println("friend_user_no:"+vo.getFriend_user_no());
		System.out.println("user_no:"+vo.getUser_no());
		
		addFriendSQLMapper.deleteByFriendNo(vo);
	}
	
}
