package com.bbq.fundmovie.trade.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.trade.mapper.TradeSQLMapper;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.TradeCommentVo;
import com.bbq.fundmovie.vo.TradeHeadlineVo;
import com.bbq.fundmovie.vo.TradeImageVo;
import com.bbq.fundmovie.vo.TradeLikeVo;
import com.bbq.fundmovie.vo.TradeVo;

@Service
public class TradeServiceImpl {

	@Autowired
	private TradeSQLMapper tradeSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	//메인화면
	public ArrayList<HashMap<String, Object>> getTradeList(){
		
		ArrayList<HashMap<String, Object>> tradeResultList =
				new ArrayList<HashMap<String,Object>>();
		
		ArrayList<TradeVo> tradeList =
				tradeSQLMapper.tradeSelectAll();
		
		for(TradeVo tradeVo : tradeList) {
			int user_no = tradeVo.getUser_no();
			int trade_headline_no = tradeVo.getTrade_headline_no();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			TradeHeadlineVo tradeHeadlineVo = tradeSQLMapper.tradeHeadlineSelect(trade_headline_no);
			
			ArrayList<TradeImageVo> tradeImageVoList = tradeSQLMapper.tradeImageSelectByNo(tradeVo.getTrade_no()); 
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("tradeVo", tradeVo);
			map.put("tradeHeadlineVo", tradeHeadlineVo);
			map.put("tradeImageVoList", tradeImageVoList);
			
			tradeResultList.add(map);
		}
		return tradeResultList;
	}
	
	//상세글 보기
	public HashMap<String, Object> getTradeContent(int tradeNo){
		
		tradeSQLMapper.tradeReadCount(tradeNo);
		
		//출력
		TradeVo tradeVo = tradeSQLMapper.tradeSelectByNo(tradeNo);
		TradeHeadlineVo tradeHeadlineVo = tradeSQLMapper.tradeHeadlineSelect(tradeVo.getTrade_headline_no());
		
		int user_no = tradeVo.getUser_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
		
		ArrayList<TradeImageVo> imageVoList = tradeSQLMapper.tradeImageSelectByNo(tradeNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);
		map.put("tradeVo", tradeVo);
		map.put("tradeHeadlineVo", tradeHeadlineVo);
		map.put("imageVoList", imageVoList);
		
		return map;
	}
	
	//글쓰기
	public void tradeWrite(TradeVo tv, ArrayList<TradeImageVo> imageVoList) {
		
		int tradePK = tradeSQLMapper.createKey();
		tv.setTrade_no(tradePK);
		tradeSQLMapper.tradeInsert(tv);
		
		for(TradeImageVo imageVo : imageVoList) {
			imageVo.setTrade_no(tradePK);
			tradeSQLMapper.tradeImageInsert(imageVo);
		}
		
	}
	
	//수정
	public void updateTradeContent(TradeVo tv) {
		
		System.out.println("수정 서비스");
		
		tradeSQLMapper.tradeContentUpdate(tv);
	}
	
	//삭제
	public void deleteTradeContent(int tradeNo) {
		
		tradeSQLMapper.tradeContentDelete(tradeNo);
	}
	
	//댓글 보기
	public ArrayList<HashMap<String, Object>> getTradeCommentList(int tradeNo){
		
		ArrayList<HashMap<String, Object>> result =
				new ArrayList<HashMap<String,Object>>();
		
		ArrayList<TradeCommentVo> tradeCommentVoList = 
				tradeSQLMapper.tradeCommentSelectByNo(tradeNo);
		
		for(TradeCommentVo tradeCommentVo : tradeCommentVoList) {

			MemberVo memberVo = memberSQLMapper.selectByNo(tradeCommentVo.getUser_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("tradeCommentVo", tradeCommentVo);
			
			result.add(map);
		}
		return result;
	}
	
	
	//댓글 쓰기
	public void tradeCommentWrite(TradeCommentVo tcv) {

		tradeSQLMapper.tradeCommentInsert(tcv);
	}
	
	
	//댓글수정
	public void updateTradeComment(TradeCommentVo tcv) {
		tradeSQLMapper.tradeCommentUpdate(tcv);
	}
	
	//댓글삭제
	public void deleteTradeComment(int tradeCommentNo) {
		tradeSQLMapper.tradeCommentDelete(tradeCommentNo);
	}
	
	
	//좋아요 중복확인 - 좋아요에 대한 전체 값을 뽑아내야 되니까 리턴값으로 count가 필요함
	public int getTradeLike(TradeLikeVo tlv) {
		
		int count = tradeSQLMapper.tradeLikeCheck(tlv);
		
		return count;
	}
	//좋아요 insert - 좋아요 누르면 끝이니까 리턴값 필요가 없음
	public void insertTradeLike(TradeLikeVo tlv) {
		
		tradeSQLMapper.tradeLikeInsert(tlv);
	}
	//좋아요 취소
	public void deleteTradeLike(TradeLikeVo tlv) {
		
		tradeSQLMapper.tradeLikeDelete(tlv);
	}
	//좋아요 한 페이지 당 갯수
	public int getTradeLikeCount(TradeLikeVo tlv) {
		
		int pageCount = tradeSQLMapper.tradeLikeCount(tlv);
		
		return pageCount;
	}
	//승인.. -> 업데이트
	public void tradeComplete(TradeVo tv) {
		tradeSQLMapper.tradeComplete(tv);
	}
	
	
}


