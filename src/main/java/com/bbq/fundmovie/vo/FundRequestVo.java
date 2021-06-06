package com.bbq.fundmovie.vo;

import java.util.Date;

public class FundRequestVo {
	
	private int funding_open_no;
    private int user_no;
    private Date funding_request_date;
	
    public FundRequestVo() {
		super();
	}

	public FundRequestVo(int funding_open_no, int user_no, Date funding_request_date) {
		super();
		this.funding_open_no = funding_open_no;
		this.user_no = user_no;
		this.funding_request_date = funding_request_date;
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

	public Date getFunding_request_date() {
		return funding_request_date;
	}

	public void setFunding_request_date(Date funding_request_date) {
		this.funding_request_date = funding_request_date;
	}
    
    
    
    
}
