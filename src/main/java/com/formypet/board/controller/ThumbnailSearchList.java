package com.formypet.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.board.model.service.BoardService;
import com.formypet.board.model.vo.Board;
import com.formypet.common.model.vo.PageInfo;
import com.formypet.common.template.PagingTemplate;

/**
 * Servlet implementation class ThumbnailSearchList
 */
@WebServlet("/search.th")
public class ThumbnailSearchList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailSearchList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int searchListCount; // 일반게시판 검색 개수
		String category = request.getParameter("category");
		String search = request.getParameter("search");
		request.setAttribute("category", category);
		request.setAttribute("search", search);
		
		searchListCount = new BoardService().searchThumbnailListCount(category, search);
		
		// 페이징바 만들기 위한 객체
		PageInfo pi= new PagingTemplate().Paging(request,"page",searchListCount,5,10);
				
		// 사용자가 요청한 게시글 목록
		List<Board> list = new BoardService().searchBoardList(pi, category, search);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("/views/board/boardSearchList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
