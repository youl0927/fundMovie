package com.bbq.fundmovie.funding.mapper;

import java.util.ArrayList;

import com.bbq.fundmovie.vo.FundingImageVo;

public interface FundingImageSQLMapper {

	public void insert(FundingImageVo vo);
	
	public ArrayList<FundingImageVo> selectFundingImagesByFundingNo(int funding_open_no);
	
	public void updateFundingImage(FundingImageVo imageVo);
}
