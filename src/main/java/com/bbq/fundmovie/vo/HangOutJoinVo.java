package com.bbq.fundmovie.vo;

public class HangOutJoinVo {
	
	private int hangout_join_no;
	private int hangout_movie_no;
	private int hangout_member_no;
	
	public HangOutJoinVo() {
		super();
	}
	public HangOutJoinVo(int hangout_join_no, int hangout_movie_no, int hangout_member_no) {
		super();
		this.hangout_join_no = hangout_join_no;
		this.hangout_movie_no = hangout_movie_no;
		this.hangout_member_no = hangout_member_no;
	}
	public int getHangout_join_no() {
		return hangout_join_no;
	}
	public void setHangout_join_no(int hangout_join_no) {
		this.hangout_join_no = hangout_join_no;
	}
	public int getHangout_movie_no() {
		return hangout_movie_no;
	}
	public void setHangout_movie_no(int hangout_movie_no) {
		this.hangout_movie_no = hangout_movie_no;
	}
	public int getHangout_member_no() {
		return hangout_member_no;
	}
	public void setHangout_member_no(int hangout_member_no) {
		this.hangout_member_no = hangout_member_no;
	}
	
	
}
