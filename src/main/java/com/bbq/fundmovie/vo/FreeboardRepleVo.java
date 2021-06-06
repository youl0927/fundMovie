package com.bbq.fundmovie.vo;

import java.util.Date;

public class FreeboardRepleVo {

	private int freeboard_reple_no;
	private int freeboard_no;
	private int user_no;
	private String reple_freeboard;
	private Date freeboard_reple_writedate;
	public FreeboardRepleVo() {
		super();
	}
	public FreeboardRepleVo(int freeboard_reple_no, int freeboard_no, int user_no, String reple_freeboard,
			Date freeboard_reple_writedate) {
		super();
		this.freeboard_reple_no = freeboard_reple_no;
		this.freeboard_no = freeboard_no;
		this.user_no = user_no;
		this.reple_freeboard = reple_freeboard;
		this.freeboard_reple_writedate = freeboard_reple_writedate;
	}
	public int getFreeboard_reple_no() {
		return freeboard_reple_no;
	}
	public void setFreeboard_reple_no(int freeboard_reple_no) {
		this.freeboard_reple_no = freeboard_reple_no;
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
	public String getReple_freeboard() {
		return reple_freeboard;
	}
	public void setReple_freeboard(String reple_freeboard) {
		this.reple_freeboard = reple_freeboard;
	}
	public Date getFreeboard_reple_writedate() {
		return freeboard_reple_writedate;
	}
	public void setFreeboard_reple_writedate(Date freeboard_reple_writedate) {
		this.freeboard_reple_writedate = freeboard_reple_writedate;
	}
	
	
}
