package com.bbq.fundmovie.vo;

public class TradeImageVo {

	private int trade_image_no;
	private int trade_no;
	private String trade_image_link;
	
	public TradeImageVo() {
		super();
	}

	public TradeImageVo(int trade_image_no, int trade_no, String trade_image_link) {
		super();
		this.trade_image_no = trade_image_no;
		this.trade_no = trade_no;
		this.trade_image_link = trade_image_link;
	}

	public int getTrade_image_no() {
		return trade_image_no;
	}

	public void setTrade_image_no(int trade_image_no) {
		this.trade_image_no = trade_image_no;
	}

	public int getTrade_no() {
		return trade_no;
	}

	public void setTrade_no(int trade_no) {
		this.trade_no = trade_no;
	}

	public String getTrade_image_link() {
		return trade_image_link;
	}

	public void setTrade_image_link(String trade_image_link) {
		this.trade_image_link = trade_image_link;
	}
}
