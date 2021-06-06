package com.bbq.fundmovie.vo;


public class PlaylistVo {
	
	private int playlist_no;
	private int user_no;
	private String playlist_title;
	private String playlist_thumbnail;
	private String playlist_content;
	
	public PlaylistVo() {
		super();
	}

	public PlaylistVo(int playlist_no, int user_no, String playlist_title, String playlist_thumbnail,
			String playlist_content) {
		super();
		this.playlist_no = playlist_no;
		this.user_no = user_no;
		this.playlist_title = playlist_title;
		this.playlist_thumbnail = playlist_thumbnail;
		this.playlist_content = playlist_content;
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

	public String getPlaylist_title() {
		return playlist_title;
	}

	public void setPlaylist_title(String playlist_title) {
		this.playlist_title = playlist_title;
	}

	public String getPlaylist_thumbnail() {
		return playlist_thumbnail;
	}

	public void setPlaylist_thumbnail(String playlist_thumbnail) {
		this.playlist_thumbnail = playlist_thumbnail;
	}

	public String getPlaylist_content() {
		return playlist_content;
	}

	public void setPlaylist_content(String playlist_content) {
		this.playlist_content = playlist_content;
	}

	//private int playlist_like_no;
	//private int playlist_readcount;//?????
	//private Date playlist_writedate;//????

	
	
	
}
