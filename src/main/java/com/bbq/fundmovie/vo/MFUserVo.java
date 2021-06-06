package com.bbq.fundmovie.vo;

import java.util.Date;

public class MFUserVo {
	private int user_no;
	private int play_list_no;
	private int achivement_no;
	private String user_id;
	private String user_pw;
	private String user_nick;
	private String user_address;
	private String user_zipcode;
	private String user_email;
	private int user_rrn;
	private int accesstime;
	private int user_level;
	private int user_exp;
	private int user_point;
	private String user_account;
	private String user_author;
	private Date user_joindate;
	
	public MFUserVo() {
		super();
	}

	public MFUserVo(int user_no, int play_list_no, int achivement_no, String user_id, String user_pw, String user_nick,
					String user_address, String user_zipcode, String user_email, int user_rrn, int accesstime, int user_level,
					int user_exp, int user_point, String user_account, String user_author, Date user_joindate) {
		super();
		this.user_no = user_no;
		this.play_list_no = play_list_no;
		this.achivement_no = achivement_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_nick = user_nick;
		this.user_address = user_address;
		this.user_zipcode = user_zipcode;
		this.user_email = user_email;
		this.user_rrn = user_rrn;
		this.accesstime = accesstime;
		this.user_level = user_level;
		this.user_exp = user_exp;
		this.user_point = user_point;
		this.user_account = user_account;
		this.user_author = user_author;
		this.user_joindate = user_joindate;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getPlay_list_no() {
		return play_list_no;
	}

	public void setPlay_list_no(int play_list_no) {
		this.play_list_no = play_list_no;
	}

	public int getAchivement_no() {
		return achivement_no;
	}

	public void setAchivement_no(int achivement_no) {
		this.achivement_no = achivement_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_zipcode() {
		return user_zipcode;
	}

	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getUser_rrn() {
		return user_rrn;
	}

	public void setUser_rrn(int user_rrn) {
		this.user_rrn = user_rrn;
	}

	public int getAccesstime() {
		return accesstime;
	}

	public void setAccesstime(int accesstime) {
		this.accesstime = accesstime;
	}

	public int getUser_level() {
		return user_level;
	}

	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}

	public int getUser_exp() {
		return user_exp;
	}

	public void setUser_exp(int user_exp) {
		this.user_exp = user_exp;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	public String getUser_account() {
		return user_account;
	}

	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}

	public String getUser_author() {
		return user_author;
	}

	public void setUser_author(String user_author) {
		this.user_author = user_author;
	}

	public Date getUser_joindate() {
		return user_joindate;
	}

	public void setUser_joindate(Date user_joindate) {
		this.user_joindate = user_joindate;
	}

}


