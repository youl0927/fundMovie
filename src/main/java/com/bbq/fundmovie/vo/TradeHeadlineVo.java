package com.bbq.fundmovie.vo;

public class TradeHeadlineVo {

	private int trade_headline_no;
	private String trade_headline;
	
	public TradeHeadlineVo() {
		super();
	}

	public TradeHeadlineVo(int trade_headline_no, String trade_headline) {
		super();
		this.trade_headline_no = trade_headline_no;
		this.trade_headline = trade_headline;
	}

	public int getTrade_headline_no() {
		return trade_headline_no;
	}

	public void setTrade_headline_no(int trade_headline_no) {
		this.trade_headline_no = trade_headline_no;
	}

	public String getTrade_headline() {
		return trade_headline;
	}

	public void setTrade_headline(String trade_headline) {
		this.trade_headline = trade_headline;
	}
}
