package com.formypet.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.formypet.cs.model.service.NoticeService;
import com.formypet.cs.model.vo.Notice;
import com.formypet.member.model.vo.Member;

/**
 * Servlet implementation class ManagerNoticeInsertController
 */
@WebServlet("/insert.mno")
public class ManagerNoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerNoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		HttpSession session = request.getSession();
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		// 등록페이지에 input:hidden 으로 userNo값 넘길때
		//int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		Notice n = new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		n.setNoticeWriter(String.valueOf(userNo));
		
		int result = new NoticeService().insertNotice(n);
		
		
		if(result > 0) {
			// 성공 => 공지사항목록페이지(/views/manager/cs/mNoticeList.jsp) 응답
			//		 포워딩 x => request객체에 담긴게 없음
			//		 alert문구 "공지사항이 성공적으로 등록되었습니다"
			session.setAttribute("alertMsg", "공지사항이 성공적으로 등록되었습니다");
			
			// 리다이렉트방식 => url 재요청 == Servlet(ManagerNoticeListController) 실행
			response.sendRedirect(request.getContextPath() + "/list.mno");
		}else {
			// 실패 => 에러페이지 + 에러문구 "공지사항 등록 실패" => 포워딩
			//request.setAttribute("errorMsg", "공지사항 등록에 실패했습니다.");
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
