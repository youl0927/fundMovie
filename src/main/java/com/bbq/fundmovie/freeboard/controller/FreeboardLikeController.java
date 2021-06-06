package com.bbq.fundmovie.freeboard.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbq.fundmovie.freeboard.service.FreeboardServiceImpl;
import com.bbq.fundmovie.vo.FreeboardLikeVo;
import com.bbq.fundmovie.vo.MemberVo;

@Controller
@RequestMapping("/freeboard/*")
@ResponseBody
public class FreeboardLikeController {

	@Autowired
	private FreeboardServiceImpl freeboardService;
	
	@RequestMapping("freeboard_like_process.do")
	public void FreeboardLikeProcess(FreeboardLikeVo param,HttpSession session) {
		System.out.println("좋아요 들어왔다");
		
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();
		param.setUser_no(user_no);
		int freeboard_no = param.getFreeboard_no();
		System.out.println("프리보드 넘버는 "+freeboard_no);
		freeboardService.freeboardLike(param);
		 
		//return "redirect:./read_freeboard_page.do?freeboard_no=" + param.getFreeboard_no();
	}
	
	@RequestMapping("freeboard_like_update.do")
	public void FreeboardLikeUpdate(FreeboardLikeVo param,HttpSession session) {
		System.out.println("좋지않아요 들어왔다");
		
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();
		param.setUser_no(user_no);
		freeboardService.freeboardLikedelete(param);
		
		 //return "redirect:./read_freeboard_page.do?freeboard_no=" + param.getFreeboard_no();		
	}
	
	@RequestMapping("freeboard_total_like.do")
	public HashMap<String,Object> FreeboardLikeTotal(int freeboard_no , HttpSession session) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		System.out.println("좋아요 토탈 들어옴");
		int total = freeboardService.countLikeTotal(freeboard_no);
		
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		if(memberVo != null) {
			
			FreeboardLikeVo freeboardLikeVo = new FreeboardLikeVo();
			freeboardLikeVo.setUser_no(memberVo.getUser_no());
			freeboardLikeVo.setFreeboard_no(freeboard_no);
			
			
			int myCount = freeboardService.countMyLike(freeboardLikeVo);
			
			map.put("myCount", myCount);
		}
		
		
		map.put("total", total);
		
		
		
		return map;
	}
}
