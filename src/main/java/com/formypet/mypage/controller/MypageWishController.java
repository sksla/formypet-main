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
import com.formypet.mypage.model.vo.WishlistProduct;

/**
 * Servlet implementation class MypageWishController
 */
@WebServlet("/MypageWish")
public class MypageWishController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageWishController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 로그인 되있는지 확인하고 안되있으면 위시리스트 페이지 접근 못하게 하기
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	    if (loginUser == null) {
	        // 로그인되어 있지 않으면 로그인 페이지로 리다이렉트
	        response.sendRedirect(request.getContextPath() + "/loginForm.me");
	        return;
	    }
		
		// 마이페이지 위시리스트
		int userNo = UserNumber.getUserNo(request);
		
		// 찜 숫자 불러오기
		int wishCount = new MypageService().getUserWishCount(userNo);
		request.setAttribute("wishCount", wishCount);
		
		// 찜 리스트 불러오기(찜 테이블 + 상품 테이블 데이터)
		List<WishlistProduct> productList = new MypageService().getUserWishlistProducts(userNo);
		
		List<Integer> proNo = new ArrayList<>();
		List<String> proImages = new ArrayList<>();
	    List<String> proNames = new ArrayList<>();
	    List<Integer> prices = new ArrayList<>();
	    List<Integer> stock = new ArrayList<>();
	    List<String> status = new ArrayList<>();

	    for (WishlistProduct product : productList) {
	    	proNo.add(product.getProNo());
	        proImages.add(product.getProImage());
	        proNames.add(product.getProName());
	        prices.add(product.getPrice());
	        stock.add(product.getStock());
	        status.add(product.getStatus());
	    }
	    request.setAttribute("proNo", proNo);
	    request.setAttribute("proImages", proImages);
	    request.setAttribute("proNames", proNames);
	    request.setAttribute("prices", prices);
	    request.setAttribute("stock", stock);
	    request.setAttribute("status", status);
	    
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
