package com.bbq.fundmovie.review.controller;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bbq.fundmovie.review.mapper.ReviewSQLMapper;
import com.bbq.fundmovie.review.service.ReviewLikeServiceImpl;
import com.bbq.fundmovie.review.service.ReviewRepleServiceImpl;
import com.bbq.fundmovie.review.service.ReviewServiceImpl;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.ReviewLikeVo;
import com.bbq.fundmovie.vo.ReviewVo;

@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired
	private ReviewServiceImpl reviewService;
	
	@Autowired
	private ReviewRepleServiceImpl reviewRepleService;
	
	@Autowired
	private ReviewLikeServiceImpl reviewLikeService;
	
	@RequestMapping("movie_review.do")
	public String reviewList(Model model, String search_word , String search_type , @RequestParam(value="page_num",defaultValue = "1") int page_num){
		
		ArrayList<HashMap<String, Object>> reviewListResult = reviewService.getReviewList(search_word , search_type , page_num);
		
		int pageCount = reviewService.getPageCount();
		
		int currentPage = page_num;
		int beginPage = ((currentPage-1)/5)*5 + 1;
		int endPage = ((currentPage-1)/5 + 1)*(5);		
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		
		HashMap<String, Object> firstMap = reviewService.reviewFirst();
		HashMap<String, Object> secondMap = reviewService.reviewSecond();
		HashMap<String, Object> ThirdMap = reviewService.reviewThird();
		
		
		model.addAttribute("currentPage" , currentPage);
		model.addAttribute("beginPage" , beginPage);
		model.addAttribute("endPage" , endPage);
		model.addAttribute("pageCount", pageCount);
		
		
		
		model.addAttribute("reviewListResult", reviewListResult);
		model.addAttribute("firstMap", firstMap);
		model.addAttribute("secondMap", secondMap);
		model.addAttribute("ThirdMap", ThirdMap);
		
		return "/review/movie_review";
	}
	
	
	@RequestMapping("movie_review_write.do")
	public String reviewWrite(Model model) {
		
		ArrayList<HashMap<String, Object>> reviewMovieList = reviewService.writeMoiveList();
		
		model.addAttribute("reviewMovieList", reviewMovieList);
		
		return "/review/movie_review_write";
	}
	
	@RequestMapping("movie_review_process.do")
	public String reviewWriteProcess(ReviewVo param, HttpSession session){
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		param.setUser_no(user_no);
		
		reviewService.reviewWrite(param);
		
		return "redirect:./movie_review.do";
	}
	
	@RequestMapping("reivew_read_page.do")
	public String reviewRead(Model model,int movie_review_no, ReviewLikeVo param, HttpSession session) {

		
		HashMap<String, Object> readMap = reviewService.reviewRead(movie_review_no);
	
	
		ArrayList<HashMap<String, Object>> reviewListResult = reviewRepleService.reviewRepleList(movie_review_no);
		
	
		ArrayList<HashMap<String, Object>> movieSteel = reviewService.readSteel(movie_review_no);
		
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();
		param.setUser_no(user_no);
		param.setMovie_review_no(movie_review_no);
		
		int countLikeTotal = reviewLikeService.countLikeTotal(movie_review_no);
		
		int MyCount = reviewLikeService.reviewMyLike(param);
		
		model.addAttribute("movieSteel", movieSteel);
		model.addAttribute("readMap",readMap);
		model.addAttribute("reviewListResult",reviewListResult);
		model.addAttribute("MyCount", MyCount);
		model.addAttribute("countLikeTotal", countLikeTotal);
		
		return "/review/movie_review_read";
	}
	
	@RequestMapping("delete_review_process.do")
	public String writeRepleReviewProcess(int movie_review_no) {
		System.out.println("일단 들어왔따");
		System.out.println("리뷰 번호는 : "+ movie_review_no);
		
		reviewService.deleteReviewNo(movie_review_no);
		return "redirect:./movie_review.do";
	}
	
	@RequestMapping("update_review_page.do")
	public String updateReviewPage(Model model, int movie_review_no) {
		System.out.println("무비 업데이트 들어옴");
		HashMap<String, Object> reviewMap = reviewService.reviewRead(movie_review_no);
		
		ArrayList<HashMap<String, Object>> reviewMovieList = reviewService.writeMoiveList();
		
		model.addAttribute("reviewMovieList", reviewMovieList);	
		model.addAttribute("reviewMap",reviewMap);
		
		return "review/review_update_page";
	}
	
	@RequestMapping("update_review_process.do")
	public String updateReviewProcess(ReviewVo param) {
		System.out.println("무비 업데이트프로세스 들어옴");
		reviewService.reviewUpdate(param);
		int review_no = param.getMovie_review_no();
		System.out.println("게시판 넘버는 :"+review_no);
		
		return "redirect:./reivew_read_page.do?movie_review_no="+review_no;
	}
	
}
