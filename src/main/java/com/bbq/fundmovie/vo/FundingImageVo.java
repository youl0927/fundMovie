package com.bbq.fundmovie.vo;

public class FundingImageVo {
	
	private int funding_image_no;
	private int funding_open_no;
	private String funding_image_link;
	
	public FundingImageVo() {
		super();
	}

	public FundingImageVo(int funding_image_no, int funding_open_no, String funding_image_link) {
		super();
		this.funding_image_no = funding_image_no;
		this.funding_open_no = funding_open_no;
		this.funding_image_link = funding_image_link;
	}

	public int getFunding_image_no() {
		return funding_image_no;
	}

	public void setFunding_image_no(int funding_image_no) {
		this.funding_image_no = funding_image_no;
	}

	public int getFunding_open_no() {
		return funding_open_no;
	}

	public void setFunding_open_no(int funding_open_no) {
		this.funding_open_no = funding_open_no;
	}

	public String getFunding_image_link() {
		return funding_image_link;
	}

	public void setFunding_image_link(String funding_image_link) {
		this.funding_image_link = funding_image_link;
	}
	
}
