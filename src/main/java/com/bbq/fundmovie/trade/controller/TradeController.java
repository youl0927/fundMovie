package com.bbq.fundmovie.trade.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bbq.fundmovie.trade.mapper.TradeSQLMapper;
import com.bbq.fundmovie.trade.service.TradeServiceImpl;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.TradeCommentVo;
import com.bbq.fundmovie.vo.TradeImageVo;
import com.bbq.fundmovie.vo.TradeLikeVo;
import com.bbq.fundmovie.vo.TradeVo;

@Controller
@RequestMapping("/trade/*")
public class TradeController {

	@Autowired
	private TradeServiceImpl tradeService;
	
	@RequestMapping("trade_page.do")
	public String tradePage(Model model) {
		
		System.out.println("거래");
		
		ArrayList<HashMap<String, Object>> tradeResultList =
				tradeService.getTradeList();
		
		model.addAttribute("tradeResultList", tradeResultList);
		
		return "/trade/trade_page";
	}
	
	//글 보기
	@RequestMapping("trade_read_page.do")
	public String tradeReadPage(Model model, int trade_no, HttpSession session) {
		
		System.out.println("상세페이지");
		
		HashMap<String, Object> map = tradeService.getTradeContent(trade_no);
		
		//얘만 restful에서 댓글보기로 가져왔음..
		ArrayList<HashMap<String, Object>> map1 = tradeService.getTradeCommentList(trade_no);
		
		model.addAttribute("tradeResult", map);
	
		model.addAttribute("tradeCommentResult", map1);
		
		
		int count = 0;
		int pageCount = 0;
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		if(memberVo != null) {
			TradeLikeVo tradeLikeVo = new TradeLikeVo();
			tradeLikeVo.setTrade_no(trade_no);
			tradeLikeVo.setUser_no(memberVo.getUser_no());
			
			count = tradeService.getTradeLike(tradeLikeVo);
			pageCount = tradeService.getTradeLikeCount(tradeLikeVo);
		}
		model.addAttribute("likeCount", count);
		model.addAttribute("likePageCount", pageCount);
		
		return "/trade/trade_read_page";
	}
	
	
	//댓글 process
	@RequestMapping("trade_comment_process.do")
	public String tradeCommentWriteProcess(TradeCommentVo param, HttpSession session){
		
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();
		param.setUser_no(user_no);

		tradeService.tradeCommentWrite(param);
		
		System.out.println("3");
		return "redirect:./trade_read_page.do?trade_no=" + param.getTrade_no();
	}
	
	//글쓰기
	@RequestMapping("trade_write_page.do")
	public String tradeWritePage() {
		System.out.println("글쓰기  페이지");
		
		return "/trade/trade_write_page";
	}
	//글쓰기 프로세스
	@RequestMapping("trade_write_process.do")
	public String tradeWriteProcess(HttpSession session, TradeVo param, MultipartFile [] files) {
		
		System.out.println("write_process 1");
		
		
		ArrayList<TradeImageVo> imageVoList = new ArrayList<TradeImageVo>();
		
		System.out.println("2");
		
		for(MultipartFile file : files) {
			if(file.getSize() <= 0) {
				continue;
			}
			System.out.println("3");
			String uploadRootFolderName = "C:/upload_files/";
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolder = sdf.format(today);
			
			String uploadFolderName = uploadRootFolderName + todayFolder;
			
			File uploadFolder = new File(uploadFolderName);
			
			System.out.println("업로드 할 위치 : " + uploadFolderName);
			
			if(!uploadFolder.exists()) {
				uploadFolder.mkdirs();
			}
			String originalFileName = file.getOriginalFilename();
			//저장시 파일명 랜덤으로 변경 [충돌방지]
			System.out.println(originalFileName);
			String randomName = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			
			randomName = randomName + "_" + currentTime;
			System.out.println("Test"+randomName);
			
			//substring - 특정길이 문자열 자름
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			randomName += ext;
			
			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			TradeImageVo imageVo = new TradeImageVo();
			
			String link = "/upload/" + todayFolder + "/" + randomName;
			imageVo.setTrade_image_link(link);
			
			imageVoList.add(imageVo);
			
		}
	
		System.out.println("write_process 2");
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		
		param.setUser_no(user_no);
		tradeService.tradeWrite(param, imageVoList);
		
		return "redirect:./trade_page.do";
	}
	
	
	//좋아요
	@RequestMapping("trade_like_process.do")
	public String tradeLikeProcess(HttpSession session, TradeLikeVo param) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		param.setUser_no(user_no);
		
		int count = tradeService.getTradeLike(param);
		
		if(count == 0) {
			tradeService.insertTradeLike(param);
		}else {
			tradeService.deleteTradeLike(param);
		}
		return "redirect:./trade_read_page.do?trade_no=" + param.getTrade_no();
	}
	
	//글삭제
	@RequestMapping("trade_delete_process.do")
	public String deleteTradeProcess(int trade_no) {
		
		tradeService.deleteTradeContent(trade_no);
		
		return "redirect:./trade_page.do";
	}
	
	//수정
	@RequestMapping("trade_update_page.do")
	public String updateTradeContent(Model model, int trade_no) {
		System.out.println("글 수정 페이지");
		
		HashMap<String, Object> map = tradeService.getTradeContent(trade_no);
		
		model.addAttribute("tradeResult", map);
		
		return "trade/trade_update_page";
	}
	
	//수정 프로세스
	@RequestMapping("trade_update_process.do")
	public String updateTradeContentProcess(TradeVo param) {
		
		System.out.println("수정");
		
		tradeService.updateTradeContent(param);
		
		System.out.println("수정");
		return "redirect:./trade_page.do";
	}
	//댓 삭
	@RequestMapping("trade_comment_delete_process.do")
	public String deleteTradeCommentProcess(int trade_comment_no, int trade_no) {
		
		int deleteCount = 0;
		deleteCount = trade_comment_no;
		tradeService.deleteTradeComment(trade_comment_no);
		
		return "redirect:./trade_read_page.do?trade_no=" + trade_no ;
	}
	//승인..
	@RequestMapping("trade_complete_process.do")
	public String tradeCompleteProcess(TradeVo param) {
		
		tradeService.tradeComplete(param);
		
		return "redirect:./trade_page.do";
	}
}