package com.formypet.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.board.model.service.BoardService;
import com.formypet.board.model.vo.Review;
import com.formypet.common.model.vo.Attachment;
import com.formypet.common.model.vo.PageInfo;
import com.formypet.common.template.PagingTemplate;

/**
 * Servlet implementation class ReviewListController
 */
@WebServlet("/list.rv")
public class MemberReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;
		
		listCount = new BoardService().selectListCount();
		PageInfo pi = new PagingTemplate().Paging(request, "page", listCount, 5, 10);
		
		List<Review> re =  new BoardService().selectReviewList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("re", re);
		
		request.getRequestDispatcher("/views/board/memberReviewList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
