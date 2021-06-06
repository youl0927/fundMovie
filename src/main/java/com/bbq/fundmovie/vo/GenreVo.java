package com.bbq.fundmovie.vo;

public class GenreVo {

	private int genre_no;
	private String genre_name;
	
	public GenreVo() {
		super();
	}

	public GenreVo(int genre_no, String genre_name) {
		super();
		this.genre_no = genre_no;
		this.genre_name = genre_name;
	}

	public int getGenre_no() {
		return genre_no;
	}

	public void setGenre_no(int genre_no) {
		this.genre_no = genre_no;
	}

	public String getGenre_name() {
		return genre_name;
	}

	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}
	
	
	  
}
