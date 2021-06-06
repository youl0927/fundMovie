package com.bbq.fundmovie.admin.mapper;

import java.util.ArrayList;

import com.bbq.fundmovie.vo.MovieSteelcutVo;

public interface AdminSteelSQLMapper {

	public void insert(MovieSteelcutVo vo);
	
	public ArrayList<MovieSteelcutVo> selectByMovieNo(int movie_no);
	
	//스틸컷 삭제
	public void deleteByNo(int movie_no);
}
