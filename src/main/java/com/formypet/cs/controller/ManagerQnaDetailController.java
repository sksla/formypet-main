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
 * Servlet implementation class ManagerQnaDetailController
 */
@WebServlet("/detail.mqa")
public class ManagerQnaDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerQnaDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String qnaNo = request.getParameter("no");
		
		QnaService qService = new QnaService();
		
		// Qna테이블에서 글번호,작성자아이디,카테고리명,제목,내용, 작성일, 글상태,답변자아이디,답변내용,답변일 조회
		Qna q = qService.selectManagerQna(qnaNo);
		
		// Attachment테이블로부터 1:1 문의글의 첨부파일 정보 조회 (at객체 | null)
		Attachment at = qService.selectAttachment(qnaNo);
		
		request.setAttribute("q", q);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("/views/manager/cs/mQnaReplyDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
