package com.formypet.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.cs.model.service.FaqService;

/**
 * Servlet implementation class ManagerFaqChangeStatusController
 */
@WebServlet("/changeStatus.mfq")
public class ManagerFaqChangeStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerFaqChangeStatusController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = request.getParameter("status");
		String[] noArray = request.getParameterValues("no");
		
		int result = new FaqService().changeFaqStatus(status, noArray);
		
		if(result > 0) {
			// 글상태 변경 요청 성공
			request.getSession().setAttribute("alertMsg", "선택한 Faq들의 글상태가 성공적으로 " 
														  + (status.equalsIgnoreCase("Y") ? "보임" : "숨김")
														  + " 처리 되었습니다.");
			
			// FAQ목록페이지 재요청 => 리다이렉트
			response.sendRedirect(request.getContextPath() + "/list.mfq");
		}else {
			// 글상태 변경 요청 실패
			// 실패 => 에러페이지 + 에러문구 "FAQ 글상태 변경 실패" => 포워딩
			//request.setAttribute("errorMsg", "FAQ의 글상태 변경에 실패했습니다.");
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
