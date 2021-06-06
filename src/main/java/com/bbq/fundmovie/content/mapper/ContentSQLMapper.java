package com.bbq.fundmovie.content.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.bbq.fundmovie.vo.QnaHeadlineVo;
import com.bbq.fundmovie.vo.QnaLikeVo;
import com.bbq.fundmovie.vo.QnaVo;


public interface ContentSQLMapper {

	//qna 글쓰기
	public void qnaInsert(QnaVo qv);
	
	//qna 클릭한 글 보기(no별로)
	public QnaVo qnaSelectByNo(int no);
	
	//qna headline 설정
	public QnaHeadlineVo qnaHeadlineSelect(int no);
	
	//qna 조회수 증가
	public void qnaIncreaseReadCount(int no);
	
	//qna 수정
	public void qnaUpdateContent(QnaVo qv);
	
	//qna 글삭제
	public void qnaDeleteContent(int no);		
	
	//qna 좋아요
	public void qnaLikeInsert(QnaLikeVo qlv);
	
	//qna 좋아요 중복확인
	public int qnaLikeCheck(QnaLikeVo qlv);
	
	//qna 좋아요 -1
	public void qnaLikeCancel(QnaLikeVo qlv);
	
	//qna 좋아요 페이지 갯수
	public int qnaLikePageCount(QnaLikeVo qlv);
	
	//qna 페이징 위치
	public int qnaGetPageCount();
	
	//qna 글 전체 출력 (10개 페이징..을 위한)
	public ArrayList<QnaVo> qnaPageSelectAll(int page_num);
	
}
