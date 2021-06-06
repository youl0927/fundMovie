package com.bbq.fundmovie.content.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bbq.fundmovie.content.mapper.ContentSQLMapper;
import com.bbq.fundmovie.content.service.ContentServiceImpl;
import com.bbq.fundmovie.member.service.MemberServiceImpl;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.QnaHeadlineVo;
import com.bbq.fundmovie.vo.QnaVo;
import com.bbq.fundmovie.vo.QnaLikeVo;
@Controller
@RequestMapping("/content/*")
public class ContentController {
	
	@Autowired
	private ContentServiceImpl contentService;
	
	@RequestMapping("main_page.do")
	public String mainPage() {
		
		System.out.println("메인페이지");
		
		return "/content/main_page";
 
	}
	
	@RequestMapping("movie_category.do")
	public String movieCategory() {
	
		System.out.println("무비카테고리");
		
		return "/content/movie_category";
		
	}
	
	
	
	

	//qna
	@RequestMapping("qna_page.do")
	public String qna(Model model,@RequestParam(value = "page_num",defaultValue = "1") int page_num) {
		
		System.out.println("qna 입성");
		
		ArrayList<HashMap<String, Object>> qnaResultList =
				contentService.getQnaList(page_num);
		
		
		System.out.println("qna arraylist 담기 성공");
		
		int pageCount = contentService.getQnaPageCount();
		
		int currentPage = page_num;
		
		int beginPage = ((currentPage-1)/5)*5 + 1;
		int endPage = ((currentPage-1)/5+1)*(5);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("qnaResultList", qnaResultList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		
		
		System.out.println("qna 입구통과");
		
		return "/content/qna_page";
	}
	
	//qna 글쓰기
	
	@RequestMapping("qna_write_page.do")
	public String qnaWritePage() {
		
		System.out.println("qna 글쓰기 페이지");
		
		return "/content/qna_write_page";
	}
	
	@RequestMapping("qna_write_process.do")
	public String qnaWriteProcess(HttpSession session, QnaVo param1) {
		
		MemberVo sessionUser = 
				(MemberVo)session.getAttribute("sessionUser");
		
		int user_no = sessionUser.getUser_no();
		
		param1.setUser_no(user_no);
		
		contentService.qnaWrite(param1);
		
		return "redirect:./qna_page.do";
	}
	
	//qna 글보기
	@RequestMapping("qna_read_page.do")
	public String qnaReadPage(Model model, int qna_no , HttpSession session) {
	
		System.out.println("1");
		
		HashMap<String, Object> map = contentService.getQnaContent(qna_no);
		System.out.println("2");
		
		model.addAttribute("qnaResult", map);	
		
		int count = 0;
		int pageCount = 0;
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		if(memberVo != null) {
			QnaLikeVo qnaLikeVo = new QnaLikeVo();
			qnaLikeVo.setQna_no(qna_no);
			qnaLikeVo.setUser_no(memberVo.getUser_no());
			
			count = contentService.getQnaLike(qnaLikeVo);
			pageCount = contentService.getQnaLikeCount(qnaLikeVo);
		}
		
		model.addAttribute("likeCount" , count);
		model.addAttribute("likePageCount", pageCount);
		
		System.out.println("3");
			return "/content/qna_read_page";
	}
	

	//qna 좋아요
	@RequestMapping("qna_like_process.do")
	public String qnaLikeProcess(HttpSession session , QnaLikeVo param){
		
		System.out.println("qqqqq!!");
		
		//user_no랑
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		param.setUser_no(user_no);
		
		int count = contentService.getQnaLike(param);
		
		if(count == 0) {
			contentService.insertQnaLike(param);
			
		}else {
			contentService.deleteQnaLike(param);
		}
		return "redirect:./qna_read_page.do?qna_no=" + param.getQna_no();
	}
	
	//qna 삭제
	@RequestMapping("qna_delete_process.do")
	public String deleteContentProcess(int qna_no) {
		
		contentService.deleteQnaContent(qna_no);
		
		return "redirect:./qna_page.do";
	}
	
	
	//qna 수정
	@RequestMapping("qna_update_page.do")
	public String updateQnaContentPage(Model model, int qna_no) {
			
		//map에 중요한 변수들 O
		HashMap<String, Object> map = contentService.getQnaContent(qna_no);
		
		model.addAttribute("qnaResult", map);
		
		return "content/qna_update_page";
	}
	
	//qna 수정 프로세스
	@RequestMapping("qna_update_process.do")
	public String updateQnaContentProcess(QnaVo param) {
		
		System.out.println("수정1");
		
		contentService.updateQnaContent(param);
		
		System.out.println("수정2");
		
		return "redirect:./qna_page.do";
	}

}
