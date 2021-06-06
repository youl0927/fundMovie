package com.bbq.fundmovie.vo;

public class FundingLikeVo {
	
	private int funding_like_no;
	private int funding_open_no;
	private int user_no;
	
	public FundingLikeVo() {
		super();
	}

	public FundingLikeVo(int funding_like_no, int funding_open_no, int user_no) {
		super();
		this.funding_like_no = funding_like_no;
		this.funding_open_no = funding_open_no;
		this.user_no = user_no;
	}

	public int getFunding_like_no() {
		return funding_like_no;
	}

	public void setFunding_like_no(int funding_like_no) {
		this.funding_like_no = funding_like_no;
	}

	public int getFunding_open_no() {
		return funding_open_no;
	}

	public void setFunding_open_no(int funding_open_no) {
		this.funding_open_no = funding_open_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
}
