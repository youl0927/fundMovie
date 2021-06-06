package com.bbq.fundmovie.mypage.mapper;

import java.util.ArrayList;

import com.bbq.fundmovie.vo.FundingOpenVo;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.MessageVo;
import com.bbq.fundmovie.vo.RankUpRequestVo;

public interface MyPageSQLMapper {

	public void insertMessage(MessageVo vo );
	
	public void insertRequest(int user_no);
	
	public int selectRankRequest(int user_no);
	
	public int selectByAuthorAndNo(MemberVo vo);
	
	public ArrayList<RankUpRequestVo> selectAllRankRequest();
	
	public ArrayList<FundingOpenVo> selectAllFundRequest();
	
	public ArrayList<MessageVo> selectByUserNo(int no);
	
	public ArrayList<MessageVo> selectByReceiverNo(int no);

	public void deleteByNo(int message_no);
	
	public MemberVo selectByNo(int no);
	
	public void chargePoint(MemberVo vo);
	
	public void addAccount(MemberVo vo);

	public void usedPoint(MemberVo vo);

}
