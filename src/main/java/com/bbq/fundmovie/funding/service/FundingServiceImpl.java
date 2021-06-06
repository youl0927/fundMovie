package com.bbq.fundmovie.funding.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbq.fundmovie.funding.mapper.FundingImageSQLMapper;
import com.bbq.fundmovie.funding.mapper.FundingSQLMapper;
import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.vo.FundMovieCommentVo;
import com.bbq.fundmovie.vo.FundingCommunityVo;
import com.bbq.fundmovie.vo.FundingGenreVo;
import com.bbq.fundmovie.vo.FundingImageVo;
import com.bbq.fundmovie.vo.FundingLikeVo;
import com.bbq.fundmovie.vo.FundingNoticeVo;
import com.bbq.fundmovie.vo.FundingOpenVo;
import com.bbq.fundmovie.vo.FundingQnACategoryVo;
import com.bbq.fundmovie.vo.FundingQnACommentVo;
import com.bbq.fundmovie.vo.FundingQnAVo;
import com.bbq.fundmovie.vo.FundingUserListVo;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.UploadFundingResultVo;

@Service
public class FundingServiceImpl {
	
	@Autowired
	private FundingSQLMapper fundingSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private FundingImageSQLMapper fundingImageSQLMapper;
	
	public void createFunding(FundingOpenVo vo, ArrayList<FundingImageVo> fundingImagesVoList, int [] genre_no) {
		
		int fundingPk = fundingSQLMapper.createKey();
		vo.setFunding_open_no(fundingPk);
		fundingSQLMapper.insert(vo);
		
		for(FundingImageVo imageVo : fundingImagesVoList) {
			imageVo.setFunding_open_no(fundingPk);
		
			fundingImageSQLMapper.insert(imageVo);
		}
		
		
		if(genre_no != null) {
			for(int funding_genre : genre_no) {
				
				FundingGenreVo fundingGenreVo = new FundingGenreVo();
				fundingGenreVo.setGenre_no(funding_genre);
				fundingGenreVo.setFunding_open_no(fundingPk);
				fundingSQLMapper.insertFundingGenre(fundingGenreVo);
			}
		}	
	}
	
	
	public ArrayList<HashMap<String, Object>> getfundingList(String search_word , String search_type ,int page_num){
		
		ArrayList<HashMap<String, Object>> resultList =	new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<FundingOpenVo> fundingList = null;
		
		if(search_word == null || search_type == null) {
			fundingList = fundingSQLMapper.selectAllNow(page_num);
		}else {
			if(search_type.equals("title")) {
				fundingList = fundingSQLMapper.selectByTitle(search_word);
			}else if(search_type.equals("detail")) {
				fundingList = fundingSQLMapper.selectByDetail(search_word);
			}else if(search_type.equals("writer")) {
				fundingList = fundingSQLMapper.selectByWriter(search_word);
			}else {
				fundingList = fundingSQLMapper.selectAllNow(page_num);
			}
		}
		
		
		for(FundingOpenVo fundingVo : fundingList) {
			
			int user_no = fundingVo.getUser_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			
			int target_point = fundingVo.getFunding_target_point();
			
			
			int total_check = fundingSQLMapper.getFundingUserCount(fundingVo.getFunding_open_no());
			
			double total_point = 1;
			
			if(total_check != 0) {
				
				total_point = fundingSQLMapper.fundingSumPoint(fundingVo.getFunding_open_no());

			}
				
			double result =  total_point  / target_point * 100 ;
			double result_remain1 = result*10 ;
			double result_remain2 = result_remain1%1 ;
			result = (result_remain1-result_remain2)/10;

			if(result > 100) {
				result = 100;
			}
			
			System.out.println("percent : " + result);
					
					
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			map.put("fundingVo", fundingVo);
			map.put("percent", result);

			resultList.add(map);
		}
		
		return resultList;
	}
	
	
public ArrayList<HashMap<String, Object>> getfundingList1(){
		
		ArrayList<HashMap<String, Object>> resultList =	new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<FundingOpenVo> fundingList = fundingSQLMapper.selectAllNow1();
		
		
		for(FundingOpenVo fundingVo : fundingList) {
			
			int user_no = fundingVo.getUser_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			
			int target_point = fundingVo.getFunding_target_point();
			
			
			int total_check = fundingSQLMapper.getFundingUserCount(fundingVo.getFunding_open_no());
			
			double total_point = 1;
			
			if(total_check != 0) {
				
				total_point = fundingSQLMapper.fundingSumPoint(fundingVo.getFunding_open_no());

			}
				
			double result =  total_point  / target_point * 100 ;
			double result_remain1 = result*10 ;
			double result_remain2 = result_remain1%1 ;
			result = (result_remain1-result_remain2)/10;

			if(result > 100) {
				result = 100;
			}
			
			System.out.println("percent : " + result);
					
					
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			map.put("fundingVo", fundingVo);
			map.put("percent", result);

			resultList.add(map);
		}
		
		return resultList;
	}
	
	public ArrayList<HashMap<String, Object>> getTobefundingList(String search_word , String search_type ,int page_num){
		
		ArrayList<HashMap<String, Object>> resultList =	new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<FundingOpenVo> fundingList = null;
		
		if(search_word == null || search_type == null) {
			fundingList = fundingSQLMapper.selectAllTobe(page_num);
		}else {
			if(search_type.equals("title")) {
				fundingList = fundingSQLMapper.selectByTitle(search_word);
			}else if(search_type.equals("detail")) {
				fundingList = fundingSQLMapper.selectByDetail(search_word);
			}else if(search_type.equals("writer")) {
				fundingList = fundingSQLMapper.selectByWriter(search_word);
			}else {
				fundingList = fundingSQLMapper.selectAllTobe(page_num);
			}
		}
		
		
		for(FundingOpenVo fundingVo : fundingList) {
			
			int user_no = fundingVo.getUser_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			map.put("fundingVo", fundingVo);
			
			resultList.add(map);
		}
		
		return resultList;
	}
	
	public ArrayList<FundingOpenVo> myFundingStatus(int no){
		
		ArrayList<FundingOpenVo> resultList = new ArrayList<FundingOpenVo>();
		resultList = fundingSQLMapper.selectByUserNo(no);
		
		return resultList;
	}
	
	public ArrayList<HashMap<String, Object>> getFundingDetail(int no){
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		ArrayList<FundingUserListVo> fundingUserList = new ArrayList<FundingUserListVo>();
		
		
		FundingOpenVo fundingOpenVo = fundingSQLMapper.selectFundingByFundingOpenNo(no);
			
		fundingUserList = fundingSQLMapper.selectUserByFundingOpenNo(no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("fundingUserList", fundingUserList);
		map.put("fundingOpenVo", fundingOpenVo);
		
		resultList.add(map);
		
		return resultList;
	}
	
	public HashMap<String,Object> getfunding(int fundingOpenNo){

		FundingOpenVo fundingVo = fundingSQLMapper.selectByFundingNo(fundingOpenNo);
		int user_no = fundingVo.getUser_no();
		
		MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
		
		ArrayList<FundingImageVo> fundingImageVoList = fundingImageSQLMapper.selectFundingImagesByFundingNo(fundingOpenNo);
		
		ArrayList<FundingGenreVo> fundingGenreVoList = fundingSQLMapper.selectFundingGenreVoByFundingNo(fundingOpenNo);
		
		String str = fundingVo.getFunding_detail();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		fundingVo.setFunding_detail(str);
		
		HashMap<String,Object> map = new HashMap<String,Object>(); 
		map.put("memberVo", memberVo);
		map.put("fundingVo", fundingVo);
		map.put("fundingImageVoList", fundingImageVoList);
		map.put("fundingGenreVoList", fundingGenreVoList);
		
		return map;
	}
	
	
	
	public FundingOpenVo getfundingOpenVo(int fundingOpenNo){
		
		return fundingSQLMapper.selectByFundingNo(fundingOpenNo);
		
	}
	
	public Integer getFundingSumPoint(int fundingOpenNo) {
		return fundingSQLMapper.getFundingSumPoint(fundingOpenNo);
	}
	
	public int fundingSumPoint(int fundingOpenNo) {
		return fundingSQLMapper.fundingSumPoint(fundingOpenNo);
	}
	
	public int checkFundingCount(FundingUserListVo vo) {
		
		int fundingUserCount = fundingSQLMapper.checkFundingCount(vo);
		
		return fundingUserCount;
		
	}
	
	public Integer getFundingUserCount(int fundingOpenNo) {
		
		return fundingSQLMapper.getFundingUserCount(fundingOpenNo);
		
	}
	
	public int getcheckCount(int fundingOpenNo) {
		
		return fundingSQLMapper.getFundingUserCount(fundingOpenNo);
		
	}
	
	public int getPageCount() {
		return fundingSQLMapper.getPageCount();
	}
	
	public int getFundingTarget(int fundingOpenNo) {
		return fundingSQLMapper.fundingTarget(fundingOpenNo);
	}
	
	public Integer getFundingSumCommunityContent(int fundingOpenNo) {
		return fundingSQLMapper.getFundingCountCommunityContent(fundingOpenNo);
	}
	
	public Integer getCountFundingNotice(int fundingOpenNo) {
		return fundingSQLMapper.getCountFundingNotice(fundingOpenNo);
	}
	
	public int getFundingRemainDate(int fundingOpenNo) {
		return fundingSQLMapper.getFundingRemainDate(fundingOpenNo);
	}
	
	public ArrayList<HashMap<String, Object>> getFundingLikeList(int memberNo){
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<FundingLikeVo> fundingLikeVoList = fundingSQLMapper.fundingLikeSelectByUserNo(memberNo);
		
		for(FundingLikeVo fundingLikeVo : fundingLikeVoList) {
			
			FundingOpenVo fundingOpenVo = fundingSQLMapper.selectByFundingNo(fundingLikeVo.getFunding_open_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("fundingOpenVo", fundingOpenVo);
			map.put("fundingLikeVo", fundingLikeVo);
		
			resultList.add(map);
		}
		
		return resultList;
	}
	
	public void insertFundingLike(FundingLikeVo vo) {
		fundingSQLMapper.fundingLikeInsert(vo);
	}
	
	public void cancelFundingLike(FundingLikeVo vo) {
		fundingSQLMapper.fundingLikeCancel(vo);
	}
	
	public int CheckFundingLike(FundingLikeVo vo) {
		
		int fundingLikeCheckCount = fundingSQLMapper.fundingLikeCheck(vo);
		
		return fundingLikeCheckCount;
	}
	
	public int getFundingLikeCount(FundingLikeVo vo) {
		
		int likePageCount = fundingSQLMapper.fundingLikeCount(vo);
		
		return likePageCount;
	}
	
	public ArrayList<FundingUserListVo> getfundingUserListVo(int fundingOpenNo){
		
		ArrayList<FundingUserListVo> resultList = new ArrayList<FundingUserListVo>();
		
		resultList = fundingSQLMapper.selectFundingUserListByNo(fundingOpenNo);
		
		return resultList;
	}
	
	public void insertFundingList(FundingUserListVo vo) {
		
		fundingSQLMapper.insertFundingUserList(vo);
		
	}
	
	public void updateFundingList(FundingUserListVo vo){
		
		fundingSQLMapper.updateFundingUserList(vo);
		
	}
	
	public void insertUploadMovie(UploadFundingResultVo vo) {
		
		int uploadFundinMoviePk = fundingSQLMapper.createUploadMovieKey();
		vo.setUpload_funding_result_no(uploadFundinMoviePk);
		
		fundingSQLMapper.insertUploadMovie(vo);
	}
	
	public int getUploadMoviePageCount() {
		return fundingSQLMapper.getUploadMoviePageCount();
	}
	
	public ArrayList<HashMap<String, Object>> getuploadMovieList(){
		
		ArrayList<HashMap<String, Object>> resultList =	new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<UploadFundingResultVo> uploadFundingMovieList = fundingSQLMapper.selectAllUploadMovie();
		
		for(UploadFundingResultVo uploadFundingMovieVo : uploadFundingMovieList) {
			
			int user_no = uploadFundingMovieVo.getUpload_funding_user_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			
			int funding_open_no = uploadFundingMovieVo.getFunding_open_no();
			FundingOpenVo fundingOpenVo = fundingSQLMapper.selectFundingByFundingOpenNo(funding_open_no);
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			map.put("fundingOpenVo", fundingOpenVo);
			map.put("uploadFundingMovieVo", uploadFundingMovieVo);
			
			resultList.add(map);
		}
		
		return resultList;
	}
	
	public HashMap<String,Object> getUploadFundingMovie(FundingUserListVo fundingMyListVo){

		int fundingOpenNo = fundingMyListVo.getFunding_open_no();
		
		UploadFundingResultVo uploadFundingResultVo = fundingSQLMapper.selectUploadFundingResultByFundingOpenNo(fundingOpenNo);
		int user_no = uploadFundingResultVo.getUpload_funding_user_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
		
		FundingOpenVo fundingOpenVo = fundingSQLMapper.selectFundingByFundingOpenNo(fundingOpenNo);
		
		int countMyListVo = fundingSQLMapper.countFundingUserByMyNo(fundingMyListVo);
		
		FundingUserListVo fundingUserListVo = new FundingUserListVo(); 
		if(countMyListVo != 0) {
			fundingUserListVo = fundingSQLMapper.selectFundingUserByMyNo(fundingMyListVo);
		}

		ArrayList<FundingImageVo> fundingImageVoList = fundingImageSQLMapper.selectFundingImagesByFundingNo(fundingOpenNo);

		HashMap<String,Object> map = new HashMap<String,Object>(); 
		map.put("memberVo", memberVo);
		map.put("fundingOpenVo", fundingOpenVo);
		map.put("uploadFundingResultVo", uploadFundingResultVo);
		map.put("fundingImageVoList", fundingImageVoList);
		map.put("fundingUserListVo", fundingUserListVo);
		
		return map;
	}
	
	public HashMap<String, Object> watchUploadFundingMovie(int fundingOpenNo){
		
		UploadFundingResultVo uploadFundingResultVo = fundingSQLMapper.selectUploadFundingResultByFundingOpenNo(fundingOpenNo);
		FundingOpenVo fundingOpenVo = fundingSQLMapper.selectFundingByFundingOpenNo(fundingOpenNo);
		int user_no = uploadFundingResultVo.getUpload_funding_user_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
		
		HashMap<String,Object> map = new HashMap<String,Object>(); 
		map.put("memberVo", memberVo);
		map.put("fundingOpenVo", fundingOpenVo);
		map.put("uploadFundingResultVo", uploadFundingResultVo);
		
		return map;
	}
	
	public void insertFundingQnA(FundingQnAVo vo) {
		
		int fundingQnAPk = fundingSQLMapper.createFundingQnAKey();
		vo.setFunding_qna_no(fundingQnAPk);
		
		fundingSQLMapper.fundingQnAInsert(vo);
	
	}
	
	public ArrayList<HashMap<String,Object>> getUploadFundingMovie1(int fundingOpenNo){
		
		ArrayList<HashMap<String, Object>> resultList =	new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<FundingUserListVo> fundingUserList = fundingSQLMapper.selectFundingUserListByNo(fundingOpenNo);
		
		
		for(FundingUserListVo fundingUserListVo : fundingUserList) {
			
			int user_no = fundingUserListVo.getFunding_user_no();
			int funding_open_no = fundingUserListVo.getFunding_open_no();
			
			FundingOpenVo fundingOpenVo = fundingSQLMapper.selectFundingByFundingOpenNo(funding_open_no);
			
			System.out.println(fundingOpenVo);
			
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			UploadFundingResultVo uploadFundingResultVo = fundingSQLMapper.selectUploadFundingResultByFundingOpenNo(funding_open_no);			
			ArrayList<FundingImageVo> fundingImageVoList = fundingImageSQLMapper.selectFundingImagesByFundingNo(funding_open_no);
			
			HashMap<String,Object> map = new HashMap<String,Object>(); 

			map.put("memberVo", memberVo);
			map.put("fundingOpenVo", fundingOpenVo);
			map.put("fundingUserListVo", fundingUserListVo);
			map.put("uploadFundingResultVo", uploadFundingResultVo);
			map.put("fundingImageVoList", fundingImageVoList);
			
			resultList.add(map);
			}
	
		return resultList;
	}
	
	public ArrayList<HashMap<String, Object>> getFundingQnAList(int fundingOpenNo){
	
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
	
		ArrayList<FundingQnAVo> fundingQnAList = fundingSQLMapper.fundingQnASelectAll(fundingOpenNo);
	
		for(FundingQnAVo fundingQnAVo : fundingQnAList) {
			
			int user_no = fundingQnAVo.getuser_no();
			int funding_qna_category_no = fundingQnAVo.getFunding_qna_category_no();
			int funding_open_no = fundingQnAVo.getFunding_open_no();
			
			FundingOpenVo fundingOpenVo = fundingSQLMapper.selectFundingByFundingOpenNo(funding_open_no);
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			FundingQnACategoryVo fundingQnACategoryVo = fundingSQLMapper.fundingQnACategorySelectByCategoryNo(funding_qna_category_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("fundingOpenVo", fundingOpenVo);
			map.put("memberVo", memberVo);
			map.put("fundingQnAVo", fundingQnAVo);
			map.put("fundingQnACategoryVo", fundingQnACategoryVo);
			
			resultList.add(map);
		}
		
		return resultList;
	}
	
	public HashMap<String, Object> getfundingQnA(int fundingQnANo){
		
		FundingQnAVo fundingQnAVo = fundingSQLMapper.fundingQnASelectByQnANo(fundingQnANo);
		fundingSQLMapper.fundingQnAIncreaseReadCount(fundingQnANo);
		FundingQnACategoryVo fundingQnACategoryVo = fundingSQLMapper.fundingQnACategorySelectByCategoryNo(fundingQnANo);
		
		int fundingOpenNo = fundingQnAVo.getFunding_open_no();
		FundingOpenVo fundingOpenVo = fundingSQLMapper.selectFundingByFundingOpenNo(fundingOpenNo);
		
		int user_no = fundingQnAVo.getuser_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
		
		System.out.println("memberVo" + memberVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundingOpenVo", fundingOpenVo);
		map.put("memberVo", memberVo);
		map.put("fundingQnAVo", fundingQnAVo);
		map.put("fundingQnACategoryVo", fundingQnACategoryVo);
		
		return map;
	}
	
	public HashMap<String, Object> getFundingQnAComment(int fundingQnACommentNo) {
	
		FundingQnACommentVo fundingQnACommentVo = fundingSQLMapper.fundingQnACommentSelectByQnACommentNo(fundingQnACommentNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundingQnACommentVo", fundingQnACommentVo);
		
		return map;
	}
	
	public void updateFundingQnA(FundingQnAVo vo) {
		fundingSQLMapper.fundingQnAUpdateContent(vo);
	}
	
	public void deleteFundingQnA(int fundingQnANo) {
		fundingSQLMapper.fundingQnADeleteContent(fundingQnANo);
	}
	
	public ArrayList<HashMap<String, Object>> getFundingQnACommentList(int fundingQnANo){
	
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		ArrayList<FundingQnACommentVo> fundingQnACommentList = fundingSQLMapper.fundingQnACommentSelectByNo(fundingQnANo);
				
		for(FundingQnACommentVo fundingCommentVo : fundingQnACommentList) {
			MemberVo memberVo = memberSQLMapper.selectByNo(fundingCommentVo.getUser_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("fundingCommentVo", fundingCommentVo);
			
			result.add(map);
		}
		
		return result;
	}
	
	public void writeFundingQnAComment(FundingQnACommentVo vo) {
		fundingSQLMapper.fundingQnACommentInsert(vo);
	}
	
	public void updateFundingQnAComment(FundingQnACommentVo vo) {
		fundingSQLMapper.fundingQnACommentUpdate(vo);
	}
	
	public void deleteFundingQnAComment(int fundingQnANo) {
		fundingSQLMapper.fundingQnACommentDelete(fundingQnANo);
	}
	
	public ArrayList<HashMap<String, Object>> getFundMovieCommentList(int fundingOpenNo){
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		ArrayList<FundMovieCommentVo> fundMovieCommentList = fundingSQLMapper.fundmovieCommentSelectByNo(fundingOpenNo);
				
		for(FundMovieCommentVo fundMovieCommentVo : fundMovieCommentList) {
			MemberVo memberVo = memberSQLMapper.selectByNo(fundMovieCommentVo.getUser_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("fundMovieCommentVo", fundMovieCommentVo);
			
			result.add(map);
		}
		
		return result;
	}
	
	public void writeFundMovieComment(FundMovieCommentVo vo) {
		fundingSQLMapper.fundMovieCommentInsert(vo);
	}
	
	public void updateFundMovieComment(FundMovieCommentVo vo) {
		fundingSQLMapper.fundMovieCommentUpdate(vo);
	}
	
	public void deleteFundMovieComment(FundMovieCommentVo vo) {
		fundingSQLMapper.fundMovieCommentDelete(vo);
	}
	
	public ArrayList<HashMap<String, Object>> getFundingCommunityList(int fundingOpenNo){
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		ArrayList<FundingCommunityVo> fundingCommunityVoList = fundingSQLMapper.fundingCommunitySelectByFundingOpenNo(fundingOpenNo);
	
		for(FundingCommunityVo fundingCommunityVo : fundingCommunityVoList) {
			
			MemberVo memberVo = memberSQLMapper.selectByNo(fundingCommunityVo.getFunding_user_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("fundingCommunityVo", fundingCommunityVo);
			
			result.add(map);
		}
		return result;
	}
	
	public HashMap<String, Object> getFundingCommunity(int fundingCommunityNo) {
		
		FundingCommunityVo fundingCommunityVo = fundingSQLMapper.fundingCommunitySelectByCommnuityNo(fundingCommunityNo);
				
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundingCommunityVo", fundingCommunityVo);
		
		return map;
	}
	
	public void writeFundingCommunity(FundingCommunityVo vo) {
		fundingSQLMapper.fundingCommunityInsert(vo);
	}
	
	public void updateFundingCommunity(FundingCommunityVo vo) {
		fundingSQLMapper.fundingCommunityUpdate(vo);
	}
	
	public void deleteFundingCommunity(int fundingCommunityNo) {
		fundingSQLMapper.fundingCommunityDelete(fundingCommunityNo);
	}
	
	public ArrayList<HashMap<String, Object>> getFundingNoticeList(int fundingOpenNo){
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		ArrayList<FundingNoticeVo> fundingNoticeVoList = fundingSQLMapper.fundingNoticeSelectByFundingOpenNo(fundingOpenNo);
	
		for(FundingNoticeVo fundingNoticeVo : fundingNoticeVoList) {
			
			MemberVo memberVo = memberSQLMapper.selectByNo(fundingNoticeVo.getUser_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("fundingNoticeVo", fundingNoticeVo);
			
			resultList.add(map);
		}
		return resultList;
	}
	
	public HashMap<String, Object> getFundingNotice(int fundingNoticeNo) {
		
		FundingNoticeVo fundingNoticeVo = fundingSQLMapper.fundingNoticeSelectByNoticeNo(fundingNoticeNo);
				
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundingNoticeVo", fundingNoticeVo);
		
		return map;
	}
	
	public void writeFundingNotice(FundingNoticeVo vo) {
		fundingSQLMapper.fundingNoticeInsert(vo);
	}
	
	public void updateFundingNotice(FundingNoticeVo vo) {
		fundingSQLMapper.fundingNoticeUpdate(vo);
	}
	
	public void deleteFundingNotice(int fundingNoticeNo) {
		fundingSQLMapper.fundingNoticeDelete(fundingNoticeNo);
	}
	
}
