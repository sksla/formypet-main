package com.formypet.cs.model.service;

import java.sql.Connection;
import java.util.List;

import static com.formypet.common.template.JDBCTemplate.*;
import com.formypet.cs.model.dao.FaqDao;
import com.formypet.cs.model.vo.Faq;

public class FaqService {

	private FaqDao fDao = new FaqDao();
	
	
	/**
	 * 관리자-FAQ 목록 조회용 Service측 메소드
	 * @author 김영주
	 * 
	 * 
	 * @param statusArr
	 * @return
	 */
	public List<Faq> selectManagerFaqList(){
		Connection conn = getConnection();
		
		List<Faq> list = fDao.selectManagerFaqList(conn);
		
		close(conn);
		return list;
	}
	
	/**
	 * 관리자-FAQ 목록 조회용 Service측 메소드
	 * 
	 * 조회해온 FAQ데이터(글번호,제목,내용,작성일,글상태)가 담긴 Faq객체 반환
	 * 
	 * @author 김영주
	 * @param faqNo => 글번호
	 * @return fq = 데이터 담긴 FAQ vo객체
	 */
	public Faq selectManagerFaq(String faqNo) {
		Connection conn = getConnection();
		
		Faq fq = fDao.selectManagerFaq(conn, faqNo);
		
		close(conn);
		
		return fq;
	}
	
	/**
	 * 관리자-FAQ 수정용 Service측 메소드
	 * 
	 * @author 김영주
	 * @param f => 수정할 제목,내용 담긴 vo객체
	 * @return result => 처리된 행수(int)
	 */
	public int updateFaq(Faq f) {
		Connection conn = getConnection();
		
		int result = fDao.updateFaq(conn, f);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 관리자-FAQ 글상태 선택변경 Service측 메소드
	 * 
	 * @author 김영주
	 * @param status => 변경할 글상태
	 * @param noArr => 선택된 글번호들이 담긴 String 배열
	 * @return result => 처리된 행수(int)
	 */
	public int changeFaqStatus(String status, String[] noArr) {
		Connection conn = getConnection();
		
		int result = fDao.changerFaqStatus(conn, status, noArr);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 관리자-FAQ 글 선택삭제 Service측 메소드
	 * 
	 * @author 김영주
	 * @param noArr => 선택된 글번호들이 담긴 String 배열
	 * @return result => 처리된 행수(int)
	 */
	public int deleteFaq(String[] noArr) {
		Connection conn = getConnection();
		
		int result = fDao.deleteFaq(conn, noArr);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	/**
	 * 관리자-FAQ 등록 Service측 메소드
	 * @author 김영주
	 * @param f => 제목,내용 담긴 FAQ vo객체
	 * @return result => 처리된 행수(int)
	 */
	public int insertFaq(Faq f) {
		Connection conn = getConnection();
		int result = fDao.insertFaq(conn, f);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	/**
	 * FAQ 리스트 조회 (사용자)
	 * @author 이주리
	 * @param List<Faq> => FAQ Faq객체가 담긴 리스트
	 * @return
	 */
	public List<Faq> selectFaqList() {
		Connection conn = getConnection();
		List<Faq> list = fDao.selectFaqList(conn);
		close(conn);
		
		return list;
	
	}

	/**
	 * FAQ 리스트 조회 (사용자) 고객센터 홈화면에서 리스트 5개 조회
	 * @author 이주리
	 * @param List<Faq> => FAQ Faq객체가 담긴 리스트
	 * @return
	 */
	public List<Faq> selectFaqListHome() {
		Connection conn = getConnection();
		List<Faq> faqList = fDao.selectFaqListHome(conn);
		close(conn);
		
		return faqList;
	
	}
	
	
}
