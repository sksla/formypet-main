package com.formypet.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.common.model.vo.PageInfo;
import com.formypet.common.template.PagingTemplate;
import com.formypet.product.model.service.ProductService;
import com.formypet.product.model.vo.Product;

/**
 * Servlet implementation class ManagerProductListController
 */
@WebServlet("/list.mpro")
public class ManagerProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerProductListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		boolean check = false;
		int listCount;
		
		listCount = new ProductService().selectListCount();
		PageInfo pi = new PagingTemplate().Paging(request, "page", listCount, 5, 10);

		// * 사용자가 요청한 페이지에 보여져야될 게시글 목록
		List<Product> list = new ProductService().selectList(pi);
		
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("check", check);
		request.getRequestDispatcher("/views/manager/product/mProductList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
