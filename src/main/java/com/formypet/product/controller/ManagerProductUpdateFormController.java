package com.formypet.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.common.model.vo.Attachment;
import com.formypet.product.model.service.ProductService;
import com.formypet.product.model.vo.Product;

/**
 * Servlet implementation class ManagerProductUpdateController
 */
@WebServlet("/updateForm.mpro")
public class ManagerProductUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerProductUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		Product p = new ProductService().selectProduct(no);
		List<Attachment> at = new ProductService().selectAttachment(no); 
		
		request.setAttribute("p", p);
		request.setAttribute("at", at);
		request.getRequestDispatcher("/views/manager/product/mProductUpdateForm.jsp").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
