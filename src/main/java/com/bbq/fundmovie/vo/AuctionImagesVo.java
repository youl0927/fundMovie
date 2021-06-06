package com.bbq.fundmovie.vo;

import java.util.Date;

public class AuctionImagesVo {
	private int auction_images_no;
	private int auction_no;
	private String auction_main_img;
	private Date auction_img_date;
	
	public AuctionImagesVo() {
		super();
	}

	public AuctionImagesVo(int auction_images_no, int auction_no, String auction_main_img, Date auction_img_date) {
		super();
		this.auction_images_no = auction_images_no;
		this.auction_no = auction_no;
		this.auction_main_img = auction_main_img;
		this.auction_img_date = auction_img_date;
	}

	public int getAuction_images_no() {
		return auction_images_no;
	}

	public void setAuction_images_no(int auction_images_no) {
		this.auction_images_no = auction_images_no;
	}

	public int getAuction_no() {
		return auction_no;
	}

	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}

	public String getAuction_main_img() {
		return auction_main_img;
	}

	public void setAuction_main_img(String auction_main_img) {
		this.auction_main_img = auction_main_img;
	}

	public Date getAuction_img_date() {
		return auction_img_date;
	}

	public void setAuction_img_date(Date auction_img_date) {
		this.auction_img_date = auction_img_date;
	}

	
	
}
