package com.bbq.fundmovie.freeboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbq.fundmovie.freeboard.mapper.FreeboardImageSQLMapper;
import com.bbq.fundmovie.freeboard.mapper.FreeboardLikeSQLMapper;
import com.bbq.fundmovie.freeboard.mapper.FreeboardRepleSQLMapper;
import com.bbq.fundmovie.freeboard.mapper.FreeboardSQLMapper;
import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.vo.FreeboardImageVo;
import com.bbq.fundmovie.vo.FreeboardLikeVo;
import com.bbq.fundmovie.vo.FreeboardRepleVo;
import com.bbq.fundmovie.vo.FreeboardVo;
import com.bbq.fundmovie.vo.MemberVo;

@Service
public class FreeboardServiceImpl {

	@Autowired
	private FreeboardSQLMapper freeboardSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private FreeboardRepleSQLMapper freeboardRepleSQLMapper;
	
	@Autowired
	private FreeboardLikeSQLMapper freeboardLikeSQLMapper;
	
	@Autowired
	private FreeboardImageSQLMapper freeboardImageSQLMapper;
	
	public void writeFreeboardContent(FreeboardVo vo, ArrayList<FreeboardImageVo> imageVoList) {
		System.out.println("라이트프리보드프로세스서비스1");
		int freeboardPK = freeboardSQLMapper.createKey();
		vo.setFreeboard_no(freeboardPK);	
		freeboardSQLMapper.fb_insert(vo);
		
		for(FreeboardImageVo imageVo : imageVoList) {
			imageVo.setFreeboard_no(freeboardPK);
			System.out.println("라이트프리보드프로세스서비스6");
			freeboardImageSQLMapper.insert(imageVo);
			System.out.println("라이트프리보드프로세스서비스7");
		}
	}
	
	public void freeboardLikedelete(FreeboardLikeVo vo) {
		freeboardLikeSQLMapper.freeboardLikedelete(vo);
	}
	
	public void freeboardLike(FreeboardLikeVo vo) {
		freeboardLikeSQLMapper.freeboardLikeinsert(vo);
	}
	
	public void deleteRepleByNo(int freeboard_reple_no) {
		freeboardRepleSQLMapper.deleteRepleByNo(freeboard_reple_no);
	}
	
	public ArrayList<HashMap<String, Object>> getFreeboardList(String search_word, String search_type, int page_num){
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		//ArrayList<FreeboardVo> freeboardList = freeboardSQLMapper.selectAll();
		ArrayList<FreeboardVo> freeboardList = null;
		
		if(search_word== null) {
			freeboardList = freeboardSQLMapper.selectAll(page_num);			
		}else {
			if(search_type.equals("title")) {
				freeboardList = freeboardSQLMapper.selectByTitle(search_word);
			}else if(search_type.equals("writer")) {
				freeboardList = freeboardSQLMapper.selectByWriter(search_word);	
			}
			else if(search_type.equals("content")) {
				freeboardList = freeboardSQLMapper.selectByContent(search_word);
			}
			else {
				freeboardList = freeboardSQLMapper.selectAll(page_num);		
			}
		}
		
		for(FreeboardVo freeboardVo : freeboardList) {
			int user_no = freeboardVo.getUser_no();
			System.out.println("프리보드 유저는 " + user_no);
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			
			
			int getFreeboard_no = freeboardVo.getFreeboard_no();
			int countReple = freeboardRepleSQLMapper.selectRepleTotal(getFreeboard_no);
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			map.put("freeboardVo", freeboardVo);
			map.put("countReple", countReple);
			
			resultList.add(map);
		}
		return resultList;
	}
	
	public HashMap<String, Object> getFreeboard(int freeboardNo){
		System.out.println("프리보드 읽기 서비스");
		freeboardSQLMapper.increaseReadcount(freeboardNo);
		FreeboardVo freeboardVo = freeboardSQLMapper.selectByNo(freeboardNo);
		
		//FreeboardLikeVo freeboardLikeVo = freeboardLikeSQLMapper.
		
		String str = freeboardVo.getFreeboard_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		freeboardVo.setFreeboard_content(str);
		
		int user_no1 = freeboardVo.getUser_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(user_no1);
		

		
		

		
		////////////////수정....
		ArrayList<HashMap<String, Object>> freeboardRepleResult = new ArrayList<HashMap<String,Object>>();		
		
		ArrayList<FreeboardRepleVo> freeboardRepleVoList = freeboardRepleSQLMapper.selectByFreeboardNo(freeboardNo);
		
		for(FreeboardRepleVo freeboardRepleVo : freeboardRepleVoList) {
			MemberVo repleMemberVo = memberSQLMapper.selectByNo(freeboardRepleVo.getUser_no());		
			HashMap<String, Object> repleMap = new HashMap<String, Object>();
			repleMap.put("memberVo", repleMemberVo);
			repleMap.put("freeboardRepleVo",freeboardRepleVo);
			
			freeboardRepleResult.add(repleMap);
		}
		
		System.out.println("프리보드 넘버는 : "+freeboardNo);
		ArrayList<FreeboardImageVo> imageVoList = freeboardImageSQLMapper.selectByFreeboardNo(freeboardNo);
		
		System.out.println("포문돌기전 리플" + freeboardRepleVoList);
		System.out.println("포문 돌기 전" + imageVoList  );
		
		
		HashMap<String, Object> map = new HashMap<String,Object>();
		

		map.put("imageVoList", imageVoList);
		map.put("memberVo", memberVo);
		map.put("freeboardVo", freeboardVo);
		map.put("repleList", freeboardRepleResult);
		
		///////////////수정 끝...
		
		
		return map;
	}
	
	
	public int getPageCount() {
		return freeboardSQLMapper.getPageCount();
	}
	
	public int countLikeTotal(int freeboardNo) {
		return freeboardLikeSQLMapper.countLikeTotal(freeboardNo);
	}
	
	public int countMyLike(FreeboardLikeVo vo) {
		return freeboardLikeSQLMapper.countMyLike(vo);
	}
	
	public void deleteContent(int freeboardNo) {
		freeboardSQLMapper.deleteByNo(freeboardNo);
	}
	
	public void updateFreeboard(FreeboardVo vo) {
		freeboardSQLMapper.update(vo);
	}
	
	public void writeFreeboardReple(FreeboardRepleVo vo) {
		freeboardRepleSQLMapper.insert(vo);
	}
	
	public ArrayList<HashMap<String, Object>> getFreeboardRepleList(int freeboardNo){
		
		ArrayList<HashMap<String, Object>> freeboardRepleResult = new ArrayList<HashMap<String,Object>>();		
		
		ArrayList<FreeboardRepleVo> freeboardRepleVoList = freeboardRepleSQLMapper.selectByFreeboardNo(freeboardNo);
		
		for(FreeboardRepleVo freeboardRepleVo : freeboardRepleVoList) {
			MemberVo memberVo = memberSQLMapper.selectByNo(freeboardRepleVo.getUser_no());		
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("freeboardRepleVo",freeboardRepleVo);
			
			freeboardRepleResult.add(map);
		}
		return freeboardRepleResult;
	}
	
	public int getRepleTotal(int freeboardNo) {	
		return freeboardRepleSQLMapper.selectRepleTotal(freeboardNo);		
	}

}
