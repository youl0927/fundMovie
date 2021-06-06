package com.bbq.fundmovie.vo;

public class MoviePlaylistVo {
    private int movie_playlist_no;
    private int movie_no;
    private int playlist_no;
	
    public MoviePlaylistVo() {
		super();
	}

	public MoviePlaylistVo(int movie_playlist_no, int movie_no, int playlist_no) {
		super();
		this.movie_playlist_no = movie_playlist_no;
		this.movie_no = movie_no;
		this.playlist_no = playlist_no;
	}

	public int getMovie_playlist_no() {
		return movie_playlist_no;
	}

	public void setMovie_playlist_no(int movie_playlist_no) {
		this.movie_playlist_no = movie_playlist_no;
	}

	public int getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}

	public int getPlaylist_no() {
		return playlist_no;
	}

	public void setPlaylist_no(int playlist_no) {
		this.playlist_no = playlist_no;
	}
    
    
    
}
