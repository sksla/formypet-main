package com.formypet.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.cs.model.service.NoticeService;

/**
 * Servlet implementation class ManagerDeleteNotice
 */
@WebServlet("/delete.mno")
public class ManagerDeleteNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerDeleteNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] noArr = request.getParameterValues("no");
		
		int result = new NoticeService().deleteNotice(noArr);
		
		if(result > 0) {
			// 공지사항 삭제 요청 성공
			// 성공적으로 삭제되었다는 알람문구
			request.getSession().setAttribute("alertMsg", "선택된 글들이 성공적으로 삭제되었습니다.");
			
			// 공지사항목록 페이지 재요청 => 리다이렉트
			response.sendRedirect(request.getContextPath() + "/list.mno");
		}else {
			// 삭제 요청 실패
			// 실패 => 에러페이지 + 에러문구 "공지사항 삭제 실패" => 포워딩
			//request.setAttribute("errorMsg", "공지사항 삭제에 실패했습니다.");
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
