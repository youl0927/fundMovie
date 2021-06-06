package com.bbq.fundmovie.vo;

import java.sql.Date;

public class AddFriendVo {
	private int friend_no;
    private int user_no;
    private int friend_user_no;
    private Date friend_regdate;
	
    public AddFriendVo() {
		super();
	}

	public AddFriendVo(int friend_no, int user_no, int friend_user_no, Date friend_regdate) {
		super();
		this.friend_no = friend_no;
		this.user_no = user_no;
		this.friend_user_no = friend_user_no;
		this.friend_regdate = friend_regdate;
	}

	public int getFriend_no() {
		return friend_no;
	}

	public void setFriend_no(int friend_no) {
		this.friend_no = friend_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getFriend_user_no() {
		return friend_user_no;
	}

	public void setFriend_user_no(int friend_user_no) {
		this.friend_user_no = friend_user_no;
	}

	public Date getFriend_regdate() {
		return friend_regdate;
	}

	public void setFriend_regdate(Date friend_regdate) {
		this.friend_regdate = friend_regdate;
	}
	    
	    
}
