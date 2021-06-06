package com.bbq.fundmovie.vo;

import java.util.Date;

public class FreeboardLikeVo {
	private int freeboard_like_no;
	private int freeboard_no;
	private int user_no;
	private String freeboard_like_like;
	private Date freeboard_like_writedate;
	public FreeboardLikeVo() {
		super();
	}
	public FreeboardLikeVo(int freeboard_like_no, int freeboard_no, int user_no, String freeboard_like_like,
			Date freeboard_like_writedate) {
		super();
		this.freeboard_like_no = freeboard_like_no;
		this.freeboard_no = freeboard_no;
		this.user_no = user_no;
		this.freeboard_like_like = freeboard_like_like;
		this.freeboard_like_writedate = freeboard_like_writedate;
	}
	public int getFreeboard_like_no() {
		return freeboard_like_no;
	}
	public void setFreeboard_like_no(int freeboard_like_no) {
		this.freeboard_like_no = freeboard_like_no;
	}
	public int getFreeboard_no() {
		return freeboard_no;
	}
	public void setFreeboard_no(int freeboard_no) {
		this.freeboard_no = freeboard_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getFreeboard_like_like() {
		return freeboard_like_like;
	}
	public void setFreeboard_like_like(String freeboard_like_like) {
		this.freeboard_like_like = freeboard_like_like;
	}
	public Date getFreeboard_like_writedate() {
		return freeboard_like_writedate;
	}
	public void setFreeboard_like_writedate(Date freeboard_like_writedate) {
		this.freeboard_like_writedate = freeboard_like_writedate;
	}
	
	
	
}
