package com.bbq.fundmovie.freeboard.mapper;

import java.util.ArrayList;

import com.bbq.fundmovie.vo.FreeboardImageVo;

public interface FreeboardImageSQLMapper {
	
	public void insert(FreeboardImageVo vo);
	
	public ArrayList<FreeboardImageVo> selectByFreeboardNo(int freeboardNo);
}
