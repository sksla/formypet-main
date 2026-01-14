package com.formypet.product.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.product.model.service.ProductService;
import com.formypet.product.model.vo.Stock;

/**
 * Servlet implementation class ManagerStockInsertController
 */
@WebServlet("/insert.msto")
public class ManagerStockInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerStockInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String status = request.getParameter("status");
		String name = request.getParameter("name");
		int count = Integer.parseInt(request.getParameter("count"));
		int no = Integer.parseInt(request.getParameter("no"));
		Date date = Date.valueOf(request.getParameter("date"));

		Stock s = new Stock();
		s.setStatus(status);
		s.setProName(name);
		s.setCount(count);
		s.setProNo(no);
		s.setEnrollDate(date);
		
		int result = new ProductService().insertStock(s);
		
		if(result > 0) {// 성공
			response.sendRedirect(request.getContextPath()+"/list.msto?page=1");
		} else {// 실패
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
