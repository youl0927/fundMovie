package com.bbq.fundmovie.funding.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbq.fundmovie.funding.service.FundingServiceImpl;
import com.bbq.fundmovie.mypage.service.MyPageServiceImpl;
import com.bbq.fundmovie.vo.FundMovieCommentVo;
import com.bbq.fundmovie.vo.FundingCommunityVo;
import com.bbq.fundmovie.vo.FundingLikeVo;
import com.bbq.fundmovie.vo.FundingOpenVo;
import com.bbq.fundmovie.vo.FundingQnACommentVo;
import com.bbq.fundmovie.vo.FundingUserListVo;
import com.bbq.fundmovie.vo.MemberVo;

@Controller
@RequestMapping("/funding/*")
@ResponseBody
public class RESTfulFundingController {
	
	@Autowired
	private FundingServiceImpl fundingService;
	
	@Autowired
	private MyPageServiceImpl myPageService;
	
	@RequestMapping("get_funding_qna_comment_list.do")
	public ArrayList<HashMap<String, Object>> getcommentList(int funding_qna_no){
	
		ArrayList<HashMap<String, Object>> result = fundingService.getFundingQnACommentList(funding_qna_no);
	
		return result;
	}
	
	@RequestMapping("funding_list.do")
	public ArrayList<HashMap<String, Object>> getfundingList(){
		ArrayList<HashMap<String, Object>> resultList = fundingService.getfundingList1();
		
		return resultList;
	}
	
	@RequestMapping("write_funding_movie_comment_process.do")
	public void writeFundMovieCommentProcess(FundMovieCommentVo param, HttpSession session){
		
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();
		param.setUser_no(user_no);
		
		int funding_open_no = param.getFunding_open_no();
		param.setFunding_open_no(funding_open_no);
		
		fundingService.writeFundMovieComment(param);
	}
	
	@RequestMapping("get_funding_fundmovie_comment_list.do")
	public ArrayList<HashMap<String, Object>> getFundMoviecommentList(int funding_open_no){
	
		ArrayList<HashMap<String, Object>> result = fundingService.getFundMovieCommentList(funding_open_no);
	
		return result;
	}
	
	@RequestMapping("write_funding_qna_comment_process.do")
	public void writeFundingQnaCommentProcess(FundingQnACommentVo param, HttpSession session){
		
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();
		param.setUser_no(user_no);
		
		int funding_qna_no = param.getFunding_qna_no();
		param.setFunding_qna_no(funding_qna_no);
		
		fundingService.writeFundingQnAComment(param);
	}
	
	@RequestMapping("get_funding_community_list.do")
	public ArrayList<HashMap<String, Object>> getcommunityList(int funding_open_no){
		
		ArrayList<HashMap<String, Object>> result = fundingService.getFundingCommunityList(funding_open_no);
		
		return result;
	}
	
	@RequestMapping("write_funding_community_process.do")
	public void writeFundingCommunityProcess(FundingCommunityVo param, HttpSession session){
		
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();
		param.setFunding_user_no(user_no);
		
		int funding_open_no = param.getFunding_open_no();
		param.setFunding_open_no(funding_open_no);
		
		System.out.println("funding_open_no"+funding_open_no);
		System.out.println("user_no"+user_no);
		
		fundingService.writeFundingCommunity(param);
	}
	
	@RequestMapping("get_funding_notice.do")
	public HashMap<String, Object> getFundingNotice(int funding_notice_no){
		
		HashMap<String, Object> map = fundingService.getFundingNotice(funding_notice_no);
		
		return map;		
	}
	
	@RequestMapping("funding_like_process.do")
	public void LikeProcess(HttpSession session, FundingLikeVo param) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		param.setUser_no(user_no);
		
		int count = fundingService.CheckFundingLike(param);
				
		if(count == 0) {
			fundingService.insertFundingLike(param);
		}else if(count != 0) {
			fundingService.cancelFundingLike(param);
		}else {
			
		}
		
	}
	
	@RequestMapping("like_check_count_process.do")
	public HashMap<String, Object> LikeCheckCount(HttpSession session, int funding_open_no) {
	
		HashMap<String, Object> map = new HashMap<String, Object>(); 
			
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		
		FundingLikeVo param = new FundingLikeVo();
		param.setFunding_open_no(funding_open_no);
		param.setUser_no(user_no);
		
		int fundingLikeCheckCount = fundingService.CheckFundingLike(param);
		System.out.println("fundingLikeCheckCount: "+fundingLikeCheckCount);
		
		map.put("myCount", fundingLikeCheckCount);
		
		return map;
	}
	
	
	@RequestMapping("count_myfunding_process.do")
	public HashMap<String, Object> CountMyLikeProcess(HttpSession session, int funding_open_no) {
		
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		
		
		FundingUserListVo fundingUserListVo = new FundingUserListVo();
		fundingUserListVo.setFunding_open_no(funding_open_no);
		fundingUserListVo.setFunding_user_no(user_no);
		
		int result = fundingService.checkFundingCount(fundingUserListVo);
		
		System.out.println("result" + result);
		
		map.put("myFundCount", result);
		
		return map;
	}
	
	@RequestMapping("count_my_status_process.do")
	public HashMap<String, Object> CountMyStatusProcess(HttpSession session, int funding_open_no) {
		
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int result = myPageService.checkUserAuthor(sessionUser);
		
		System.out.println("result" + result);
		
		map.put("myFundCount", result);
		
		return map;
	}
	
	@RequestMapping("count_funding_like_process.do")
	public HashMap<String, Object> CountLikeProcess(HttpSession session, FundingLikeVo param, int funding_open_no) {
		
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int user_no = memberVo.getUser_no();
		
		FundingLikeVo fundingLikeVo = new FundingLikeVo();
		fundingLikeVo.setFunding_open_no(funding_open_no);
		fundingLikeVo.setUser_no(user_no);
		
		int result = fundingService.getFundingLikeCount(fundingLikeVo);
		
		map.put("count", result);
		
		return map;
	}
	
	@RequestMapping("count_percent_process.do")
	public HashMap<String, Object> countPercentProcess(HttpSession session ,int funding_open_no){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		FundingOpenVo fundingOpenVo = fundingService.getfundingOpenVo(funding_open_no);
		int target_point = fundingOpenVo.getFunding_target_point();
		
		int total_check = fundingService.getcheckCount(funding_open_no);
		
		double total_point = 0;
		
		if(total_check != 0) {
			
			total_point = fundingService.fundingSumPoint(funding_open_no);

		}
			
		double result =  total_point  / target_point * 100 ;
		double result_remain1 = result*10 ;
		double result_remain2 = result_remain1%1 ;
		result = (result_remain1-result_remain2)/10;

		if(result > 100) {
			result = 100;
		}
		
		System.out.println("percent : " + result);
		
		map.put("percent", result);
		
		
		return map;
	}
	
	@RequestMapping("run_funding_process.do")
	public void fundingProcess(FundingUserListVo param, HttpSession session, int funding_open_no) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int user_no = memberVo.getUser_no();
		
		int price = param.getFunding_user_point();
		int mypoint = memberVo.getUser_point();
		mypoint =  mypoint - price;
		memberVo.setUser_point(mypoint);
		
		param.setFunding_user_no(user_no);
		param.setFunding_open_no(funding_open_no);
		fundingService.insertFundingList(param);
	}
	
	@RequestMapping("purcahse_funding_movie_process.do")
	public void purchaseFudingMovieProcess(FundingUserListVo param, HttpSession session) {
		
		int funding_open_no = param.getFunding_open_no();
		
		FundingOpenVo fundingOpenVo = fundingService.getfundingOpenVo(funding_open_no);
		int releasePrice = fundingOpenVo.getRelease_price();
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int user_no = memberVo.getUser_no();
		param.setFunding_user_no(user_no);
		
		int user_point = memberVo.getUser_point();
		
		int used_point = user_point - releasePrice;
		
		param.setFunding_user_point(releasePrice);
		
		memberVo.setUser_point(used_point);
		fundingService.insertFundingList(param);	
	}
	
}
