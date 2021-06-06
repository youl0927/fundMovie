package com.bbq.fundmovie.vo;

import java.util.Date;

public class TradeVo {
	
	private int trade_no;
	private int user_no;
	private int trade_headline_no;
	private String trade_title;
	private String trade_content;
	private int trade_money;
	private String trade_complete;
	private int trade_readcount;
	private Date trade_writedate;
	
	public TradeVo() {
		super();
	}

	public TradeVo(int trade_no, int user_no, int trade_headline_no, String trade_title, String trade_content,
			int trade_money, String trade_complete, int trade_readcount, Date trade_writedate) {
		super();
		this.trade_no = trade_no;
		this.user_no = user_no;
		this.trade_headline_no = trade_headline_no;
		this.trade_title = trade_title;
		this.trade_content = trade_content;
		this.trade_money = trade_money;
		this.trade_complete = trade_complete;
		this.trade_readcount = trade_readcount;
		this.trade_writedate = trade_writedate;
	}

	public int getTrade_no() {
		return trade_no;
	}

	public void setTrade_no(int trade_no) {
		this.trade_no = trade_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getTrade_headline_no() {
		return trade_headline_no;
	}

	public void setTrade_headline_no(int trade_headline_no) {
		this.trade_headline_no = trade_headline_no;
	}

	public String getTrade_title() {
		return trade_title;
	}

	public void setTrade_title(String trade_title) {
		this.trade_title = trade_title;
	}

	public String getTrade_content() {
		return trade_content;
	}

	public void setTrade_content(String trade_content) {
		this.trade_content = trade_content;
	}

	public int getTrade_money() {
		return trade_money;
	}

	public void setTrade_money(int trade_money) {
		this.trade_money = trade_money;
	}

	public String getTrade_complete() {
		return trade_complete;
	}

	public void setTrade_complete(String trade_complete) {
		this.trade_complete = trade_complete;
	}

	public int getTrade_readcount() {
		return trade_readcount;
	}

	public void setTrade_readcount(int trade_readcount) {
		this.trade_readcount = trade_readcount;
	}

	public Date getTrade_writedate() {
		return trade_writedate;
	}

	public void setTrade_writedate(Date trade_writedate) {
		this.trade_writedate = trade_writedate;
	}

}
