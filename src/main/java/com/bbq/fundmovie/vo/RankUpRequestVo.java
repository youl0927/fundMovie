package com.bbq.fundmovie.vo;

import java.util.Date;

public class RankUpRequestVo {
	
	private int rank_up_request_no;
    private int user_no;
    private Date rank_up_request_date;
	
    public RankUpRequestVo() {
		super();
	}

	public RankUpRequestVo(int rank_up_request_no, int user_no, Date rank_up_request_date) {
		super();
		this.rank_up_request_no = rank_up_request_no;
		this.user_no = user_no;
		this.rank_up_request_date = rank_up_request_date;
	}

	public int getRank_up_request_no() {
		return rank_up_request_no;
	}

	public void setRank_up_request_no(int rank_up_request_no) {
		this.rank_up_request_no = rank_up_request_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public Date getRank_up_request_date() {
		return rank_up_request_date;
	}

	public void setRank_up_request_date(Date rank_up_request_date) {
		this.rank_up_request_date = rank_up_request_date;
	}
    
    
}
