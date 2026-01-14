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
 * Servlet implementation class MypageAddressInsertController
 * 배송지 추가하는 버튼 기능
 */
@WebServlet("/MypageAddressInsert")
public class MypageAddressInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageAddressInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 로그인 되있는지 확인하고 안되있으면 접근 못하게 하기
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	    if (loginUser == null) {
	        // 로그인되어 있지 않으면 로그인 페이지로 리다이렉트
	        response.sendRedirect(request.getContextPath() + "/loginForm.me");
	        return;
	    }
	    // 사용자 번호 가져오기
	    int userNo = UserNumber.getUserNo(request);
	    
	    // 배송지 번호 받기
	    String name = request.getParameter("name");
	    String phone = request.getParameter("phone");
	    String postCode = request.getParameter("postCode");
	    String address = request.getParameter("address");
	    String detailAddress = request.getParameter("detailAddress");
	    boolean defaultCheck = "true".equals(request.getParameter("defaultCheck"));
		
	    int result = new MypageService().insertAddress(userNo, name, phone, postCode, address, detailAddress, defaultCheck);
        
	    if (result > 0) {
        	System.out.println("배송지 추가 후 기존 기본 배송지 STATUS 변경함");
        } else {
        	System.out.println("배송지 추가 후 기존 기본 배송지 STATUS 변경안함");
        }
		// 배송지 관리 페이지 실행
        request.getRequestDispatcher("/views/mypage/MypageAddress.jsp").forward(request, response);
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
