package com.bbq.fundmovie.vo;

import java.util.Date;

public class QnaVo {

	private int qna_no ;
	private int user_no;
	private int qna_headline_no;
	private String qna_title;
	private String qna_content;
	private int qna_readcount;
	private Date qna_writedate;
	private String qna_reply;
	
	public QnaVo() {
		super();
	}

	public QnaVo(int qna_no, int user_no, int qna_headline_no, String qna_title, String qna_content, int qna_readcount,
			Date qna_writedate, String qna_reply) {
		super();
		this.qna_no = qna_no;
		this.user_no = user_no;
		this.qna_headline_no = qna_headline_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_readcount = qna_readcount;
		this.qna_writedate = qna_writedate;
		this.qna_reply = qna_reply;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getQna_headline_no() {
		return qna_headline_no;
	}

	public void setQna_headline_no(int qna_headline_no) {
		this.qna_headline_no = qna_headline_no;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public int getQna_readcount() {
		return qna_readcount;
	}

	public void setQna_readcount(int qna_readcount) {
		this.qna_readcount = qna_readcount;
	}

	public Date getQna_writedate() {
		return qna_writedate;
	}

	public void setQna_writedate(Date qna_writedate) {
		this.qna_writedate = qna_writedate;
	}

	public String getQna_reply() {
		return qna_reply;
	}

	public void setQna_reply(String qna_reply) {
		this.qna_reply = qna_reply;
	}
	
}
