package com.formypet.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.member.model.vo.Member;
import com.formypet.mypage.model.service.MypageService;

/**
 * Servlet implementation class mypage_mainpage
 */
@WebServlet("/MypageMain")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 되있는지 확인하고 안되있으면 마이페이지 접근 못하게 하기
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	    if (loginUser == null) {
	        // 로그인되어 있지 않으면 로그인 페이지로 리다이렉트
	        response.sendRedirect(request.getContextPath() + "/loginForm.me");
	        return;
	    }
		
		// 사용자명, 아이디 불러오기
		int userNo = UserNumber.getUserNo(request);
		Member m = new MypageService().getUserInfo(userNo);
		
		String userName = m.getUserName();
		String userId = m.getUserId();

		request.setAttribute("userName", userName);
		request.setAttribute("userId", userId);
		
		// 포인트 불러오기
		int pointTotal = new MypageService().getUserPoint(userNo);
		request.setAttribute("pointTotal", pointTotal);

		// 총 구매 누적금액 불러오기
		int totalAmount = new MypageService().getTotalAmount(userNo);
		request.setAttribute("totalAmount", totalAmount);
		
		// 찜 숫자 불러오기
		int wishCount = new MypageService().getUserWishCount(userNo);
		request.setAttribute("wishCount", wishCount);
		
		
		// 마이페이지 실행하기
		request.getRequestDispatcher("/views/mypage/MypageMain.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
