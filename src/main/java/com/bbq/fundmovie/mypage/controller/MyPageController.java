package com.bbq.fundmovie.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bbq.fundmovie.funding.service.FundingServiceImpl;
import com.bbq.fundmovie.member.service.MemberServiceImpl;
import com.bbq.fundmovie.mypage.service.MyPageServiceImpl;
import com.bbq.fundmovie.vo.FundingOpenVo;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.MessageVo;



@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@Autowired
	private MyPageServiceImpl myPageService;
		
	@Autowired
	private FundingServiceImpl fundingService;
	
	@RequestMapping("my_point.do")
	public String mypoint(Model model, HttpSession session) {
		
		 MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
	      int user_no = sessionUser.getUser_no();
	      System.out.println(user_no);
	      
	      
	      HashMap<String, Object> map = myPageService.getUser_point(user_no);
	      model.addAttribute("result",map);

		return "/mypage/my_point";
	}
	
	@RequestMapping("point_process.do")
	public String pointPageProcess(MemberVo param, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
	      int user_no = sessionUser.getUser_no();
	      
		System.out.println("User_point"+param.getUser_point());
		System.out.println("User_no"+param.getUser_no());
		
		param.setUser_no(user_no);
		myPageService.chargePoint(param);
		
		return "redirect:./my_point.do";
	}
	
	
	
	@RequestMapping("point_purchase.do")
	public String pointPurchase(Model model, HttpSession session) {

		 MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
	      int user_no = sessionUser.getUser_no();
	      System.out.println(user_no);
	      
	      
	      HashMap<String, Object> map = myPageService.getUser_point(user_no);
	      model.addAttribute("result",map);
	      
	      
		return "/mypage/point_purchase";
	}
	
	@RequestMapping("used_point_process.do")
	public String usedPointPageProcess(MemberVo param, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
	      int user_no = sessionUser.getUser_no();
	      
		System.out.println("User_point"+param.getUser_point());
		System.out.println("User_no"+param.getUser_no());
		
		param.setUser_no(user_no);
		
				
		myPageService.usedPoint(param);
		
		return "redirect:./point_purchase.do";
	}
	
	@RequestMapping("mypage_main_rank.do")
	public String myPageMainRank(HttpSession session, Model model) {
		MemberVo sessionUser = 
				(MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no(); 
		int rankUpStatus = myPageService.rankUpStatus(user_no);
		
		model.addAttribute("rankUpStatus",rankUpStatus);
		
		return "/mypage/mypage_main_rank";
	}
	
	@RequestMapping("mypage_main.do")
	public String myPageMain(HttpSession session, Model model) {
		MemberVo sessionUser = 
				(MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no(); 
		int rankUpStatus = myPageService.rankUpStatus(user_no);
		
		model.addAttribute("rankUpStatus",rankUpStatus);
		
		return "/mypage/mypage_main";
	}
	
	
	
	
	@RequestMapping("message_board.do")
	public String messageBoard(HttpSession session, Model model) {
		
		MemberVo sessionUser = 
				(MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no(); 
		
		ArrayList<HashMap<String, Object>> resultList = 
				myPageService.sendMessageList(user_no);
		
		model.addAttribute("resultList",resultList);
		
		ArrayList<HashMap<String, Object>> resultGetList = 
				myPageService.receiveMessageList(user_no);
		
		model.addAttribute("resultGetList",resultGetList);
		
		
		return "/mypage/message_board";
	}
	
	@RequestMapping("write_message_page.do")
	public String writeMessage(Model model, int friend_no, String friend_nick) {
		int friend_user_no= friend_no;
		String friend_user_nick= friend_nick;
		
		System.out.println(friend_user_no);
		System.out.println(friend_user_nick);
		
		model.addAttribute("friend_user_no",friend_user_no);
		model.addAttribute("friend_user_nick",friend_user_nick);
		
		return "/mypage/write_message_page";
	}
	
	@RequestMapping("write_message_process.do")
	public String writeMessageProcess(HttpSession session, MessageVo param ) {
	
		MemberVo sessionUser = 
				(MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no(); 
		param.setUser_no(user_no);
		System.out.println(param.getMessage_content());
		System.out.println(param.getReceiver_no());
		System.out.println(param.getUser_no());
		myPageService.writeMessage(param);
		
		return "redirect:./message_board.do";
	}
	
	@RequestMapping("delete_message_process.do")
	public String deleteMessageProcess(int message_no) {
		
		myPageService.deleteMessage(message_no);
		
		return "redirect:./message_board.do";
	}
	
	@RequestMapping("rank_up_request_process.do")
	public String rankUpRequestProcess(HttpSession session, MemberVo param) {
		MemberVo sessionUser = 
				(MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no(); 
		myPageService.rankUpRequest(user_no);
		param.setUser_no(user_no);
		myPageService.setAccount(param);
		
		return "redirect:./mypage_main.do";
	}
	
	@RequestMapping("manage_my_funding.do")
	public String manageMyFunding(Model model, HttpSession session) {
		
		MemberVo sessionUser = 
				(MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no(); 
		
		ArrayList<FundingOpenVo> resultList = fundingService.myFundingStatus(user_no);
		
		model.addAttribute("resultList", resultList);
		return "/mypage/manage_my_funding";
	}
	
	@RequestMapping("manage_funding_detail.do")
	public String manageFundingDetail(Model model, int funding_open_no) {
		System.out.println("funding_open_no: "+funding_open_no);
		ArrayList<HashMap<String, Object>> resultList = fundingService.getFundingDetail(funding_open_no);
		System.out.println("resultList: "+resultList);
		model.addAttribute("resultList", resultList);
		
		return "/mypage/manage_funding_datail";
	}
	
}
