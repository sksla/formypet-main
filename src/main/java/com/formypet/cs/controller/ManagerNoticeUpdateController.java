package com.formypet.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.cs.model.service.NoticeService;
import com.formypet.cs.model.vo.Notice;

/**
 * Servlet implementation class ManagerNoticeUpdateController
 */
@WebServlet("/update.mno")
public class ManagerNoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerNoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 작성자 : 김영주
		int noticeNo = Integer.parseInt(request.getParameter("no"));
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		Notice n = new Notice();
		n.setNoticeNo(noticeNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		
		int result = new NoticeService().updateNotice(n);
		
		if(result > 0) {
			// 성공 => 공지사항 목록 페이지(/views/manager/cs/mNoticeList.jsp) 응답
			//			 포워딩 x => request객체에 담긴게 없음
			//		 alert문구 "공지사항이 성공적으로 수정되었습니다"
			request.getSession().setAttribute("alertMsg", "공지사항이 성공적으로 수정되었습니다.");

			// 리다이렉트방식 => url 재요청 == Servlet(ManagerNoticeListController) 실행
			response.sendRedirect(request.getContextPath() + "/list.mno");
			
		}else {
			//실패 => 에러페이지(포워딩)
			//request.setAttribute("errorMsg", "공지사항 수정에 실패했습니다.");
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
