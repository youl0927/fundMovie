package com.bbq.fundmovie.review.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbq.fundmovie.review.service.ReviewRepleServiceImpl;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.ReviewRepleVo;
import com.bbq.fundmovie.vo.ReviewVo;

@Controller
@RequestMapping("/review/*")
public class ReviewRepleController {
	
	@Autowired
	private ReviewRepleServiceImpl reviewRepleService;
	
	@RequestMapping("write_review_reple_process.do")
	public String writeReviewRepleProcess(ReviewRepleVo param, HttpSession session) {

		System.out.println("리플 업데이트 들어옴");
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();	
		

		System.out.println("유저넘버는 : "+user_no);


		param.setUser_no(user_no);		
		
		
		int a= param.getMovie_review_no();
		int b= param.getReview_reple_no();
		int c= param.getUser_no();
	
		System.out.println("리뷰넘버 : " + a + "리플넘버 : " + b + "맴버넘버 : " + c);
		System.out.println("컨텐츠 :" + param.getReview_reple_content());
		reviewRepleService.reviewRepleInsert(param);
		
		
		int movie_review_no = param.getMovie_review_no();
			
		System.out.println("리플 업데이트 들어옴5");
		return "redirect:./reivew_read_page.do?movie_review_no="+movie_review_no;
	}
	@RequestMapping("delete_ReviewReple_process.do")
	public String deleteReviewReple(int review_reple_no, int movie_review_no) {
			
		reviewRepleService.deleteReviewRepleNo(review_reple_no);
		
		return "redirect:./reivew_read_page.do?movie_review_no="+movie_review_no;
	}
	
}
