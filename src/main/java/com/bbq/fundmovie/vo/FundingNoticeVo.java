package com.bbq.fundmovie.vo;

import java.util.Date;

public class FundingNoticeVo {
	
	private int funding_notice_no;
    private int funding_open_no;
    private int user_no;
    private String funding_notice_title;
    private String funding_notice_content;
    private Date funding_notice_writedate;
	
    public FundingNoticeVo() {
		super();
	}

	public FundingNoticeVo(int funding_notice_no, int funding_open_no, int user_no, String funding_notice_title,
			String funding_notice_content, Date funding_notice_writedate) {
		super();
		this.funding_notice_no = funding_notice_no;
		this.funding_open_no = funding_open_no;
		this.user_no = user_no;
		this.funding_notice_title = funding_notice_title;
		this.funding_notice_content = funding_notice_content;
		this.funding_notice_writedate = funding_notice_writedate;
	}

	public int getFunding_notice_no() {
		return funding_notice_no;
	}

	public void setFunding_notice_no(int funding_notice_no) {
		this.funding_notice_no = funding_notice_no;
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

	public String getFunding_notice_title() {
		return funding_notice_title;
	}

	public void setFunding_notice_title(String funding_notice_title) {
		this.funding_notice_title = funding_notice_title;
	}

	public String getFunding_notice_content() {
		return funding_notice_content;
	}

	public void setFunding_notice_content(String funding_notice_content) {
		this.funding_notice_content = funding_notice_content;
	}

	public Date getFunding_notice_writedate() {
		return funding_notice_writedate;
	}

	public void setFunding_notice_writedate(Date funding_notice_writedate) {
		this.funding_notice_writedate = funding_notice_writedate;
	}

}
