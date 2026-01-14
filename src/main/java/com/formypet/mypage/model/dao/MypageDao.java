package com.formypet.mypage.model.dao;

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

import com.formypet.mypage.model.vo.Delivery;
import com.formypet.member.model.vo.Member;
import com.formypet.mypage.model.vo.Order;
import com.formypet.mypage.model.vo.Point;
import com.formypet.mypage.model.vo.WishlistProduct;


public class MypageDao {

	private Properties prop = new Properties();
	
	public MypageDao() {
		try {
			prop.loadFromXML(new FileInputStream(MypageDao.class.getResource("/db/mappers/mypage-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member getUserInfo(Connection conn, int userNo) {
		
		Member m = null;
		
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("userInfo");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userNo);
            
            rset = pstmt.executeQuery();

            if (rset.next()) {
                m = new Member( rset.getString("USER_ID")
                			  , rset.getString("USER_NAME")
                			  , rset.getString("USER_BIRTH")
                			  , rset.getString("GENDER")
                			  , rset.getString("EMAIL")
                			  , rset.getString("PHONE")
                			  , rset.getString("ADDRESS")
                			  , rset.getString("ADDRESS_DETAIL")
                			  , rset.getString("ADDRESS_POST")
                			  , rset.getInt("STATUS_SNS")
                			  , rset.getInt("STATUS_EMAIL")
                			  , rset.getString("PET_TYPE")
                			  , rset.getString("PET_NAME")
                			  , rset.getString("PET_KIND")
                			  , rset.getInt("PET_AGE")
                			  , rset.getString("PET_GENDER")
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
	
	// 총 적립금 불러오기
	public int getUserPoint(Connection conn, int userNo) {

		int p = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("pointTotal");
		
		try {
			pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userNo);
			
            rset = pstmt.executeQuery();
            
            if (rset.next()) {
                p = rset.getInt("POINT_TOTAL");
            }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

	// 위시리스트 개수 가져오기
	public int getUserWishCount(Connection conn, int userNo) {
		
		int c = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("wishCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();
			
			if (rset.next()) {
                c = rset.getInt("WISH_COUNT");
            }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return c;
	}
	
	// 위시리스트 불러오기
	public List<WishlistProduct> getUserWishlistProducts(Connection conn, int userNo) {
		
		List<WishlistProduct> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("wishList");
		
		try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userNo);
            
            rset = pstmt.executeQuery();

            while (rset.next()) {
            	WishlistProduct product = new WishlistProduct(rset.getInt("PRO_NO") 
            							  , rset.getString("PRO_MAIN_IMAGE")
			                			  , rset.getString("PRO_NAME")
			                			  , rset.getInt("PRICE")
			                			  , rset.getInt("STOCK")
			                			  , rset.getString("STATUS")
            			);
            	list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
	}

	// 총 누적 구매 금액 불러오기
	public int getTotalAmount(Connection conn, int userNo) {

		int totalAmount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("totalAmount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
            
            rset = pstmt.executeQuery();
			
            if (rset.next()) {
                totalAmount = rset.getInt(1);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalAmount;
	}

	
	// 위시리스트 전체 삭제 기능 구현
	public int deleteAllWishlist(Connection conn, int userNo) {
		int result = 0;
	    PreparedStatement pstmt = null;
	    String sql = prop.getProperty("deleteAllWishlist");
		    
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
	// 위시리스트 1개만 삭제
	public int deleteOneWishlist(Connection conn, int userNo, int proNo) {
		int result = 0;
	    PreparedStatement pstmt = null;
	    String sql = prop.getProperty("deleteOneWishlist");
		    
	    try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, proNo);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	    
		return result;
	}
	
	// 적립금 사용 내역 가져오기
	public List<Point> PointHistory(Connection conn, int userNo) {
		
		List<Point> pointHistory = new ArrayList<>();
		PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("pointHistory");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userNo);
            
            rset = pstmt.executeQuery();

            while (rset.next()) {
            	Point point = new Point( rset.getInt("USER_NO")
                			  , rset.getInt("ORDER_NO")
                			  , rset.getDate("POINT_DATE")
                			  , rset.getInt("POINT_ADD_LIST")
                			  , rset.getInt("POINT_USE_LIST")
                			  , rset.getInt("POINT_REASON")
                		);
            	pointHistory.add(point);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return pointHistory;
	}

	// 배송지 조회 하기
	public List<Delivery> getDeliveryInfo(Connection conn, int userNo) {
		
		List<Delivery> delivery = new ArrayList<>();
		PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("deliveryInfo");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userNo);
            
            rset = pstmt.executeQuery();

            while (rset.next()) {
            	Delivery list = new Delivery( rset.getInt("DELIVERY_NO")
            				  , rset.getString("DELIVERY_NAME")
                			  , rset.getString("DELIVERY_RECEIVER")
                			  , rset.getString("PHONE")
                			  , rset.getString("POST")
                			  , rset.getString("ADDRESS")
                			  , rset.getString("ADDRESS_DETAIL")
                			  , rset.getString("STATUS").charAt(0)
                		);
            	delivery.add(list);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return delivery;
	}

	// 기본 배송지로 변경하기 선택한 배송지는 Y로 바꾸고 나머지는 N으로 바꿈
	public int changeDefaultAddress(Connection conn, int userNo, int deliveryNo) {
		int result = 0;
	    PreparedStatement pstmt = null;
	    String sql = prop.getProperty("updateAddressStatus");
		    
	    try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deliveryNo);
			pstmt.setInt(2, userNo);
			pstmt.setInt(3, deliveryNo);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	    
		return result;
	}

	// 배송지 삭제하기
	public int deleteAddress(Connection conn, int deliveryNo) {
		
		int result = 0;
	    PreparedStatement pstmt = null;
	    String sql = prop.getProperty("deleteAddress");
		    
	    try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deliveryNo);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	    
		return result;
	}
	
	// 배송지 추가하고 기존배송지로 할지 업데이트 하기
	public int insertAddress(Connection conn, int userNo, String name, String phone, String postCode, String address, String detailAddress, boolean defaultCheck) {

		int result1 = 0;
		int result2 = 0;
	    PreparedStatement pstmt1 = null;
	    PreparedStatement pstmt2 = null;
	    String sql1 = prop.getProperty("insertAddress");
	    String sql2 = prop.getProperty("updateAddress");
		    
	    try {
	    	// 기본 배송지로 선택(true) 시 기존 기본 배송지는 서브로 바꾸기 그 다음 배송지 추가 진행
	    	if(defaultCheck == true) {
	    		pstmt2 = conn.prepareStatement(sql2);
	    		pstmt2.setInt(1, userNo);
	    		
	    		result2 = pstmt2.executeUpdate();
	    	}
	    	
	    	// 배송지 추가
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, userNo);
			pstmt1.setString(2, name);
			pstmt1.setString(3, phone);
			pstmt1.setString(4, postCode);
			pstmt1.setString(5, address);
			pstmt1.setString(6, detailAddress);
			pstmt1.setString(7, defaultCheck ? "Y" : "N");
			
			result1 = pstmt1.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt1);
			close(pstmt2);
		}
	    
		return result1 * result2;
	}

	// 배송지 수정하기 위해 값을 가져옴
	public Delivery modifyAddress(Connection conn, int deliveryNo) {

		Delivery delivery = null;
		PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("modifyAddress");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, deliveryNo);
            
            rset = pstmt.executeQuery();

            while (rset.next()) {
            	delivery = new Delivery( rset.getString("DELIVERY_RECEIVER")
                			  , rset.getString("PHONE")
                			  , rset.getString("POST")
                			  , rset.getString("ADDRESS")
                			  , rset.getString("ADDRESS_DETAIL")
                			  , rset.getString("STATUS").charAt(0)
                		);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return delivery;
	}

	// 회원 탈퇴하기
	public int Unregister(Connection conn, int userNo, String userPwd) {
		
		int result = 0;
	    PreparedStatement pstmt = null;
	    String sql = prop.getProperty("updateUnregister");
		    
	    try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<Order> orderSelect(Connection conn, int userNo) {
		
		List<Order> orderlist = new ArrayList<>();
		PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("orderSelect");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userNo);
            
            rset = pstmt.executeQuery();

            while (rset.next()) {
                Order order = new Order(
            		rset.getInt("PRO_NO"),
                    rset.getString("PRO_MAIN_IMAGE"),
                    rset.getString("PRO_NAME"),
                    rset.getInt("COUNT"),
                    rset.getInt("PRICE"),
                    rset.getDate("ORDER_DATE")
                );

                orderlist.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return orderlist;
	}


	// 회원수정 
	public int MypageUpdate(Connection conn, Member m) {
		
		Member m2 = null;
		
		int result = 0;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("mypageUpdate");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, m.getUserName());
            pstmt.setString(2, m.getUserBirth());       
            pstmt.setString(3, m.getEmail());           
            pstmt.setString(4, m.getPhone());           
            pstmt.setString(5, m.getAddress());         
            pstmt.setString(6, m.getAddressDetail());   
            pstmt.setString(7, m.getAddressPost());     
            pstmt.setInt(8, m.getStatusSns());          
            pstmt.setInt(9, m.getStatusEmail());       
            pstmt.setString(10, m.getPetType());        
            pstmt.setString(11, m.getPetName());        
            pstmt.setString(12, m.getPetKind());        
            pstmt.setInt(13, m.getPetAge());            
            pstmt.setString(14, m.getPetGender());   
            pstmt.setInt(15, m.getUserNo());   
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
	}
	
	

}