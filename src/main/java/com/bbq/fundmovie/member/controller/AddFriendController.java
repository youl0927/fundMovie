package com.bbq.fundmovie.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bbq.fundmovie.member.service.AddFriendServiceImpl;
import com.bbq.fundmovie.vo.AddFriendVo;
import com.bbq.fundmovie.vo.MemberVo;


@Controller
@RequestMapping("/friend/*")
public class AddFriendController {
	
	@Autowired
	private AddFriendServiceImpl addFriendService;

	@RequestMapping("addFriendProcess.do")
	public String addFriendProcess(AddFriendVo param, HttpSession session) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		param.setUser_no(memberVo.getUser_no());
		
		addFriendService.addFriend(param);
		
		return "redirect:./friend_search.do";
	}
	
	
	@RequestMapping("friend_main.do")
	public String friendMain(HttpSession session, Model model) {
		MemberVo sessionUser = 
				(MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no(); 

		ArrayList<HashMap<String, Object>> addFriendList = 
				addFriendService.getFriendList(user_no);
		
		ArrayList<HashMap<String, Object>> myFriendList = 
				addFriendService.getMyFriendList(user_no);
		
		model.addAttribute("addFriendList", addFriendList);
		model.addAttribute("myFriendList", myFriendList);

		System.out.println("여기까진 되나?");

		return "friend/friend_main";
		
	}
	
	@RequestMapping("friend_search.do")
	public String friendSearch(Model model , String search_word , String search_type , @RequestParam(value="page_num",defaultValue = "1") int page_num) {
	
		ArrayList<HashMap<String, Object>> searchList = 
				addFriendService.getMemberList(search_word , search_type , page_num);
		
		int pageCount = addFriendService.getPageCount();

		int currentPage = page_num;
		int beginPage = ((currentPage-1)/5)*5 + 1;
		int endPage = ((currentPage-1)/5 + 1)*(5);		
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		
		model.addAttribute("searchList", searchList);
		model.addAttribute("currentPage" , currentPage);
		model.addAttribute("beginPage" , beginPage);
		model.addAttribute("endPage" , endPage);
		model.addAttribute("pageCount", pageCount);
		
		
		return "/friend/friend_search";
	}
	
	//친구 삭제
	@RequestMapping("delete_friend_process.do")
	public String deleteFriendProcess(AddFriendVo param) {
		System.out.println(param.getFriend_user_no());
		System.out.println(param.getUser_no());
		
		addFriendService.deleteFriend(param);
		return "redirect:./friend_search.do";
	}
	
}
