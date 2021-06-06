package com.bbq.fundmovie.vo;

public class QnaHeadlineVo {

	private int qna_headline_no;
	private String qna_headline;
	
	public QnaHeadlineVo() {
		super();
	}

	public QnaHeadlineVo(int qna_headline_no, String qna_headline) {
		super();
		this.qna_headline_no = qna_headline_no;
		this.qna_headline = qna_headline;
	}

	public int getQna_headline_no() {
		return qna_headline_no;
	}

	public void setQna_headline_no(int qna_headline_no) {
		this.qna_headline_no = qna_headline_no;
	}

	public String getQna_headline() {
		return qna_headline;
	}

	public void setQna_headline(String qna_headline) {
		this.qna_headline = qna_headline;
	}
	
}
