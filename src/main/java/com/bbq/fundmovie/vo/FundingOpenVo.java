package com.bbq.fundmovie.vo;

import java.util.Date;

public class FundingOpenVo {
		
		private int funding_open_no;
		private int user_no;
		private String funding_title;
		private String funding_rating;
		private Date funding_start;
		private Date funding_end;
		private Date release_date;
	    private int funding_target_point;
	    private int funding_min_point;
	    private int release_price;
	    private String funding_detail;
	    private String funding_thumb;
	    private String funding_status;
		private Date funding_open_date;
	    
	    public FundingOpenVo() {
			super();
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

		public String getFunding_title() {
			return funding_title;
		}

		public void setFunding_title(String funding_title) {
			this.funding_title = funding_title;
		}

		public String getFunding_rating() {
			return funding_rating;
		}

		public void setFunding_rating(String funding_rating) {
			this.funding_rating = funding_rating;
		}

		public Date getFunding_start() {
			return funding_start;
		}

		public void setFunding_start(Date funding_start) {
			this.funding_start = funding_start;
		}

		public Date getFunding_end() {
			return funding_end;
		}

		public void setFunding_end(Date funding_end) {
			this.funding_end = funding_end;
		}

		public Date getRelease_date() {
			return release_date;
		}

		public void setRelease_date(Date release_date) {
			this.release_date = release_date;
		}

		public int getFunding_target_point() {
			return funding_target_point;
		}

		public void setFunding_target_point(int funding_target_point) {
			this.funding_target_point = funding_target_point;
		}

		public int getFunding_min_point() {
			return funding_min_point;
		}

		public void setFunding_min_point(int funding_min_point) {
			this.funding_min_point = funding_min_point;
		}

		public int getRelease_price() {
			return release_price;
		}

		public void setRelease_price(int release_price) {
			this.release_price = release_price;
		}

		public String getFunding_detail() {
			return funding_detail;
		}

		public void setFunding_detail(String funding_detail) {
			this.funding_detail = funding_detail;
		}

		public String getFunding_thumb() {
			return funding_thumb;
		}

		public void setFunding_thumb(String funding_thumb) {
			this.funding_thumb = funding_thumb;
		}

		public String getFunding_status() {
			return funding_status;
		}

		public void setFunding_status(String funding_status) {
			this.funding_status = funding_status;
		}

		public Date getFunding_open_date() {
			return funding_open_date;
		}

		public void setFunding_open_date(Date funding_open_date) {
			this.funding_open_date = funding_open_date;
		}

}
