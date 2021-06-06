package com.bbq.fundmovie.playlist.mapper;

import java.util.ArrayList;
import java.util.List;

import com.bbq.fundmovie.vo.MoviePlaylistVo;
import com.bbq.fundmovie.vo.MovieVo;
import com.bbq.fundmovie.vo.PlaylistVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PlayListSQLMapper {
	
	public int createKey();
	
	public void writePlayList(PlaylistVo vo);
	
	public ArrayList<PlaylistVo> selectAll();

	public List<PlaylistVo> myAllList(int user_no);

	public void insertMovieIntoPlayList(int movie_no, int playlist_no);

	public PlaylistVo selectByPlayListNo(int playlist_no);

	public List<MoviePlaylistVo> getMovieListFromPlaylistByPlaylistNo(int playlist_no);
	
	public void deletePlaylist(int playlist_no);

	public void updatePlaylist(PlaylistVo vo);

	public void deleteMovieFromPlaylist(int movie_no, int playlist_no);

	public List<MovieVo> selectAllMovie();
	
}
