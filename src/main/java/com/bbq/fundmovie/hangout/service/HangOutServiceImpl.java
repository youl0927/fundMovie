package com.bbq.fundmovie.hangout.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbq.fundmovie.hangout.mapper.HangOutSQLMapper;
import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.vo.HangOutJoinVo;
import com.bbq.fundmovie.vo.HangOutVo;
import com.bbq.fundmovie.vo.MemberVo;

@Service
public class HangOutServiceImpl {

	@Autowired
	private HangOutSQLMapper hangOutSQLMapper;

	@Autowired
	private MemberSQLMapper memberSQLMapper; 
	
	public void openHangOut(HangOutVo vo) {
		
		int hangoutPK = hangOutSQLMapper.createKey();
		vo.setHangout_movie_no(hangoutPK);
		hangOutSQLMapper.addHangOut(vo);
		
		int user_no = vo.getHangout_user_no();
		HangOutJoinVo vo1 = new HangOutJoinVo();
		vo1.setHangout_movie_no(hangoutPK);
		vo1.setHangout_member_no(user_no);
		hangOutSQLMapper.addHangOutMember(vo1);
		
	}
	
	public void joinHangOut(HangOutJoinVo vo) {
		hangOutSQLMapper.addHangOutMember(vo);
	}
	
	
	public ArrayList<HashMap<String, Object>> getHangOutList(int user_no){
		ArrayList<HashMap<String, Object>> resulList = 
				new ArrayList<HashMap<String, Object>>();
		
		ArrayList<HangOutVo> hangOutList = 
				hangOutSQLMapper.selectAll();
			
		for(HangOutVo hangOutVo : hangOutList) {
			int member_no = hangOutVo.getHangout_user_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			int movie_no = hangOutVo.getHangout_movie_no();
			int hangoutCount = hangOutSQLMapper.selectJoinCount(movie_no);
			HangOutJoinVo param = new HangOutJoinVo();
			param.setHangout_member_no(user_no);
			param.setHangout_movie_no(movie_no);
			int joinMembercount = hangOutSQLMapper.selectJoin(param);
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			map.put("hangOutVo", hangOutVo);
			map.put("hangoutCount", hangoutCount);
			map.put("joinMember", joinMembercount);
			
			resulList.add(map);
		}
		return resulList;

	}
}
