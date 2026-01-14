package com.formypet.cs.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static com.formypet.common.template.JDBCTemplate.close;
import com.formypet.cs.model.vo.Notice;


public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		try {
			prop.loadFromXML(new FileInputStream(NoticeDao.class.getResource("/db/mappers/cs-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 관리자 공지사항 목록 조회하는 메소드
	 * 
	 * 작성자 : 김영주
	 * @param conn
	 * @return 조회된 공지사항들이 담긴 List<Notice> 객체
	 */
	public List<Notice> selectManagerNoticeList(Connection conn){
		List<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectManagerNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(
									 rset.getInt("notice_no")
								   , rset.getString("user_id")
								   , rset.getString("notice_title")
								   , rset.getString("notice_content")
								   , rset.getString("enroll_date")
								   , rset.getString("status")
								   )
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	/**
	 * 공지사항 등록 메소드
	 * 작성자 : 김영주
	 * 
	 * 넘겨받은 Notice객체에 담긴 데이터로 공지사항 등록 실행시킨 후
	 * 처리된 행 수 담긴 result Service측에 반환
	 * 
	 * @param conn : Connection 객체
	 * @param n : 공지사항 제목, 내용, 작성자 회원번호 담긴 Notice 객체
	 * @return result : 처리된 행수
	 */
	public int insertNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getNoticeWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/**
	 * 관리자 공지사항 상세조회 메소드
	 * 
	 * 넘겨받은 noticeNo로 조회해온 공지사항 데이터(글번호,제목,내용) 
	 * Notice 객체에 담아 Service측에 반환
	 * 
	 * 작성자 : 김영주
	 * 
	 * @param conn : Connection 객체
	 * @param noticeNo : 조회할 공지사항의 공지사항번호
	 * @return n : 조회하려는 공지사항의 글번호, 제목, 내용이 담긴 Notice객체
	 */
	public Notice selectManagerNotice(Connection conn, String noticeNo) {
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectManagerNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeContent(rset.getString("notice_content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}
	
	/**
	 * 공지사항 수정 메소드
	 * 
	 * 수정요청 실행 후 처리된 행 수가 담긴 result 서비스 측에 반환
	 * 
	 * 작성자 : 김영주
	 * @param conn => Connection객체
	 * @param n => 수정하려는 공지사항 글번호, 제목,내용 담긴 Notice객체
	 * @return result => 처리된 행수 
	 */
	public int updateNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**
	 * 공지사항 글상태 변경 메소드
	 * 
	 * 글상태 변경 실행후 처리된 행 수가 담긴 result 반환
	 * 
	 * 작성자 : 김영주
	 * @param conn	=> Service측에서 전달받은 Connection객체
	 * @param status => 변경하고자하는 글상태 값 'Y' | 'N'
	 * @param noArray => 변경하고자하는 글번호가 담긴 String배열
	 * @return
	 */
	public int changeStatus(Connection conn, String status, String[] noArray) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("changeNoticeStatus") + "WHERE NOTICE_NO IN (" + String.join(",", noArray) + ")";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, status);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 공지사항 삭제 메소드
	 * 작성자 : 김영주
	 * 
	 * 공지사항 삭제 후 처리된 행 수 담긴 result 반환
	 * @param conn 	=> Service측에서 전달받은 Connection객체
	 * @param noArr	=> 삭제하고자하는 글번호가 담긴 String배열
	 * @return
	 */
	public int deleteNotice(Connection conn, String[] noArr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice") + "WHERE NOTICE_NO IN (" + String.join(",", noArr) + ")" ;
		
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		return result;
	}

	public List<Notice> selectNoticeList(Connection conn) {
		List<Notice> list = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("memberSelectNoticeList");
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        rset = pstmt.executeQuery();
	        
	        while(rset.next()) {
	            Notice n = new Notice();
	            
	            n.setNoticeNo(rset.getInt("notice_no"));
	            n.setNoticeTitle(rset.getString("notice_title"));
	            n.setNoticeWriter(rset.getString("user_id"));
	            n.setEnrollDate(rset.getString("enroll_date"));
	            n.setNoticeContent(rset.getString("notice_content"));
	            
	            list.add(n); // 리스트에 추가
	        } 
	        
	    }catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	    
	    return list;
	
	}

	public List<Notice> selectNoticeListHome(Connection conn) {
		List<Notice> noticeList = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("selectNoticeListHome");
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        rset = pstmt.executeQuery();
	        
	        while(rset.next()) {
	            Notice n = new Notice();
	            
	            n.setNoticeNo(rset.getInt("notice_no"));
	            n.setNoticeTitle(rset.getString("notice_title"));
	            n.setNoticeWriter(rset.getString("user_id"));
	            n.setEnrollDate(rset.getString("enroll_date"));
	            n.setNoticeContent(rset.getString("notice_content"));
	            
	            noticeList.add(n); // 리스트에 추가
	        } 
	        
	    }catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	    
	    return noticeList;
	    
	}
	
	

	
	

}
