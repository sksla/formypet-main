package com.formypet.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static com.formypet.common.template.JDBCTemplate.*;

import com.formypet.common.model.vo.PageInfo;
import com.formypet.member.model.vo.Member;
import com.formypet.product.model.vo.Product;

public class MemberDao {

	private Properties prop = new Properties();
	
	public MemberDao() {
		try {
			prop.loadFromXML(new FileInputStream(MemberDao.class.getResource("/db/mappers/member-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getUserBirth());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getPhone());			
			pstmt.setString(8, m.getAddress());
			pstmt.setString(9, m.getAddressDetail());
			pstmt.setString(10, m.getAddressPost());
			pstmt.setInt(11, m.getStatusSns());
			pstmt.setInt(12, m.getStatusEmail());
			pstmt.setString(13, m.getPetType());
			pstmt.setString(14, m.getPetName());
			pstmt.setString(15, m.getPetKind());
			pstmt.setInt(16, m.getPetAge());
			pstmt.setString(17, m.getPetGender());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		 
		return count;
	}

	public Member loginMember(Connection conn, String userId, String userPwd) {

		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member( rset.getInt("user_no")
							  , rset.getString("user_id")
							  , rset.getString("user_pwd")
							  , rset.getString("user_name")
							  , rset.getString("user_birth")
							  , rset.getString("gender")
							  , rset.getString("email")
							  , rset.getString("phone")
							  , rset.getString("address")
							  , rset.getString("address_detail")
							  , rset.getString("address_post")
							  , rset.getDate("enroll_date")
							  , rset.getDate("modify_date")
							  , rset.getString("status")
							  , rset.getInt("status_sns")
							  , rset.getInt("status_email")
							  , rset.getDate("resign_date")
							  , rset.getString("pet_type")
							  , rset.getString("pet_name")
							  , rset.getString("pet_kind")
							  , rset.getInt("pet_age")
							  , rset.getString("pet_gender")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	
	}

	public int insertKakaoMember(Connection conn, String userName, String email) {

		int result = 0;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("kakaoLogin");
        
        try {
        	pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userName);
            pstmt.setString(2, email);
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
			e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }

	public String selectUserId(Connection conn, String userName, String email) {
		
		String userId = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserId");
		
		try {
			pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userName);
            pstmt.setString(2, email);
            rset = pstmt.executeQuery();

            if (rset.next()) {
                userId = rset.getString("USER_ID");
            }
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userId;
		
		
	
	}

	public String selectUserPwd(Connection conn, String userId, String email) {

		String userPwd = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, email);
            rset = pstmt.executeQuery();

            if (rset.next()) {
                userPwd = rset.getString("USER_PWD");
            }
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userPwd;
	
	}

	public int selectMemberCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public List<Member> selectMemberList(Connection conn, PageInfo pi) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String front = "SELECT *"
				+ "		  FROM ("
				+ "				SELECT ROWNUM RNUM, A.*"
				+ "				  FROM(";
		String sql = prop.getProperty("selectMemberList");
		
		sql += "ORDER"
				+ "						     BY user_no DESC"
				+ "					  ) A"
				+ "			  )"
				+ "		 WHERE RNUM BETWEEN ? AND ?";
		sql = front + sql;
		
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				Member m = new Member();
				m.setUserNo(rset.getInt("user_no"));
				m.setUserId(rset.getString("user_id"));
				m.setUserPwd(rset.getString("user_pwd"));
				m.setUserName(rset.getString("user_name"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setAddress(rset.getString("address"));
				m.setAddressDetail(rset.getString("address_detail"));
				m.setAddressPost(rset.getString("address_post"));
				m.setStatus(rset.getString("status"));
				m.setUserBirth(rset.getString("user_Birth"));
				m.setStatusEmail(rset.getInt("status_email"));
				m.setStatusSns(rset.getInt("status_sns"));
				m.setPetType(rset.getString("pet_type"));
				m.setPetName(rset.getString("pet_name"));
				m.setPetKind(rset.getString("pet_kind"));
				m.setPetAge(rset.getInt("pet_age"));
				m.setPetGender(rset.getString("pet_gender"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int updateMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getEmail());
			pstmt.setInt(3, m.getStatusEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setInt(5, m.getStatusSns());
			pstmt.setString(6, m.getAddressPost());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getAddressDetail());
			pstmt.setString(9, m.getUserBirth());
			pstmt.setString(10, m.getStatus());
			pstmt.setString(11, m.getPetType());
			pstmt.setString(12, m.getPetName());
			pstmt.setString(13, m.getPetKind());
			pstmt.setInt(14, m.getPetAge());
			pstmt.setString(15, m.getPetGender());
			pstmt.setInt(16, m.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteMember(Connection conn, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectSearchMember(Connection conn, String main, String search) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberCount");
		if(main.equals("no")) {
			System.out.println("no");
			sql += "where user_no like ?";
		} else if(main.equals("id")) {
			System.out.println("id");
			sql += "where user_id like ?";
		} else if(main.equals("name")) {
			System.out.println("name");
			sql += "where user_name like ?";			
		} else if(main.equals("phone")) {
			System.out.println("phone");
			sql += "where phone like ?";
		} else if(main.equals("birth")) {
			System.out.println("birth");
			sql += "where user_birth like ?";
		} else {
			sql += "where email like ?";
		}
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public List<Member> selectSearchList(Connection conn, PageInfo pi, String main, String search) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String front = "SELECT *"
				+ "		  FROM ("
				+ "				SELECT ROWNUM RNUM, A.*"
				+ "				  FROM(";
		String sql = prop.getProperty("selectMemberList");
		if(main.equals("no")) {
			sql += "where user_no like ?";
		} else if(main.equals("id")) {
			sql += "where user_id like ?";
		} else if(main.equals("name")) {
			sql += "where user_name like ?";			
		} else if(main.equals("phone")) {
			sql += "where phone like ?";
		} else if(main.equals("birth")) {
			sql += "where user_birth like ?";
		} else {
			sql += "where email like ?";
		}
		sql += "ORDER"
				+ "						     BY user_no DESC"
				+ "					  ) A"
				+ "			  )"
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
				Member m = new Member();
				m.setUserNo(rset.getInt("user_no"));
				m.setUserId(rset.getString("user_id"));
				m.setUserPwd(rset.getString("user_pwd"));
				m.setUserName(rset.getString("user_name"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setAddress(rset.getString("address"));
				m.setAddressDetail(rset.getString("address_detail"));
				m.setAddressPost(rset.getString("address_post"));
				m.setStatus(rset.getString("status"));
				m.setUserBirth(rset.getString("user_Birth"));
				m.setStatusEmail(rset.getInt("status_email"));
				m.setStatusSns(rset.getInt("status_sns"));
				m.setPetType(rset.getString("pet_type"));
				m.setPetName(rset.getString("pet_name"));
				m.setPetKind(rset.getString("pet_kind"));
				m.setPetAge(rset.getInt("pet_age"));
				m.setPetGender(rset.getString("pet_gender"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
}
