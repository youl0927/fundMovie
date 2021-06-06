package com.bbq.fundmovie.playlist.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import com.bbq.fundmovie.playlist.service.PlayListServiceImpl;
import com.bbq.fundmovie.vo.MFUserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bbq.fundmovie.vo.PlaylistVo;

@Controller
@RequestMapping("/member/*")
public class PlayListController {

	@Autowired
	private PlayListServiceImpl playListService;
	
	@RequestMapping("playlist_page.do")
	public String PlayListPage(Model model) {
		
		ArrayList<HashMap<String, Object>> playList = playListService.getPlayList();
		
		model.addAttribute("playList", playList);
		
		return "/member/playlist_page";
	}
	
	@RequestMapping("write_playlist_page.do")
	public String writePlayListPage() {
		
		return "member/write_playlist_page";
	}
	
	@RequestMapping("write_playlist_process.do")
	public String writePlayListPageProcess(HttpSession session, PlaylistVo param, MultipartFile file) {
		

		
		while(file.isEmpty()) {
			String uploadRootFolderName = "C:/upload_files/playlist_thumbnail";
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolderName = sdf.format(today);
			
			String uploadFolderName = uploadRootFolderName + todayFolderName;
			
			File uploadFolder = new File(uploadFolderName);
			
			if(!uploadFolder.exists()) {
				uploadFolder.mkdirs();
			}
			
			String originalFileName = file.getOriginalFilename();
			
			String randomName = UUID.randomUUID().toString();
			
			long currentTime = System.currentTimeMillis();
			
			randomName = randomName + "_" + currentTime;
			
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			randomName += ext;
			
			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			

			String link = "/upload/" + todayFolderName + "/" + randomName;
			//thumbnailVo.setPlaylist_thumbnail_link(link);
			
		}
		
		
		MFUserVo sessionUser = (MFUserVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no();
		
		param.setUser_no(user_no);
		
		//playListService.writePlayList(param, playListThumbNailVo);
		
		return "redirect:./playlist_page.do";
		
	}
	
	@RequestMapping("read_playlist_page.do")
	public String readPlayListPage(Model model, int playList_no) {
		
		HashMap<String, Object> map = playListService.getPlayContent(playList_no);
		
		model.addAttribute("result", map);
		
		return "member/read_playlist_page";
		
	}
	
	@RequestMapping("delete_playlist_process.do")
	public String deletePlayListProcess(int playList_no) {
		playListService.deletePlayList(playList_no);
		
		return "redirect:./playlist_page.do";
	}
	
	@RequestMapping("update_playlist_page.do")
	public String updatePlayListPage(Model model, int playList_no) {
		HashMap<String, Object> map = playListService.getPlayContent(playList_no);
		
		model.addAttribute("result", map);
		
		return "member/update_playlist_page";
		
	}
	
	@RequestMapping("update_playlist_process.do")
	public String updatePlayListProcess(PlaylistVo param) {
		
		playListService.updatePlayList(param);
		
		return "rediect:./playlist_page.do";
		
	}
	
}
