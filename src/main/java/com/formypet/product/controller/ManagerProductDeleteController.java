package com.formypet.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.product.model.service.ProductService;

/**
 * Servlet implementation class ManagerProductDeleteController
 */
@WebServlet("/delete.mpro")
public class ManagerProductDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerProductDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("들어오지?");
		int result = new ProductService().deleteProduct(no);
		System.out.println(result);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 상품이 삭제되었습니다.");
		} else {
			request.getSession().setAttribute("alertMsg", "상품 삭제에 실패했습니다.");
		}
		response.sendRedirect(request.getContextPath() + "/list.mpro?page=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
