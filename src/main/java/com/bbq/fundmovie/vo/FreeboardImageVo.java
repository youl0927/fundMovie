package com.bbq.fundmovie.vo;

public class FreeboardImageVo {
	private int image_no;
	private int freeboard_no;
	private String image_link;
	public FreeboardImageVo() {
		super();
	}
	public FreeboardImageVo(int image_no, int freeboard_no, String image_link) {
		super();
		this.image_no = image_no;
		this.freeboard_no = freeboard_no;
		this.image_link = image_link;
	}
	public int getImage_no() {
		return image_no;
	}
	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}
	public int getFreeboard_no() {
		return freeboard_no;
	}
	public void setFreeboard_no(int freeboard_no) {
		this.freeboard_no = freeboard_no;
	}
	public String getImage_link() {
		return image_link;
	}
	public void setImage_link(String image_link) {
		this.image_link = image_link;
	}
	
	
}
