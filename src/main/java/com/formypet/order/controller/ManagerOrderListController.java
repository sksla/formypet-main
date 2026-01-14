package com.formypet.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.common.model.vo.PageInfo;
import com.formypet.common.template.PagingTemplate;
import com.formypet.order.model.service.OrderService;
import com.formypet.order.model.vo.OrderDetail;

/**
 * Servlet implementation class ManagerOrderListController
 */
@WebServlet("/list.mor")
public class ManagerOrderListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerOrderListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean order = false;
		boolean cancel = false;
		boolean change = false;
		boolean reform = false;

		order = checkList(Integer.parseInt(request.getParameter("order")));
		cancel = checkList(Integer.parseInt(request.getParameter("cancel")));
		change = checkList(Integer.parseInt(request.getParameter("change")));
		reform = checkList(Integer.parseInt(request.getParameter("reform")));
			
		int listCount;
		PageInfo pi = null;
		listCount = new OrderService().selectOrderCount(order, cancel, change, reform);
		pi = new PagingTemplate().Paging(request, "page", listCount, 5, 10);			

		// * 사용자가 요청한 페이지에 보여져야될 게시글 목록
		List<OrderDetail> list = new OrderService().selectOrderList(pi, order, cancel, change, reform);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("order", order);
		request.setAttribute("cancel", cancel);
		request.setAttribute("change", change);
		request.setAttribute("reform", reform);
		request.getRequestDispatcher("/views/manager/order/mOrderList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public boolean checkList(int index) {
		boolean check = false;
		if(index == 1) {
			check = true;
		} else {
			check = false;
		}
		return check;
	}

}
