package com.bbq.fundmovie.freeboard.mapper;


import com.bbq.fundmovie.vo.FreeboardLikeVo;

public interface FreeboardLikeSQLMapper {

	public void freeboardLikeinsert(FreeboardLikeVo vo);
	
	public void freeboardLikedelete(FreeboardLikeVo vo);
		
	public int countMyLike(FreeboardLikeVo vo);
	
	public int countLikeTotal(int no);

	public FreeboardLikeVo MyLike(int freeboard_no, int user_no);	
	
}
