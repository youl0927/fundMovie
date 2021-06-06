package com.bbq.fundmovie.review.mapper;

import com.bbq.fundmovie.vo.ReviewLikeVo;

public interface ReviewLikeSQLMapper {
	public void reviewLikeInsert(ReviewLikeVo vo);
	
	public int reviewMyLike(ReviewLikeVo vo);
	
	public void reviewLikeDelete(ReviewLikeVo vo);
	
	public int countLikeTotal(int no);

}
