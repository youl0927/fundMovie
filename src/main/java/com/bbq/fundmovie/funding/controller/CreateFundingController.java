package com.bbq.fundmovie.funding.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bbq.fundmovie.funding.service.FundingServiceImpl;
import com.bbq.fundmovie.mypage.service.MyPageServiceImpl;
import com.bbq.fundmovie.vo.FundingCommunityVo;
import com.bbq.fundmovie.vo.FundingGenreVo;
import com.bbq.fundmovie.vo.FundingImageVo;
import com.bbq.fundmovie.vo.FundingLikeVo;
import com.bbq.fundmovie.vo.FundingNoticeVo;
import com.bbq.fundmovie.vo.FundingOpenVo;
import com.bbq.fundmovie.vo.FundingQnACommentVo;
import com.bbq.fundmovie.vo.FundingQnAVo;
import com.bbq.fundmovie.vo.FundingUserListVo;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.UploadFundingResultVo;

@Controller
@RequestMapping("/funding/*")
public class CreateFundingController {
	
	@Autowired
	private FundingServiceImpl fundingService;
	
	@RequestMapping("funding_main_page.do")
	public String fundingMainPage(Model model, String search_word, String search_type, @RequestParam(value="page_num",defaultValue = "1") int page_num) {
		
		ArrayList<HashMap<String, Object>> resultList = fundingService.getfundingList(search_word, search_type, page_num);
		
		int pageCount = fundingService.getPageCount();
		int currentPage = page_num;
		int beginPage = ((currentPage-1)/5)*5 + 1;
		int endPage = ((currentPage-1)/5 + 1)*(5);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("currentPage" , currentPage);
		model.addAttribute("beginPage" , beginPage);
		model.addAttribute("endPage" , endPage);
		model.addAttribute("pageCount", pageCount);
		
		return "/funding/funding_main_page";
	}
	
	@RequestMapping("tobeopen_funding_main_page.do")
	public String tobeopenFundingMainPage(Model model, String search_word, String search_type, @RequestParam(value="page_num",defaultValue = "1") int page_num) {
		
		ArrayList<HashMap<String, Object>> resultList = fundingService.getTobefundingList(search_word, search_type, page_num);
		
		int pageCount = fundingService.getPageCount();
		int currentPage = page_num;
		int beginPage = ((currentPage-1)/5)*5 + 1;
		int endPage = ((currentPage-1)/5 + 1)*(5);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("currentPage" , currentPage);
		model.addAttribute("beginPage" , beginPage);
		model.addAttribute("endPage" , endPage);
		model.addAttribute("pageCount", pageCount);
		
		return "/funding/tobeopen_funding_main_page";
	}
	
	@RequestMapping("create_funding_page.do")
	public String createFundingPage() {
		
		return "funding/create_funding_page";

	}
	
	@RequestMapping("create_funding_process.do")
	public String createFundingProcess(HttpSession session, FundingOpenVo param, MultipartFile thumbnail_file, MultipartFile[] funding_images_link, int[] genre_no) {
		UUID uid = UUID.randomUUID();
		
		String uploadRootFolderName = "C:/upload_files/";
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String todayFolder = sdf.format(today);
			
		String uploadFolderName = uploadRootFolderName + todayFolder;
		File uploadFolder = new File(uploadFolderName);
				
		if(!uploadFolder.exists()) {
			uploadFolder.mkdirs();
		}
		
		String originalName = thumbnail_file.getOriginalFilename();
		String randomeName = uid.toString();
		long cuurentTime = System.currentTimeMillis();
		randomeName = randomeName + "_" + cuurentTime;
				
		String ext = originalName.substring(originalName.lastIndexOf("."));
		randomeName += ext;
				
				
		try {
			thumbnail_file.transferTo(new File(uploadFolderName + "/" + randomeName));
		}catch(Exception e){
			e.printStackTrace();
		}
				
		String thumbNailLink = "/upload/" + todayFolder + "/" + randomeName;	
			
		param.setFunding_thumb(thumbNailLink);
		
		ArrayList<FundingImageVo> fundingImagesVoList = new ArrayList<FundingImageVo>();
		
		for(MultipartFile fundingImage : funding_images_link) {
			
			if(fundingImage.isEmpty()) {
				continue;
			}
		
			if(!uploadFolder.exists()) {
				uploadFolder.mkdirs();
			}
			
			String originalFundingImageName = fundingImage.getOriginalFilename();
			String fundImageName = uid.toString();
			long currentTime = System.currentTimeMillis();
			
			fundImageName = fundImageName + "_" + currentTime;
			String ext1 = originalFundingImageName.substring(originalFundingImageName.lastIndexOf("."));
			
			fundImageName += ext1;
			
			try {
				fundingImage.transferTo(new File(uploadFolderName + "/" + fundImageName));
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			FundingImageVo imagesVo = new FundingImageVo();
			
			String fundingImageLink = "/upload/" + todayFolder + "/" + fundImageName;
			imagesVo.setFunding_image_link(fundingImageLink);
			
			fundingImagesVoList.add(imagesVo);
		}
		
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		param.setUser_no(user_no);
		fundingService.createFunding(param, fundingImagesVoList, genre_no);
		
		return "funding/funding_complete_page";
	}
	
	@RequestMapping("read_funding_page.do")
	public String readfundingPage(Model model, HttpSession session, int funding_open_no) {
		
		HashMap<String, Object> map = fundingService.getfunding(funding_open_no);
		
		int fundingLikeCheckCount = 0;
		int likePageCount = 0;
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		if(memberVo != null) {
			FundingLikeVo fundingLikeVo = new FundingLikeVo();
			fundingLikeVo.setFunding_open_no(funding_open_no);
			fundingLikeVo.setUser_no(memberVo.getUser_no());
			
			fundingLikeCheckCount = fundingService.CheckFundingLike(fundingLikeVo);
			likePageCount = fundingService.getFundingLikeCount(fundingLikeVo);
		}
		
		int getFundingUserCount = fundingService.getFundingUserCount(funding_open_no);
		Integer getFundingSumPoint = fundingService.getFundingSumPoint(funding_open_no);
		int getFundingRemainDate = fundingService.getFundingRemainDate(funding_open_no);
		
		if(getFundingSumPoint == null) {
			getFundingSumPoint = 0;
		}
		
		model.addAttribute("result",map);
		model.addAttribute("fundingLikeCheckCount", fundingLikeCheckCount);
		model.addAttribute("likePageCount", likePageCount);
		model.addAttribute("getFundingSumPoint", getFundingSumPoint);
		model.addAttribute("getFundingUserCount",getFundingUserCount);
		model.addAttribute("getFundingRemainDate", getFundingRemainDate);
		
		return "funding/read_funding_page";
	}
	
	@RequestMapping("read_tobeopen_funding_page.do")
	public String readTobeopenfundingPage(Model model, HttpSession session, int funding_open_no) {
		
		HashMap<String, Object> map = fundingService.getfunding(funding_open_no);
		
		int fundingLikeCheckCount = 0;
		int likePageCount = 0;
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		if(memberVo != null) {
			FundingLikeVo fundingLikeVo = new FundingLikeVo();
			fundingLikeVo.setFunding_open_no(funding_open_no);
			fundingLikeVo.setUser_no(memberVo.getUser_no());
			
			fundingLikeCheckCount = fundingService.CheckFundingLike(fundingLikeVo);
			likePageCount = fundingService.getFundingLikeCount(fundingLikeVo);
		}
		
		Integer getFundingSumPoint = fundingService.getFundingSumPoint(funding_open_no); 
		Integer getFundingUserCount = fundingService.getFundingUserCount(funding_open_no);
		int getFundingRemainDate = fundingService.getFundingRemainDate(funding_open_no);
		
		model.addAttribute("result",map);
		model.addAttribute("fundingLikeCheckCount", fundingLikeCheckCount);
		model.addAttribute("likePageCount", likePageCount);
		model.addAttribute("getFundingSumPoint", getFundingSumPoint);
		model.addAttribute("getFundingUserCount",getFundingUserCount);
		model.addAttribute("getFundingRemainDate", getFundingRemainDate);
		
		return "funding/read_tobeopen_funding_page";
	}

	
	@RequestMapping("funding_notice_page.do")
	public String fundingNoticePage(Model model, HttpSession session, int funding_open_no) {
		
		HashMap<String, Object> map = fundingService.getfunding(funding_open_no);
		ArrayList<HashMap<String, Object>> resultList = fundingService.getFundingNoticeList(funding_open_no);
		
		System.out.println("resultList = " + resultList);
		System.out.println("map = " + map);
		
		int fundingLikeCheckCount = 0;
		int likePageCount = 0;
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		if(memberVo != null) {
			FundingLikeVo fundingLikeVo = new FundingLikeVo();
			fundingLikeVo.setFunding_open_no(funding_open_no);
			fundingLikeVo.setUser_no(memberVo.getUser_no());
			
			fundingLikeCheckCount = fundingService.CheckFundingLike(fundingLikeVo);
			likePageCount = fundingService.getFundingLikeCount(fundingLikeVo);
		}
		
		Integer getFundingSumPoint = fundingService.getFundingSumPoint(funding_open_no); 
		Integer getFundingUserCount = fundingService.getFundingUserCount(funding_open_no);
		int getFundingRemainDate = fundingService.getFundingRemainDate(funding_open_no);
		int getTarget = fundingService.getFundingTarget(funding_open_no);
		Integer getCountFundingNotice = fundingService.getCountFundingNotice(funding_open_no);
		
		if(getFundingSumPoint == null) {
			getFundingSumPoint = 0;
		}
		
		int percent = getFundingSumPoint/getTarget*100;
		int percent1 = getFundingSumPoint/getTarget*100;
		
			if(percent >= 100) {
				percent = 100;
			}
		
		model.addAttribute("getCountFundingNotice", getCountFundingNotice);
		model.addAttribute("resultList", resultList);
		model.addAttribute("result",map);
		model.addAttribute("percent",percent);
		model.addAttribute("percent1",percent1);
		model.addAttribute("fundingLikeCheckCount", fundingLikeCheckCount);
		model.addAttribute("likePageCount", likePageCount);
		model.addAttribute("getFundingSumPoint", getFundingSumPoint);
		model.addAttribute("getFundingUserCount",getFundingUserCount);
		model.addAttribute("getFundingRemainDate", getFundingRemainDate);
		
		System.out.println("model = " + model);
		
		return "funding/funding_notice_page";
	}
	
	@RequestMapping("write_funding_notice_page.do")
	public String writeFundingNoticePage(Model model, int funding_open_no) {
		
		model.addAttribute("funding_open_no", funding_open_no);
		
		return "funding/write_funding_notice_page";
	}
	
	@RequestMapping("write_funding_notice_process.do")
	public String writeFundingNoticeProcess(FundingNoticeVo param, HttpSession session){
		
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();
		param.setUser_no(user_no);
		
		int funding_open_no = param.getFunding_open_no();
		param.setFunding_open_no(funding_open_no);
		
		fundingService.writeFundingNotice(param);
		
		return "redirect:./funding_notice_page.do?funding_open_no=" + funding_open_no;
	}
	
	@RequestMapping("get_funding_notice_list.do")
	public String FundingNoticeList(Model model ,int funding_open_no){
		
		ArrayList<HashMap<String, Object>> resultList = fundingService.getFundingNoticeList(funding_open_no);
		
		model.addAttribute("resultList", resultList);
		
		return "funding/update_funding_notice_page";
	}
	
	@RequestMapping("update_funding_notice_page.do")
	public String updateFundingNoticePage(Model model, int funding_notice_no) {
	
		HashMap<String, Object> map = fundingService.getFundingNotice(funding_notice_no);
		
		model.addAttribute("result", map);
		
		return "funding/update_funding_notice_page";
	}
	
	@RequestMapping("update_funding_notice_process.do")
	public String updateFundingNoticeProcess(FundingNoticeVo param) {
		
		fundingService.updateFundingNotice(param);
		
		return "redirect:./funding_notice_page.do";
	}
	
	@RequestMapping("delete_funding_notice_process.do")
	public String deleteFundingNoticeProcess(int funding_notice_no) {
		
		fundingService.deleteFundingNotice(funding_notice_no);
		
		return "redirect:./funding_notice_page.do";
	}
	
	@RequestMapping("funding_community_page.do")
	public String fundingCommunityPage(Model model, HttpSession session, int funding_open_no) {
		
		HashMap<String, Object> map = fundingService.getfunding(funding_open_no);
		
		int fundingLikeCheckCount = 0;
		int likePageCount = 0;
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		if(memberVo != null) {
			FundingLikeVo fundingLikeVo = new FundingLikeVo();
			fundingLikeVo.setFunding_open_no(funding_open_no);
			fundingLikeVo.setUser_no(memberVo.getUser_no());
			
			fundingLikeCheckCount = fundingService.CheckFundingLike(fundingLikeVo);
			likePageCount = fundingService.getFundingLikeCount(fundingLikeVo);
		}
		
		Integer getFundingSumPoint = fundingService.getFundingSumPoint(funding_open_no); 
		Integer getFundingUserCount = fundingService.getFundingUserCount(funding_open_no);
		int getFundingRemainDate = fundingService.getFundingRemainDate(funding_open_no);
		Integer getFundingSumCommunityContent = fundingService.getFundingSumCommunityContent(funding_open_no);
		Integer getCountFundingNotice = fundingService.getCountFundingNotice(funding_open_no);
		int getTarget = fundingService.getFundingTarget(funding_open_no);
		
		if(getFundingSumPoint == null) {
			getFundingSumPoint = 0;
		}
		
		int percent = getFundingSumPoint/getTarget*100;
		int percent1 = getFundingSumPoint/getTarget*100;
		
			if(percent >= 100) {
				percent = 100;
			}
		
		model.addAttribute("getCountFundingNotice", getCountFundingNotice);
		model.addAttribute("result",map);
		model.addAttribute("percent",percent);
		model.addAttribute("percent1",percent1);
		model.addAttribute("fundingLikeCheckCount", fundingLikeCheckCount);
		model.addAttribute("likePageCount", likePageCount);
		model.addAttribute("getFundingSumCommunityContent", getFundingSumCommunityContent);
		model.addAttribute("getFundingSumPoint", getFundingSumPoint);
		model.addAttribute("getFundingUserCount",getFundingUserCount);
		model.addAttribute("getFundingRemainDate", getFundingRemainDate);
		
		return "funding/funding_community_page";
	}
	

	@RequestMapping("update_funding_community_page.do")
	public String updateFundingCommunityPage(Model model, int funding_community_no) {
	
		HashMap<String, Object> map = fundingService.getFundingCommunity(funding_community_no);
		
		model.addAttribute("result", map);
		
		return "funding/update_funding_community_page";
	}
	
	@RequestMapping("update_funding_community_process.do")
	public String updateFundingCommunityProcess(FundingCommunityVo param) {
		
		fundingService.updateFundingCommunity(param);
		
		return "redirect:./funding_community_page.do";
	}
	
	@RequestMapping("delete_funding_community_process.do")
	public String deleteFundingCommunityProcess(int funding_community_no) {
		
		fundingService.deleteFundingCommunity(funding_community_no);
		
		return "redirect:./funding_community_page.do";
	}
	
	@RequestMapping("upload_funding_movie_page.do")
	public String uploadFundingPage(Model model, int funding_open_no) {
		
		model.addAttribute("funding_open_no", funding_open_no);
		
		return "funding/upload_funding_movie_page";
	}
	
	@RequestMapping("upload_funding_movie_process.do")
	public String uploadFundingMovieProcess(HttpSession session, UploadFundingResultVo param, MultipartFile upload_funding_movie) {
		
		UUID uid = UUID.randomUUID();
		
		String uploadRootFolderName = "C:/upload_files/";
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String todayFolder = sdf.format(today);
			
		String uploadFolderName = uploadRootFolderName + todayFolder;
		File uploadFolder = new File(uploadFolderName);
				
		if(!uploadFolder.exists()) {
			uploadFolder.mkdirs();
		}
		
		String originalName = upload_funding_movie.getOriginalFilename();
		String randomeName = uid.toString();
		long cuurentTime = System.currentTimeMillis();
		randomeName = randomeName + "_" + cuurentTime;
				
		String ext = originalName.substring(originalName.lastIndexOf("."));
		randomeName += ext;
				
				
		try {
			upload_funding_movie.transferTo(new File(uploadFolderName + "/" + randomeName));
		}catch(Exception e){
			e.printStackTrace();
		}
				
		String uploadFundingMovieLink = "/upload/" + todayFolder + "/" + randomeName;	
			
		param.setUpload_funding_movie_link(uploadFundingMovieLink);
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int user_no = memberVo.getUser_no();
		param.setUpload_funding_user_no(user_no);
		
		fundingService.insertUploadMovie(param);
		
		return "redirect:./upload_movie_view_page.do";
	}
	
	@RequestMapping("upload_movie_view_page.do")
	public String uploadMovieViewPage(Model model) {
		
		ArrayList<HashMap<String, Object>> resultList = fundingService.getuploadMovieList();
		
		model.addAttribute("resultList", resultList);
		
		return "/funding/upload_movie_view_page";
	}
	
	@RequestMapping("read_upload_movie_page.do")
	public String readUploadMoviePage(Model model, HttpSession session, int funding_open_no) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int user_no = memberVo.getUser_no();
		
		FundingUserListVo fundingMyListVo = new FundingUserListVo();
		fundingMyListVo.setFunding_user_no(user_no);
		fundingMyListVo.setFunding_open_no(funding_open_no);
		
		HashMap<String, Object> map = fundingService.getUploadFundingMovie(fundingMyListVo);
		
		model.addAttribute("result",map);
		
		return "funding/read_upload_movie_page";
	}
	
	@RequestMapping("watch_upload_movie_page.do")
	public String watchUploadMoviePage(Model model, HttpSession session, int funding_open_no) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int user_no = memberVo.getUser_no();
		
		FundingUserListVo fundingMyListVo = new FundingUserListVo();
		fundingMyListVo.setFunding_user_no(user_no);
		fundingMyListVo.setFunding_open_no(funding_open_no);
		
		HashMap<String, Object> map = fundingService.getUploadFundingMovie(fundingMyListVo);
		
		model.addAttribute("result",map);
		
		return "funding/watch_upload_movie_page";
	}
	
	@RequestMapping("funding_qna_page.do")
	public String fundingQnAPage(Model model, int funding_open_no) {
		
		ArrayList<HashMap<String, Object>> resultList = fundingService.getFundingQnAList(funding_open_no);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("funding_open_no", funding_open_no);
		
		return "funding/funding_qna_page";
	}
	
	@RequestMapping("write_funding_qna_page.do")
	public String writeFundingQnAPage(Model model, int funding_open_no) {
		
		model.addAttribute("funding_open_no", funding_open_no);
		
		return "funding/write_funding_qna_page";
	}
	
	@RequestMapping("funding_qna_write_process.do")
	public String writeFundingQnAProcess(HttpSession session, FundingQnAVo param) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int user_no = memberVo.getUser_no();
		param.setuser_no(user_no);
		fundingService.insertFundingQnA(param);
		
		int funding_open_no = param.getFunding_open_no();
		param.setFunding_open_no(funding_open_no);
		
		return "redirect:./funding_qna_page.do?funding_open_no=" + funding_open_no;
	}
	
	@RequestMapping("read_funding_qna_page.do")
	public String readFundingQnAPage(Model model, HttpSession session, int funding_qna_no) {
		
		HashMap<String, Object> map = fundingService.getfundingQnA(funding_qna_no);
		
		model.addAttribute("result", map);
		
		return "funding/read_funding_qna_page";
		
	}
	
	@RequestMapping("update_funding_qna_page.do")
	public String updateFundingQnAPage(Model model, int funding_qna_no) {
	
		HashMap<String, Object> map = fundingService.getfundingQnA(funding_qna_no);
		
		model.addAttribute("result", map);
		
		return "funding/update_funding_qna_page";
	}
	
	@RequestMapping("update_funding_qna_process.do")
	public String updateFundingQnAProcess(FundingQnAVo param) {
		
		fundingService.updateFundingQnA(param);
		
		return "redirect:./funding_qna_page.do";
	}
	
	@RequestMapping("delete_funding_qna_process.do")
	public String deleteFundingQnAProcess(int funding_qna_no) {
		
		fundingService.deleteFundingQnA(funding_qna_no);
		
		return "redirect:./funding_qna_page.do";
	}
	
	@RequestMapping("update_funding_qna_comment_page.do")
	public String updateFundingQnACommentPage(Model model, int funding_comment_no) {
		
		HashMap<String, Object> map = fundingService.getFundingQnAComment(funding_comment_no);
		
		model.addAttribute("result", map);
		
		return "funding/update_funding_qna_comment_page.do";
	}
	
	
	
	
}
