package com.formypet.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.board.model.service.BoardService;

/**
 * Servlet implementation class ManagerDeleteBoardContorller
 */
@WebServlet("/delete.mbo")
public class ManagerDeleteBoardContorller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerDeleteBoardContorller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] noArr = request.getParameterValues("no");
	
		int result = new BoardService().deleteManagerBoard(noArr);
		
		if(result > 0) {
			// 글 삭제 요청 성공 => 댓글관리목록페이지(list/mbo) 재요청
			request.getSession().setAttribute("alertMsg", "선택된 게시글들이 성공적으로 삭제되었습니다.");
			
			// 댓글관리목록페이지 재요청
			response.sendRedirect(request.getContextPath() + "/list.mbo");
			
		}else {
			// 글상태 변경 요청 실패
			// 실패 => 에러페이지 + 에러문구 "게시글 삭제 실패" => 포워딩
			//request.setAttribute("errorMsg", "게시글 삭제에 실패했습니다.");
			//request.getRequestDispatcher("/views/manager/common/404errorPage.jsp"); 
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
