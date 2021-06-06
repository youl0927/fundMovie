package com.bbq.fundmovie.admin.mapper;

import java.util.ArrayList;

import com.bbq.fundmovie.vo.ContentVo;
import com.bbq.fundmovie.vo.FundingOpenVo;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.MovieGenreVo;
import com.bbq.fundmovie.vo.QnaHeadlineVo;
import com.bbq.fundmovie.vo.QnaVo;

public interface AdminSQLMapper {
	
		public int createKey(); //seq.nextval
	
		//영화 등록
		public void addMovieInform(ContentVo vo);
					
		//genre....
		public void insertGenre(MovieGenreVo vo);	

		//전체 출력..
		public ArrayList<ContentVo> selectAll(int page_num);
		
		public ArrayList<String> selectGenre(int movie_no);

		
		//제목 검색...
		public ArrayList<ContentVo> selectByTitle(String search_word);
		
		//내용 검색
		public ArrayList<ContentVo> selectByContent(String search_word);
		
		//작성자 검색
		public ArrayList<ContentVo> selectByWriter(String search_word);
		
		//등급 업
		public void updateRank(int user_no);
		
		//펀딩 조건
		public ArrayList<FundingOpenVo> selectSatisiedFunding();
		
		//펀딩 승인
		public void updateFundingStatusApproved(int funding_open_no);
		
		public void updateFundingStatusComplete(int funding_open_no);
		
		public void updateFundingStatusUploaded(int funding_open_no);
				
		//글보기...
		public ContentVo selectByNo(int no);
		//글 삭제
		public void deleteByNo(int movie_no);
		//글 수정
		public void update(ContentVo vo);
		
		//페이지 개수
		public int getPageCount();
		
		//qna
		
		//qna 전체 출력  메인화면
		public ArrayList<QnaVo> qnaSelectAll();
		
		//qna 상세보기
		public QnaVo qnaSelectByNo(int no);
		
		//qna 헤드라인보기..?!
		public QnaHeadlineVo qnaHeadlineSelect(int no);
		
		//qna 리플달기
		public void qnaAdminReply(QnaVo qv);
				
		//qna 페이징 위치
		public int qnaGetPageCount();
		
		//qna 글 전체 출력 (10개 페이징..을 위한)
		public ArrayList<QnaVo> qnaPageSelectAll(int page_num);
}
