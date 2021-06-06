package com.bbq.fundmovie.playlist.controller;

import javax.servlet.http.HttpServletRequest;

import com.bbq.fundmovie.playlist.service.PlayListServiceImpl;
import com.bbq.fundmovie.vo.MFUserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbq.fundmovie.vo.PlayListLikeVo;

@Controller
@RequestMapping("/member/*")
@ResponseBody
public class PlayListLikeController {
	
	@Autowired
	private PlayListServiceImpl playListService;
	
	@RequestMapping("get_playlist_like.do")
	public void getPlayListLike(int playlist_no, Model model, HttpServletRequest httpServletRequest) {
		
		int user_no = ((MFUserVo)httpServletRequest.getSession().getAttribute("login")).getUser_no();
		
		PlayListLikeVo vo = new PlayListLikeVo();
		vo.setPlaylist_no(playlist_no);
		vo.setUser_no(user_no);
		
		int playListLike = playListService.getPlayList(vo);
		
		model.addAttribute("heart", playListLike);
	}
	
	public int heart(HttpServletRequest httpServletRequest) {
		
		int heart = Integer.parseInt(httpServletRequest.getParameter("heart"));
		int playlist_no = Integer.parseInt(httpServletRequest.getParameter("playlist_no"));
		int user_no = ((MFUserVo)httpServletRequest.getSession().getAttribute("login")).getUser_no();
		
		PlayListLikeVo playListLikeVo = new PlayListLikeVo();
		
		playListLikeVo.setPlaylist_no(playlist_no);
		playListLikeVo.setUser_no(user_no);
		
		if(heart >= 1) {
			playListService.deletePlayListLike(playListLikeVo);
			heart = 0;
		}else {
			playListService.insertPlayListLike(playListLikeVo);
			heart = 1;
		}
		
		return heart;
		
	}
	
}
