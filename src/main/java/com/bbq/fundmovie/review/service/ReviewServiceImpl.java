package com.bbq.fundmovie.review.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.transform.impl.AddDelegateTransformer;
import org.springframework.stereotype.Service;

import com.bbq.fundmovie.admin.controller.AdminController;
import com.bbq.fundmovie.admin.mapper.AdminSQLMapper;
import com.bbq.fundmovie.admin.mapper.AdminSteelSQLMapper;
import com.bbq.fundmovie.content.mapper.ContentSQLMapper;
import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.review.mapper.ReviewSQLMapper;
import com.bbq.fundmovie.vo.ContentVo;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.MovieSteelcutVo;
import com.bbq.fundmovie.vo.ReviewVo;

@Service
public class ReviewServiceImpl {

	@Autowired
	private ReviewSQLMapper reviewSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private AdminSQLMapper adminSQLMapper;
	
	@Autowired
	private AdminSteelSQLMapper adminSteelSQLMapper;
	
	
	public void deleteReviewNo(int movie_review_no) {
		reviewSQLMapper.deleteReviewNo(movie_review_no);
	};
	
	public ArrayList<HashMap<String, Object>> getReviewList(String search_word , String search_type ,int page_num){
		ArrayList<HashMap<String, Object>> reviewListResult = new ArrayList<HashMap<String,Object>>();
		ArrayList<ReviewVo> reviewList = null;

		if(search_word == null || search_type == null) {
			reviewList = reviewSQLMapper.selectAllReview(page_num);
		}else {
			if(search_type.equals("title")) {
				reviewList = reviewSQLMapper.selectByTitle(search_word);
			}else if(search_type.equals("review")) {
				reviewList = reviewSQLMapper.selectByContent(search_word);
			}else if(search_type.equals("writer")) {
				reviewList = reviewSQLMapper.selectByWriter(search_word);
			}else {
				reviewList = reviewSQLMapper.selectAllReview(page_num);
			}
		}
				
		for(ReviewVo reviewVo : reviewList) {
			int user_no = reviewVo.getUser_no();			
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			int movie_no = reviewVo.getMovie_no();
			ContentVo contentVo = adminSQLMapper.selectByNo(movie_no);
			HashMap<String, Object> reviewMap = new HashMap<String, Object>();
			
			reviewMap.put("reviewVo", reviewVo);
			reviewMap.put("memberVo", memberVo);
			reviewMap.put("contentVo", contentVo);
			
			reviewListResult.add(reviewMap);
			
		}
		return reviewListResult;
	}
	
	public int getPageCount() {
		return reviewSQLMapper.getPageCount();
	}
	
	public HashMap<String, Object> reviewFirst(){
		System.out.println("첫번째 리뷰 들어옴");
		HashMap<String, Object> firstMap = new HashMap<String, Object>();		
		ReviewVo reviewVo = reviewSQLMapper.reviewFirst();
		System.out.println("리뷰 서비스 들어왔따");
		if(reviewVo != null) {
			System.out.println("리뷰 서비스 if 들어왔따");
			int user_no = reviewVo.getUser_no();
			int movie_no = reviewVo.getMovie_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			ContentVo contentVo = adminSQLMapper.selectByNo(movie_no);
						
			firstMap.put("reviewVo", reviewVo);
			firstMap.put("memberVo", memberVo);
			firstMap.put("contentVo", contentVo);
		}else {
			System.out.println("리뷰 서비스 else 들어왔따");
			firstMap.put("reviewVo", reviewVo);
		}
		System.out.println("나가야징");
		return firstMap;
	}
	
	public HashMap<String, Object> reviewSecond(){
		HashMap<String, Object> SecondMap = new HashMap<String, Object>();
		ReviewVo reviewVo = reviewSQLMapper.reviewSecond();
		System.out.println("설마 여기들어온거?");
		if(reviewVo != null) {
			int user_no = reviewVo.getUser_no();
			int movie_no = reviewVo.getMovie_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			ContentVo contentVo = adminSQLMapper.selectByNo(movie_no);
			
			SecondMap.put("reviewVo", reviewVo);
			SecondMap.put("memberVo", memberVo);
			SecondMap.put("contentVo", contentVo);
		}else {
			SecondMap.put("reviewVo", reviewVo);
		}
		
		return SecondMap;
	}
	
	public HashMap<String, Object> reviewThird(){
		HashMap<String, Object> ThirdMap = new HashMap<String, Object>();
		ReviewVo reviewVo = reviewSQLMapper.reviewThird();
		if(reviewVo != null) {
			int user_no = reviewVo.getUser_no();
			int movie_no = reviewVo.getMovie_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			ContentVo contentVo = adminSQLMapper.selectByNo(movie_no);
			ThirdMap.put("reviewVo", reviewVo);
			ThirdMap.put("memberVo", memberVo);
			ThirdMap.put("contentVo", contentVo);
		}else {
			ThirdMap.put("reviewVo", reviewVo);
		}
		
		return ThirdMap;
	}
	
	public void reviewWrite(ReviewVo param) {
		reviewSQLMapper.insertMovieReview(param);
	}
	
	
	public HashMap<String, Object> reviewRead(int movie_review_no) {
		reviewSQLMapper.increaseReviewCount(movie_review_no);
		ReviewVo reviewVo = reviewSQLMapper.selectByNo(movie_review_no);
		
		int user_no = reviewVo.getUser_no();
		
		MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
		
		HashMap<String, Object> readMap = new HashMap<String, Object>();
		
		int movie_no = reviewVo.getMovie_no();
		
		ContentVo contentVo = adminSQLMapper.selectByNo(movie_no);
		
		String release_date = contentVo.getMovie_release_date();
		String Ryear = release_date.substring(0, 4);
		String Rmonth = release_date.substring(4, 6);
		String Rdate = release_date.substring(6, 8);
		
		
		String str = reviewVo.getMovie_review_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		reviewVo.setMovie_review_content(str);
		
		String str1 = contentVo.getMovie_synopsis();
		str1 = StringEscapeUtils.escapeHtml4(str1);
		str1= str1.replaceAll("\n", "<br>");
		contentVo.setMovie_synopsis(str1);
	
	
	
		readMap.put("reviewVo", reviewVo);
		readMap.put("memberVo",memberVo);
		readMap.put("contentVo", contentVo);
		readMap.put("releaseYear", Ryear);
		readMap.put("releaseMonth", Rmonth);
		readMap.put("releaseDate", Rdate);
		
		
		return readMap;
	}
	
	public ArrayList<HashMap<String, Object>> writeMoiveList(){
		System.out.println("영화 리스트 들어왔따");
		ArrayList<HashMap<String, Object>> reviewMovieList = new ArrayList<HashMap<String,Object>>();
		ArrayList<ContentVo> reviewMovie=reviewSQLMapper.selectMovieList();
		
		for(ContentVo contentVo : reviewMovie) {
			System.out.println("영화 리스트 포문 들어옴");
			HashMap<String, Object> movieMap = new HashMap<String, Object>();
			System.out.println("영화 재목은 ---->"+contentVo.getMovie_title());
			
			
			movieMap.put("contentVo", contentVo);
			
			
			reviewMovieList.add(movieMap);
		}
		
		return reviewMovieList;
	}
	
	public void reviewUpdate(ReviewVo param) {
		reviewSQLMapper.reviewUpdate(param);
	}
	
	public ArrayList<HashMap<String, Object>> readSteel(int movie_review_no){
		ReviewVo reviewVo = reviewSQLMapper.selectByNo(movie_review_no);		
		int movie_no = reviewVo.getMovie_no();
		
		ArrayList<HashMap<String, Object>> movieSteelList = new ArrayList<HashMap<String, Object>>();
		ArrayList<MovieSteelcutVo> movieSteel = adminSteelSQLMapper.selectByMovieNo(movie_no);
		
		for(MovieSteelcutVo movieSteelcutVo : movieSteel) {
			System.out.println("무비스틸컷 포문 들어옴");
			HashMap<String, Object> steelMap = new HashMap<String, Object>();
			
			steelMap.put("movieSteelcutVo", movieSteelcutVo);
			
			movieSteelList.add(steelMap);
			
		}
		
		return movieSteelList;
	}
	
}
