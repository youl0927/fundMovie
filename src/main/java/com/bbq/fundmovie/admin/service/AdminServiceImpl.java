package com.bbq.fundmovie.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbq.fundmovie.admin.mapper.AdminSQLMapper;
import com.bbq.fundmovie.admin.mapper.AdminSteelSQLMapper;
import com.bbq.fundmovie.funding.mapper.FundingSQLMapper;
import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.mypage.mapper.MyPageSQLMapper;
import com.bbq.fundmovie.vo.ContentVo;
import com.bbq.fundmovie.vo.FundingOpenVo;
import com.bbq.fundmovie.vo.FundingUserListVo;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.MovieGenreVo;
import com.bbq.fundmovie.vo.MovieSteelcutVo;
import com.bbq.fundmovie.vo.QnaHeadlineVo;
import com.bbq.fundmovie.vo.QnaVo;
import com.bbq.fundmovie.vo.RankUpRequestVo;

@Service
public class AdminServiceImpl {
	
	@Autowired
	private AdminSQLMapper adminSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper; 
	
	@Autowired
	private MyPageSQLMapper myPageSQLMapper;
	
	@Autowired
	private AdminSteelSQLMapper adminSteelSQLMapper;
	
	@Autowired
	private FundingSQLMapper fundingSQLMapper;
	
	public void approveRankProcess(int user_no) {
		adminSQLMapper.updateRank(user_no);
	}
	
	public void approveFudingProcess(int funding_open_no) {
		adminSQLMapper.updateFundingStatusApproved(funding_open_no);
	}
	
	public void completeFudingProcess(int funding_open_no) {
		adminSQLMapper.updateFundingStatusComplete(funding_open_no);
	}
	
	public void uploadedFudingProcess(int funding_open_no) {
		adminSQLMapper.updateFundingStatusUploaded(funding_open_no);
	}
	
	public ArrayList<HashMap<String, Object>> getFundRequestList(){
		ArrayList<HashMap<String, Object>> fundList =
				new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<FundingOpenVo> fundRequestList = myPageSQLMapper.selectAllFundRequest();
		
		for(FundingOpenVo fundingRequestVo : fundRequestList) {
			
			int member_no = fundingRequestVo.getUser_no();		
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			int funding_open_no = fundingRequestVo.getFunding_open_no();
			ArrayList<FundingUserListVo> fundingUserListVo = fundingSQLMapper.selectFundingUserListByNo(funding_open_no);
			
			Integer fundingsum = fundingSQLMapper.getFundingSumPoint(funding_open_no);
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			map.put("fundingRequestVo", fundingRequestVo);
			map.put("fundingUserListVo", fundingUserListVo);
			map.put("fundingsum", fundingsum);
			
			fundList.add(map);
		}
		
		return fundList;
	}
	
	public ArrayList<HashMap<String, Object>> getselectSatisiedFundingList(){
		ArrayList<HashMap<String, Object>> fundList =
				new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<FundingOpenVo> satisiedFundList = adminSQLMapper.selectSatisiedFunding();
		
		for(FundingOpenVo satisiedFundVo : satisiedFundList) {
			
			int member_no = satisiedFundVo.getUser_no();		
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			int funding_open_no = satisiedFundVo.getFunding_open_no();
			ArrayList<FundingUserListVo> fundingUserListVo = fundingSQLMapper.selectFundingUserListByNo(funding_open_no);
			
			Integer fundingsum = fundingSQLMapper.getFundingSumPoint(funding_open_no);
			if(fundingsum == null) {
				fundingsum = 0;
			}
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			map.put("fundingRequestVo", satisiedFundVo);
			map.put("fundingUserListVo", fundingUserListVo);
			map.put("fundingsum", fundingsum);
			
			fundList.add(map);
		}
		
		return fundList;
	}
	
	public ArrayList<HashMap<String, Object>> getRankRequestList(){
		ArrayList<HashMap<String, Object>> rankList =
				new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<RankUpRequestVo> rankUpRequestList = myPageSQLMapper.selectAllRankRequest();
		
		for(RankUpRequestVo rankUpRequestVo : rankUpRequestList) {
			int member_no = rankUpRequestVo.getUser_no();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			map.put("rankUpRequestVo", rankUpRequestVo);
			
			rankList.add(map);
		}
		return rankList;
	}
	
	public ArrayList<HashMap<String, Object>> getContentList(String search_word , String search_type ,int page_num){
		ArrayList<HashMap<String, Object>> resultList =
				new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<ContentVo> contentList = null;
		
		if(search_word == null || search_type == null) {
			contentList = adminSQLMapper.selectAll(page_num);
		}else {
			if(search_type.equals("title")) {
				contentList = adminSQLMapper.selectByTitle(search_word);
			}else if(search_type.equals("content")) {
				contentList = adminSQLMapper.selectByContent(search_word);
			}else if(search_type.equals("writer")) {
				contentList = adminSQLMapper.selectByWriter(search_word);
			}else {
				contentList = adminSQLMapper.selectAll(page_num);
			}
		}
		
		for(ContentVo contentVo : contentList) {
			int member_no = contentVo.getUser_no();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);
			map.put("contentVo", contentVo);
			
			resultList.add(map);
		}
		
		return resultList;
	}
	
	public HashMap<String,Object> getContent(int movie_no){

		//출력 데이터 받아 오기...
		ContentVo contentVo = adminSQLMapper.selectByNo(movie_no);
		int user_no = contentVo.getUser_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
		
		
		ArrayList<MovieSteelcutVo> steelcutVoList =
				adminSteelSQLMapper.selectByMovieNo(movie_no);
		
		ArrayList<String> movieGenreList = adminSQLMapper.selectGenre(movie_no);
		String release_date = contentVo.getMovie_release_date();
		String Ryear = release_date.substring(0, 4);
		String Rmonth = release_date.substring(4, 6);
		String Rdate = release_date.substring(6, 8);

		HashMap<String,Object> map = new HashMap<String,Object>(); 
		map.put("memberVo", memberVo);
		map.put("contentVo", contentVo);
		map.put("releaseYear", Ryear);
		map.put("releaseMonth", Rmonth);
		map.put("releaseDate", Rdate);
		map.put("steelcutVoList", steelcutVoList);
		map.put("movieGenreList", movieGenreList);

		return map;
	}
	
	
	
	public void addMovieInform(ContentVo vo, ArrayList<MovieSteelcutVo> steelcutVoList, int [] genre_no) {
		
		int moviePK = adminSQLMapper.createKey();
		vo.setMovie_no(moviePK);
		adminSQLMapper.addMovieInform(vo);
		
		for(MovieSteelcutVo steelcutVo : steelcutVoList) {
			steelcutVo.setMovie_no(moviePK);
			adminSteelSQLMapper.insert(steelcutVo);
		}
		
		
		if(genre_no != null) {
			for(int genre : genre_no) {
				
				MovieGenreVo genreVo = new MovieGenreVo();
				genreVo.setGenre_no(genre);
				genreVo.setMovie_no(moviePK);
				
				adminSQLMapper.insertGenre(genreVo);
			}
		}
		
		
	}
	
	public void deleteMovie(int movie_no) {
		adminSQLMapper.deleteByNo(movie_no);
		adminSteelSQLMapper.deleteByNo(movie_no);

	}
	public void updateMovie(ContentVo vo) {
		adminSQLMapper.update(vo);
	}
	
		
	public int getPageCount() {
		return adminSQLMapper.getPageCount();
	}
	
	//qna 메인화면 글목록 보기
	public ArrayList<HashMap<String, Object>> getQnaList(int page_num){
		
		ArrayList<HashMap<String, Object>> qnaResultList =
				new ArrayList<HashMap<String,Object>>();
		
		ArrayList<QnaVo> qnaList = 
				adminSQLMapper.qnaPageSelectAll(page_num);
		
		for(QnaVo qnaVo : qnaList) {
			int user_no = qnaVo.getUser_no();
			int qna_headline_no = qnaVo.getQna_headline_no();
			System.out.println("qna_headline_no: "+qna_headline_no);

			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			QnaHeadlineVo qnaHeadlineVo = adminSQLMapper.qnaHeadlineSelect(qna_headline_no);
			System.out.println("qnaHeadlineVo1: "+qnaHeadlineVo);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("qnaVo", qnaVo);
			map.put("qnaHeadlineVo", qnaHeadlineVo);
			System.out.println("qnaHeadlineVo2: "+qnaHeadlineVo);
			qnaResultList.add(map);
		}
		return qnaResultList;
	}
	
	//qna 댓글 입력...
	public void getAdminQnaReply(QnaVo qv){
		
		System.out.println(qv.getQna_reply());
		System.out.println(qv.getQna_no());
		
		adminSQLMapper.qnaAdminReply(qv);
		
		System.out.println("서비스 통과");
	}
	
	
	//qna 상세글보기
	public HashMap<String, Object> getQnaContent(int qnaNo){
		
		//출력 데이터
		QnaVo qnaVo = adminSQLMapper.qnaSelectByNo(qnaNo);
		System.out.println("Qna_headline_no: "+qnaVo.getQna_headline_no());
		QnaHeadlineVo qnaHeadlineVo = adminSQLMapper.qnaHeadlineSelect(qnaVo.getQna_headline_no());
		
		int user_no = qnaVo.getUser_no();
		
		MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);
		map.put("qnaVo", qnaVo);
		map.put("qnaHeadlineVo", qnaHeadlineVo);
		
		return map;
	}
	
	//qna 페이징
	public int getQnaPageCount() {
		return adminSQLMapper.qnaGetPageCount();
	}
	
	
	
}
