package com.formypet.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.member.model.vo.Member;
import com.formypet.mypage.model.service.MypageService;
import com.formypet.mypage.model.vo.Delivery;

/**
 * Servlet implementation class MypageAddressController
 */
@WebServlet("/MypageAddress")
public class MypageAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageAddressController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 되있는지 확인하고 안되있으면 배송지 관리 페이지 접근 못하게 하기
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	    if (loginUser == null) {
	        // 로그인되어 있지 않으면 로그인 페이지로 리다이렉트
	        response.sendRedirect(request.getContextPath() + "/loginForm.me");
	        return;
	    }
		
		int userNo = UserNumber.getUserNo(request);
		
		List<Delivery> delivery = new MypageService().getDeliveryInfo(userNo);
		
		List<Integer> deliveryNo = new ArrayList<>();
		List<String> deliveryName = new ArrayList<>();
		List<String> deliveryReceiver = new ArrayList<>();
		List<String> phone = new ArrayList<>();
		List<String> post = new ArrayList<>();
		List<String> address = new ArrayList<>();
		List<String> addressDetail = new ArrayList<>();
		List<Character> status = new ArrayList<>();
		
		for (Delivery d : delivery) {
			deliveryNo.add(d.getDeliveryNo());
			deliveryName.add(d.getDeliverName());
			deliveryReceiver.add(d.getDeliveryReceiver());
			phone.add(d.getPhone());
			post.add(d.getPost());
			address.add(d.getAddress());
			addressDetail.add(d.getAddressDetail());
			status.add(d.getStatus());
		}
		request.setAttribute("deliveryNo", deliveryNo);
		request.setAttribute("deliveryName", deliveryName);
		request.setAttribute("deliveryReceiver", deliveryReceiver);
		request.setAttribute("phone", phone);
		request.setAttribute("post", post);
		request.setAttribute("address", address);
		request.setAttribute("addressDetail", addressDetail);
		request.setAttribute("status", status);

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
