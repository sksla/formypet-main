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
 * Servlet implementation class MypageDeleteOneWishlistController
 */
@WebServlet("/deleteOneWishlist")
public class MypageDeleteOneWishlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageDeleteOneWishlistController() {
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
	    
	    // 사용자 정보 가져오기
 		int userNo = UserNumber.getUserNo(request);
	    
 		// 상품 번호 가져오기
 		String proNoParam = request.getParameter("proNo");
 		int proNo = 0;
 		
 		if (proNoParam != null && !proNoParam.isEmpty()) {
 			proNo = Integer.parseInt(proNoParam);
 			System.out.println("상품 번호 가져옴 : " + proNo);
 		} else {
 			System.out.println("상품 번호 못 가져옴");
 		}
 		
 		// 위시리스트 1개 삭제 기능
 		int result = new MypageService().deleteOneWishlist(userNo, proNo);
 		if (result > 0) {
            System.out.println("위시리스트 1개 삭제 완료");
        } else {
            System.out.println("위시리스트 1개 삭제 실패");
        }
 		
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
