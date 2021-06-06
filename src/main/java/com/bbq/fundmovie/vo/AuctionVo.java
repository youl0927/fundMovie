package com.bbq.fundmovie.vo;

import java.util.Date;

public class AuctionVo {
	private int auction_no;
	private int user_no;
	private String auction_title;
	private int current_price;
	private int estimate_price;
	private Date opening_date;
	private Date closing_date;
	private String auction_detail;
	private String maker;
	private String production_date;
	private Date auction_date;
	private String auction_status;

	
	public AuctionVo() {
		super();
	}


	public AuctionVo(int auction_no, int user_no, String auction_title, int current_price, int estimate_price,
			Date opening_date, Date closing_date, String auction_detail, String maker, String production_date,
			Date auction_date, String auction_status) {
		super();
		this.auction_no = auction_no;
		this.user_no = user_no;
		this.auction_title = auction_title;
		this.current_price = current_price;
		this.estimate_price = estimate_price;
		this.opening_date = opening_date;
		this.closing_date = closing_date;
		this.auction_detail = auction_detail;
		this.maker = maker;
		this.production_date = production_date;
		this.auction_date = auction_date;
		this.auction_status = auction_status;
	}


	public int getAuction_no() {
		return auction_no;
	}


	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public String getAuction_title() {
		return auction_title;
	}


	public void setAuction_title(String auction_title) {
		this.auction_title = auction_title;
	}


	public int getCurrent_price() {
		return current_price;
	}


	public void setCurrent_price(int current_price) {
		this.current_price = current_price;
	}


	public int getEstimate_price() {
		return estimate_price;
	}


	public void setEstimate_price(int estimate_price) {
		this.estimate_price = estimate_price;
	}


	public Date getOpening_date() {
		return opening_date;
	}


	public void setOpening_date(Date opening_date) {
		this.opening_date = opening_date;
	}


	public Date getClosing_date() {
		return closing_date;
	}


	public void setClosing_date(Date closing_date) {
		this.closing_date = closing_date;
	}


	public String getAuction_detail() {
		return auction_detail;
	}


	public void setAuction_detail(String auction_detail) {
		this.auction_detail = auction_detail;
	}


	public String getMaker() {
		return maker;
	}


	public void setMaker(String maker) {
		this.maker = maker;
	}


	public String getProduction_date() {
		return production_date;
	}


	public void setProduction_date(String production_date) {
		this.production_date = production_date;
	}


	public Date getAuction_date() {
		return auction_date;
	}


	public void setAuction_date(Date auction_date) {
		this.auction_date = auction_date;
	}


	public String getAuction_status() {
		return auction_status;
	}


	public void setAuction_status(String auction_status) {
		this.auction_status = auction_status;
	}


	
}
