package com.bbq.fundmovie.vo;

import java.util.Date;

public class TradeCommentVo {

	private int trade_comment_no;
	private int trade_no;
	private int user_no;
	private String trade_comment;
	private Date trade_comment_writedate;
	
	public TradeCommentVo() {
		super();
	}

	public TradeCommentVo(int trade_comment_no, int trade_no, int user_no, String trade_comment,
			Date trade_comment_writedate) {
		super();
		this.trade_comment_no = trade_comment_no;
		this.trade_no = trade_no;
		this.user_no = user_no;
		this.trade_comment = trade_comment;
		this.trade_comment_writedate = trade_comment_writedate;
	}

	public int getTrade_comment_no() {
		return trade_comment_no;
	}

	public void setTrade_comment_no(int trade_comment_no) {
		this.trade_comment_no = trade_comment_no;
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

	public String getTrade_comment() {
		return trade_comment;
	}

	public void setTrade_comment(String trade_comment) {
		this.trade_comment = trade_comment;
	}

	public Date getTrade_comment_writedate() {
		return trade_comment_writedate;
	}

	public void setTrade_comment_writedate(Date trade_comment_writedate) {
		this.trade_comment_writedate = trade_comment_writedate;
	}

}
