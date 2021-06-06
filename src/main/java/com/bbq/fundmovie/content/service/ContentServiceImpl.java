package com.bbq.fundmovie.content.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbq.fundmovie.content.mapper.ContentSQLMapper;
import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.QnaHeadlineVo;
import com.bbq.fundmovie.vo.QnaLikeVo;
import com.bbq.fundmovie.vo.QnaVo;

@Service
public class ContentServiceImpl {

	@Autowired
	private ContentSQLMapper contentSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	
	
	//qna
	
	//qna 글쓰기
	public void qnaWrite(QnaVo qv) {
		System.out.println("글쓰기 service 담기1");
		
		contentSQLMapper.qnaInsert(qv);
		
		System.out.println("글쓰기 service 담기2");
	}
	
	//qna 메인화면 글목록 보기
	public ArrayList<HashMap<String, Object>> getQnaList(int page_num){
		
		ArrayList<HashMap<String, Object>> qnaResultList =
				new ArrayList<HashMap<String,Object>>();
		
		ArrayList<QnaVo> qnaList = 
				contentSQLMapper.qnaPageSelectAll(page_num);
		
		for(QnaVo qnaVo : qnaList) {
			int user_no = qnaVo.getUser_no();
			int qna_headline_no = qnaVo.getQna_headline_no();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
			QnaHeadlineVo qnaHeadlineVo = contentSQLMapper.qnaHeadlineSelect(qna_headline_no);
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("qnaVo", qnaVo);
			map.put("qnaHeadlineVo", qnaHeadlineVo);
			
			qnaResultList.add(map);
		}
		
		return qnaResultList;
	}
	
	//qna 상세글보기
	public HashMap<String, Object> getQnaContent(int qnaNo){
		
		contentSQLMapper.qnaIncreaseReadCount(qnaNo);
		
		//출력 데이터
		QnaVo qnaVo = contentSQLMapper.qnaSelectByNo(qnaNo);
		QnaHeadlineVo qnaHeadlineVo = contentSQLMapper.qnaHeadlineSelect(qnaVo.getQna_headline_no());
		
		int user_no = qnaVo.getUser_no();
		
		MemberVo memberVo = memberSQLMapper.selectByNo(user_no);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);
		map.put("qnaVo", qnaVo);
		map.put("qnaHeadlineVo", qnaHeadlineVo);
		
		return map;
	}
	//qna 글 삭제
	public void deleteQnaContent(int qnaNo) {
		contentSQLMapper.qnaDeleteContent(qnaNo);
	}
	
	
	//qna 글 수정-날라올 것 : 글번호,제목,내용(qnaVo에 다 있음)
	public void updateQnaContent(QnaVo qv) {
		
		System.out.println(qv.getQna_content());
		System.out.println(qv.getQna_no());

		contentSQLMapper.qnaUpdateContent(qv);
	}
	
	
	//qna 좋아요 
	public void insertQnaLike(QnaLikeVo qlv) {
		
		contentSQLMapper.qnaLikeInsert(qlv);
		
	}
	//좋아요 취소
	public void deleteQnaLike(QnaLikeVo qlv) {
		
		contentSQLMapper.qnaLikeCancel(qlv);
		
	}
	//좋아요 중복확인
	public int getQnaLike(QnaLikeVo qlv) {
		
		int count = contentSQLMapper.qnaLikeCheck(qlv);
		
		return count;
	}
	//좋아요 페이지내의 전체 갯수
	public int getQnaLikeCount(QnaLikeVo qlv) {
		
		int pageCount = contentSQLMapper.qnaLikePageCount(qlv);
		
		return pageCount;
	}
	
	//qna 페이징
	public int getQnaPageCount() {
		return contentSQLMapper.qnaGetPageCount();
	}
}