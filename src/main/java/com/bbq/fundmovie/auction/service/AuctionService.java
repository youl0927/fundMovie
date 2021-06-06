package com.bbq.fundmovie.auction.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbq.fundmovie.auction.mapper.AuctionSQLMapper;
import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.vo.AuctionApplyListVo;
import com.bbq.fundmovie.vo.AuctionImagesVo;
import com.bbq.fundmovie.vo.AuctionVo;
import com.bbq.fundmovie.vo.MemberVo;

@Service
public class AuctionService {

	@Autowired
	private AuctionSQLMapper auctionSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public void joinAuctionInform(AuctionApplyListVo vo) {
		
		System.out.println("경매 조인 시작");
		
		auctionSQLMapper.updateAuctionApplyList(vo);
		System.out.println("경매 조인 끝");

	
	}
	
	public void updateAuctionPrice(AuctionVo vo) {
		auctionSQLMapper.updateCurrentPrice(vo);
	}
	
	public void updateAuctionTime(int auction_no) {
		auctionSQLMapper.updateAuctionTime(auction_no);
	}
	
		
	public int addAuctionInform(AuctionVo vo) {
		
		int auction_no = auctionSQLMapper.createKey();
		System.out.println("service1 auction_no: "+auction_no);
		vo.setAuction_no(auction_no);
		int current_price = vo.getEstimate_price();
		current_price = (current_price*8/10)+(current_price*8%10);
		vo.setCurrent_price(current_price);
		auctionSQLMapper.insertAuctionInform(vo);
		System.out.println("service1-1 auction_no: "+auction_no);

		return auction_no;
	}
	
	public void addAuctionImages(AuctionImagesVo vo) {
		System.out.println("service2 auction_no: "+vo.getAuction_no());
		auctionSQLMapper.addAuctionImages(vo);
	}
	
	
	
	public ArrayList<HashMap<String, Object>> getMyAuctionList(int user_no){
		ArrayList<HashMap<String, Object>> resultList =
				new ArrayList<HashMap<String, Object>>();
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		int myAuctionCount = auctionSQLMapper.countMyAuctionByNo(user_no);
		//ArrayList<AuctionApplyListVo> myAuctionList = new ArrayList<AuctionApplyListVo>();
		ArrayList<AuctionApplyListVo> myAuctionList = null;
		
		if(myAuctionCount !=0) {
			myAuctionList = auctionSQLMapper.selectMyAuctionNo(user_no);

			for(AuctionApplyListVo auctionListVo : myAuctionList) {
				int auction_no = auctionListVo.getAuction_no();
				
				AuctionVo myAuctionVo = auctionSQLMapper.selectByNo(auction_no);
				ArrayList<AuctionImagesVo> auctionImagesVoList = 
						auctionSQLMapper.selectImagesByNo(auction_no);
	
				int call_price = myAuctionVo.getEstimate_price()/30;
				
				int max_price = 0;
				int max_bidder_no = 0;
				MemberVo max_bidderVo = new MemberVo();
				max_bidderVo.setUser_nick("");
				
				int countByNo = auctionSQLMapper.countAuction(auction_no);
				if(countByNo != 0) {
					max_price = auctionSQLMapper.maxPrice(auction_no);
					max_bidder_no = auctionSQLMapper.maxBidder(auction_no);
					max_bidderVo = memberSQLMapper.selectByNo(max_bidder_no);
				}else {
					
				}
				
				map.put("myAuctionVo", myAuctionVo);
				map.put("call_price", call_price);
				map.put("max_price", max_price);
				map.put("max_bidderVo", max_bidderVo);
				map.put("auctionImagesVoList", auctionImagesVoList);
				
				resultList.add(map);
			}
		}
				map.put("myAuctionCount", myAuctionCount);

		
		return resultList;
	}
	
	
	public ArrayList<HashMap<String, Object>> getAuctionList(){
		ArrayList<HashMap<String, Object>> resultList =
				new ArrayList<HashMap<String, Object>>();
	
		ArrayList<AuctionVo> auctionList = auctionSQLMapper.selectAll();
		
		for(AuctionVo auctionVo : auctionList) {
			int member_no = auctionVo.getUser_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no) ;
			
			int auction_no = auctionVo.getAuction_no();
			ArrayList<AuctionImagesVo> auctionImagesVoList = 
					auctionSQLMapper.selectImagesByNo(auction_no);

			

			int low_price = auctionVo.getEstimate_price()*8/10;
			int high_price = auctionVo.getEstimate_price()*12/10;
			int call_price = auctionVo.getEstimate_price()/30;
			
			int max_price = 0;
			int max_bidder_no = 0;
			MemberVo max_bidderVo = new MemberVo();
			max_bidderVo.setUser_nick("");
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			int countByNo = auctionSQLMapper.countAuction(auction_no);
			if(countByNo != 0) {
				max_price = auctionSQLMapper.maxPrice(auction_no);
				max_bidder_no = auctionSQLMapper.maxBidder(auction_no);
				max_bidderVo = memberSQLMapper.selectByNo(max_bidder_no);
			}else {
				
			}
			
			map.put("memberVo", memberVo);
			map.put("auctionVo", auctionVo);
			map.put("low_price", low_price);
			map.put("high_price", high_price);
			map.put("call_price", call_price);
			map.put("max_price", max_price);
			map.put("max_bidderVo", max_bidderVo);
			map.put("auctionImagesVoList", auctionImagesVoList);
			
			//map.put("name" , memberVo.getUser_nick());
			
			
			
			
			resultList.add(map);
		}
		return resultList;
	}
	
	public HashMap<String, Object> getAuctionInform(int auction_no){
		AuctionVo auctionVo = auctionSQLMapper.selectByNo(auction_no);
		int user_no = auctionVo.getUser_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
		
		ArrayList<AuctionImagesVo> auctionImagesVoList = 
				auctionSQLMapper.selectImagesByNo(auction_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);
		map.put("auctionVo", auctionVo);
		map.put("auctionImagesVoList", auctionImagesVoList);
		
		return map;
	}
	
	public AuctionVo auctionInform(int auction_no) {
		AuctionVo vo = auctionSQLMapper.selectByNo(auction_no);
		return vo;
	}
	
	public AuctionApplyListVo auctionApplyListInform(AuctionApplyListVo vo) {
		
		int countByNo = auctionSQLMapper.countByAuctionNo(vo);
		if(countByNo != 0) {
			System.out.println("경매 업데이트 시작");
		}else {
			System.out.println("경매 신규 참가 시작");
			auctionSQLMapper.insertAuctionApplyList(vo);
		}
		
		AuctionApplyListVo applyListVo = auctionSQLMapper.selectApplyListByNo(vo);
		return applyListVo;
	}
	
	public void deleteAuctionInform(int auction_no) {
		auctionSQLMapper.deleteByNo(auction_no);
		auctionSQLMapper.deleteImagesByNo(auction_no);

	}
	
	public void confirmAuctionInform(int auction_no) {
		auctionSQLMapper.updateStatus(auction_no);
	}
	
}
