package com.bbq.fundmovie.freeboard.mapper;

import java.util.ArrayList;

import com.bbq.fundmovie.vo.FreeboardRepleVo;

public interface FreeboardRepleSQLMapper {
	
	public void insert(FreeboardRepleVo vo);

	public ArrayList<FreeboardRepleVo> selectByFreeboardNo(int freeboard_no);
	
	public void deleteRepleByNo(int freeboard_reple_no);
	
	public int selectRepleTotal(int freeboard_no);
}
