package com.bbq.fundmovie.vo;

import java.util.Date;

public class UploadFundingResultVo {
	
	private int upload_funding_result_no;
	private int funding_open_no;
	private int  upload_funding_user_no;
	private String upload_funding_movie_link;
	private Date upload_funding_result_date;
	
	public UploadFundingResultVo() {
		super();
	}

	public UploadFundingResultVo(int upload_funding_result_no, int funding_open_no, int upload_funding_user_no,
			String upload_funding_movie_link, Date upload_funding_result_date) {
		super();
		this.upload_funding_result_no = upload_funding_result_no;
		this.funding_open_no = funding_open_no;
		this.upload_funding_user_no = upload_funding_user_no;
		this.upload_funding_movie_link = upload_funding_movie_link;
		this.upload_funding_result_date = upload_funding_result_date;
	}

	public int getUpload_funding_result_no() {
		return upload_funding_result_no;
	}

	public void setUpload_funding_result_no(int upload_funding_result_no) {
		this.upload_funding_result_no = upload_funding_result_no;
	}

	public int getFunding_open_no() {
		return funding_open_no;
	}

	public void setFunding_open_no(int funding_open_no) {
		this.funding_open_no = funding_open_no;
	}

	public int getUpload_funding_user_no() {
		return upload_funding_user_no;
	}

	public void setUpload_funding_user_no(int upload_funding_user_no) {
		this.upload_funding_user_no = upload_funding_user_no;
	}

	public String getUpload_funding_movie_link() {
		return upload_funding_movie_link;
	}

	public void setUpload_funding_movie_link(String upload_funding_movie_link) {
		this.upload_funding_movie_link = upload_funding_movie_link;
	}

	public Date getUpload_funding_result_date() {
		return upload_funding_result_date;
	}

	public void setUpload_funding_result_date(Date upload_funding_result_date) {
		this.upload_funding_result_date = upload_funding_result_date;
	}

	
}
