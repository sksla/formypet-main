package com.formypet.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.common.model.vo.Attachment;
import com.formypet.cs.model.service.QnaService;
import com.formypet.cs.model.vo.Qna;

/**
 * Servlet implementation class MemberQnaDetailController
 */
@WebServlet("/detail.qo")
public class MemberQnaDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberQnaDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int qnaNo = Integer.parseInt(request.getParameter("no"));
		
		QnaService qService = new QnaService();
		
		Qna q = qService.selectQna(qnaNo);
		
		// Attachment테이블로부터 1:1 문의글의 첨부파일 정보 조회 (at객체 | null)
		Attachment at = qService.selectAttachment(qnaNo);
		
		request.setAttribute("q", q);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("/views/cs/memberQnaDetailForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
