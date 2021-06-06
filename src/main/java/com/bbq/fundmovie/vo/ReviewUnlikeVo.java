package com.bbq.fundmovie.vo;

import javax.xml.crypto.Data;

public class ReviewUnlikeVo {
	private int review_like_no;
	private int movie_review_no;
	private int user_no;
	private int review_unlike;
	private Data review_like_writedate;
	public ReviewUnlikeVo() {
		super();
	}
	public ReviewUnlikeVo(int review_like_no, int movie_review_no, int user_no, int review_unlike,
			Data review_like_writedate) {
		super();
		this.review_like_no = review_like_no;
		this.movie_review_no = movie_review_no;
		this.user_no = user_no;
		this.review_unlike = review_unlike;
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
	public int getReview_unlike() {
		return review_unlike;
	}
	public void setReview_unlike(int review_unlike) {
		this.review_unlike = review_unlike;
	}
	public Data getReview_like_writedate() {
		return review_like_writedate;
	}
	public void setReview_like_writedate(Data review_like_writedate) {
		this.review_like_writedate = review_like_writedate;
	}
}
