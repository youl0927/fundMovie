package com.bbq.fundmovie.auction.mapper;

import java.util.ArrayList;

import com.bbq.fundmovie.vo.AuctionApplyListVo;
import com.bbq.fundmovie.vo.AuctionImagesVo;
import com.bbq.fundmovie.vo.AuctionVo;

public interface AuctionSQLMapper {
	
	public int createKey();
	//옥션 개설
	public void insertAuctionInform(AuctionVo vo);
	
	public void addAuctionImages(AuctionImagesVo vo);
	
	public ArrayList<AuctionVo> selectAll();
	
	public ArrayList<AuctionApplyListVo> selectMyAuctionNo(int user_no);
	
	public int countMyAuctionByNo(int user_no);

	public AuctionVo selectByNo(int auction_no);
	
	public AuctionApplyListVo selectApplyListByNo(AuctionApplyListVo vo);
	
	public  ArrayList<AuctionImagesVo> selectImagesByNo(int auction_no);

	public void deleteByNo(int auction_no);
	
	public void deleteImagesByNo(int auction_no);
	
	public void updateStatus(int auction_no);
	
	public void insertAuctionApplyList(AuctionApplyListVo vo);
	
	public void updateAuctionApplyList(AuctionApplyListVo vo);
	
	public int countByAuctionNo(AuctionApplyListVo vo);
	
	public int countAuction(int auction_no);

	public int maxPrice(int auction_no);
	
	public int maxBidder(int auction_no);

	public void updateCurrentPrice(AuctionVo vo);
	
	public void updateAuctionTime(int auction_no);
	
}
