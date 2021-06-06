package com.bbq.fundmovie.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbq.fundmovie.member.service.MemberServiceImpl;

@ResponseBody
@Controller
@RequestMapping("/member/*")
public class RESTfulMemberController {
	
	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	@RequestMapping("exist_id.do")
	public String existId(String id) {
		
		boolean existId = memberServiceImpl.searchById(id);
		
		if(existId == true) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping("exist_nick.do")
	public String existNick(String nick) {
		
		boolean existNick = memberServiceImpl.searchByNick(nick);
		
		if(existNick == true) {
			return "true";
		}else {
			return "false";
		}
	}
}
