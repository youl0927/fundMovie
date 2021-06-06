package com.bbq.fundmovie.playlist.mapper;

import com.bbq.fundmovie.vo.PlayListLikeVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

@Mapper
public interface PlayListLikeSQLMapper {
	
	public void inserPlayListLike(PlayListLikeVo vo);
	
	public void updatePlayListLike(int playlist_no);
	
	public void deletePlayListLike(PlayListLikeVo vo);
	
	public int getPlayList(PlayListLikeVo vo);
}
