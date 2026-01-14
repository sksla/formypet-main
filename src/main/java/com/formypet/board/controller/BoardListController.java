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
 * Servlet implementation class BoardListController
 */
@WebServlet("/list.b")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; // 게시글 총 개수
		
		listCount = new BoardService().selectListCount();
		
		// 페이징바 만들기 위한 객체
		PageInfo pi= new PagingTemplate().Paging(request,"page",listCount,5,10);
				
		// 사용자가 요청한 게시글 목록
		List<Board> list = new BoardService().selectList(pi);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/board/boardList.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
