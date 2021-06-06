package com.bbq.fundmovie.vo;

import java.util.Date;

public class FreeboardVo {
	
	private int freeboard_no;
	private int user_no;
	private String freeboard_title;
	private String freeboard_content;
	private int freeboard_readcount;
	private Date freeboard_writedate;
	public FreeboardVo() {
		super();
	} 
	public FreeboardVo(int freeboard_no, int user_no, String freeboard_title, String freeboard_content,
			int freeboard_readcount, Date freeboard_writedate) {
		super();
		this.freeboard_no = freeboard_no;
		this.user_no = user_no;
		this.freeboard_title = freeboard_title;
		this.freeboard_content = freeboard_content;
		this.freeboard_readcount = freeboard_readcount;
		this.freeboard_writedate = freeboard_writedate;
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
	public String getFreeboard_title() {
		return freeboard_title;
	}
	public void setFreeboard_title(String freeboard_title) {
		this.freeboard_title = freeboard_title;
	}
	public String getFreeboard_content() {
		return freeboard_content;
	}
	public void setFreeboard_content(String freeboard_content) {
		this.freeboard_content = freeboard_content;
	}
	public int getFreeboard_readcount() {
		return freeboard_readcount;
	}
	public void setFreeboard_readcount(int freeboard_readcount) {
		this.freeboard_readcount = freeboard_readcount;
	}
	public Date getFreeboard_writedate() {
		return freeboard_writedate;
	}
	public void setFreeboard_writedate(Date freeboard_writedate) {
		this.freeboard_writedate = freeboard_writedate;
	}
	
	
}
