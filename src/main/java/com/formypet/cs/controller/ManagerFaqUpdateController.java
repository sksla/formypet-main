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
 * Servlet implementation class ManagerFaqUpdateController
 */
@WebServlet("/update.mfq")
public class ManagerFaqUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerFaqUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int faqNo = Integer.parseInt(request.getParameter("no"));
		String faqTitle = request.getParameter("title");
		String faqContent = request.getParameter("content");
		
		Faq f = new Faq();
		f.setFaqNo(faqNo);
		f.setFaqTitle(faqTitle);
		f.setFaqContent(faqContent);
		
		int result = new FaqService().updateFaq(f);
		
		if(result > 0) {
			// 성공 => 자주묻는질문 목록페이지 재요청(리다이렉트)
			// alert문구 "FAQ가 성공적으로 수정되었습니다."
			request.getSession().setAttribute("alertMsg", "FAQ가 성공적으로 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.mfq");
		}else {
			//실패 => 에러페이지(포워딩)
			//request.setAttribute("errorMsg", "FAQ 수정에 실패했습니다.");
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
