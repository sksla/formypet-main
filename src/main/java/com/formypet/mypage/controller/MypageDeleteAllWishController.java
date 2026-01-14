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
 * Servlet implementation class MypageDeleteWishController
 */
@WebServlet("/deleteAllWishlist")
public class MypageDeleteAllWishController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageDeleteAllWishController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 되있는지 확인하고 안되있으면 위시리스트 삭제 접근 못하게 하기
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	    if (loginUser == null) {
	        // 로그인되어 있지 않으면 로그인 페이지로 리다이렉트
	        response.sendRedirect(request.getContextPath() + "/loginForm.me");
	        return;
	    }
		
		// 사용자 정보
		int userNo = UserNumber.getUserNo(request);
		
		// 이곳에 삭제버튼 클릭 기능 구현
        int result = new MypageService().deleteAllWishlist(userNo);
        if (result > 0) {
            System.out.println("위시리스트 전체 삭제 완료");
        } else {
            System.out.println("위시리스트 전체 삭제 실패");
        }
        
        // 찜 개수 구하기
        int wishCount = new MypageService().getUserWishCount(userNo);
		request.setAttribute("wishCount", wishCount);
		
		// 찜 페이지 실행
		request.getRequestDispatcher("/views/mypage/MypageWish.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
