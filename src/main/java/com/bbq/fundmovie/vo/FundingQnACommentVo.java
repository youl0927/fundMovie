package com.bbq.fundmovie.vo;

import java.util.Date;

public class FundingQnACommentVo {
	
	private int funding_qna_comment_no;
	private int funding_qna_no;
	private int user_no;
	private String funding_qna_comment;
	private Date funding_qna_comment_writedate;
	
	public FundingQnACommentVo() {
		super();
	}

	public FundingQnACommentVo(int funding_qna_comment_no, int funding_qna_no, int user_no, String funding_qna_comment,
			Date funding_qna_comment_writedate) {
		super();
		this.funding_qna_comment_no = funding_qna_comment_no;
		this.funding_qna_no = funding_qna_no;
		this.user_no = user_no;
		this.funding_qna_comment = funding_qna_comment;
		this.funding_qna_comment_writedate = funding_qna_comment_writedate;
	}

	public int getFunding_qna_comment_no() {
		return funding_qna_comment_no;
	}

	public void setFunding_qna_comment_no(int funding_qna_comment_no) {
		this.funding_qna_comment_no = funding_qna_comment_no;
	}

	public int getFunding_qna_no() {
		return funding_qna_no;
	}

	public void setFunding_qna_no(int funding_qna_no) {
		this.funding_qna_no = funding_qna_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getFunding_qna_comment() {
		return funding_qna_comment;
	}

	public void setFunding_qna_comment(String funding_qna_comment) {
		this.funding_qna_comment = funding_qna_comment;
	}

	public Date getFunding_qna_comment_writedate() {
		return funding_qna_comment_writedate;
	}

	public void setFunding_qna_comment_writedate(Date funding_qna_comment_writedate) {
		this.funding_qna_comment_writedate = funding_qna_comment_writedate;
	}
	
}
