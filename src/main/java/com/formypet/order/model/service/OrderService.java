package com.formypet.order.model.service;

import static com.formypet.common.template.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;

import com.formypet.common.model.vo.PageInfo;
import com.formypet.order.model.dao.OrderDao;
import com.formypet.order.model.vo.OrderDetail;

public class OrderService {
	
	OrderDao oDao = new OrderDao();

	public int insertToCart(int proNo, int quantity, int userNo,int price) {
		Connection conn = getConnection();
		int result = oDao.insertToCart(proNo,quantity,conn, userNo,price);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int selectOrderCount(boolean order, boolean cancel, boolean change, boolean reform) {
		Connection conn = getConnection();
		int result = oDao.selectOrderCount(conn, order, cancel, change, reform);
		close(conn);
		return result;
	}

	public List<OrderDetail> selectOrderList(PageInfo pi, boolean order, boolean cancel, boolean change, boolean reform) {
		Connection conn = getConnection();
		List<OrderDetail> list = oDao.selectOrderList(conn, pi, order, cancel, change, reform);
		close(conn);
		return list;
	}	

}
