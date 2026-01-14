package com.formypet.manager.model.service;

import static com.formypet.common.template.JDBCTemplate.close;
import static com.formypet.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.formypet.manager.model.dao.ManagerDao;

public class ManagerService {

	private ManagerDao mgDao = new ManagerDao();
	
	/**
	 * 관리자 - 품절 상품 개수 조회
	 * 
	 * @author 김영주
	 * @return count => 품절 상품 개수
	 */
	public int countSoldOutProduct() {
		Connection conn = getConnection();
		
		int count = mgDao.countSoldOutProduct(conn);
		
		close(conn);
		
		return count;
	}
	
	
	/**
	 * 관리자-오늘 회원 가입한 회원 수 조회
	 * 
	 * @author 김영주
	 * @return count => 오늘 가입한 회원 수
	 */
	public int countTodayEnrollMember() {
		Connection conn = getConnection();
		
		int count = mgDao.countTodayEnrollMember(conn);
		
		close(conn);
		
		return count;
	}
	
	
	/**
	 * 관리자 - 오늘 등록된 답변 대기중인 문의글 개수 
	 * 
	 * @author 김영주
	 * @return count => 오늘 등록된 답변 대기중인 문의글 개수 
	 */
	public int countTodayEnrollQna() {
		Connection conn = getConnection();
		
		int count = mgDao.countTodayEnrollQna(conn);
		
		close(conn);
		
		return count;
	}
	
	
	/**
	 * 관리자- 관리자 메인 판매량(출고량) BEST 5 조회
	 * 
	 *  순위, 상품번호, 상품명, 가격, 총판매량, 대표이미지 을 담은 hm(HashMap<String, Object>)
	 * 을 List 객체에 담아서 반환 
	 *   
	 * @return list => 판매량 Best5의 상품 정보 담은 List<HashMap<String,Object>>
	 */
	public List<HashMap<String,Object>> bestSaleRateProList(){
		Connection conn = getConnection();
		List<HashMap<String,Object>> list = new ArrayList<>();
		
		list = mgDao.bestSaleRateProList(conn);
		
		close(conn);
		
		return list;
	}
	
	
	
}
