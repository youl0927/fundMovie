package com.bbq.fundmovie.vo;

import javax.xml.crypto.Data;

public class ReviewLikeVo {
	private int review_like_no;
	private int movie_review_no;
	private int user_no;
	private int review_like;
	private Data review_like_writedate;
	public ReviewLikeVo() {
		super();
	}
	public ReviewLikeVo(int review_like_no, int movie_review_no, int user_no, int review_like,
			Data review_like_writedate) {
		super();
		this.review_like_no = review_like_no;
		this.movie_review_no = movie_review_no;
		this.user_no = user_no;
		this.review_like = review_like;
		this.review_like_writedate = review_like_writedate;
	}
	public int getReview_like_no() {
		return review_like_no;
	}
	public void setReview_like_no(int review_like_no) {
		this.review_like_no = review_like_no;
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
	public int getReview_like() {
		return review_like;
	}
	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}
	public Data getReview_like_writedate() {
		return review_like_writedate;
	}
	public void setReview_like_writedate(Data review_like_writedate) {
		this.review_like_writedate = review_like_writedate;
	}
	
}
