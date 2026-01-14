package com.formypet.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.board.model.service.BoardService;
import com.formypet.board.model.vo.Reply;
import com.formypet.common.model.vo.PageInfo;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxManagerRelplyListController
 */
@WebServlet("/search.mre")
public class AjaxManagerRelplyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxManagerRelplyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService bService = new BoardService();

		String boardType = request.getParameter("boardType");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		//System.out.println(boardType);
		
		HashMap<String, String> hmKey = new HashMap<>();
		hmKey.put("boardType", boardType);
		hmKey.put("searchType", searchType);
		hmKey.put("keyword", keyword);
		
		
		int listCount = bService.searchReplyListCount(hmKey);
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int pageLimit = 5;
		int boardLimit = 10;
		
		int maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage  = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Reply> list = bService.searchReplyKeyword(hmKey, pi);

		response.setContentType("application/json; charset=utf-8");
		HashMap<String, Object> hm = new HashMap<>();
		
		hm.put("list", list);
		hm.put("pi", pi);
		
		new Gson().toJson(hm, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
