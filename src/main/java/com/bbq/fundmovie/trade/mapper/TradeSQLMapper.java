package com.bbq.fundmovie.trade.mapper;

import java.util.ArrayList;

import com.bbq.fundmovie.vo.TradeCommentVo;
import com.bbq.fundmovie.vo.TradeHeadlineVo;
import com.bbq.fundmovie.vo.TradeImageVo;
import com.bbq.fundmovie.vo.TradeLikeVo;
import com.bbq.fundmovie.vo.TradeVo;

public interface TradeSQLMapper {

	//PK키-이미지에서?
	public int createKey();
	
	//글쓰기-0
	public void tradeInsert(TradeVo tv);
	
	//메인화면-0
	public ArrayList<TradeVo> tradeSelectAll();

	//상세화면-0
	public TradeVo tradeSelectByNo(int no);
	
	//조회수-0
	public void tradeReadCount(int no);
	
	//말머리-0
	public TradeHeadlineVo tradeHeadlineSelect (int no);
	
	//수정
	public void tradeContentUpdate(TradeVo tv);
	
	//글 삭제
	public void tradeContentDelete(int no);
	
	//거래승인
	public void tradeComplete(TradeVo tv);
	
	
	
	
	//좋아요 중복확인-0
	public int tradeLikeCheck(TradeLikeVo tlv);
	
	//좋아요 insert-0
	public void tradeLikeInsert(TradeLikeVo tlv);
	
	//좋아요 취소-0
	public void tradeLikeDelete(TradeLikeVo tlv);
	
	//좋아요 하나의 글 당 갯수-0
	public int tradeLikeCount(TradeLikeVo tlv);
	
	
	
	
	
	//댓글보기
	public ArrayList<TradeCommentVo> tradeCommentSelectByNo(int trade_no);
	
	//댓글쓰기
	public void tradeCommentInsert(TradeCommentVo tcv);
	
	//댓글수정
	public void tradeCommentUpdate(TradeCommentVo tcv);
	
	//댓글삭제
	public void tradeCommentDelete(int no);
	
	//이미지 첨부
	public void tradeImageInsert(TradeImageVo tiv);
	
	//이미지 보기
	public ArrayList<TradeImageVo> tradeImageSelectByNo(int trade_no);
}
