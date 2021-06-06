package com.bbq.fundmovie.vo;

import java.util.Date;

public class AuctionMyListVo {
	private int my_auction_no;
	private int auction_no;
	private Date add_date;
	
	public AuctionMyListVo() {
		super();
	}
	public AuctionMyListVo(int my_auction_no, int auction_no, Date add_date) {
		super();
		this.my_auction_no = my_auction_no;
		this.auction_no = auction_no;
		this.add_date = add_date;
	}
	public int getMy_auction_no() {
		return my_auction_no;
	}
	public void setMy_auction_no(int my_auction_no) {
		this.my_auction_no = my_auction_no;
	}
	public int getAuction_no() {
		return auction_no;
	}
	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}
	public Date getAdd_date() {
		return add_date;
	}
	public void setAdd_date(Date add_date) {
		this.add_date = add_date;
	}

	
	
	
}
