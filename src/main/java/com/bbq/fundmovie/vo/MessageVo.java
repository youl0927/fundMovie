package com.bbq.fundmovie.vo;

import java.sql.Date;

public class MessageVo {
    
    private int message_no;
    private int user_no;
    private int receiver_no;
    private String message_content;
    private Date opendate;
    private Date senddate;
	
    public MessageVo() {
		super();
	}

	public MessageVo(int message_no, int user_no, int receiver_no, String message_content, Date opendate,
			Date senddate) {
		super();
		this.message_no = message_no;
		this.user_no = user_no;
		this.receiver_no = receiver_no;
		this.message_content = message_content;
		this.opendate = opendate;
		this.senddate = senddate;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getReceiver_no() {
		return receiver_no;
	}

	public void setReceiver_no(int receiver_no) {
		this.receiver_no = receiver_no;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public Date getOpendate() {
		return opendate;
	}

	public void setOpendate(Date opendate) {
		this.opendate = opendate;
	}

	public Date getSenddate() {
		return senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

    
    
}
