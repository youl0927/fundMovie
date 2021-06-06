package com.bbq.fundmovie.review.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.bbq.fundmovie.vo.ReviewRepleVo;

public interface ReviewRepleSQLMapper {

	public void reviewRepleInsert(ReviewRepleVo vo);
	
	public ArrayList<ReviewRepleVo> selectByReviewRepleAll(int movie_review_no);
	
	public void deleteReviewRepleNo(int review_reple_no);
	
}
