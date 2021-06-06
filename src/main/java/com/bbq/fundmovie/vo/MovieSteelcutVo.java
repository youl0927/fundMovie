package com.bbq.fundmovie.vo;

public class MovieSteelcutVo {

	private int movie_steelcut_no;
	private String movie_steelcut_img;
	private int movie_no;
	
	public MovieSteelcutVo() {
		super();
	}

	public MovieSteelcutVo(int movie_steelcut_no, String movie_steelcut_img, int movie_no) {
		super();
		this.movie_steelcut_no = movie_steelcut_no;
		this.movie_steelcut_img = movie_steelcut_img;
		this.movie_no = movie_no;
	}

	public int getMovie_steelcut_no() {
		return movie_steelcut_no;
	}

	public void setMovie_steelcut_no(int movie_steelcut_no) {
		this.movie_steelcut_no = movie_steelcut_no;
	}

	public String getMovie_steelcut_img() {
		return movie_steelcut_img;
	}

	public void setMovie_steelcut_img(String movie_steelcut_img) {
		this.movie_steelcut_img = movie_steelcut_img;
	}

	public int getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	
	
	
	
}
