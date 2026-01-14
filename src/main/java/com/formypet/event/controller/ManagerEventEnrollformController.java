package com.formypet.event.controller;

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
 * Servlet implementation class ManagerEventEnrollformController
 */
@WebServlet("/enrollForm.mev")
public class ManagerEventEnrollformController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerEventEnrollformController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;
		boolean check;
		if(request.getParameter("check") == null) {
			check = false;
		} else {
			check = true;
		}
		
		listCount = new ProductService().selectListCount();
		PageInfo pi = new PagingTemplate().Paging(request, "page", listCount, 5, 10);

		// * 사용자가 요청한 페이지에 보여져야될 게시글 목록
		List<Product> list = new ProductService().selectList(pi);
		
		for(Product p : list) {
			String code = null;
			String midd = null;
			if(p.getProMiddNo() == 1) {
				midd = "Food";
			} else if(p.getProMiddNo() == 2) {
				midd = "Snack";
			} else {
				midd = "Goods";
			}
			code = p.getProCateCode();
			code += "_";
			code += midd;
			code += "_";
			code += p.getProNo();
			p.setProCateCode(code);
		}
		
		// 응답페이지 => /views/board/boardList.jsp
		// 응답데이터 => 사용자가 요청한 페이지상에 보여져야될 게시글 목록, 페이징바를 만들기위한 애들
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("check", check);
		request.getRequestDispatcher("/views/manager/event/mEventEnrollForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
