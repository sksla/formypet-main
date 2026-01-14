package com.formypet.member.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import static com.formypet.common.template.JDBCTemplate.*;

import com.formypet.common.model.vo.PageInfo;
import com.formypet.member.model.dao.MemberDao;
import com.formypet.member.model.vo.Member;
import com.formypet.product.model.vo.Product;

public class MemberService {

	private MemberDao mDao = new MemberDao();
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = mDao.insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int count = mDao.idCheck(conn, checkId);
		close(conn);
		
		return count;
	}

	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = /*JDBCTemplate.*/getConnection();
		Member loginUser = mDao.loginMember(conn, userId, userPwd);
		/*JDBCTemplate.*/close(conn);
		return loginUser;

	}

	public int insertKakaoMember(String userName, String email) {
		Connection conn = getConnection();
		int result = mDao.insertKakaoMember(conn, userName, email);
		close(conn);		
		
		return result;
	}

	public String selectUserId(String userName, String email) {
		String userId = null;
		Connection conn = getConnection();
		
		userId = mDao.selectUserId(conn, userName, email);
		close(conn);
		
		return userId;
	
	}

	public String selectUserPwd(String userId, String email) {
		String userPwd = null;
		Connection conn = getConnection();
		
		userPwd = mDao.selectUserPwd(conn, userId, email);
		close(conn);
		
		return userPwd;
	
	}

	public int selectMemberCount() {
		Connection conn = getConnection();
		int result = mDao.selectMemberCount(conn);
		close(conn);
		return result;
	}

	public List<Member> selectMemberList(PageInfo pi) {
		Connection conn = getConnection();
		List<Member> list = mDao.selectMemberList(conn, pi);
		close(conn);
		return list;
	}

	public int updateMember(Member m) {
		Connection conn = getConnection();
		int result = mDao.updateMember(conn, m);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteMember(int userNo) {
		Connection conn = getConnection();
		int result = mDao.deleteMember(conn, userNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int selectSearchCount(String main, String search) {
		Connection conn = getConnection();
		int result = mDao.selectSearchMember(conn, main, search);
		close(conn);
		return result;
	}

	public List<Member> selectSearchList(PageInfo pi, String main, String search) {
		Connection conn = getConnection();
		List<Member> list = mDao.selectSearchList(conn, pi, main, search);
		close(conn);
		return list;
	}

}
