package com.bbq.fundmovie.freeboard.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bbq.fundmovie.freeboard.service.FreeboardServiceImpl;
import com.bbq.fundmovie.vo.FreeboardImageVo;
import com.bbq.fundmovie.vo.FreeboardLikeVo;
import com.bbq.fundmovie.vo.FreeboardVo;
import com.bbq.fundmovie.vo.MemberVo;


@Controller
@RequestMapping("/freeboard/*")
public class FreeboardController {
	
	@Autowired
	private FreeboardServiceImpl freeboardService;
	
	
	@RequestMapping("freeboard_page.do")
	public String freeboardPage(Model model, @RequestParam(value="page_num", defaultValue = "1") int page_num, String search_word, String search_type, FreeboardVo param){
		System.out.println("자유게시판 입장");
		ArrayList<HashMap<String, Object>> resultList = freeboardService.getFreeboardList(search_word,search_type, page_num);
		
			
		
		int pageCount = freeboardService.getPageCount();
		int currentPage = page_num;
		int beginPage = ((currentPage-1)/5)*5+1;
		int endPage = ((currentPage-1)/5+1)*(5);
		
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		

		return "/freeboard/freeboard_page";
	}
	
	
	@RequestMapping("write_freeboard_page.do")
	public String writeFreeboardPage() {
		
		return "freeboard/write_freeboard_page";
	}
	
	@RequestMapping("write_freeboard_process.do")
	public String writeFreeboardProcess(HttpSession session, FreeboardVo param, MultipartFile [] files) {

		System.out.println("라이트프리보드프로세스1");
		ArrayList<FreeboardImageVo> imageVoList = new ArrayList<FreeboardImageVo>();
		
		//업로드....
		for(MultipartFile file : files) {
			if(file.getSize() <= 0) {
				continue;
			}
			
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
			FreeboardImageVo imageVo = new FreeboardImageVo();
			
			String link = "/upload/" + todayFolder + "/" + randomName;
			imageVo.setImage_link(link);
			
			imageVoList.add(imageVo);
			
		}
			
			
			
		
		System.out.println("라이트프리보드프로세스3");
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		param.setUser_no(user_no);
		freeboardService.writeFreeboardContent(param, imageVoList);
		
		return "redirect:./freeboard_page.do";
	}
	
	@RequestMapping("read_freeboard_page.do")
	public String readFreeboardPage(Model model, int freeboard_no, FreeboardLikeVo param, HttpSession session) {
		int user_no = ((MemberVo)session.getAttribute("sessionUser")).getUser_no();
		HashMap<String, Object> map = freeboardService.getFreeboard(freeboard_no);
		System.out.println("리트프리보드1");
		
		//ArrayList<HashMap<String, Object>> freeboardRepleResult = freeboardService.getFreeboardRepleList(freeboard_no);
		System.out.println("리트프리보드2");
				
	
		int countLikeTotal = freeboardService.countLikeTotal(freeboard_no);
		
		
		param.setUser_no(user_no);
		param.setFreeboard_no(freeboard_no);
		
		
		
		
		int countMyLike = freeboardService.countMyLike(param);
		
		
		model.addAttribute("countLikeTotal", countLikeTotal);
		model.addAttribute("countMyLike", countMyLike);		
		
		model.addAttribute("result",map);
		System.out.println("리트프리보드3");
		
		//model.addAttribute("freeboardRepleResult",freeboardRepleResult);
		System.out.println("리트프리보드4");
		

		return "freeboard/read_freeboard_page";
	}
	
	@RequestMapping("delete_freeboard_process.do")
	public String deleteFreeboardProcess(int freeboard_no) {
		freeboardService.deleteContent(freeboard_no);
		
		return "redirect:./freeboard_page.do";
	}
	
	@RequestMapping("update_freeboard_page.do")
	public String updateFreeboardPage(Model model, int freeboard_no) {
		
		HashMap<String, Object> map = freeboardService.getFreeboard(freeboard_no);
		
		model.addAttribute("result", map);
		
		return "freeboard/update_freeboard_page";
	}
	
	@RequestMapping("update_freeboard_process.do")
	public String updateFreeboardProcess(FreeboardVo param) {
		freeboardService.updateFreeboard(param);
		return "redirect:./freeboard_page.do";
	}
}
