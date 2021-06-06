package com.bbq.fundmovie.vo;

public class TradeLikeVo {

	private int trade_like_no;
	private int trade_no;
	private int user_no;
	
	public TradeLikeVo() {
		super();
	}

	public TradeLikeVo(int trade_like_no, int trade_no, int user_no) {
		super();
		this.trade_like_no = trade_like_no;
		this.trade_no = trade_no;
		this.user_no = user_no;
	}

	public int getTrade_like_no() {
		return trade_like_no;
	}

	public void setTrade_like_no(int trade_like_no) {
		this.trade_like_no = trade_like_no;
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
}
