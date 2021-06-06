package com.bbq.fundmovie.vo;

public class QnaLikeVo {
	private int qna_like_no;
	private int qna_no;
	private int user_no;
	
	public QnaLikeVo() {
		super();
	}

	public QnaLikeVo(int qna_like_no, int qna_no, int user_no) {
		super();
		this.qna_like_no = qna_like_no;
		this.qna_no = qna_no;
		this.user_no = user_no;
	}

	public int getQna_like_no() {
		return qna_like_no;
	}

	public void setQna_like_no(int qna_like_no) {
		this.qna_like_no = qna_like_no;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

}
