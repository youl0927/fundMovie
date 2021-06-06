package com.bbq.fundmovie.review.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bbq.fundmovie.review.service.ReviewLikeServiceImpl;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.ReviewLikeVo;
import com.bbq.fundmovie.vo.ReviewUnlikeVo;

@Controller
@RequestMapping("/review/*")
public class ReviewLikeController {

	@Autowired
	private ReviewLikeServiceImpl reviewLikeService;
	
	@RequestMapping("review_like_process.do")
	public String ReviewLikeInsert(ReviewLikeVo param, HttpSession session) {
		
		System.out.println("좋아요 업데이트 들어옴");
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();
		param.setUser_no(user_no);
		
		reviewLikeService.reviewLikeInsert(param);
		
		int movie_review_no = param.getMovie_review_no();
		System.out.println("좋아요 업데이트 처리 직전");		
		return "redirect:./reivew_read_page.do?movie_review_no=" + movie_review_no;
	}
	
	@RequestMapping("review_like_update.do")
	public String ReviewLikeUpdate(ReviewLikeVo param) {
		System.out.println("좋아요 취소 들어왔따");
		reviewLikeService.reviewLikeUpdate(param);
		
		return "redirect:./reivew_read_page.do?movie_review_no=" + param.getMovie_review_no();
	}
	
	@RequestMapping("review_unlike_process.do")
	public String ReveiwUnlikeInsert(ReviewUnlikeVo param, HttpSession session) {
		System.out.println("좋지 않아요 업데이트 들어옴");
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();
		param.setUser_no(user_no);
		
		reviewLikeService.reviewUnlikInsert(param);
		
		int movie_review_no = param.getMovie_review_no();
		System.out.println("좋지 않아요 업데이트 처리 직전");		
		return "redirect:./reivew_read_page.do?movie_review_no=" + movie_review_no;
	}
}
