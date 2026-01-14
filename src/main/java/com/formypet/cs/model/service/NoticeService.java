package com.formypet.cs.model.service;

import static com.formypet.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.formypet.cs.model.dao.NoticeDao;
import com.formypet.cs.model.vo.Notice;

public class NoticeService {

	private NoticeDao nDao = new NoticeDao();
	
	/**
	 * 관리자 공지사항 목록 조회용 Service 측 메소드
	 *
	 * 작성자 : 김영주
	 * 
	 * Dao측에 Connection 객체 넘겨주고 받는 List<Notice> 객체
	 * 컨트롤러에 반환
	 * 
	 * @return list : 조회된 공지사항들이 담긴 List<Notice> 객체
	 */
	public List<Notice> selectManagerNoticeList(){
		Connection conn = getConnection();
		List<Notice> list = nDao.selectManagerNoticeList(conn);
		close(conn);
		return list;
	}
	
	
	/**
	 * 관리자 공지사항 등록용 Service측 메소드
	 * 
	 * 작성자 : 김영주
	 * 
	 * Dao측에 Connection 객체와 Notice객체 넘겨주고 돌려받은 
	 * result가 0 이하면 rollback,
	 * 0 이상이면 commit 시켜줌
	 * 
	 * @param n : 컨트롤러에서 넘겨받은 Notice객체
	 * @return result : insert 처리된 행수
	 */
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = nDao.insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/**
	 * 관리자 공지사항 글 상세조회용 Service측 메소드
	 * 
	 * 작성자 : 김영주
	 * 
	 * Dao측에 Connection객체와 글번호 넘겨주고 
	 * 받은 Notice객체 컨트롤러측에 넘겨줌
	 * 
	 * @param noticeNo : 조회할 공지사항의 글번호
	 * @return n : 조회하려는 공지사항의 글번호, 제목, 내용이 담긴 Notice객체  
	 */
	public Notice selectManagerNotice(String noticeNo) {
		Connection conn = getConnection();
		
		Notice n = nDao.selectManagerNotice(conn, noticeNo);
		
		close(conn);
		return n;
		
	}
	
	/**
	 * 공지사항 수정용 Service측 메소드
	 * 작성자 : 김영주
	 * 
	 * Connection객체와 컨트롤러에서 전달받은 Notice객체 Dao측에 전달하고
	 * 돌려받는 result가 0 이상이면 commit,
	 * 0 이하면 rollback해주고 result 컨트롤러측에 반환
	 * @param n
	 * @return
	 */
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = nDao.updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	/**
	 * 공지사항 글상태 변경용 Service측 메소드
	 * 작성자 : 김영주
	 * 
	 * Connection 객체와 Controller측에서 전달받은 stauts와 noArray 
	 * Dao측에 전달하고 돌려받은 result의 값에 따라 commit|rollback 실행
	 * 그 후 result Controller측에 반환
	 * 
	 * @param status => 글상태 변경값 : 'Y'|'N'
	 * @param noArray => 글상태 변경할 글번호가 담긴 String배열 
	 * @return
	 */
	public int changeStatus(String status, String[] noArray) {
		Connection conn = getConnection();
		
		int result = nDao.changeStatus(conn, status, noArray);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 공지사항 삭제용 Service측 메소드
	 * @author 김영주
	 * 
	 * Connection 객체와 Controller측에서 전달받은 String[] noArr을 
	 * Dao측에 전달하고 돌려받은 result의 값에 따라 commit|rollback 실행
	 * 그 후 result Controller측에 반환 
	 * @param noArr => 삭제할 글번호가 담긴 String배열
	 * @return
	 */
	public int deleteNotice(String[] noArr) {
		Connection conn = getConnection();
		
		int result = nDao.deleteNotice(conn, noArr);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	/**
	 * 공지사항 리스트 조회 (사용자)
	 * @author 이주리
	 * @param List<Notice> => 공지사항 notice객체가 담긴 리스트
	 * @return
	 */
	public List<Notice> selectNoticeList() {
		Connection conn = getConnection();
		List<Notice> list = nDao.selectNoticeList(conn);
		close(conn);
		
		return list;
		
	}

	/**
	 * 공지사항 리스트 조회 (사용자) 고객센터 홈화면에서 리스트 2개까지만 조회
	 * @author 이주리
	 * @param List<Notice> => 공지사항 notice객체가 담긴 리스트
	 * @return
	 */
	public List<Notice> selectNoticeListHome() {
		Connection conn = getConnection();
		List<Notice> noticeList = nDao.selectNoticeListHome(conn);
		close(conn);
		
		return noticeList;
	
	}
}
