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
import com.formypet.cs.model.vo.Faq;
import com.formypet.cs.model.vo.Notice;

public class FaqDao {

	private Properties prop = new Properties();
	
	public FaqDao() {
		try {
			prop.loadFromXML(new FileInputStream(FaqDao.class.getResource("/db/mappers/cs-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 관리자-FAQ 목록 조회 메소드
	 * 
	 * @author 김영주
	 * @param conn => 서비스측에서 전달받은 Connection 객체
	 * @return list 조회된 FAQ들이 담긴 List<FAQ> 객체
	 */
	public List<Faq> selectManagerFaqList(Connection conn){
		List<Faq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectManagerFaqList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq fq = new Faq(
								  rset.getInt("faq_no")
								, rset.getString("faq_title")
								, rset.getString("faq_content")
								, rset.getString("enroll_date")
								, rset.getString("status")
						);
				
				list.add(fq);
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
	 * 관리자-FAQ 상세조회 메소드
	 * 
	 * Connection 객체와 글번호가 담긴 faqNo(String)을 전달받아
	 * 조회해온 FAQ데이터(글번호,제목,내용,작성일,글상태)가 담긴 Faq객체 반환
	 * 
	 * @author 김영주
	 * @param conn => Connection 객체
	 * @param faqNo => 조회할 글번호
	 * @return fq => 데이터가 담긴 Faq객체
	 */
	public Faq selectManagerFaq(Connection conn, String faqNo) {
		Faq fq = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectManagerFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, faqNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				fq = new Faq(
						  rset.getInt("faq_no")
						, rset.getString("faq_title")
						, rset.getString("faq_content")
						, rset.getString("enroll_date")
						, rset.getString("status")
				);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return fq;
		
	}

	/**
	 * 관리자-FAQ 수정
	 * @author 김영주
	 * @param conn
	 * @param f => 제목,내용 담긴 FAQ vo객체
	 * @return result => 처리된 행수
	 */
	public int updateFaq(Connection conn, Faq f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFaqTitle());
			pstmt.setString(2, f.getFaqContent());
			pstmt.setInt(3, f.getFaqNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 관리자-FAQ 글상태 선택변경
	 * 
	 * @author 김영주
	 * @param conn
	 * @param status => 변경할 글상태
	 * @param noArr => 선택된 글번호들이 담긴 String 배열
	 * @return result => 처리된 행수(int)
	 */
	public int changerFaqStatus(Connection conn, String status, String[] noArr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("changeFaqStatus") + "WHERE FAQ_NO IN (" + String.join(",", noArr) + ")";
		
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
	 * 관리자-FAQ 선택삭제
	 * 
	 * @author 김영주
	 * @param conn
	 * @param noArr => 선택된 글번호들이 담긴 String 배열
	 * @return result => 처리된 행수(int)s
	 */
	public int deleteFaq(Connection conn, String[] noArr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFaq") + "WHERE FAQ_NO IN (" + String.join(",", noArr) + ")" ;
		
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
	
	/**
	 * 관리자-FAQ 등록
	 * @author 김영주
	 * @param conn
	 * @param f => 제목,내용 담긴 FAQ vo객체
	 * @return result => 처리된 행수
	 */
	public int insertFaq(Connection conn, Faq f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFaqTitle());
			pstmt.setString(2, f.getFaqContent());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 사용자-FAQ 리스트 조회
	 * @author 이주리
	 * @param f => 번호,제목,내용 담긴 FAQ vo객체
	 * @return list => f객체 리스트가 담긴 오브젝트배열
	 */
	public List<Faq> selectFaqList(Connection conn) {
		List<Faq> list = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("selectFaqList");
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        rset = pstmt.executeQuery();
	        
	        while(rset.next()) {
	            Faq f = new Faq();
	            
	            f.setFaqNo(rset.getInt("Faq_no"));
	            f.setFaqTitle(rset.getString("Faq_title"));
	            f.setFaqContent(rset.getString("Faq_content"));
	            
	            list.add(f); // 리스트에 추가
	        } 
	        
	    }catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	    
	    return list;
		}

	/**
	 * 사용자-고객센터 홈화면 FAQ 리스트 조회
	 * @author 이주리
	 * @param f => 번호,제목,내용 담긴 FAQ vo객체
	 * @return list => f객체 리스트가 담긴 오브젝트배열
	 */
	public List<Faq> selectFaqListHome(Connection conn) {
		List<Faq> faqList = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("selectFaqListHome");
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        rset = pstmt.executeQuery();
	        
	        while(rset.next()) {
	            Faq f = new Faq();
	            
	            f.setFaqNo(rset.getInt("Faq_no"));
	            f.setFaqTitle(rset.getString("Faq_title"));
	            f.setFaqContent(rset.getString("Faq_content"));
	            
	            faqList.add(f); // 리스트에 추가
	        } 
	        
	    }catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	    
	    return faqList;
	
	}
	
	
}
