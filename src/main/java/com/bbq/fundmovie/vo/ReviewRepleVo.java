package com.bbq.fundmovie.vo;

import java.util.Date;

public class ReviewRepleVo {
	private int review_reple_no;
	private int movie_review_no;
	private int user_no;
	private String review_reple_content;
	private Date review_reple_date;
	public ReviewRepleVo() {
		super();
	}
	public ReviewRepleVo(int review_reple_no, int movie_review_no, int user_no, String review_reple_content,
			Date review_reple_date) {
		super();
		this.review_reple_no = review_reple_no;
		this.movie_review_no = movie_review_no;
		this.user_no = user_no;
		this.review_reple_content = review_reple_content;
		this.review_reple_date = review_reple_date;
	}
	public int getReview_reple_no() {
		return review_reple_no;
	}
	public void setReview_reple_no(int review_reple_no) {
		this.review_reple_no = review_reple_no;
	}
	public int getMovie_review_no() {
		return movie_review_no;
	}
	public void setMovie_review_no(int movie_review_no) {
		this.movie_review_no = movie_review_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getReview_reple_content() {
		return review_reple_content;
	}
	public void setReview_reple_content(String review_reple_content) {
		this.review_reple_content = review_reple_content;
	}
	public Date getReview_reple_date() {
		return review_reple_date;
	}
	public void setReview_reple_date(Date review_reple_date) {
		this.review_reple_date = review_reple_date;
	}

	
}
