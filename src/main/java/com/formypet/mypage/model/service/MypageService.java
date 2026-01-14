package com.formypet.mypage.model.service;

import static com.formypet.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.formypet.mypage.model.dao.MypageDao;
import com.formypet.mypage.model.vo.Delivery;
import com.formypet.member.model.vo.Member;
import com.formypet.mypage.model.vo.Order;
import com.formypet.mypage.model.vo.Point;
import com.formypet.mypage.model.vo.WishlistProduct;

public class MypageService {

    private final static MypageDao mDao = new MypageDao();

    // 회원 데이터 가져오기
    public Member getUserInfo(int userNo) {
        Connection conn = getConnection();
        Member m = mDao.getUserInfo(conn, userNo);
        close(conn);
        return m;
    }
    /*
    // 회원 데이터 배송지
    public Delivery getUserInfoAddress(int userNo) {
    	Connection conn = getConnection();
    	Delivery m = mDao.getUserInfoAddress(conn, userNo);
    	close(conn);
    	return m;
    }
*/
    // 포인트 불러오기
	public int getUserPoint(int userNo) {
		Connection conn = getConnection();
		int p = mDao.getUserPoint(conn, userNo);
		close(conn);
        return p;
	}

	// 회원 찜 수량 가져오기
	public int getUserWishCount(int userNo) {
		Connection conn = getConnection();
		int c = mDao.getUserWishCount(conn, userNo);
		close(conn);
		return c;
	}
	
	// 위시리스트 가져오기
	public List<WishlistProduct> getUserWishlistProducts(int userNo) {
		Connection conn = getConnection();
		List<WishlistProduct> list = mDao.getUserWishlistProducts(conn, userNo);
		close(conn);
		return list;
	}

	// 총 구매 누적 금액
	public int getTotalAmount(int userNo) {
		Connection conn = getConnection();
		int totalAmount = mDao.getTotalAmount(conn, userNo);
		close(conn);
		return totalAmount;
	}

	// 찜 전체 삭제 기능 구현
	public int deleteAllWishlist(int userNo) {
		Connection conn = getConnection();
		int result = mDao.deleteAllWishlist(conn, userNo);
	    close(conn);
	    return result;
	}
	
	// 찜 1개 삭제 기능 구현
	public int deleteOneWishlist(int userNo, int proNo) {
		Connection conn = getConnection();
		int result = mDao.deleteOneWishlist(conn, userNo, proNo);
	    close(conn);
	    return result;
	}
	
	// 적립금 정보 가져오기
	public List<Point> PointHistory(int userNo) {
		Connection conn = getConnection();
		List<Point> pointHistory = mDao.PointHistory(conn, userNo);
	    close(conn);
	    return pointHistory;
	}

	// 배송지 조회 하기
	public List<Delivery> getDeliveryInfo(int userNo) {
		Connection conn = getConnection();
		List<Delivery> result = mDao.getDeliveryInfo(conn, userNo);
	    close(conn);
	    return result;
	}

	// 기본 배송지 변경하기
	public int updateAddress(int userNo, int deliveryNo) {
		Connection conn = getConnection();
		int result = mDao.changeDefaultAddress(conn, userNo, deliveryNo);
	    close(conn);
	    return result;
	}

	// 배송지 삭제하기
	public int deleteAddress(int deliveryNo) {
		Connection conn = getConnection();
		int result = mDao.deleteAddress(conn, deliveryNo);
	    close(conn);
	    return result;
	}

	// 배송지 관리 추가하기 총 7개 데이터
	public int insertAddress(int userNo, String name, String phone, String postCode, String address, String detailAddress, boolean defaultCheck) {
		Connection conn = getConnection();
		int result = mDao.insertAddress(conn, userNo, name, phone, postCode, address, detailAddress, defaultCheck);
	    close(conn);
	    return result;
	}

	// 배송지 수정하기 위해 값을 가져옴
	public Delivery modifyAddress(int deliveryNo) {
		Connection conn = getConnection();
		Delivery delivery = mDao.modifyAddress(conn, deliveryNo);
	    close(conn);
	    return delivery;
	}

	
	// 회원 탈퇴하기
	public int Unregister(int userNo, String userPwd) {
		Connection conn = getConnection();
		int result = mDao.Unregister(conn, userNo, userPwd);
	    close(conn);
	    return result;
	}
	
	// 주문 출력하기
	public List<Order> orderSelect(int userNo) {
		Connection conn = getConnection();
		List<Order> result = mDao.orderSelect(conn, userNo);
		close(conn);
		return result;
	}
	
	// 회원수정
	public int MypageUpdate(com.formypet.member.model.vo.Member m) {
		Connection conn = getConnection();
		int result = mDao.MypageUpdate(conn, m);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	

}