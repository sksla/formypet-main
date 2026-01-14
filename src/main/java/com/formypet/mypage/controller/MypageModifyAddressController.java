package com.formypet.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.member.model.vo.Member;
import com.formypet.mypage.model.service.MypageService;
import com.formypet.mypage.model.vo.Delivery;
import com.google.gson.Gson;

/**
 * Servlet implementation class MypageModifyAddressController
 * 배송지 수정하기 위해 값을 가져옴
 */
@WebServlet("/MypageModifyAddress")
public class MypageModifyAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageModifyAddressController() {
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

	    // MypageService를 사용하여 배송지 정보 가져오기
	    Delivery delivery = new MypageService().modifyAddress(deliveryNo);

	    // JSON 형식으로 응답하기 위해 content type 및 인코딩 설정
	    response.setContentType("application/json;charset=UTF-8");

	    // Gson 라이브러리를 사용하여 JSON 형식으로 변환
	    Gson gson = new Gson();
	    String json = gson.toJson(delivery);

	    // 응답 전송
	    response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
