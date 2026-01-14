package com.formypet.product.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.common.model.vo.PageInfo;
import com.formypet.common.template.PagingTemplate;
import com.formypet.product.model.service.ProductService;
import com.formypet.product.model.vo.Stock;

/**
 * Servlet implementation class ManagerStockSearchController
 */
@WebServlet("/search.msto")
public class ManagerStockSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerStockSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		boolean check = true;
		String main = request.getParameter("main");
		String sub = request.getParameter("sub");
		String status = request.getParameter("status");
		String search = request.getParameter("search");
		
		Date dateStart = Date.valueOf(request.getParameter("dateStart"));
		Date dateEnd = Date.valueOf(request.getParameter("dateEnd"));
		System.out.println(dateStart);
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(dateEnd);
		cal1.add(Calendar.DATE, 1);
		dateEnd = new Date(cal1.getTimeInMillis());
		System.out.println(dateEnd);
		int listCount;
		
		Stock s = new Stock();
		s.setProMain(main);
		s.setProSub(sub);
		s.setStatus(status);
		s.setProName(search);
		
		listCount = new ProductService().selectSearchStockCount(s, dateStart, dateEnd);
		PageInfo pi = new PagingTemplate().Paging(request, "page", listCount, 5, 10);

		// * 사용자가 요청한 페이지에 보여져야될 게시글 목록
		List<Stock> list = new ProductService().selectSearchStockList(pi, s, dateStart, dateEnd);
		
		
		// 응답페이지 => /views/board/boardList.jsp
		// 응답데이터 => 사용자가 요청한 페이지상에 보여져야될 게시글 목록, 페이징바를 만들기위한 애들
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("check", check);
		request.getRequestDispatcher("/views/manager/product/mStockList.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
