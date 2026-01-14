package com.formypet.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.board.model.service.BoardService;

/**
 * Servlet implementation class ManagerInsertMacroController
 */
@WebServlet("/insert.mac")
public class ManagerInsertMacroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerInsertMacroController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String macroContent = request.getParameter("content");
		
		int result = new BoardService().insertMacro(macroContent);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "매크로 답변이 성공적으로 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.mrv");
		}else {
			// 글상태 변경 요청 실패
			// 실패 => 에러페이지 + 에러문구 "매크로 등록 실패" => 포워딩
			//request.setAttribute("errorMsg", "매크로 등록에 실패했습니다.");
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
