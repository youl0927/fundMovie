package com.bbq.fundmovie.admin.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bbq.fundmovie.admin.service.AdminServiceImpl;
import com.bbq.fundmovie.vo.ContentVo;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.MovieSteelcutVo;
import com.bbq.fundmovie.vo.QnaVo;



@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminServiceImpl adminService;
	
	
	@RequestMapping("fund_request_list.do")
	public String fundRequestList(Model model) {
		ArrayList<HashMap<String, Object>> fundList = 
				adminService.getFundRequestList();
		
		model.addAttribute("fundList", fundList);
		
		return "/admin/fund_request_list";
	}
	
	@ResponseBody
	@RequestMapping("funding_list.do")
	public ArrayList<HashMap<String, Object>> getfundingList(){
		ArrayList<HashMap<String, Object>> resultList = adminService.getselectSatisiedFundingList();
		
		return resultList;
	}
	
	
	@RequestMapping("movie_list.do")
	public String movieList(Model model , String search_word , String search_type , @RequestParam(value="page_num",defaultValue = "1") int page_num) {
		
		ArrayList<HashMap<String, Object>> resultList = 
				adminService.getContentList(search_word , search_type , page_num);
		
		int pageCount = adminService.getPageCount();

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
		
		
		return "/admin/movie_list";
	}
	
	@RequestMapping("approve_rank_process.do")
	public String approveRankProcess(int user_no) {
		
		adminService.approveRankProcess(user_no);
		
		return "redirect:./rank_request_list.do";
	}
	
	@RequestMapping("approve_funding_process.do")
	public String approveFundingProcess(int funding_open_no) {
		
		adminService.approveFudingProcess(funding_open_no);
		
		return "redirect:./fund_request_list.do";
	}
	
	@RequestMapping("complete_funding_process.do")
	public String completeFundingProcess(int funding_open_no) {
		
		adminService.completeFudingProcess(funding_open_no);
		
		return "redirect:./fund_request_list.do";
	}
	
	@RequestMapping("uploaded_funding_process.do")
	public String uploadedFundingProcess(int funding_open_no) {
		
		adminService.uploadedFudingProcess(funding_open_no);
		
		return "redirect:./fund_request_list.do";
	}
	
	@RequestMapping("rank_request_list.do")
	public String rankUpRequestList(Model model) {
		ArrayList<HashMap<String, Object>> rankList = 
				adminService.getRankRequestList();
		
		model.addAttribute("rankList", rankList);
		
		return "/admin/rank_request_list";
	}

	@RequestMapping("setting_main.do")
	public String settingMain() {
		
		
		return "/admin/setting_main";
 
	}
	
	@RequestMapping("add_movie_inform.do")
	public String addMovieInform() {
		
		
		return "/admin/add_movie_inform";
 
	}
	
	@RequestMapping("add_movie_inform_process.do")
	public String addMovieProcess(HttpSession session, ContentVo param, MultipartFile file, MultipartFile [] steelcuts, int [] genre_no) {
	
	
		//업로드....
						
			//날짜별 폴더를 만들기....!!!
			// ..../년도/월/일/랜덤_시간.jpg ...
			String uploadRootFolderName = "C:/upload_files/";
			
			Date today = new Date(); 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolder = sdf.format(today);
			
			String uploadFolderName = uploadRootFolderName + todayFolder;
			
			File uploadFolder = new File(uploadFolderName); 
			
			if(!uploadFolder.exists()) {
				uploadFolder.mkdirs();
			}
			
			

			String originalFileName = file.getOriginalFilename();
			System.out.println(originalFileName);
			//저장시.. 파일명을 변경 
			//목적 : 충돌 방지(덮어 씌우기 방지)
			//방법 : 랜덤 + 시간
			
			String randomName = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			
			randomName = randomName + "_" + currentTime;
			
			//확장자 추가...(오리지널 파일 이름에서 뽑아와야됨)
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			randomName += ext;

			
			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));
											
				
			}catch(Exception e) {		
				e.printStackTrace();
			}
			
			//..ImageVo 객체 생성....
								 
			String link = "/upload/" + todayFolder + "/" + randomName;

			
			param.setMovie_main_img(link);
			
		
	
		
		ArrayList<MovieSteelcutVo> steelcutVoList = new ArrayList<MovieSteelcutVo>(); 
		
		//업로드....
		for(MultipartFile steelcut : steelcuts) {
					
					if(steelcut.getSize() <= 0) {
						continue;
					}
					
			//날짜별 폴더를 만들기....!!!
			// ..../년도/월/일/랜덤_시간.jpg ...
			String uploadRootFolderName1 = "C:/upload_files/";
			
			Date today1 = new Date(); 
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolder1 = sdf1.format(today1);
			
			String uploadFolderName1 = uploadRootFolderName1 + todayFolder1;
			
			File uploadFolder1 = new File(uploadFolderName1); 
			
			if(!uploadFolder1.exists()) {
				uploadFolder1.mkdirs();
			}
			
			
			String originalSteelcutName = steelcut.getOriginalFilename();

			System.out.println(originalSteelcutName);
			//저장시.. 파일명을 변경 
			//목적 : 충돌 방지(덮어 씌우기 방지)
			//방법 : 랜덤 + 시간
			
			String randomName1 = UUID.randomUUID().toString();
			long currentTime1 = System.currentTimeMillis();
			
			randomName1 = randomName1 + "_" + currentTime1;
			
			//확장자 추가...(오리지널 파일 이름에서 뽑아와야됨)
			String ext1 = originalSteelcutName.substring(originalSteelcutName.lastIndexOf("."));
			
			randomName1 += ext1;
	
			try {
				steelcut.transferTo(new File(uploadFolderName1 + "/" + randomName1));
											
				
			}catch(Exception e1) {		
				e1.printStackTrace();
			}
			
			//..ImageVo 객체 생성....
			
			MovieSteelcutVo steelcutVo = new MovieSteelcutVo();
						 
			String link1 = "/upload/" + todayFolder1 + "/" + randomName1;

			steelcutVo.setMovie_steelcut_img(link1);
			
			steelcutVoList.add(steelcutVo);
		
		}
		
		
		//데이터 처리....

		MemberVo sessionUser = 
				(MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no(); 
		
		param.setUser_no(user_no);
	
		adminService.addMovieInform(param, steelcutVoList, genre_no);
		

		
		return "redirect:./movie_list.do";
	}
	
	//글삭제
	@RequestMapping("delete_movie_process.do")
	public String deleteMovieProcess(int movie_no) {
		
		adminService.deleteMovie(movie_no);
		
		return "redirect:./movie_list.do";
	}
	//글수정
	@RequestMapping("update_movie_page.do")
	public String updateMoviePage(Model model , int movie_no) {
		
		HashMap<String, Object> map = adminService.getContent(movie_no);
		
		model.addAttribute("result", map);
		
		return "admin/update_movie_page";
	}
	
	
	@RequestMapping("update_movie_process.do")
	public String updateMovieProcess(ContentVo param) {
		
		adminService.updateMovie(param);
		
		return "redirect:./movie_list.do";
	}
	
	
	@RequestMapping("test_movie_page.do")
	public String readContentPage(Model model,int movie_no) {
		
		HashMap<String, Object> map = adminService.getContent(movie_no);
		
		model.addAttribute("result",map);
		
		return "admin/test_movie_page";
	}
	

	//qna
	@RequestMapping("qna_page.do")
	public String qna(Model model,@RequestParam(value = "page_num",defaultValue = "1") int page_num) {
		
		
		ArrayList<HashMap<String, Object>> qnaResultList =
				adminService.getQnaList(page_num);
		
		System.out.println("qna arraylist 담기 성공");
		
		int pageCount = adminService.getQnaPageCount();
		
		int currentPage = page_num;
		
		int beginPage = ((currentPage-1)/5)*5 + 1;
		int endPage = ((currentPage-1)/5+1)*(5);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("qnaAdminResultList", qnaResultList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		
		System.out.println("2");
		
		return "/admin/qna_page";
	}
	
		//qna 글보기 + qna 댓글달기
		@RequestMapping("add_qna_reply_page.do")
		public String qnaReadPage(Model model, int qna_no) {
			
		System.out.println("관리자 리플페이지");
			
		HashMap<String, Object> map = adminService.getQnaContent(qna_no);
		
		
		model.addAttribute("qnaAdminResult", map);	
		
		
			return "/admin/add_qna_reply_page";
		}
	
	
		@RequestMapping("add_qna_reply_process.do")
		public String updateQnaAdminReplyProcess(QnaVo param) {
			
			adminService.getAdminQnaReply(param);
			
			return "redirect:./qna_page.do";
		}
	
	
}
