package com.bbq.fundmovie.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.mypage.mapper.MyPageSQLMapper;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.MessageVo;

@Service
public class MyPageServiceImpl {

	@Autowired
	private MyPageSQLMapper myPageSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public HashMap<String, Object> getUser_point(int userNo){
	      MemberVo memberVo = myPageSQLMapper.selectByNo(userNo);
	      HashMap<String,Object> map = new HashMap<String,Object>(); 
	      map.put("memberVo", memberVo);      
	      return map;
	   }

	
	public void chargePoint(MemberVo vo) {
		myPageSQLMapper.chargePoint(vo);
	}
	
	public void usedPoint(MemberVo vo) {
		myPageSQLMapper.usedPoint(vo);
	}
	
	
	
	public void writeMessage(MessageVo vo ) {
		myPageSQLMapper.insertMessage(vo);
	}
	
	public void rankUpRequest(int user_no) {
		myPageSQLMapper.insertRequest(user_no);
	}
	
	public void setAccount(MemberVo param) {
		myPageSQLMapper.addAccount(param);
	}
	
	public int rankUpStatus(int user_no) {
		return myPageSQLMapper.selectRankRequest(user_no);
	}
	
	
	public ArrayList<HashMap<String, Object>> sendMessageList(int no){
		ArrayList<HashMap<String, Object>> resultList =
				new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<MessageVo> messageList = myPageSQLMapper.selectByUserNo(no); 
	
		for(MessageVo messageVo : messageList) {
			int user_no = messageVo.getReceiver_no();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			map.put("messageVo", messageVo);
			
			resultList.add(map);
		}
		return resultList;
	}
	
	public ArrayList<HashMap<String, Object>> receiveMessageList(int no){
		ArrayList<HashMap<String, Object>> resultList =
				new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<MessageVo> messageList = myPageSQLMapper.selectByReceiverNo(no); 
	
		for(MessageVo messageVo : messageList) {
			int user_no = messageVo.getUser_no();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			map.put("messageVo", messageVo);
			
			resultList.add(map);
		}
		return resultList;
	}
	
	public void deleteMessage(int message_no) {
		myPageSQLMapper.deleteByNo(message_no);

	}
	
	public int checkUserAuthor(MemberVo vo) {
		
		int fundingUserCount = myPageSQLMapper.selectByAuthorAndNo(vo);
		
		return fundingUserCount;
		
	}
}
	