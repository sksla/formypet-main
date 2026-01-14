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
 * Servlet implementation class MypageModificationController
 * 회원정보 수정 페이지 출력
 */
@WebServlet("/MypageModification")
public class MypageModificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageModificationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 되있는지 확인하고 안되있으면 회원정보 수정 페이지 접근 못하게 하기
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	    if (loginUser == null) {
	        // 로그인되어 있지 않으면 로그인 페이지로 리다이렉트
	        response.sendRedirect(request.getContextPath() + "/loginForm.me");
	        return;
	    }
		
    	// 사용자 번호 불러오기
		int userNo = UserNumber.getUserNo(request);
		Member m = new MypageService().getUserInfo(userNo);
		
		String userName = m.getUserName();
		String userId = m.getUserId();
		String userBirth = m.getUserBirth();
		String gender = m.getGender();
		String email = m.getEmail();
		String phone = m.getPhone();
		String address = m.getAddress();
		String addressDetail = m.getAddressDetail();
		String addressPost = m.getAddressPost();
		int statusSns = m.getStatusSns();
		int statusEmail = m.getStatusEmail();
		String petType = m.getPetType();
		String petName = m.getPetName();
		String petKind = m.getPetKind();
		int petAge = m.getPetAge();
		String petGender = m.getPetGender();

		request.setAttribute("userName", userName);
		request.setAttribute("userId", userId);
		request.setAttribute("userBirth", userBirth);
		request.setAttribute("gender", gender);
		request.setAttribute("email", email);
		request.setAttribute("phone", phone);
		request.setAttribute("address", address);
		request.setAttribute("addressDetail", addressDetail);
		request.setAttribute("addressPost", addressPost);
		request.setAttribute("statusSns", statusSns);
		request.setAttribute("statusEmail", statusEmail);
		request.setAttribute("petType", petType);
		request.setAttribute("petName", petName);
		request.setAttribute("petKind", petKind);
		request.setAttribute("petAge", petAge);
		request.setAttribute("petGender", petGender);
		
		
		/* 배송지 정보에서 배송지 띄우기  */
		/*
		com.formypet.mypage.model.vo.Member m2 = new MypageService().getUserInfo(userNo);
		String address2 = m2.getAddress();
		String addressDetail2 = m2.getAddressDetail();
		String addressPost2 = m2.getPost();
		
		request.setAttribute("address2", address2);
		request.setAttribute("addressDetail2", addressDetail2);
		request.setAttribute("Post2", addressPost2);
		*/
		// 회원 정보 수정 페이지 요청
        request.getRequestDispatcher("/views/mypage/MypageModification.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
