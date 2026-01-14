package com.formypet.cs.model.dao;

import static com.formypet.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.formypet.common.model.vo.Attachment;
import com.formypet.cs.model.vo.Qna;
import com.formypet.cs.model.vo.QnaCategory;

public class QnaDao {

	private Properties prop = new Properties();
	
	public QnaDao() {
		try {
			prop.loadFromXML(new FileInputStream(QnaDao.class.getResource("/db/mappers/cs-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 관리자-1대1문의 목록 조회하는 메소드
	 * 
	 * @author 작성자 김영주
	 * @param conn => Connection 객체
	 * @return list => 조회된 Qna들이 담긴 List<Qna>  
	 */
	public List<Qna> selectManagerQnaList(Connection conn){
		List<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectManagerQnaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Qna( rset.getInt("qna_no")
						        , rset.getString("user_id")
						        , rset.getString("category_name")
						        , rset.getString("qna_title")
						        , rset.getString("qna_content")
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
	 * 관리자-1:1문의 상세조회 메소드(글&답변조회)
	 * 
	 * 글번호, 작성자ID, 문의유형,제목,내용,작성일,글상태,답변자아이디,답변내용,답변일
	 * 조회 후 Qna 객체에 담아 반환
	 * 
	 * @author 김영주
	 * @param conn => Connection 객체
	 * @param qnaNo => 전달받은 qna 글번호
	 * @return
	 */
	public Qna selectManagerQna(Connection conn, String qnaNo) {
		Qna q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectManagerQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new Qna();
				q.setQnaNo(rset.getInt("qna_no"));
				q.setQnaWriter(rset.getString("qna_writer"));
				q.setCategory(rset.getString("category_name"));
				q.setQnaTitle(rset.getString("qna_title"));
				q.setQnaContent(rset.getString("qna_content"));
				q.setEnrollDate(rset.getString("ENROLL_DATE"));
				q.setStatus(rset.getString("status"));
				q.setAnswerWriter(rset.getString("ANSWER_WRITER"));
				q.setAnswerContent(rset.getString("ANSWER_CONTENT"));
				q.setAnswerDate(rset.getString("ANSWER_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
	}
	
	/**
	 * 관리자- 1:1문의 답변 등록 메소드
	 * 
	 * @author 김영주
	 * @param conn
	 * @param q => 글번호, 답변자회원번호, 답변내용담긴 vo객체
	 * @return result => 처리된 행수(int)
	 */
	public int insertQnaReply(Connection conn, Qna q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQnaReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getAnswerWriter());
			pstmt.setString(2, q.getAnswerContent());
			pstmt.setInt(3, q.getQnaNo());;
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 관리자- 1:1 문의글 선택삭제 
	 * 
	 * 
	 * @param conn
	 * @param noArr => 글번호들이 담긴 String 배열
	 * @return result => 처리결과 (int)
	 */
	public int deleteManagerQna(Connection conn, String[] noArr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteManagerQna") + "WHERE QNA_NO IN (" + String.join(",", noArr) + ")";
		
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
	 * 관리자-1:1 문의글 첨부파일 선택삭제
	 * 
	 * 1:1 문의글 선택 삭제시 첨부파일의 상태도 'N'으로 변경
	 * @param conn
	 * @param noArr => 글번호들이 담긴 String 배열
	 * @return result => 처리결과 (int)
	 */
	public int deleteManagerQnaAttachment(Connection conn, String[] noArr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteManagerQnaAttachment") + " AND REF_BNO IN (" + String.join(",", noArr) + ")";
		
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
	 * 1:1 문의 첨부파일 조회
	 * 
	 * @author 김영주
	 * @param conn
	 * @param qnaNo => 1:1 문의 글번호(String)
	 * @return at => 파일번호, 원본명,수정명,파일경로 담긴 vo객체
	 */
	public Attachment selectAttachment(Connection conn, String qnaNo) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}

	/**
	 * 1:1 문의 사용자 등록
	 * 
	 * @author 이주리
	 * @param conn
	 * @param qnaWriter => 1:1 문의 작성자(Member() userNo) == loginUser
	 * @return 
	 */
	public int insertQna(Connection conn, Qna q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getCategory());
			pstmt.setString(2, q.getQnaTitle());
			pstmt.setString(3, q.getQnaContent());
			pstmt.setString(4, q.getQnaWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	/**
	 * 1:1 문의 사용자 첨부파일 등록
	 * 
	 * @author 이주리
	 * @param conn
	 * @param 
	 * @return at => 파일번호, 원본명,수정명,파일경로 담긴 vo객체
	 */
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 1:1 문의 사용자 글 등록 시 카테고리 리스트 조회
	 * 
	 * @author 이주리
	 * @param conn
	 * @param 
	 * @return list => QnaCategory객체 리스트
	 */
	public List<QnaCategory> selectListCategory(Connection conn) {
		List<QnaCategory> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QnaCategory(rset.getInt("category_no"),
									  rset.getString("category_name")));
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
	 * 1:1 문의 리스트 조회 (사용자) 
	 * 
	 * @author 이주리
	 * @param conn
	 * @param 
	 * @return list => Qna객체 리스트
	 */
	public List<Qna> selectQnaList(Connection conn, int userNo) {
		
		List<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Qna q = new Qna();
				q.setQnaNo(rset.getInt("qna_no"));
				q.setCategory(rset.getString("category_name"));
				q.setQnaTitle(rset.getString("qna_title"));
				q.setQnaWriter(rset.getString("user_id"));
				q.setEnrollDate(rset.getString("enroll_date"));
				q.setStatus(rset.getString("status"));
				
				list.add(q);
				
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
	 * 1:1 문의글 상세조회 (사용자)
	 * 
	 * @author 이주리
	 * @param conn
	 * @param 
	 * @return 
	 */
	public Qna selectQna(Connection conn, int qnaNo) {
		Qna q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new Qna();
				q.setQnaNo(rset.getInt("qna_no"));
				q.setQnaWriter(rset.getString("qna_writer"));
				q.setCategory(rset.getString("category_name"));
				q.setQnaTitle(rset.getString("qna_title"));
				q.setQnaContent(rset.getString("qna_content"));
				q.setEnrollDate(rset.getString("ENROLL_DATE"));
				q.setStatus(rset.getString("status"));
				q.setAnswerWriter(rset.getString("ANSWER_WRITER"));
				q.setAnswerContent(rset.getString("ANSWER_CONTENT"));
				q.setAnswerDate(rset.getString("ANSWER_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
		
	}
	/**
	 * 1:1 문의 상세조회 시 등록되있는 첨부파일 조회 (사용자)
	 * 
	 * @author 이주리
	 * @param conn
	 * @param 
	 * @return at => 파일번호, 원본명,수정명,파일경로 담긴 vo객체
	 */
	public Attachment memberSelectAttachment(Connection conn, int qnaNo) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("memberSelectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;	
	
	}

	/**
	 * 1:1 문의 사용자 문의글 수정 (사용자)
	 * 
	 * @author 이주리
	 * @param conn
	 * @param 
	 * @return at => 파일번호, 원본명,수정명,파일경로 담긴 vo객체
	 */
	public int updateQna(Connection conn, Qna q) {
		int result = 0;
		PreparedStatement pstmt = null; 
		String sql = prop.getProperty("updateQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getCategory());
			pstmt.setString(2, q.getQnaTitle());
			pstmt.setString(3, q.getQnaContent());
			pstmt.setInt(4, q.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 1:1 문의 사용자 문의글 수정 시, 첨부파일 수정 (사용자)
	 * 
	 * @author 이주리
	 * @param conn
	 * @param 
	 * @return at => 파일번호, 원본명,수정명,파일경로 담긴 vo객체
	 */
	public int updateAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 1:1 문의글 수정 시, //기존첨부파일 없을경우// 첨부파일 등록 (사용자)
	 * 
	 * @author 이주리
	 * @param conn
	 * @param 
	 * @return at => 파일번호, 원본명,수정명,파일경로 담긴 vo객체
	 */
	public int insertNewAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getRefBno());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	
	
	
}
