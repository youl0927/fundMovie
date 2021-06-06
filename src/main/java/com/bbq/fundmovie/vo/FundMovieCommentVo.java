package com.bbq.fundmovie.vo;

import java.util.Date;

public class FundMovieCommentVo {
	
	private int fund_movie_comment_no;
	private int funding_open_no;
	private int fund_movie_star;
	private int user_no;
	private String fund_movie_comment;
	private Date fund_movie_comment_writedate;
	
	public FundMovieCommentVo() {
		super();
	}

	public FundMovieCommentVo(int fund_movie_comment_no, int funding_open_no, int fund_movie_star, int user_no,
			String fund_movie_comment, Date fund_movie_comment_writedate) {
		super();
		this.fund_movie_comment_no = fund_movie_comment_no;
		this.funding_open_no = funding_open_no;
		this.fund_movie_star = fund_movie_star;
		this.user_no = user_no;
		this.fund_movie_comment = fund_movie_comment;
		this.fund_movie_comment_writedate = fund_movie_comment_writedate;
	}

	public int getFund_movie_comment_no() {
		return fund_movie_comment_no;
	}

	public void setFund_movie_comment_no(int fund_movie_comment_no) {
		this.fund_movie_comment_no = fund_movie_comment_no;
	}

	public int getFunding_open_no() {
		return funding_open_no;
	}

	public void setFunding_open_no(int funding_open_no) {
		this.funding_open_no = funding_open_no;
	}

	public int getFund_movie_star() {
		return fund_movie_star;
	}

	public void setFund_movie_star(int fund_movie_star) {
		this.fund_movie_star = fund_movie_star;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getFund_movie_comment() {
		return fund_movie_comment;
	}

	public void setFund_movie_comment(String fund_movie_comment) {
		this.fund_movie_comment = fund_movie_comment;
	}

	public Date getFund_movie_comment_writedate() {
		return fund_movie_comment_writedate;
	}

	public void setFund_movie_comment_writedate(Date fund_movie_comment_writedate) {
		this.fund_movie_comment_writedate = fund_movie_comment_writedate;
	}

}
