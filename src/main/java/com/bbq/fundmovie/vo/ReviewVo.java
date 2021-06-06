package com.bbq.fundmovie.vo;

import java.util.Date;

public class ReviewVo {
	private int movie_review_no;
	private int movie_no;
	private int user_no;
	private String movie_review_title;
	private String movie_review_content;
	private int movie_review_readcount;
	private int movie_review_rating;
	private Date movie_review_writedate;
	public ReviewVo() {
		super();
	}
	public ReviewVo(int movie_review_no, int movie_no, int user_no, String movie_review_title,
			String movie_review_content, int movie_review_readcount, int movie_review_rating,
			Date movie_review_writedate) {
		super();
		this.movie_review_no = movie_review_no;
		this.movie_no = movie_no;
		this.user_no = user_no;
		this.movie_review_title = movie_review_title;
		this.movie_review_content = movie_review_content;
		this.movie_review_readcount = movie_review_readcount;
		this.movie_review_rating = movie_review_rating;
		this.movie_review_writedate = movie_review_writedate;
	}
	public int getMovie_review_no() {
		return movie_review_no;
	}
	public void setMovie_review_no(int movie_review_no) {
		this.movie_review_no = movie_review_no;
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
	public String getMovie_review_title() {
		return movie_review_title;
	}
	public void setMovie_review_title(String movie_review_title) {
		this.movie_review_title = movie_review_title;
	}
	public String getMovie_review_content() {
		return movie_review_content;
	}
	public void setMovie_review_content(String movie_review_content) {
		this.movie_review_content = movie_review_content;
	}
	public int getMovie_review_readcount() {
		return movie_review_readcount;
	}
	public void setMovie_review_readcount(int movie_review_readcount) {
		this.movie_review_readcount = movie_review_readcount;
	}
	public int getMovie_review_rating() {
		return movie_review_rating;
	}
	public void setMovie_review_rating(int movie_review_rating) {
		this.movie_review_rating = movie_review_rating;
	}
	public Date getMovie_review_writedate() {
		return movie_review_writedate;
	}
	public void setMovie_review_writedate(Date movie_review_writedate) {
		this.movie_review_writedate = movie_review_writedate;
	}
	
	
}
