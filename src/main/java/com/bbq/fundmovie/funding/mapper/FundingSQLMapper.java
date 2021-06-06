package com.bbq.fundmovie.funding.mapper;

import java.util.ArrayList;

import com.bbq.fundmovie.vo.FundMovieCommentVo;
import com.bbq.fundmovie.vo.FundingCommunityVo;
import com.bbq.fundmovie.vo.FundingGenreVo;
import com.bbq.fundmovie.vo.FundingLikeVo;
import com.bbq.fundmovie.vo.FundingNoticeVo;
import com.bbq.fundmovie.vo.FundingOpenVo;
import com.bbq.fundmovie.vo.FundingQnACategoryVo;
import com.bbq.fundmovie.vo.FundingQnACommentVo;
import com.bbq.fundmovie.vo.FundingQnAVo;
import com.bbq.fundmovie.vo.FundingUserListVo;
import com.bbq.fundmovie.vo.UploadFundingResultVo;


public interface FundingSQLMapper {
	
	public int createKey();
	
	public void insert(FundingOpenVo vo);
	
	public ArrayList<FundingOpenVo> selectAllNow(int page_num);
	
	
	public ArrayList<FundingOpenVo> selectAllNow1();
	public ArrayList<FundingOpenVo> selectAllTobe(int page_num);
	
	public ArrayList<FundingOpenVo> selectByTitle(String search_word);

	public ArrayList<FundingOpenVo> selectByDetail(String search_word);
	
	public ArrayList<FundingOpenVo> selectByWriter(String search_word);
	
	public int getPageCount();
	
	public FundingOpenVo selectByFundingNo(int no);
	
	public void updateFundingGenreVo(FundingGenreVo genrevo);
	
	public void insertFundingGenre(FundingGenreVo vo);
	
	public ArrayList<FundingGenreVo> selectFundingGenreVoByFundingNo(int funding_open_no);
	
	public ArrayList<FundingUserListVo> selectFundingUserListByNo(int no);
	
	public ArrayList<FundingUserListVo> selectFundingUserListAll();
	
	public ArrayList<FundingUserListVo> selectAllFundingUserList();
	
	public FundingUserListVo selectFundingUserByNo(int no);
	
	public void insertFundingUserList(FundingUserListVo vo);
	
	public void updateFundingUserList(FundingUserListVo vo);
	
	public int countFundingUserByMyNo(FundingUserListVo vo);

	public FundingUserListVo selectFundingUserByMyNo(FundingUserListVo vo);
	
	public ArrayList<FundingOpenVo> selectByUserNo(int no);
	
	public FundingOpenVo selectFundingByFundingOpenNo(int no);
	
	public ArrayList<FundingUserListVo> selectUserByFundingOpenNo(int no);
	
	public void insertUploadMovie(UploadFundingResultVo vo);
	
	public int createUploadMovieKey();
	
	public ArrayList<UploadFundingResultVo> selectAllUploadMovie();
	
	public UploadFundingResultVo selectUploadFundingResultVoByNo(int no);

	public int getUploadMoviePageCount();
	
	public UploadFundingResultVo selectUploadFundingResultByFundingOpenNo(int no);
	
	public int checkFundingCount(FundingUserListVo vo);
	
	public int checkCount(FundingUserListVo vo);
	
	public Integer getFundingSumPoint(int funding_open_no);
	
	public int fundingSumPoint(int funding_open_no);
	
	public int getFundingUserCount(int funding_open_no);
	
	public int getFundingRemainDate(int no);
	
	public int fundingTarget(int funding_open_no);
	
	public int getFundingCountCommunityContent(int funding_open_no);
	
	public int getCountFundingNotice(int funding_open_no);
	
	public void fundingQnAInsert(FundingQnAVo vo);
	
	public ArrayList<FundingQnAVo> fundingQnASelectAll(int funding_open_no);
	
	public FundingQnAVo fundingQnASelectByQnANo(int no);
	
	public FundingQnAVo fundingQnASelectByFundingOpenNo(int no);
	
	public FundingQnACategoryVo fundingQnACategorySelectByCategoryNo(int no);
	
	public void fundingQnAUpdateContent(FundingQnAVo vo);
	
	public void fundingQnADeleteContent(int funding_qna_no);
	
	public void updateFundingQnAStatus(FundingQnAVo vo);
	
	public ArrayList<FundingNoticeVo> fundingNoticeSelectByFundingOpenNo(int funding_open_no);
	
	public FundingNoticeVo fundingNoticeSelectByNoticeNo(int funding_notice_no);
	
	public void fundingNoticeInsert(FundingNoticeVo vo);
	
	public void fundingNoticeUpdate(FundingNoticeVo vo);
	
	public void fundingNoticeDelete(int funding_notice_no);
	
	public ArrayList<FundingCommunityVo> fundingCommunitySelectByFundingOpenNo(int funding_open_no);
	
	public FundingQnACommentVo fundingQnACommentSelectByQnACommentNo(int funding_qna_comment_no);
	
	public FundingCommunityVo fundingCommunitySelectByCommnuityNo(int funding_community_no);
	
	public void fundingCommunityInsert(FundingCommunityVo vo);
	
	public void fundingCommunityUpdate(FundingCommunityVo vo);
	
	public void fundingCommunityDelete(int no);
	
	public ArrayList<FundingQnACommentVo> fundingQnACommentSelectByNo(int funding_qna_no);
	
	public void fundingQnACommentInsert(FundingQnACommentVo vo);
	
	public void fundingQnACommentUpdate(FundingQnACommentVo vo);
	
	public void fundingQnACommentDelete(int no);
	
	public ArrayList<FundMovieCommentVo> fundmovieCommentSelectByNo(int funding_open_no);
	
	public void fundMovieCommentInsert(FundMovieCommentVo vo);
	
	public void fundMovieCommentUpdate(FundMovieCommentVo vo);
	
	public void fundMovieCommentDelete(FundMovieCommentVo vo);
	
	public int createFundingQnAKey();
	
	public void fundingQnAIncreaseReadCount(int no);
	
	public void fundingLikeInsert(FundingLikeVo vo);
	
	public void fundingLikeCancel(FundingLikeVo vo);
	
	public int fundingLikeCheck(FundingLikeVo vo);
	
	public int fundingLikeCount(FundingLikeVo vo);
	
	public ArrayList<FundingLikeVo> fundingLikeSelectByUserNo(int user_no);
	
	
}
