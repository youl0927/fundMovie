package com.bbq.fundmovie.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbq.fundmovie.member.service.AddFriendServiceImpl;

@Controller
@RequestMapping("/friend/*")
@ResponseBody
public class RESTfulAddFriendController {
	
	@Autowired
	private AddFriendServiceImpl addFriendService;
	
	@RequestMapping("friend_search1.do")
	public ArrayList<HashMap<String, Object>> friendSearch(String search_word , String search_type , @RequestParam(value="page_num",defaultValue = "1") int page_num) {
	
		ArrayList<HashMap<String, Object>> searchList = 
				addFriendService.getMemberList(search_word , search_type , page_num);
		
				
		return searchList;
	}
}
