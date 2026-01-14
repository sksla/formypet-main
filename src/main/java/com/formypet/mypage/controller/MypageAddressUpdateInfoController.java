package com.formypet.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.member.model.vo.Member;

/**
 * Servlet implementation class MypageAddressUpdateInfoController
 */
@WebServlet("/MypageAddressUpdateInfo")
public class MypageAddressUpdateInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageAddressUpdateInfoController() {
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
		
	    // 배송지 번호 받기
	    int deliveryNo = Integer.parseInt(request.getParameter("deliveryNo"));
	    
	    System.out.println(deliveryNo);
		
		
		System.out.println(deliveryNo);
		System.out.println("출력되나요????");
		System.out.println("출력되나요????");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
