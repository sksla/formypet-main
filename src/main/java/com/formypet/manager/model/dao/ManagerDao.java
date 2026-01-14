package com.formypet.manager.model.dao;

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

public class ManagerDao {

private Properties prop = new Properties();
	
	public ManagerDao() {
		try {
			prop.loadFromXML(new FileInputStream(ManagerDao.class.getResource("/db/mappers/manager-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 관리자 - 품절 상품 개수 조회
	 * 
	 * @author 김영주
	 * @param conn
	 * @return count => 품절 상품 개수
	 */
	public int countSoldOutProduct(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countSoldOutProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return count;
		
	}
	
	/**
	 * 관리자-오늘 회원 가입한 회원 수 조회
	 * 
	 * @author 김영주
	 * @param conn
	 * @return count => 오늘 가입한 회원 수
	 */
	public int countTodayEnrollMember(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countTodayEnrollMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return count;
	}
	
	/**
	 * 관리자 - 오늘 등록된 답변 대기중인 문의글 개수 
	 * 
	 * @author 김영주
	 * @param conn
	 * @return count => 오늘 등록된 답변 대기중인 문의글 개수 
	 */
	public int countTodayEnrollQna(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countTodayEnrollQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return count;
	}
	
	/**
	 * 관리자- 관리자 메인 판매량(출고량) BEST 5 조회
	 * 
	 *  순위, 상품번호, 상품명, 가격, 총판매량, 대표이미지 을 담은 hm(HashMap<String, Object>)
	 * 을 List 객체에 담아서 반환 
	 *   
	 * @param conn
	 * @return list => 판매량 Best5의 상품 정보 담은 List<HashMap<String,Object>>
	 */
	public List<HashMap<String,Object>> bestSaleRateProList(Connection conn){
		List<HashMap<String,Object>> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("bestSaleRateProList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				HashMap<String, Object> hm = new HashMap<>();
				
				hm.put("rank", rset.getInt("RANK"));
				hm.put("proNo", rset.getInt("pro_no"));
				hm.put("proName", rset.getString("pro_name"));
				hm.put("price", rset.getInt("price"));
				hm.put("totalSale", rset.getInt("sum"));
				hm.put("proMainImage", rset.getString("pro_main_image"));
				
				list.add(hm);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	
	
	
}
