package com.bbq.fundmovie.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.review.mapper.ReviewLikeSQLMapper;
import com.bbq.fundmovie.review.mapper.ReviewUnlikeSQLMapper;
import com.bbq.fundmovie.vo.FreeboardLikeVo;
import com.bbq.fundmovie.vo.ReviewLikeVo;
import com.bbq.fundmovie.vo.ReviewUnlikeVo;

@Service
public class ReviewLikeServiceImpl {
	
	@Autowired
	private ReviewLikeSQLMapper reviewLikeSQLMapper;
	
	@Autowired
	private ReviewUnlikeSQLMapper reviewUnlikeSQLMapper;

	public void reviewLikeInsert(ReviewLikeVo param) {
		reviewLikeSQLMapper.reviewLikeInsert(param);
	}
	
	public void reviewLikeUpdate(ReviewLikeVo vo) {
		reviewLikeSQLMapper.reviewLikeDelete(vo);
	}
	
	public void reviewUnlikInsert(ReviewUnlikeVo param) {
		reviewUnlikeSQLMapper.reviewUnlikeInsert(param);
	}
	
	public int reviewMyLike(ReviewLikeVo vo) {
		return reviewLikeSQLMapper.reviewMyLike(vo);
	}
	
	public int countLikeTotal(int movie_reple_no) {
		return reviewLikeSQLMapper.countLikeTotal(movie_reple_no);
	}
	
	
}
