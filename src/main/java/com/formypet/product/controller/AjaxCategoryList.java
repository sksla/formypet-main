package com.formypet.product.controller;

import java.io.IOException;
import java.util.HashMap;
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
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxCategoryList
 */
@WebServlet("/cate.p")
public class AjaxCategoryList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCategoryList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cate = (String)request.getParameter("cate");
		String kind = (String)request.getParameter("kind");
		int listCount;
		
		listCount = new ProductService().selectCateCount(kind,cate);
		
		PageInfo pi = new PagingTemplate().Paging(request, "page", listCount, 5, 16);
		
		List<Product> list = new ProductService().selectCateProduct(cate,pi,kind);

		response.setContentType("application/json; charset=utf-8");
		HashMap<String, Object> hm = new HashMap<>();	
		hm.put("list", list);
		hm.put("pi", pi);
		
		new Gson().toJson(hm,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
