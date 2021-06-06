package com.bbq.fundmovie.freeboard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbq.fundmovie.freeboard.service.FreeboardServiceImpl;
import com.bbq.fundmovie.vo.FreeboardRepleVo;
import com.bbq.fundmovie.vo.MemberVo;

@Controller
@RequestMapping("/freeboard/*")
@ResponseBody
public class RESTfulFreeboardController {

	@Autowired
	private FreeboardServiceImpl freeboardService;
	
	@RequestMapping("write_reple_freeboard_process.do")
	public String writeFreeboardRepleProcess(FreeboardRepleVo param, HttpSession session) {
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();	
		param.setUser_no(user_no);	
		freeboardService.writeFreeboardReple(param);

		return "redirect:./read_freeboard_page.do?freeboard_no=" + param.getFreeboard_no();
	}
	
	@RequestMapping("get_freeboard_reple_list.do")
	public ArrayList<HashMap<String, Object>> getFreeboardRepleList(int freeboard_no){
		ArrayList<HashMap<String, Object>> freeboardRepleResult = freeboardService.getFreeboardRepleList(freeboard_no);
	
		return freeboardRepleResult;
	}
	
	@RequestMapping("delete_reple_freeobard_process.do")
	public void DeleteRepleFreeobardProcess(int freeboard_reple_no, int freeboard_no) {
		System.out.println("리플 지우기 들어왔다.");
		int c=0;
		c= freeboard_reple_no;		
		System.out.println("변수 C는" + c);
		
		freeboardService.deleteRepleByNo(freeboard_reple_no);
					
		System.out.println("리플 지우기 나가기 전.");	
	}
}
