package com.formypet.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.board.model.vo.Review;
import com.formypet.common.model.vo.Attachment;
import com.formypet.common.model.vo.PageInfo;
import com.formypet.common.template.PagingTemplate;
import com.formypet.member.model.vo.Member;
import com.formypet.product.model.service.ProductService;
import com.formypet.product.model.vo.Product;

/**
 * Servlet implementation class ProductDetailPage
 */
@WebServlet("/detail.pro")
public class ProductDetailPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int proNo = Integer.parseInt(request.getParameter("no"));

		int listCount;
		
		listCount = new ProductService().selectProReviewCount(proNo);
		PageInfo pi = new PagingTemplate().Paging(request, "page", listCount, 5, 5);
		
		Product p = new ProductService().selectProduct(proNo);
		List<Attachment> at = new ProductService().selectAttachment(proNo);
		List<Review> re = new ProductService().selectProReviewList(proNo);
		
		int userNo =0;
		int wish = 0; 
		if((Member)request.getSession().getAttribute("loginUser")!= null) {
			userNo= ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			wish = new ProductService().selectWishProduct(proNo, userNo);
			
			request.setAttribute("wish", wish);
		}
		
		request.setAttribute("pi", pi);
		request.setAttribute("re", re);
		request.setAttribute("p", p);
		request.setAttribute("at", at);
		request.getRequestDispatcher("/views/product/productDetailPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
