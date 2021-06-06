package com.bbq.fundmovie.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bbq.fundmovie.member.service.MemberServiceImpl;
import com.bbq.fundmovie.vo.MemberVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberServiceImpl memberService;
	

	@RequestMapping("join_member_page.do")
	public String joinMemberPage() {
		
		System.out.println("회원가입 페이지");
		
		return "member/join_member_page";
	}
	
	@RequestMapping("join_member_process.do")
	public String joinMemberProccess(MemberVo param, Model model) {
		
		System.out.println("회원가입 프로세스");
		
		memberService.joinMember(param);
		System.out.println(param.getUser_pw());
		String id = param.getUser_id();
		 
	      model.addAttribute("id",id);

		return "redirect:../member/join_member_complete.do";
		
	}
	
	@RequestMapping("join_member_complete.do")
	public String joinComplete(MemberVo memberVo, String id, Model model) {
		
		System.out.println("회원가입 완료");
		System.out.println("id: "+id);
		memberVo.setUser_id(id);
		model.addAttribute("memberVo", memberVo);

		return "member/join_member_complete";
	}
	
	@RequestMapping("login_page.do")
	public String loginPage() {
		
		System.out.println("로그인페이지");
		
		return "member/login_page";
	}
	

	@RequestMapping("login_process.do")
	public String loginProcess(MemberVo param, HttpSession session) {
		
		System.out.println("로그인 프로세스");
		
		MemberVo sessionUser = memberService.login(param);
		
		System.out.println("로그인 프로세스");
		
		if(sessionUser != null) {
			session.setAttribute("sessionUser", sessionUser);
			
			System.out.println("로그인1");
			String auth = sessionUser.getUser_author();
			System.out.println("auth1"+auth);

			if(!auth.equals("관리자")) {
				System.out.println("auth2"+auth);
				return "redirect:../content/main_page.do";

			}
				System.out.println("auth3"+auth);
				return "redirect:../admin/setting_main.do";

			
		}else {
			return "member/login_fail";
		}
		
	}

	
	@RequestMapping("logout_process.do")
	public String logoutProcess(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:../content/main_page.do";
	}
	
	
	
}
