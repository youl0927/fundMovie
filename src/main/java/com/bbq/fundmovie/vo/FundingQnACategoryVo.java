package com.bbq.fundmovie.vo;

public class FundingQnACategoryVo {

	private int funding_qna_category_no;
	private String funding_qna_category;
	
	public FundingQnACategoryVo() {
		super();
	}

	public FundingQnACategoryVo(int funding_qna_category_no, String funding_qna_category) {
		super();
		this.funding_qna_category_no = funding_qna_category_no;
		this.funding_qna_category = funding_qna_category;
	}

	public int getFunding_qna_category_no() {
		return funding_qna_category_no;
	}

	public void setFunding_qna_category_no(int funding_qna_category_no) {
		this.funding_qna_category_no = funding_qna_category_no;
	}

	public String getFunding_qna_category() {
		return funding_qna_category;
	}

	public void setFunding_qna_category(String funding_qna_category) {
		this.funding_qna_category = funding_qna_category;
	}
	
	
}
