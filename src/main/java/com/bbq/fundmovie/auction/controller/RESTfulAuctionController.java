package com.bbq.fundmovie.auction.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbq.fundmovie.auction.service.AuctionService;
import com.bbq.fundmovie.vo.MemberVo;

@Controller
@RequestMapping("/auction/*")
@ResponseBody
public class RESTfulAuctionController {
	
	@Autowired
	private AuctionService auctionService;
			
	@RequestMapping("get_auction_list.do")
	public ArrayList<HashMap<String, Object>> auctionMain() {
		
		ArrayList<HashMap<String, Object>> resultList = 
				auctionService.getAuctionList();
		
		return resultList;
	}
	
	@RequestMapping("get_my_auction_list.do")
	public ArrayList<HashMap<String, Object>> myAuctionList(HttpSession session) {
		
		MemberVo sessionUser = 
				(MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no(); 
	
		ArrayList<HashMap<String, Object>> resultList = 
				auctionService.getMyAuctionList(user_no);
		
		return resultList;
	}


	@RequestMapping("get_auction_detail.do")
	public HashMap<String, Object> addAuctionConfirm(int auction_no) {
		HashMap<String, Object> map = auctionService.getAuctionInform(auction_no);
		
		return map;
	}
	
	
}
