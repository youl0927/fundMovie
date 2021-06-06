package com.bbq.fundmovie.vo;

import java.util.Date;

public class FundingUserListVo {
	
	private int funding_user_list_no;
	private int funding_open_no;
	private int funding_user_no;
	private int funding_user_point;
	private Date funding_date;
	
	public FundingUserListVo() {
		super();
	}

	public FundingUserListVo(int funding_user_list_no, int funding_open_no, int funding_user_no, int funding_user_point,
			Date funding_date) {
		super();
		this.funding_user_list_no = funding_user_list_no;
		this.funding_open_no = funding_open_no;
		this.funding_user_no = funding_user_no;
		this.funding_user_point = funding_user_point;
		this.funding_date = funding_date;
	}

	public int getFunding_user_list_no() {
		return funding_user_list_no;
	}

	public void setFunding_user_list_no(int funding_user_list_no) {
		this.funding_user_list_no = funding_user_list_no;
	}

	public int getFunding_open_no() {
		return funding_open_no;
	}

	public void setFunding_open_no(int funding_open_no) {
		this.funding_open_no = funding_open_no;
	}

	public int getFunding_user_no() {
		return funding_user_no;
	}

	public void setFunding_user_no(int funding_user_no) {
		this.funding_user_no = funding_user_no;
	}

	public int getFunding_user_point() {
		return funding_user_point;
	}

	public void setFunding_user_point(int funding_user_point) {
		this.funding_user_point = funding_user_point;
	}

	public Date getFunding_date() {
		return funding_date;
	}

	public void setFunding_date(Date funding_date) {
		this.funding_date = funding_date;
	}
	
}
