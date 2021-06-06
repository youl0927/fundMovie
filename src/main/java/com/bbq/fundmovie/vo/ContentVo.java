package com.bbq.fundmovie.vo;

import java.util.Date;

public class ContentVo {
	private int movie_no;
	private int user_no;
	private int movie_genre_no;
	private int movie_tag_no;
	private String movie_director;
	private String movie_actor;
	private String movie_title;
	private String movie_rating;
	private String movie_release_date;
	private String movie_synopsis;
	private int movie_runtime;
	private String movie_main_img;
	private String movie_from;
	private String movie_writer;
	private int movie_readcount;
	private Date movie_writedate;

	
	
	public ContentVo() {
		super();
	}



	public ContentVo(int movie_no, int user_no, int movie_genre_no, int movie_tag_no, String movie_director,
			String movie_actor, String movie_title, String movie_rating, String movie_release_date,
			String movie_synopsis, int movie_runtime, String movie_main_img, String movie_from, String movie_writer,
			int movie_readcount, Date movie_writedate) {
		super();
		this.movie_no = movie_no;
		this.user_no = user_no;
		this.movie_genre_no = movie_genre_no;
		this.movie_tag_no = movie_tag_no;
		this.movie_director = movie_director;
		this.movie_actor = movie_actor;
		this.movie_title = movie_title;
		this.movie_rating = movie_rating;
		this.movie_release_date = movie_release_date;
		this.movie_synopsis = movie_synopsis;
		this.movie_runtime = movie_runtime;
		this.movie_main_img = movie_main_img;
		this.movie_from = movie_from;
		this.movie_writer = movie_writer;
		this.movie_readcount = movie_readcount;
		this.movie_writedate = movie_writedate;
	}



	public int getMovie_no() {
		return movie_no;
	}



	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}



	public int getUser_no() {
		return user_no;
	}



	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}



	public int getMovie_genre_no() {
		return movie_genre_no;
	}



	public void setMovie_genre_no(int movie_genre_no) {
		this.movie_genre_no = movie_genre_no;
	}



	public int getMovie_tag_no() {
		return movie_tag_no;
	}



	public void setMovie_tag_no(int movie_tag_no) {
		this.movie_tag_no = movie_tag_no;
	}



	public String getMovie_director() {
		return movie_director;
	}



	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}



	public String getMovie_actor() {
		return movie_actor;
	}



	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}



	public String getMovie_title() {
		return movie_title;
	}



	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}



	public String getMovie_rating() {
		return movie_rating;
	}



	public void setMovie_rating(String movie_rating) {
		this.movie_rating = movie_rating;
	}



	public String getMovie_release_date() {
		return movie_release_date;
	}



	public void setMovie_release_date(String movie_release_date) {
		this.movie_release_date = movie_release_date;
	}



	public String getMovie_synopsis() {
		return movie_synopsis;
	}



	public void setMovie_synopsis(String movie_synopsis) {
		this.movie_synopsis = movie_synopsis;
	}



	public int getMovie_runtime() {
		return movie_runtime;
	}



	public void setMovie_runtime(int movie_runtime) {
		this.movie_runtime = movie_runtime;
	}



	public String getMovie_main_img() {
		return movie_main_img;
	}



	public void setMovie_main_img(String movie_main_img) {
		this.movie_main_img = movie_main_img;
	}



	public String getMovie_from() {
		return movie_from;
	}



	public void setMovie_from(String movie_from) {
		this.movie_from = movie_from;
	}



	public String getMovie_writer() {
		return movie_writer;
	}



	public void setMovie_writer(String movie_writer) {
		this.movie_writer = movie_writer;
	}



	public int getMovie_readcount() {
		return movie_readcount;
	}



	public void setMovie_readcount(int movie_readcount) {
		this.movie_readcount = movie_readcount;
	}



	public Date getMovie_writedate() {
		return movie_writedate;
	}



	public void setMovie_writedate(Date movie_writedate) {
		this.movie_writedate = movie_writedate;
	}

	
	
}
