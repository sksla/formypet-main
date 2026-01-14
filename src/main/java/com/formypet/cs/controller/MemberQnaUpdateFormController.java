package com.formypet.cs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.common.model.vo.Attachment;
import com.formypet.cs.model.service.QnaService;
import com.formypet.cs.model.vo.Qna;
import com.formypet.cs.model.vo.QnaCategory;

/**
 * Servlet implementation class MemberQnaUpdateForm
 */
@WebServlet("/updateForm.qo")
public class MemberQnaUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberQnaUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qnaNo = Integer.parseInt(request.getParameter("no"));

		QnaService qService = new QnaService();
		List<QnaCategory> list = qService.selectListCategory();
		Qna q = qService.selectQna(qnaNo);
		Attachment at = qService.selectAttachment(qnaNo);
		
		request.setAttribute("list", list);
		request.setAttribute("q", q);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("/views/cs/memberQnaUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
