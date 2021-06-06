package com.bbq.fundmovie.trade.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbq.fundmovie.trade.service.TradeServiceImpl;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.TradeCommentVo;
import com.bbq.fundmovie.vo.TradeLikeVo;

@Controller
@RequestMapping("/trade/*")
@ResponseBody
public class RESTfulTradeController {

	@Autowired
	private TradeServiceImpl tradeService;
	//어디까지 얼마나 보여져야 하는가?!
	//댓글보기
	@RequestMapping("get_comment_list.do")
	public ArrayList<HashMap<String, Object>> getCommentList(int trade_no){
		
		ArrayList<HashMap<String, Object>> result= tradeService.getTradeCommentList(trade_no);
		
		return result;
	}
	
	
	//댓글쓰기
	//여기서의 리턴값은 없어야되나...??
	@RequestMapping("write_comment_process.do")
	public void writeCommentProcess(TradeCommentVo param, HttpSession session) {
		
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();
		param.setUser_no(user_no);
		
		tradeService.tradeCommentWrite(param);
	}
	
	//댓글삭제
	@RequestMapping("delete_comment_process.do")
	public void deleteCommentProcess(int trade_no, int trade_comment_no) {
		
		int deleteCount = 0;
		deleteCount = trade_comment_no;
		tradeService.deleteTradeComment(trade_comment_no);
		
	}
	//좋아요
	@RequestMapping("like_process.do")
	public void likeProcess(HttpSession session, TradeLikeVo param,int trade_no) {
		
		/*
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		int count = 0;
		int pageCount = 0;
		
		if(memberVo != null) {
			TradeLikeVo tradeLikeVo = new TradeLikeVo();
			tradeLikeVo.setTrade_no(trade_no);
			tradeLikeVo.setUser_no(memberVo.getUser_no());
			
			count = tradeService.getTradeLike(tradeLikeVo);
			pageCount = tradeService.getTradeLikeCount(tradeLikeVo);
		}
		*/
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		param.setUser_no(user_no);
		
		int count = tradeService.getTradeLike(param);
		
		if(count == 0) {
			tradeService.insertTradeLike(param);
		}else {
			tradeService.deleteTradeLike(param);
		}
	}
	
	//내가 좋아요를 했냐 안했냐...
	@RequestMapping("getLikeState.do")
	public HashMap<String,Object> getLikeState(HttpSession session,int trade_no){
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		int count = 0;
		int pageCount = 0;
		
		if(memberVo != null) {
			TradeLikeVo tradeLikeVo = new TradeLikeVo();
			tradeLikeVo.setTrade_no(trade_no);
			tradeLikeVo.setUser_no(memberVo.getUser_no());
			
			count = tradeService.getTradeLike(tradeLikeVo);
			pageCount = tradeService.getTradeLikeCount(tradeLikeVo);
			
			map.put("myLikeCount" , count);
			map.put("totalLikeCount", pageCount);
		}
		
		return map;
		
	}
}
