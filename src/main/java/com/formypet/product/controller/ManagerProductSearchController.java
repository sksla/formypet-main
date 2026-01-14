package com.formypet.product.controller;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class ManagerProductSearchController
 */
@WebServlet("/search.mpro")
public class ManagerProductSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerProductSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;
		
		boolean check = true;
		String search = request.getParameter("search");
		String[] cate = request.getParameterValues("category");
		String[] midd = request.getParameterValues("middle");
		String category = String.join(",", cate);
		String middle = String.join(",", midd);
		//검색 정보 재 리턴
		request.setAttribute("category", category);
		request.setAttribute("middle", middle);
		request.setAttribute("search", search);
		
		listCount = new ProductService().selectSearchListCount(cate, middle, search);
		System.out.println(listCount);
		PageInfo pi = new PagingTemplate().Paging(request, "page", listCount, 5, 10);
		
		List<Product> list = new ProductService().searchProductList(pi, cate, middle, search);
		
		System.out.println(list.size());
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
