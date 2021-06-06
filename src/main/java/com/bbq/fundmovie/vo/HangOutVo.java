package com.bbq.fundmovie.vo;

import java.util.Date;

public class HangOutVo {
 	private int hangout_movie_no;
 	private int hangout_user_no;
 	private String movie_title;
 	private Date movie_start_date;
 	private Date deadLine_date;
 	private int member_count;
 	private int hangout_price;
 	private String movie_genre;
 	private Date open_date;
 	
	public HangOutVo() {
		super();
	}

	public HangOutVo(int hangout_movie_no, int hangout_user_no, String movie_title, Date movie_start_date,
			Date deadLine_date, int member_count, int hangout_price, String movie_genre, Date open_date) {
		super();
		this.hangout_movie_no = hangout_movie_no;
		this.hangout_user_no = hangout_user_no;
		this.movie_title = movie_title;
		this.movie_start_date = movie_start_date;
		this.deadLine_date = deadLine_date;
		this.member_count = member_count;
		this.hangout_price = hangout_price;
		this.movie_genre = movie_genre;
		this.open_date = open_date;
	}

	public int getHangout_movie_no() {
		return hangout_movie_no;
	}

	public void setHangout_movie_no(int hangout_movie_no) {
		this.hangout_movie_no = hangout_movie_no;
	}

	public int getHangout_user_no() {
		return hangout_user_no;
	}

	public void setHangout_user_no(int hangout_user_no) {
		this.hangout_user_no = hangout_user_no;
	}

	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public Date getMovie_start_date() {
		return movie_start_date;
	}

	public void setMovie_start_date(Date movie_start_date) {
		this.movie_start_date = movie_start_date;
	}

	public Date getDeadLine_date() {
		return deadLine_date;
	}

	public void setDeadLine_date(Date deadLine_date) {
		this.deadLine_date = deadLine_date;
	}

	public int getMember_count() {
		return member_count;
	}

	public void setMember_count(int member_count) {
		this.member_count = member_count;
	}

	public int getHangout_price() {
		return hangout_price;
	}

	public void setHangout_price(int hangout_price) {
		this.hangout_price = hangout_price;
	}

	public String getMovie_genre() {
		return movie_genre;
	}

	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}

	public Date getOpen_date() {
		return open_date;
	}

	public void setOpen_date(Date open_date) {
		this.open_date = open_date;
	}
	
	
	
 	
}
