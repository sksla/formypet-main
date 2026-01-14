package com.formypet.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.cs.model.service.QnaService;

/**
 * Servlet implementation class ManagerQnaDeleteController
 */
@WebServlet("/delete.mqa")
public class ManagerQnaDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerQnaDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] noArr = request.getParameterValues("no");
		
		int result = new QnaService().deleteManagerQna(noArr);
		
		if(result > 0) {
			// 글 삭제 요청 성공
			request.getSession().setAttribute("alertMsg", "선택된 글들이 성공적으로 삭제되었습니다.");
			
			// 1:1문의 목록페이지 재요청 => 리다이렉트
			response.sendRedirect(request.getContextPath() + "/list.mqa");
		}else {
			// 글상태 변경 요청 실패
			// 실패 => 에러페이지 + 에러문구 "1:1문의 글 삭제 실패" => 포워딩
			//request.setAttribute("errorMsg", "1:1문의 삭제에 실패했습니다.");
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
