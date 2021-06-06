package com.bbq.fundmovie.hangout.mapper;

import java.util.ArrayList;

import com.bbq.fundmovie.vo.HangOutJoinVo;
import com.bbq.fundmovie.vo.HangOutVo;

public interface HangOutSQLMapper {
	
	//키생성
		public int createKey();
	//등록
	public void addHangOut(HangOutVo vo);
	
	public ArrayList<HangOutVo>selectAll();
	
	public void addHangOutMember(HangOutJoinVo vo);
	
	public int selectJoinCount(int hangout_movie_no);
	
	public int selectJoin(HangOutJoinVo param);
	
}
