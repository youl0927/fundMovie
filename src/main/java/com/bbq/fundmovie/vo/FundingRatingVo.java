package com.bbq.fundmovie.vo;

public class FundingRatingVo {

	private int funding_rating_no;
	private int funding_open_no;
	private String funding_rating_name;
	
	public FundingRatingVo() {
		super();
	}

	public FundingRatingVo(int funding_rating_no, int funding_open_no, String funding_rating_name) {
		super();
		this.funding_rating_no = funding_rating_no;
		this.funding_open_no = funding_open_no;
		this.funding_rating_name = funding_rating_name;
	}

	public int getFunding_rating_no() {
		return funding_rating_no;
	}

	public void setFunding_rating_no(int funding_rating_no) {
		this.funding_rating_no = funding_rating_no;
	}

	public int getFunding_open_no() {
		return funding_open_no;
	}

	public void setFunding_open_no(int funding_open_no) {
		this.funding_open_no = funding_open_no;
	}

	public String getFunding_rating_name() {
		return funding_rating_name;
	}

	public void setFunding_rating_name(String funding_rating_name) {
		this.funding_rating_name = funding_rating_name;
	}

}
