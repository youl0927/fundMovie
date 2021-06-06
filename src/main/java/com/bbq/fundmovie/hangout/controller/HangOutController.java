package com.bbq.fundmovie.hangout.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbq.fundmovie.hangout.service.HangOutServiceImpl;
import com.bbq.fundmovie.vo.HangOutJoinVo;
import com.bbq.fundmovie.vo.HangOutVo;
import com.bbq.fundmovie.vo.MemberVo;

@Controller
@RequestMapping("/hangout/*")
public class HangOutController {
	
	@Autowired
	private HangOutServiceImpl hangOutService;
	
	@RequestMapping("hangOut_open_process.do")
	public String hangOutOpenProcess(HttpSession session, HangOutVo param) {
		
		System.out.println("시작은 했니?");
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		param.setHangout_user_no(user_no);
		hangOutService.openHangOut(param);
		
		return "redirect:./hangOut_list.do";
	}
	
	@RequestMapping("hangOut_join_process.do")
	public String hangOutJoinProcess(HttpSession session, int hangout_movie_no, HangOutJoinVo param) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		param.setHangout_movie_no(hangout_movie_no);
		param.setHangout_member_no(user_no);
		hangOutService.joinHangOut(param);
		
		return "redirect:./hangOut_list.do";
	}
	
	@RequestMapping("hangOut_main.do")
	public String hangOutMain() {
		
		
		return "/hangout/hang_out_main";
	}
	
	@ResponseBody
	@RequestMapping("get_hangOut_list.do")
	public ArrayList<HashMap<String, Object>> gethangOutList(HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		
		ArrayList<HashMap<String, Object>>resultList = 
				hangOutService.getHangOutList(user_no);
		
		return resultList;
	}
	
	
	@RequestMapping("hangOut_list.do")
	public String hangOutList(Model model, HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		ArrayList<HashMap<String, Object>>resultList = 
				hangOutService.getHangOutList(user_no);
		
		model.addAttribute("resultList", resultList);
		
		return "/hangout/hang_out_list";
	}
	
	@RequestMapping("hangOut_open.do")
	public String hangOutOpen() {
		
		
		return "/hangout/hang_out_open";
	}
	
	@RequestMapping("test.do")
	public String test() {
		
		
		return "/hangout/test";
	}
	
	
	
	
}
