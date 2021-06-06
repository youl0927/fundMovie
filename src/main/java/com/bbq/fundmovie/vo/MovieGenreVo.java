package com.bbq.fundmovie.vo;

public class MovieGenreVo {
	
	private int movie_genre_no;
	private int movie_no;
	private int genre_no;
	
	public MovieGenreVo() {
		super();
	}

	public MovieGenreVo(int movie_genre_no, int movie_no, int genre_no) {
		super();
		this.movie_genre_no = movie_genre_no;
		this.movie_no = movie_no;
		this.genre_no = genre_no;
	}

	public int getMovie_genre_no() {
		return movie_genre_no;
	}

	public void setMovie_genre_no(int movie_genre_no) {
		this.movie_genre_no = movie_genre_no;
	}

	public int getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}

	public int getGenre_no() {
		return genre_no;
	}

	public void setGenre_no(int genre_no) {
		this.genre_no = genre_no;
	}
	
	
	
}
