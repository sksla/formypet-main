package com.formypet.mypage.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.member.model.vo.Member;
import com.formypet.mypage.model.service.MypageService;
import com.formypet.mypage.model.vo.Order;

/**
 * Servlet implementation class MypageOrderController
 */
@WebServlet("/MypageOrder")
public class MypageOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageOrderController() {
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
				
		// 찜 숫자 불러오기
		int wishCount = new MypageService().getUserWishCount(userNo);
		request.setAttribute("wishCount", wishCount);
		
		// 찜 리스트 불러오기(찜 테이블 + 상품 테이블 데이터)
		List<Order> orderList = new MypageService().orderSelect(userNo);
		
		List<Integer> proNo = new ArrayList<>();
		List<String> proImage = new ArrayList<>();
        List<String> proName = new ArrayList<>();
        List<Integer> count = new ArrayList<>();
        List<Integer> price = new ArrayList<>();
        List<Date> orderDate = new ArrayList<>();

        for (Order order : orderList) {
        	proNo.add(order.getProNo());
        	proImage.add(order.getProImage());
        	proName.add(order.getProName());
        	count.add(order.getCount());
        	price.add(order.getPrice());
        	orderDate.add(order.getOrderDate());
        }
        
        request.setAttribute("proNo", proNo);
        request.setAttribute("proImage", proImage);
        request.setAttribute("proName", proName);
        request.setAttribute("count", count);
        request.setAttribute("price", price);
        request.setAttribute("orderDate", orderDate);
		
		// 주문 페이지
        request.getRequestDispatcher("/views/mypage/MypageOrder.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
