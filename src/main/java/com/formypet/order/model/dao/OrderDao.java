package com.formypet.order.model.dao;

import static com.formypet.common.template.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.formypet.common.model.vo.PageInfo;
import com.formypet.order.model.vo.OrderDetail;
import com.formypet.product.model.dao.ProductDao;

public class OrderDao {
	
	private Properties prop = new Properties();
	
	public OrderDao() {
		try {
			prop.loadFromXML(new FileInputStream(OrderDao.class.getResource("/db/mappers/order-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertToCart(int proNo, int quantity, Connection conn, int userNo, int price) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertToCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, proNo);
			pstmt.setInt(3, quantity);
			pstmt.setInt(4, price*quantity);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int selectOrderCount(Connection conn, boolean order, boolean cancel, boolean change, boolean reform) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrderCount");
		if(order) {
			sql += "where status = 1";
		} else if(cancel) {
			sql += "where status = 2";
		} else if(change) {
			sql += "where status = 3";
		} else {
			sql += "where status = 4";
		}
			
			
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public List<OrderDetail> selectOrderList(Connection conn, PageInfo pi, boolean order, boolean cancel, boolean change, boolean reform) {
		List<OrderDetail> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String front = "SELECT *"
				+ "		  FROM ("
				+ "				SELECT ROWNUM RNUM, A.*"
				+ "				  FROM(";
		String sql = prop.getProperty("selectOrderList");
		if(order) {
			sql += "where status = 1";
		} else if(cancel) {
			sql += "where status = 2";
		} else if(change) {
			sql += "where status = 3";
		} else {
			sql += "where status = 4";
		}
		sql += "ORDER"
				+ "						     BY od_detail_no DESC"
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
				String midd = "";
				if(rset.getInt("pro_midd_no") == 1) {
					midd = "Food";
				} else if(rset.getInt("pro_midd_no") == 2) {
					midd = "Snack";
				} else {
					midd = "Goods";
				}
				OrderDetail od = new OrderDetail();
				od.setOrderDate(rset.getString("order_date"));
				od.setOrderNo(rset.getInt("order_no"));
				od.setUserName(rset.getString("user_name"));
				od.setUserId(rset.getString("user_id"));
				od.setPhone(rset.getString("phone"));
				od.setAddress(rset.getString("address"));
				od.setCode(rset.getString("pro_cate_code") + "_" + midd + "_" + rset.getInt("pro_no"));
				od.setProName(rset.getString("pro_name"));
				od.setCount(rset.getInt("count"));
				od.setDeliStatus(rset.getInt("deli_status"));
				list.add(od);
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
