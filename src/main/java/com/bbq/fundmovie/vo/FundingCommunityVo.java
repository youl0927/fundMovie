package com.bbq.fundmovie.vo;

import java.util.Date;

public class FundingCommunityVo {
	
	private int funding_community_no;
    private int funding_open_no;
    private int funding_user_no;
    private String funding_community_content;
    private Date funding_community_writedate;
	
    public FundingCommunityVo() {
		super();
	}

	public FundingCommunityVo(int funding_community_no, int funding_open_no, int funding_user_no,
			String funding_community_content, Date funding_community_writedate) {
		super();
		this.funding_community_no = funding_community_no;
		this.funding_open_no = funding_open_no;
		this.funding_user_no = funding_user_no;
		this.funding_community_content = funding_community_content;
		this.funding_community_writedate = funding_community_writedate;
	}

	public int getFunding_community_no() {
		return funding_community_no;
	}

	public void setFunding_community_no(int funding_community_no) {
		this.funding_community_no = funding_community_no;
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

	public String getFunding_community_content() {
		return funding_community_content;
	}

	public void setFunding_community_content(String funding_community_content) {
		this.funding_community_content = funding_community_content;
	}

	public Date getFunding_community_writedate() {
		return funding_community_writedate;
	}

	public void setFunding_community_writedate(Date funding_community_writedate) {
		this.funding_community_writedate = funding_community_writedate;
	}
	
}
