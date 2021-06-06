package com.bbq.fundmovie.vo;

import java.util.Date;

public class AuctionApplyListVo {
	private int auction_apply_no;
	private int auction_no;
	private int auction_user_no;
	private int call_price;
	private int total_call_price;
	private Date call_date;
	
	public AuctionApplyListVo() {
		super();
	}

	public AuctionApplyListVo(int auction_apply_no, int auction_no, int auction_user_no, int call_price,
			int total_call_price, Date call_date) {
		super();
		this.auction_apply_no = auction_apply_no;
		this.auction_no = auction_no;
		this.auction_user_no = auction_user_no;
		this.call_price = call_price;
		this.total_call_price = total_call_price;
		this.call_date = call_date;
	}

	public int getAuction_apply_no() {
		return auction_apply_no;
	}

	public void setAuction_apply_no(int auction_apply_no) {
		this.auction_apply_no = auction_apply_no;
	}

	public int getAuction_no() {
		return auction_no;
	}

	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}

	public int getAuction_user_no() {
		return auction_user_no;
	}

	public void setAuction_user_no(int auction_user_no) {
		this.auction_user_no = auction_user_no;
	}

	public int getCall_price() {
		return call_price;
	}

	public void setCall_price(int call_price) {
		this.call_price = call_price;
	}

	public int getTotal_call_price() {
		return total_call_price;
	}

	public void setTotal_call_price(int total_call_price) {
		this.total_call_price = total_call_price;
	}

	public Date getCall_date() {
		return call_date;
	}

	public void setCall_date(Date call_date) {
		this.call_date = call_date;
	}

	
	
	
	
}
