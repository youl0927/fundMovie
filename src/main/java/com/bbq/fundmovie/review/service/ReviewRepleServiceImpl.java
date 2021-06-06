package com.bbq.fundmovie.review.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.member.service.MemberServiceImpl;
import com.bbq.fundmovie.review.mapper.ReviewRepleSQLMapper;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.ReviewRepleVo;

@Service
public class ReviewRepleServiceImpl {

	@Autowired
	private ReviewRepleSQLMapper reviewRepleSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public void reviewRepleInsert(ReviewRepleVo param) {
		reviewRepleSQLMapper.reviewRepleInsert(param);
	}
	
	public ArrayList<HashMap<String, Object>> reviewRepleList(int movie_review_no){
		ArrayList<HashMap<String, Object>> reviewRepleListResult = new ArrayList<HashMap<String,Object>>();
		ArrayList<ReviewRepleVo> reviewReple = reviewRepleSQLMapper.selectByReviewRepleAll(movie_review_no);
		
		for(ReviewRepleVo vo : reviewReple) {
			int user_no = vo.getUser_no();			
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			HashMap<String, Object> reviewRepleList = new HashMap<String, Object>();
			
			reviewRepleList.put("memberVo", memberVo);
			reviewRepleList.put("vo", vo);
			
			
			reviewRepleListResult.add(reviewRepleList);
		}
		return reviewRepleListResult;
	}
	
	public void deleteReviewRepleNo(int review_reple_no) {
		reviewRepleSQLMapper.deleteReviewRepleNo(review_reple_no);
	}
}
