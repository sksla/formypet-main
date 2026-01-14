package com.formypet.cs.model.service;

import static com.formypet.common.template.JDBCTemplate.close;
import static com.formypet.common.template.JDBCTemplate.commit;
import static com.formypet.common.template.JDBCTemplate.getConnection;
import static com.formypet.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.formypet.common.model.vo.Attachment;
import com.formypet.cs.model.dao.QnaDao;
import com.formypet.cs.model.vo.Qna;
import com.formypet.cs.model.vo.QnaCategory;

public class QnaService {
	
	private QnaDao qDao = new QnaDao();
	
	
	/**
	 * 관리자-1:1 문의 목록 조회
	 * 
	 * dao에 요청해서 받아낸 List<Qna>를 컨트롤러측에 반환
	 * 
	 * @author 김영주
	 * @return list => 조회된 Qna들이 담긴 List<Qna>
	 */
	public List<Qna> selectManagerQnaList(){
		Connection conn = getConnection();
		
		List<Qna> list = qDao.selectManagerQnaList(conn);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 관리자-1:1 문의 내용 답변 상세조회
	 * 
	 * @author 김영주
	 * @param qnaNo => 조회할 글번호
	 * @return q 조회된 데이터들 담긴 Qna 객체
	 */
	public Qna selectManagerQna(String qnaNo) {
		Connection conn = getConnection();
		
		Qna q = qDao.selectManagerQna(conn, qnaNo);
		
		close(conn);
		
		return q;
	}
	
	/**
	 * 관리자- 1:1 문의 답변 등록
	 * 
	 * 
	 * @author 김영주
	 * @param q => 글번호, 답변자회원번호, 답변내용담긴 vo객체 
	 * @return result => 처리된 행수(int)
	 */
	public int insertQnaReply(Qna q) {
		Connection conn = getConnection();
		
		int result = qDao.insertQnaReply(conn, q);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
	
		close(conn);
		
		return result;
	}
	
	/**
	 * 관리자-1:1 문의글 선택 삭제
	 * 
	 * 문의글 상태를 'D'로 변경 요청한 결과와 해당 문의글의 첨부파일 상태를 'N'으로 
	 * 변경 요청한 결과를 곱해 최종 결과 반환  
	 * 
	 * @author 김영주
	 * @param noArr => 글번호 담긴 String[]
	 * @return totalResult => 처리 결관 (int)
	 */
	public int deleteManagerQna(String[] noArr) {
		Connection conn = getConnection();
		
		int result1 = qDao.deleteManagerQna(conn, noArr);
		
		int result2 = qDao.deleteManagerQnaAttachment(conn, noArr);
		
		int totalResult = result1 * result2;
		
		if(totalResult > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return totalResult;
	}
	
	/**
	 * 1:1 문의 첨부파일 조회
	 * 
	 * @author 김영주
	 * @param qnaNo => 1:1 문의 글번호(String)
	 * @return at => 파일번호, 원본명,수정명,파일경로 담긴 vo객체
	 */
	public Attachment selectAttachment(String qnaNo) {
		Connection conn = getConnection();
		Attachment at = qDao.selectAttachment(conn, qnaNo);
		close(conn);
		return at;
	}

	/**
	 * 1:1 문의 등록 - 사용자(첨부파일 등록가능)
	 * 
	 * @author 이주리
	 * @param int형으로 결과값 받아 controller로 반환
	 * @return at => 파일번호, 원본명,수정명,파일경로 담긴 vo객체
	 */
	public int insertQna(Qna q, Attachment at) {
		Connection conn = getConnection();
	    int result1 = qDao.insertQna(conn, q);
	      
	    int result2 = 1;
	    if(at != null) {
	       result2 = qDao.insertAttachment(conn, at);
	    }
	      
	    if(result1 > 0 && result2 > 0) {
	       commit(conn);
	    }else {
	       rollback(conn);
	    }
	    close(conn);
	      
	    return result1 * result2;
	}
	/**
	 * 1:1 사용자 문의글 카테고리 리스트
	 * 
	 * @author 이주리
	 * @param Object형으로 list 결과값 받아 controller로 반환
	 * @return list => categoryNo, categoryName 담긴 object객체
	 */
	public List<QnaCategory> selectListCategory() {
	      Connection conn = getConnection();
	      List<QnaCategory> list = qDao.selectListCategory(conn);
	      
	      close(conn);
	      
	      return list;	
	}
	
	/**
	 * 1:1 내 문의 리스트 조회 - 사용자
	 * 
	 * @author 이주리
	 * @param Object형으로 list 결과값 받아 controller로 반환
	 * @return list => QNA테이블 컬럼 담긴 object객체
	 */
	public List<Qna> selectQnaList(int userNo) {
		
		Connection conn = getConnection();
		List<Qna> list = qDao.selectQnaList(conn, userNo);
		
		close(conn);
		
		return list;
		
	}

	public Qna selectQna(int qnaNo) {
		Connection conn = getConnection();
		
		Qna q = qDao.selectQna(conn, qnaNo);
		
		close(conn);
		
		return q;
	}

	public Attachment selectAttachment(int qnaNo) {
		Connection conn = getConnection();
		
		Attachment at = qDao.memberSelectAttachment(conn, qnaNo);
		
		close(conn);
		
		return at;
	}

	public int updateQna(Qna q, Attachment at) {
		  Connection conn = getConnection();
		  int result1 = qDao.updateQna(conn, q);
		  
		  int result2 = 1; // 변경사항없을경우 저장해도 데이터가남아야하기때문에 1로 둠
		  if(at != null) { // 새로 넘어온 첨부파일이 있었을 경우
			  if(at.getFileNo() != 0) { // 기존의 첨부파일이 있었을 경우
				  result2 = qDao.updateAttachment(conn, at);
			  }else { // 기존의 첨부파일이 없었을 경우
				  result2 = qDao.insertNewAttachment(conn, at);
			  }
		  }
		  
		  if(result1>0 && result2 > 0) {
			  commit(conn);
		  }else {
			  rollback(conn);
		  }
		  close(conn);
		  
		  return result1 * result2;
	}	
	
	
	

}
