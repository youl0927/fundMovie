package com.bbq.fundmovie.vo;

import java.sql.Date;

public class PointVo {

	private int point_no;
	private int user_no;
	private Date charge_pointdate;
	
	public PointVo() {
		super();
	}

	public PointVo(int point_no, int user_no, Date charge_pointdate) {
		super();
		this.point_no = point_no;
		this.user_no = user_no;
		this.charge_pointdate = charge_pointdate;
	}

	public int getPoint_no() {
		return point_no;
	}

	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public Date getCharge_pointdate() {
		return charge_pointdate;
	}

	public void setCharge_pointdate(Date charge_pointdate) {
		this.charge_pointdate = charge_pointdate;
	}
	
	
	
}
