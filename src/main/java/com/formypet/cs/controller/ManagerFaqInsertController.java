package com.formypet.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.cs.model.service.FaqService;
import com.formypet.cs.model.vo.Faq;

/**
 * Servlet implementation class ManagerFaqInsertController
 */
@WebServlet("/insert.mfq")
public class ManagerFaqInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerFaqInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String faqTitle = request.getParameter("title");
		String faqContent = request.getParameter("content");
		
		Faq f = new Faq();
		f.setFaqTitle(faqTitle);
		f.setFaqContent(faqContent);
		
		int result = new FaqService().insertFaq(f);
		
		if(result > 0) {
			// 등록 요청 성공
			request.getSession().setAttribute("alertMsg", "FAQ가 성공적으로 등록되었습니다");
			
			// FAQ목록페이지 재요청 => 리다이렉트
			response.sendRedirect(request.getContextPath() + "/list.mfq");
		}else {
			// 글상태 변경 요청 실패
			// 실패 => 에러페이지 + 에러문구 "FAQ 등록 실패" => 포워딩
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
