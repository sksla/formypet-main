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
import com.formypet.common.model.vo.Attachment;

/**
 * Servlet implementation class ThumbnailUpdateFormController
 */
@WebServlet("/updateForm.th")
public class ThumbnailUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int thBoardNo = Integer.parseInt(request.getParameter("no"));
		
		BoardService bs = new BoardService();
		
		Board b = bs.thSelectBoard(thBoardNo);
		List<Attachment> list = bs.thSelectAttachmentList(thBoardNo);
		
		request.setAttribute("b", b);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/board/thumbnailUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
