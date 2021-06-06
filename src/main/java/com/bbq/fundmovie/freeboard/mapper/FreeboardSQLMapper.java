package com.bbq.fundmovie.freeboard.mapper;

import java.util.ArrayList;

import com.bbq.fundmovie.vo.FreeboardVo;

public interface FreeboardSQLMapper {

	//글쓰기
	public int createKey();
	
	public void fb_insert(FreeboardVo vo);
	
	public ArrayList<FreeboardVo> selectAll(int page_num);
	
	public FreeboardVo selectByNo(int no);
	
	public int getPageCount();
	
	public void increaseReadcount(int no);
	
	public ArrayList<FreeboardVo> selectByTitle(String search_word);
	
	public ArrayList<FreeboardVo> selectByContent(String search_word);
	
	public ArrayList<FreeboardVo> selectByWriter(String search_word);
	
	public void deleteByNo(int no);
	
	public void update(FreeboardVo vo);
}
