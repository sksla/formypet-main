package com.formypet.board.model.service;

import static com.formypet.common.template.JDBCTemplate.close;
import static com.formypet.common.template.JDBCTemplate.commit;
import static com.formypet.common.template.JDBCTemplate.getConnection;
import static com.formypet.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

import com.formypet.board.model.dao.BoardDao;
import com.formypet.board.model.vo.Board;
import com.formypet.board.model.vo.Macro;
import com.formypet.board.model.vo.Reply;
import com.formypet.board.model.vo.Review;
import com.formypet.common.model.vo.Attachment;
import com.formypet.common.model.vo.PageInfo;
import com.formypet.product.model.vo.Product;

public class BoardService {
	
	private BoardDao bDao = new BoardDao();
	
	// 게시글 총 개수 조회메소드
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = bDao.selectListCount(conn);
		
		close(conn);
		return listCount;
		
	}
	// 일반게시글 전체 조회메소드
	public List<Board> selectList(PageInfo pi) {
		Connection conn = getConnection();
		List<Board> list = bDao.selectList(conn, pi);
		
		return list;
		
	}
	
	//  조회수 증가 메소드
	public int increaseCount(int boardNo) {
		Connection conn = getConnection();
		int result = bDao.increaseCount(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 게시글 상세페이지 조회 메소드
	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		Board b = bDao.selectBoard(conn, boardNo);
		close(conn);
		return b;
		
	}
	
	// 게시글 작성
	public int insertBoard(Board b) {
		Connection conn = getConnection();
		int result = bDao.insertBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	// 게시글 수정
	
	public int updateBoard(Board b) {
		Connection conn = getConnection();
		
		int result = bDao.updateBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 사진 게시글 총 개수 조회메소드
		public int selectThListCount() {
			Connection conn = getConnection();
			int thListCount = bDao.selectThListCount(conn);
			
			close(conn);
			return thListCount;
			
		}
	
	// 사진게시판 게시글 작성
	
	public int insertThumbnailBoard(Board b, List<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = bDao.insertThBoard(conn, b);
		int result2 = bDao.insertThAttachment(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1 * result2;
	}
	
	// 사진게시판 목록
	
	public List<Board> selectThumbnailList(PageInfo pi){
		Connection conn = getConnection();
		List<Board> list = bDao.selectThumbnailList(conn,pi);
		
		close(conn);
		return list;
	}
	
	// 사진게시글 상세페이지 조회 메소드(Board)
	public Board thSelectBoard(int thBoardNo) {
		Connection conn = getConnection();
		Board b = bDao.thSelectBoard(conn, thBoardNo);
		close(conn);
		return b;
		
	}
	
	public List<Attachment> thSelectAttachmentList(int thBoardNo){
		Connection conn = getConnection();
		List<Attachment> list = bDao.thSelectAttachmentList(conn, thBoardNo);
		
		close(conn);
		
		return list;
		
	}
	
	// 일반게시판 댓글
	public List<Reply> selectReplyList(int boardNo){
		Connection conn = getConnection();
		List<Reply> list = bDao.selectReplyList(conn, boardNo);
		close(conn);
		return list;
	}
	
	public int insertReply(Reply r) {
		Connection conn = getConnection();
		int result = bDao.insertReply(conn , r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 게시글 삭제
	
	public int deleteBoard(int boardNo) {
		
		Connection conn = getConnection();
		
		
		int result = bDao.deleteBoard(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;
	}
	
	// 검색된 일반게시글 개수
	public int searchBoardListCount(String category, String search) {
		Connection conn = getConnection();
		int searchListCount = bDao.searchBoardListCount(conn ,category, search);
		
		close(conn);
		return searchListCount;
	}
	
	// 일반게시글 검색
	public List<Board> searchBoardList(PageInfo pi, String category, String search) {
		Connection conn = getConnection();
		List<Board> list = bDao.searchBoardList(conn, pi, category, search);
		
		
		return list;
		
	}
	
	// 검색된 사진게시글 개수
	public int searchThumbnailListCount(String category, String search){
		Connection conn = getConnection();
		int searchListCount = bDao.searchBoardListCount(conn ,category, search);
		
		close(conn);
		return searchListCount;
		
	}
	
	public List<Board> searchThumbnailList(PageInfo pi, String category, String search){
		Connection conn = getConnection();
		List<Board> list = bDao.searchThumbnailList(conn, pi, category, search);
		
		close(conn);
		return list;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 관리자-검색된 게시글의 총 갯수 조회
	 * 
	 * @author 김영주
	 * @param hmKey => 게시판유형, 검색유형, 검색키워드 담겨있는 HashMap<String, String>
	 * @return listCount => 검색된 댓글의 총 개수(int)
	 */
	public int searchBoardListCount(HashMap<String, String> hmKey) {
		Connection conn = getConnection();
		int listCount = bDao.searchBoardListCount(conn, hmKey);
		close(conn);
		return listCount;
	}
	
	/**
	 * 관리자-검색결과에 맞는 게시글들 조회하는 메소드
	 * 
	 * @author 김영주
	 * @param hmKey => 게시판유형, 검색유형, 검색키워드 담겨있는 HashMap<String, String>
	 * @param pi => PageInfo
	 * @return list => 검색 결과에 맞는 댓글 데이터들이 담겨있는 List<Board>
	 */
	public List<Board> searchBoardKeyword(HashMap<String, String> hmKey, PageInfo pi){
		Connection conn = getConnection();
		List<Board> list = bDao.searchBoardKeyword(conn, hmKey, pi);
		close(conn);
		
		return list;
	}
	
	/**
	 * 관리자-게시글관리=> 포토게시판 첨부파일 조회
	 * 
	 * @author 김영주 
	 * @return list => 참조유형이 'B'인 Attachment들이 담긴 List<Attachment>
	 */
	public List<Attachment> selectAttachmentList(){
		Connection conn = getConnection();
		List<Attachment> list = bDao.selectAttachmentList(conn);
		close(conn);
		
		return list;
	}
	
	
	/**
	 * 관리자-게시글 선택삭제
	 * 
	 * 처리결과에 따라 변경사항 commit(성공) | rollback(실패) 해줌
	 * @author 김영주
	 * @param noArr => 글번호들이 담긴 String배열
	 * @return result => 처리 결과(int)
	 */
	public int deleteManagerBoard(String[] noArr) {
		Connection conn = getConnection();
		int result = bDao.deleteManagerBoard(conn, noArr);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	/**
	 * 관리자-검색결과에 맞는 댓글들 조회하는 메소드
	 * 
	 * @author 김영주
	 * @param hmKey => 게시판유형, 검색유형, 검색키워드 담겨있는 HashMap<String, String>
	 * @param pi => PageInfo
	 * @return list => 검색 결과에 맞는 댓글 데이터들이 담겨있는 List<Reply>
	 */
	public List<Reply> searchReplyKeyword(HashMap<String, String> hmKey, PageInfo pi){
		Connection conn = getConnection();
		List<Reply> list = bDao.searchReplyKeyword(conn, hmKey, pi);
		close(conn);
		
		return list;
	}
	
	/**
	 * 관리자-검색된 댓글의 총 갯수 조회
	 * 
	 * @author 김영주
	 * @param hmKey => 게시판유형, 검색유형, 검색키워드 담겨있는 HashMap<String, String>
	 * @return listCount => 검색된 댓글의 총 개수(int)
	 */
	public int searchReplyListCount(HashMap<String, String> hmKey) {
		Connection conn = getConnection();
		int listCount = bDao.searchReplyListCount(conn, hmKey);
		close(conn);
		
		return listCount;
		
		
	}
	
	/**
	 * 관리자-댓글 선택삭제(글상태 'N'으로 변경)
	 * 
	 * 처리결과에 따라 변경사항 commit | rollback 해줌
	 * @author 김영주
	 * @param noArr => 글번호들이 담긴 String배열 
	 * @return result => 처리 결과(int)
	 */
	public int deleteManagerReply(String[] noArr) {
		Connection conn = getConnection();
		int result = bDao.deleteManagerReply(conn, noArr);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
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
	public List<Review> searchReviewKeyword(HashMap<String, String> hmKey, PageInfo pi){
		Connection conn = getConnection();
		List<Review> list = bDao.searchReviewKeyword(conn, hmKey, pi);
		close(conn);
		
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
	public int searchReviewListCount(HashMap<String, String> hmKey) {
		Connection conn = getConnection();
		int listCount = bDao.searchReviewListCount(conn, hmKey);
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 관리자 - 리뷰답변 매크로 등록
	 * 
	 * 처리결과(result)에 따라 변경사항 commit(성공) | rollback(실패) 해줌
	 * 
	 * @author 김영주
	 * @param macContent => 매크로에 등록하고자하는 내용
	 * @return result => 처리 결과 (int)
	 */
	public int insertMacro(String macContent) {
		Connection conn = getConnection();
		int result = bDao.insertMacro(conn, macContent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	/**
	 * 관리자 - 매크로 답변 목록 조회
	 * 
	 * @author 김영주
	 * @return list => 매크로 데이터 담긴 List<Macro>
	 */
	public List<Macro> selectMacro(){
		Connection conn = getConnection();
		List<Macro> list = bDao.selectMacro(conn);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 관리자-매크로 답변 삭제
	 * 
	 * 처리결과(result)에 따라 변경사항 commit(성공) | rollback(실패) 해줌
	 * 
	 * @author 김영주
	 * @param macroNo => 삭제할 매크로 번호
	 * @return result => 처리결과(int)
	 */
	public int deleteMacro(String macNo){
		Connection conn = getConnection();
		int result = bDao.deleteMacro(conn, macNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	/**
	 * 관리자 - 리뷰 답변 등록
	 * 
	 * 처리결과(result)에 따라 변경사항 commit(성공) | rollback(실패) 해줌
	 * 
	 * @author 김영주
	 * @param conn
	 * @param r => 리뷰글 번호, 리뷰답변내용 담긴 vo객체(Review)
	 * @return result => 처리 결과(int)
	 */
	public int insertManagerReview(Review r) {
		Connection conn = getConnection();
		
		int result = bDao.insertManagerReview(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	/**
	 * 관리자-리뷰글 선택 삭제(글상태 'D'으로 변경)
	 * 
	 * 처리결과(result)에 따라 변경사항 commit(성공) | rollback(실패) 해줌
	 * 
	 * @author 김영주
	 * @param noArr => 글번호들이 담긴 String배열
	 * @return result => 처리 결과(int)
	 */
	public int deleteManagerReview(String[] noArr) {
		Connection conn = getConnection();
		
		int result = bDao.deleteManagerReview(conn, noArr);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	public List<Review> selectReviewList(PageInfo pi) {
		Connection conn = getConnection();
		List<Review> list = bDao.selectReviewList(conn, pi);
		close(conn);
		
		return list;
		
	
	}

	
	public List<Attachment> selectAttachmentReview(int rNo) {
		Connection conn = getConnection();
		List<Attachment> list = bDao.selectAttachmentReview(conn, rNo);
		close(conn);
		
		return list;
	}

}
