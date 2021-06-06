package com.bbq.fundmovie.vo;

import java.util.Date;

public class FundingQnAVo {
	
	private int funding_qna_no;
    private int user_no;
    private int funding_open_no;
    private int funding_qna_category_no;
    private String funding_qna_title;
    private String funding_qna_content;
    private int funding_qna_readcount;
    private Date funding_qna_writedate;
	private String funding_qna_status;
    
    public FundingQnAVo() {
		super();
	}

	public FundingQnAVo(int funding_qna_no, int user_no, int funding_open_no, int funding_qna_category_no,
			String funding_qna_title, String funding_qna_content, int funding_qna_readcount,
			Date funding_qna_writedate, String funding_qna_status) {
		super();
		this.funding_qna_no = funding_qna_no;
		this.user_no = user_no;
		this.funding_open_no = funding_open_no;
		this.funding_qna_category_no = funding_qna_category_no;
		this.funding_qna_title = funding_qna_title;
		this.funding_qna_content = funding_qna_content;
		this.funding_qna_readcount = funding_qna_readcount;
		this.funding_qna_writedate = funding_qna_writedate;
		this.funding_qna_status = funding_qna_status;
	}

	public int getFunding_qna_no() {
		return funding_qna_no;
	}

	public void setFunding_qna_no(int funding_qna_no) {
		this.funding_qna_no = funding_qna_no;
	}

	public int getuser_no() {
		return user_no;
	}

	public void setuser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getFunding_open_no() {
		return funding_open_no;
	}

	public void setFunding_open_no(int funding_open_no) {
		this.funding_open_no = funding_open_no;
	}

	public int getFunding_qna_category_no() {
		return funding_qna_category_no;
	}

	public void setFunding_qna_category_no(int funding_qna_category_no) {
		this.funding_qna_category_no = funding_qna_category_no;
	}

	public String getFunding_qna_title() {
		return funding_qna_title;
	}

	public void setFunding_qna_title(String funding_qna_title) {
		this.funding_qna_title = funding_qna_title;
	}

	public String getFunding_qna_content() {
		return funding_qna_content;
	}

	public void setFunding_qna_content(String funding_qna_content) {
		this.funding_qna_content = funding_qna_content;
	}

	public int getFunding_qna_readcount() {
		return funding_qna_readcount;
	}

	public void setFunding_qna_readcount(int funding_qna_readcount) {
		this.funding_qna_readcount = funding_qna_readcount;
	}

	public Date getFunding_qna_writedate() {
		return funding_qna_writedate;
	}

	public void setFunding_qna_writedate(Date funding_qna_writedate) {
		this.funding_qna_writedate = funding_qna_writedate;
	}

	public String getfunding_qna_status() {
		return funding_qna_status;
	}

	public void setfunding_qna_status(String funding_qna_status) {
		this.funding_qna_status = funding_qna_status;
	}
    
    
	
}
