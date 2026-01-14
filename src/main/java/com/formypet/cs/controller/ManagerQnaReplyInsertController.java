package com.formypet.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.formypet.cs.model.service.QnaService;
import com.formypet.cs.model.vo.Qna;
import com.formypet.member.model.vo.Member;

/**
 * Servlet implementation class ManagerQnaReplyInsertController
 */
@WebServlet("/insert.mqa")
public class ManagerQnaReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerQnaReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 글번호
		int qnaNo = Integer.parseInt(request.getParameter("no"));
		// 답변내용
		String replyContent = request.getParameter("content");
		
		HttpSession session = request.getSession();
		// 관리자 회원번호
		String answerWriter = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo()); 
		// 임시
		//String answerWriter = "1";
		
		Qna q = new Qna();
		q.setQnaNo(qnaNo);
		q.setAnswerWriter(answerWriter);
		q.setAnswerContent(replyContent);
		
		int result = new QnaService().insertQnaReply(q);
		
		if(result > 0) {
			// 등록 요청 성공
			request.getSession().setAttribute("alertMsg", "문의 답변이 성공적으로 등록되었습니다");
			
			// FAQ목록페이지 재요청 => 리다이렉트
			response.sendRedirect(request.getContextPath() + "/list.mqa");
		}else {
			// 글상태 변경 요청 실패
			// 실패 => 에러페이지 + 에러문구 "답변 등록 실패" => 포워딩
			//request.setAttribute("errorMsg", "답변 등록에 실패했습니다.");
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
