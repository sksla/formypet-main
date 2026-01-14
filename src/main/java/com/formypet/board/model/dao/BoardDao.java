package com.formypet.board.model.dao;

import static com.formypet.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import com.formypet.board.model.vo.Board;
import com.formypet.board.model.vo.Macro;
import com.formypet.board.model.vo.Reply;
import com.formypet.board.model.vo.Review;
import com.formypet.common.model.vo.Attachment;
import com.formypet.common.model.vo.PageInfo;
import com.formypet.product.model.vo.Product;

public class BoardDao {
	
	private Properties prop = new Properties(); 
	
	public BoardDao() {
		try {
//			sql문이 작성되어있는 xml파일 읽어들이는 구문
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/db/mappers/board-mapper.xml").getPath()));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 게시글 총 개수 알아내는 메소드
	 * @author 조성범
	 * @param conn
	 * @return
	 */
	public int selectListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}	
		return listCount;
	}
	
	
	/**
	 * 게시글 전체 글 조회하는 메소드
	 * @author 조성범
	 * @param conn
	 * @param pi
	 * @return
	 */
	public List<Board> selectList(Connection conn, PageInfo pi){
		
		List<Board> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_no"),
								   rset.getString("board_title"),
								   rset.getString("user_id"),
								   rset.getDate("enroll_date"),
								   rset.getInt("read_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	/**
	 * 게시글상세 조회수 증가 메소드
	 * @author 조성범
	 * @param conn
	 * @param boardNo
	 * @return
	 */
	public int increaseCount(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
								 	  
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/**
	 * 게시글상세페이지 조회하는 메소드
	 * @author 조성범
	 * @param conn
	 * @param boardNo
	 * @return
	 */
	public Board selectBoard(Connection conn, int boardNo) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("board_no")
							, rset.getString("board_title")
							, rset.getString("user_id")
							, rset.getDate("enroll_date")
							, rset.getInt("read_count")
							, rset.getString("board_content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}
	
	/**
	 * 자유게시판 게시글 작성
	 * @author 조성범
	 * @param conn
	 * @param b
	 * @return
	 */
	public int insertBoard(Connection conn, Board b) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setString(3, b.getBoardWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	/**
	 * 자유게시판 게시글 수정
	 * @author 조성범
	 * @param conn
	 * @param b
	 * @return
	 */
	public int updateBoard(Connection conn, Board b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * 사진게시글 총 개수 알아내는 메소드
	 * @author 조성범
	 * @param conn
	 * @return
	 */
	public int selectThListCount(Connection conn) {
		int thListCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selecThtListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				thListCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}	
		return thListCount;
	}
	
	
	/**
	 * 사진게시판 게시글 작성(Board)
	 * @author 조성범
	 * @param conn
	 * @param b
	 * @return
	 */
	public int insertThBoard(Connection conn, Board b) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertThBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setString(3, b.getBoardWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 사진게시판 게시글 작성(Attachment)
	 * @author 조성범
	 * @param conn
	 * @param b
	 * @return
	 */
	public int insertThAttachment(Connection conn, List<Attachment> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertThAttachment");
		
		try {
		for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				result = pstmt.executeUpdate();
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	/**
	 * 사진게시판 게시글 목록(Attachment)
	 * @author 조성범
	 * @param conn
	 * @param b
	 * @return
	 */
	
	public List<Board> selectThumbnailList(Connection conn, PageInfo pi){
		
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectThumbnailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setBoardWriter(rset.getString("user_id"));
				b.setEnrollDate(rset.getDate("enroll_date"));
				b.setReadCount(rset.getInt("read_count"));
				b.setTitleImgURL(rset.getString("titleimg_url"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
		
	}
	
	/**
	 * 게시글상세페이지 조회하는 메소드
	 * @author 조성범
	 * @param conn
	 * @param boardNo
	 * @return
	 */
	public Board thSelectBoard(Connection conn, int thBoardNo) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("thSelectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, thBoardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("board_no")
							, rset.getString("board_title")
							, rset.getString("user_id")
							, rset.getDate("enroll_date")
							, rset.getInt("read_count")
							, rset.getString("board_content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}
	
	
	public List<Attachment> thSelectAttachmentList(Connection conn, int thBoardNo){
		List<Attachment> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("thSelectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, thBoardNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileNo(rset.getInt("file_no"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				
				list.add(at);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		
	}
	
	public List<Reply> selectReplyList(Connection conn, int boardNo){
		List<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("reply_no")
								 , rset.getString("user_id")
								 , rset.getString("reply_content")
								 , rset.getString("enroll_date")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReplyWriter());
			pstmt.setInt(2, r.getRefBno());
			pstmt.setString(3, r.getReplyContent());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
	}
	
	public int deleteBoard(Connection conn, int boardNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}
	
	public int searchBoardListCount(Connection conn, String category, String search) {
		int searchListCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchBoardListCount");
		
		if(category.equals("title")) {
			sql += "and board_title like ?";
		}else {
			sql += "and user_id like ?";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				searchListCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}	
		return searchListCount;
	}
	
	
	
	public List<Board> searchBoardList(Connection conn, PageInfo pi, String category, String search){
		
		List<Board> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String front = "SELECT * "
				+ "		  FROM ( "
				+ "		        SELECT ROWNUM RNUM, A.* "
				+ "		          FROM (";
		String sql = prop.getProperty("searchBoardList");
		
		if(category.equals("title")) {
			sql += "and board_title like ?";
		}else {
			sql += "and user_id like ?";
		}
		sql += "               ORDER "
				+ "           BY BOARD_NO DESC )A "
				+ "		        ) "
				+ "		 WHERE RNUM BETWEEN ? AND ?";
		sql = front + sql;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + search + "%");
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_no"),
								   rset.getString("board_title"),
								   rset.getString("user_id"),
								   rset.getDate("enroll_date"),
								   rset.getInt("read_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	
	
	public int searchThumbnailListCount(Connection conn, String category, String search) {
		int searchListCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchThumbnailListCount");
		
		if(category.equals("title")) {
			sql += "and board_title like ?";
		}else {
			sql += "and user_id like ?";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				searchListCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}	
		return searchListCount;
	}
	
	
	public List<Board> searchThumbnailList(Connection conn, PageInfo pi, String category, String search){
		
		List<Board> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String front = "SELECT * "
				+ "		  FROM ( "
				+ "		        SELECT ROWNUM RNUM, A.* "
				+ "		          FROM (";
		String sql = prop.getProperty("searchThumbnailList");
		
		if(category.equals("title")) {
			sql += "and board_title like ?";
		}else {
			sql += "and user_id like ?";
		}
		sql += "               ORDER "
				+ "           BY BOARD_NO DESC )A "
				+ "		        ) "
				+ "		 WHERE RNUM BETWEEN ? AND ?";
		sql = front + sql;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + search + "%");
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setBoardWriter(rset.getString("user_id"));
				b.setEnrollDate(rset.getDate("enroll_date"));
				b.setReadCount(rset.getInt("read_count"));
				b.setTitleImgURL(rset.getString("titleimg_url"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	
	
	
	
	
	//------------------------------------------------------------------------------------
	
	
	
	/**
	 * 관리자-검색된 게시글의 총 갯수 조회
	 * 
	 * @author 김영주
	 * @param conn
	 * @param hmKey => 게시판유형, 검색유형, 검색키워드 담겨있는 HashMap<String, String>
	 * @return listCount => 검색된 게시글의 총 개수(int)
	 */
	public int searchBoardListCount(Connection conn, HashMap<String, String> hmKey) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchBoardListCount");
		
		if(!hmKey.get("keyword").equals("")) { // 키워드 "" X => 검색 조회
			
			// 게시판 유형이 전체 | 자유OR 포토인지
			if(!hmKey.get("boardType").equals("0")) { // 게시판 유형 전체 x => 게시판 유형 자유 | 포토
				
				sql += "AND BOARD_TYPE = " + hmKey.get("boardType");
				
			} 
			
			// 검색 유형이 아이디 | 제목인지
			if(hmKey.get("searchType").equals("userId")) {
				// 아이디 검색일 때
				sql += "AND USER_ID LIKE \'%" + hmKey.get("keyword") + "%\'";
			}else {
				// 제목 검색일 때
				sql += "AND BOARD_TITLE LIKE \'%" + hmKey.get("keyword") + "%\'";
			}
			
		} else {
			// 게시판 유형이 전체 | 자유OR 포토인지
			if(!hmKey.get("boardType").equals("0")) { // 게시판 유형 전체 x => 게시판 유형 자유 | 포토
				
				sql += "AND BOARD_TYPE = " + hmKey.get("boardType");
				
			} 
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return listCount ;
		
	}
	
	/**
	 * 관리자 - 게시글관리  검색 조회
	 * 
	 * @author 김영주
	 * @param conn
	 * @param hmKey => 게시판유형, 검색유형, 검색키워드 담겨있는 HashMap<String, String>
	 * @param pi => PageInfo
	 * @return list => 검색 결과에 맞는 게시글 데이터들이 담겨있는 List<Board>
	 */
	public List<Board> searchBoardKeyword(Connection conn, HashMap<String, String> hmKey, PageInfo pi){
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String[] typeArr = {"1", "2"};
		
		
		
		String firSql = "SELECT * FROM ( SELECT ROWNUM RNUM, A.* FROM (";
		String midSql = prop.getProperty("searchBoardKeyword");
		
		if(!hmKey.get("keyword").equals("")) { // 키워드 "" X => 검색 조회
			// 게시판 유형이 전체 | 자유OR 포토인지
			if(!hmKey.get("boardType").equals("0")) { // 게시판 유형 전체 x => 게시판 유형 자유 | 포토
				
				midSql += "AND BOARD_TYPE = " + hmKey.get("boardType");
			} 
			
			// 검색 유형이 아이디 | 제목인지
			if(hmKey.get("searchType").equals("userId")) {
				// 아이디 검색일 때
				midSql += "AND USER_ID LIKE \'%" + hmKey.get("keyword") + "%\'";
			}else {
				// 제목 검색일 때
				midSql += "AND BOARD_TITLE LIKE \'%" + hmKey.get("keyword") + "%\'";
			}
		}else {
			// 게시판 유형이 전체 | 자유OR 포토인지
			if(!hmKey.get("boardType").equals("0")) { // 게시판 유형 전체 x => 게시판 유형 자유 | 포토
			
				midSql += "AND BOARD_TYPE = " + hmKey.get("boardType");
				
			} 
		}
			
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		String endSql = "ORDER BY BOARD_NO DESC  ) A ) WHERE RNUM BETWEEN " + startRow + " AND " + endRow;
		String sql = firSql + midSql + endSql;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setBoardType(rset.getInt("board_type"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setBoardContent(rset.getString("board_content"));
				b.setBoardWriter(rset.getString("user_id"));
				b.setEnrollDate(rset.getDate("enroll_date"));
				b.setReadCount(rset.getInt("read_count"));
				
				list.add(b);
				
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	/**
	 * 관리자-게시글관리=> 포토게시판 첨부파일 조회
	 * 
	 * @author 김영주
	 * @param conn
	 * @return list => 참조유형이 'B'인 Attachment들이 담긴 List<Attachment>
	 */
	public List<Attachment> selectAttachmentList(Connection conn){
		List<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setRefBno(rset.getInt("REF_BNO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setFileLevel(rset.getInt("FILE_LEVEL"));
				
				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	/**
	 * 관리자- 게시글 선택 삭제
	 * 
	 * @author 김영주
	 * @param conn
	 * @param noArr => 글번호들이 담긴 String배열
	 * @return result => 처리 결과(int)
	 */
	public int deleteManagerBoard(Connection conn, String[] noArr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteManagerBoard") + "WHERE BOARD_NO IN (" + String.join(",", noArr) + ")";
		
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	/**
	 * 관리자 - 댓글관리  검색 조회
	 * 
	 * @author 김영주
	 * @param conn
	 * @param hmKey => 게시판유형, 검색유형, 검색키워드 담겨있는 HashMap<String, String>
	 * @param pi => PageInfo
	 * @return list => 검색 결과에 맞는 댓글 데이터들이 담겨있는 List<Reply>
	 */
	public List<Reply> searchReplyKeyword(Connection conn, HashMap<String, String> hmKey, PageInfo pi){
		List<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String firSql = "SELECT * FROM ( SELECT ROWNUM RNUM, A.* FROM (";
		String midSql = prop.getProperty("searchReplyKeyword");
		
		if(!hmKey.get("keyword").equals("")) { // 키워드 "" X => 검색 조회
			
			// 게시판 유형이 전체 | 자유OR 포토인지
			if(!hmKey.get("boardType").equals("0")) { // 게시판 유형 전체 x => 게시판 유형 자유 | 포토
				
				midSql += "AND BOARD_TYPE = " + hmKey.get("boardType");
			} 
			
			// 검색 유형이 아이디 | 댓글 내용인지
			if(hmKey.get("searchType").equals("userId")) {
				// 아이디 검색일 때
				midSql += "AND USER_ID LIKE \'%" + hmKey.get("keyword") + "%\'";
			}else {
				// 댓글 내용 검색일 때
				midSql += "AND REPLY_CONTENT LIKE \'%" + hmKey.get("keyword") + "%\'";
			}

		}else {
			// 게시판 유형이 전체 | 자유OR 포토인지
			if(!hmKey.get("boardType").equals("0")) { // 게시판 유형 전체 x => 게시판 유형 자유 | 포토
				
				midSql += "AND BOARD_TYPE = " + hmKey.get("boardType");
			} 
		}
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		String endSql = "ORDER BY REPLY_NO DESC  ) A ) WHERE RNUM BETWEEN " + startRow + " AND " + endRow;
        
        String sql = firSql + midSql + endSql;

        try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reply r = new Reply(
									  rset.getInt("reply_no")
									, rset.getString("user_id")
									, rset.getInt("board_type")
									, rset.getInt("reply_bno")
									, rset.getString("reply_content")
									, rset.getString("enroll_date")
									, rset.getString("status")
									
						);
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
        
        return list;
        
	}
	
	/**
	 * 관리자-검색된 댓글의 총 갯수 조회
	 * 
	 * @param conn
	 * @param hmKey => 게시판유형, 검색유형, 검색키워드 담겨있는 HashMap<String, String>
	 * @return listCount => 검색된 댓글의 총 개수(int)
	 */
	public int searchReplyListCount(Connection conn, HashMap<String, String> hmKey) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("searchReplyListCount");
		if(!hmKey.get("keyword").equals("")) { // 키워드 "" X => 검색 조회
			
			// 게시판 유형이 전체 | 자유OR 포토인지
			if(!hmKey.get("boardType").equals("0")) { // 게시판 유형 전체 x => 게시판 유형 자유 | 포토
				
				sql += "AND BOARD_TYPE = " + hmKey.get("boardType");
			} 
			
			// 검색 유형이 아이디 | 댓글 내용인지
			if(hmKey.get("searchType").equals("userId")) {
				// 아이디 검색일 때
				sql += "AND USER_ID LIKE \'%" + hmKey.get("keyword") + "%\'";
			}else {
				// 댓글 내용 검색일 때
				sql += "AND REPLY_CONTENT LIKE \'%" + hmKey.get("keyword") + "%\'";
			}
		}else {
			// 게시판 유형이 전체 | 자유OR 포토인지
			if(!hmKey.get("boardType").equals("0")) { // 게시판 유형 전체 x => 게시판 유형 자유 | 포토
				
				sql += "AND BOARD_TYPE = " + hmKey.get("boardType");
			} 
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	
	/**
	 * 관리자-댓글 선택 삭제(글상태 'N'으로 변경)
	 * 
	 * @author 김영주
	 * @param conn
	 * @param noArr => 글번호들이 담긴 String배열
	 * @return result => 처리 결과(int)
	 */
	public int deleteManagerReply (Connection conn, String[] noArr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteManagerReply") + "WHERE REPLY_NO IN (" + String.join(",", noArr) + ")";
		
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**
	 * 관리자 - 리뷰글 검색 조회 
	 * 
	 * @param conn
	 * @param hmKey => 별점유형, 검색유형, 검색키워드 담겨있는 HashMap<String, String>
	 * @param pi
	 * @return list => 검색 결과에 맞는 리뷰들이 담긴 List<Review>
	 */
	public List<Review> searchReviewKeyword(Connection conn, HashMap<String, String> hmKey, PageInfo pi){
		List<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String firSql = "SELECT *  FROM (";
		String midSql = prop.getProperty("searchReviewKeyword");
		
		if(!hmKey.get("keyword").equals("")) { // 키워드 "" X => 검색 조회
			
			// 별점이 전체 | 별점별 조회 인지
			if(!hmKey.get("rate").equals("0")) { // 게시판 유형 전체 x => 게시판 유형 자유 | 포토
				
				midSql += "AND RE_STAR = " + hmKey.get("rate");
			} 
			
			// 검색 유형이 아이디 | 상품명인지
			if(hmKey.get("searchType").equals("userId")) {
				// 아이디 검색일 때
				midSql += "AND USER_ID LIKE \'%" + hmKey.get("keyword") + "%\'";
			}else {
				// 상품명 검색일 때
				midSql += "AND PRO_NAME LIKE \'%" + hmKey.get("keyword") + "%\'";
			}

		}else {
			// 별점이 전체 | 선택 인지
			if(!hmKey.get("rate").equals("0")) { // 별점 전체 x => 별점별(1|2|3|4|5)
				
				midSql += "AND RE_STAR = " + hmKey.get("rate");
			} 
		}
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		String endSql = ") WHERE RANK BETWEEN " + startRow + " AND " + endRow;
        
        String sql = firSql + midSql + endSql;

        try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			int i = 0; // 첫행 일때 | list.add(r) 했을 때
			while(rset.next()) {
				
				int currReNo = rset.getInt("re_no");
				
				if(i != 0 && list.get(i-1).getReNo() == currReNo) { // 첫 행이 아니고 전행의 글번호와 현 행의 글번호가 같다(전행에 이미 리뷰객체 생성됨 &첨부파일이 여러개, 전행에서 atList 생성되어있음)
					// 첨부파일 이 있다
					Attachment at = new Attachment();
					// 첨부파일관련값 담고 
					at.setFileNo(rset.getInt("file_no"));
					at.setRefBno(rset.getInt("ref_bno"));
					at.setRefType(rset.getString("ref_type"));
					at.setOriginName(rset.getString("origin_name"));
					at.setChangeName(rset.getString("change_name"));
					at.setFilePath(rset.getString("file_path"));
					at.setFileLevel(rset.getInt("file_level"));
					
					// list의 전인덱스의 atList에 추가
					list.get(i-1).getAtList().add(at);
					
				}else { // 첫 행 | 전행의 글번호화 현 행의 글번호가 다르다
					
					// 리뷰객체 생성
					Review r = new Review();
					
					// 글번호(currReNo)담기
					r.setReNo(currReNo);
					
					// 다른값들도 담기
					r.setProNo(rset.getInt("pro_no"));
					r.setProName(rset.getString("pro_name"));
					r.setReWriter(rset.getString("user_id"));
					r.setReTitle(rset.getString("re_title"));
					r.setReContent(rset.getString("re_content"));
					r.setReStar(rset.getInt("re_star"));
					r.setEnrollDate(rset.getString("enroll_date"));
					r.setReadCount(rset.getInt("read_count"));
					r.setStatus(rset.getString("status"));
					r.setMacroNo(rset.getInt("macro_no"));
					r.setReview(rset.getString("review"));
					
					
					String changeName = rset.getString("change_name");
					if(changeName != null) { // 첨부파일이 있다.
						List<Attachment> atList = new ArrayList<>();
						Attachment at = new Attachment();
						// 첨부파일관련값 담고 
						at.setFileNo(rset.getInt("file_no"));
						at.setRefBno(rset.getInt("ref_bno"));
						at.setRefType(rset.getString("ref_type"));
						at.setOriginName(rset.getString("origin_name"));
						at.setChangeName(rset.getString("change_name"));
						at.setFilePath(rset.getString("file_path"));
						at.setFileLevel(rset.getInt("file_level"));
						
						atList.add(at);
						
						r.setAtList(atList);
					}
					
					list.add(r);
					i++;
				}
			
				 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
        
        return list;
	}
	
	
	/**
	 * 관리자-검색된 리뷰글의 총 갯수 조회
	 * 
	 * @author 김영주 
	 * @param conn
	 * @param hmKey => 별점유형, 검색유형, 검색키워드 담겨있는 HashMap<String, String>
	 * @return listCount => 검색된 리뷰글의 총 개수(int) 
	 */
	public int searchReviewListCount(Connection conn, HashMap<String, String> hmKey) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchReviewListCount");
		
		if(!hmKey.get("keyword").equals("")) { // 키워드 "" X => 검색 조회
			
			// 별점이 전체 | 별점별 조회 인지
			if(!hmKey.get("rate").equals("0")) { // 게시판 유형 전체 x => 게시판 유형 자유 | 포토
				
				sql += "AND RE_STAR = " + hmKey.get("rate");
			} 
			
			// 검색 유형이 아이디 | 상품명인지
			if(hmKey.get("searchType").equals("userId")) {
				// 아이디 검색일 때
				sql += "AND USER_ID LIKE \'%" + hmKey.get("keyword") + "%\'";
			}else {
				// 상품명 검색일 때
				sql += "AND PRO_NAME LIKE \'%" + hmKey.get("keyword") + "%\'";
			}

		}else {
			// 별점이 전체 | 선택 인지
			if(!hmKey.get("rate").equals("0")) { // 별점 전체 x => 별점별(1|2|3|4|5)
				
				sql += "AND RE_STAR = " + hmKey.get("rate");
			} 
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	/**
	 * 관리자 - 리뷰답변 매크로 등록
	 * 
	 * @author 김영주
	 * @param conn
	 * @param macContent => 매크로에 등록하고자하는 내용
	 * @return result => 처리 결과 (int)
	 */
	public int insertMacro(Connection conn, String macContent) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMacro");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, macContent);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 관리자 - 매크로 답변 목록 조회
	 * 
	 * @author 김영주
	 * @param conn
	 * @return list => 매크로 데이터 담긴 List<Macro>
	 */
	public List<Macro> selectMacro (Connection conn){
		List<Macro> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMacro");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Macro(rset.getInt("macro_no")
								  , rset.getString("macro_content")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	/**
	 * 관리자-매크로 답변 삭제
	 * 
	 * @author 김영주
	 * @param conn
	 * @param macroNo => 삭제할 매크로 번호
	 * @return result => 처리결과(int)
	 */
	public int deleteMacro (Connection conn, String macroNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMacro");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, macroNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**
	 * 관리자 - 리뷰 답변 등록
	 * 
	 * @author 김영주
	 * @param conn
	 * @param r => 리뷰글 번호, 리뷰답변내용 담긴 vo객체(Review)
	 * @return result => 처리 결과(int)
	 */
	public int insertManagerReview(Connection conn, Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertManagerReview");
		 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReview());
			pstmt.setInt(2, r.getReNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**
	 * 관리자-리뷰 선택 삭제(글상태 'D'으로 변경)
	 * 
	 * @author 김영주
	 * @param conn
	 * @param noArr => 글번호들이 담긴 String배열
	 * @return result => 처리 결과(int)
	 */
	public int deleteManagerReview(Connection conn, String[] noArr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteManagerReview") + " WHERE RE_NO IN (" + String.join(",", noArr) + ")";
		
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	
	}

	public List<Review> selectReviewList(Connection conn, PageInfo pi) {
		
		List<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
        
        try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			int i = 0; // 첫행 일때 | list.add(r) 했을 때
			while(rset.next()) {
				
				int currReNo = rset.getInt("re_no");
				
				if(i != 0 && list.get(i-1).getReNo() == currReNo) { // 첫 행이 아니고 전행의 글번호와 현 행의 글번호가 같다(전행에 이미 리뷰객체 생성됨 &첨부파일이 여러개, 전행에서 atList 생성되어있음)
					// 첨부파일 이 있다
					Attachment at = new Attachment();
					// 첨부파일관련값 담고 
					at.setFileNo(rset.getInt("file_no"));
					at.setRefBno(rset.getInt("ref_bno"));
					at.setRefType(rset.getString("ref_type"));
					at.setOriginName(rset.getString("origin_name"));
					at.setChangeName(rset.getString("change_name"));
					at.setFilePath(rset.getString("file_path"));
					at.setFileLevel(rset.getInt("file_level"));
					
					// list의 전인덱스의 atList에 추가
					list.get(i-1).getAtList().add(at);
					
				}else { // 첫 행 | 전행의 글번호화 현 행의 글번호가 다르다
					
					// 리뷰객체 생성
					Review r = new Review();
					
					// 글번호(currReNo)담기
					r.setReNo(currReNo);
					
					// 다른값들도 담기
					r.setProNo(rset.getInt("pro_no"));
					r.setProName(rset.getString("pro_name"));
					r.setReWriter(rset.getString("user_id"));
					r.setReTitle(rset.getString("re_title"));
					r.setReContent(rset.getString("re_content"));
					r.setReStar(rset.getInt("re_star"));
					r.setEnrollDate(rset.getString("enroll_date"));
					r.setReadCount(rset.getInt("read_count"));
					r.setStatus(rset.getString("status"));
					r.setMacroNo(rset.getInt("macro_no"));
					r.setReview(rset.getString("review"));
					
					
					String changeName = rset.getString("change_name");
					if(changeName != null) { // 첨부파일이 있다.
						List<Attachment> atList = new ArrayList<>();
						Attachment at = new Attachment();
						// 첨부파일관련값 담고 
						at.setFileNo(rset.getInt("file_no"));
						at.setRefBno(rset.getInt("ref_bno"));
						at.setRefType(rset.getString("ref_type"));
						at.setOriginName(rset.getString("origin_name"));
						at.setChangeName(rset.getString("change_name"));
						at.setFilePath(rset.getString("file_path"));
						at.setFileLevel(rset.getInt("file_level"));
						
						atList.add(at);
						
						r.setAtList(atList);
					}
					
					list.add(r);
					i++;
				}
			
				 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
        
        return list;
	}
		
	

	public List<Attachment> selectAttachmentReview(Connection conn, int rNo) {
		List<Attachment> list = new ArrayList<>();
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachmentReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setRefBno(rset.getInt("REF_BNO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setFileLevel(rset.getInt("FILE_LEVEL"));
				
				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


}
