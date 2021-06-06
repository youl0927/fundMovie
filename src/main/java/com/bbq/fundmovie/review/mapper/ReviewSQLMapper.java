package com.bbq.fundmovie.review.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.bbq.fundmovie.vo.ContentVo;
import com.bbq.fundmovie.vo.ReviewVo;

public interface ReviewSQLMapper {

	public ArrayList<ReviewVo> selectAllReview(int page_num);
	
	//제목 검색...
	public ArrayList<ReviewVo> selectByTitle(String search_word);
		
	//내용 검색
	public ArrayList<ReviewVo> selectByContent(String search_word);
		
	//작성자 검색
	public ArrayList<ReviewVo> selectByWriter(String search_word);
		
	//페이지 개수
	public int getPageCount();	
	
	public void insertMovieReview(ReviewVo vo);
	
	public void increaseReviewCount(int movie_review_no);
	
	public ReviewVo selectByNo(int movie_review_no);
	
	public void deleteReviewNo(int movie_review_no);
	
	public void reviewUpdate(ReviewVo vo);
	
	public ArrayList<ContentVo> selectMovieList();
	
	public ReviewVo reviewFirst();
	
	public ReviewVo reviewSecond();
	
	public ReviewVo reviewThird();
}
