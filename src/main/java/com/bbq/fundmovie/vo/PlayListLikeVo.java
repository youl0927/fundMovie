package com.bbq.fundmovie.vo;

public class PlayListLikeVo {

	private int playlist_like_no;
	private int playlist_no;
	private int user_no;
	private int playlist_like_check;
	
	public PlayListLikeVo() {
		super();
	}

	public PlayListLikeVo(int playlist_like_no, int playlist_no, int user_no, int playlist_like_check) {
		super();
		this.playlist_like_no = playlist_like_no;
		this.playlist_no = playlist_no;
		this.user_no = user_no;
		this.playlist_like_check = playlist_like_check;
	}

	public int getPlaylist_like_no() {
		return playlist_like_no;
	}

	public void setPlaylist_like_no(int playlist_like_no) {
		this.playlist_like_no = playlist_like_no;
	}

	public int getPlaylist_no() {
		return playlist_no;
	}

	public void setPlaylist_no(int playlist_no) {
		this.playlist_no = playlist_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getPlaylist_like_check() {
		return playlist_like_check;
	}

	public void setPlaylist_like_check(int playlist_like_check) {
		this.playlist_like_check = playlist_like_check;
	}

	
}
