package com.formypet.manager.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.manager.model.service.ManagerService;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxManagerInputDataController
 */
@WebServlet("/input.md")
public class AjaxManagerInputDataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxManagerInputDataController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ManagerService mgService = new ManagerService();
		// 품절된 상품 개수
		int soldOutCount =  mgService.countSoldOutProduct();
		// 오늘 새로 회원가입한 회원 수
		int newMemCount = mgService.countTodayEnrollMember();
		// 오늘 새로 등록된 답변대기중인 문의글
		int newQnaCount = mgService.countTodayEnrollQna();
		// 판매량 Best5 상품들 조회 => 순위, 상품번호, 상품코드, ,대표이미지, 상품가격, 총판매량
		List<HashMap<String,Object>> list = mgService.bestSaleRateProList();
		
		
		response.setContentType("application/json; charset=utf-8");
		
		HashMap<String, Object> hmData = new HashMap<>();
		
		hmData.put("soCount", soldOutCount);
		hmData.put("nmCount", newMemCount);
		hmData.put("nqCount", newQnaCount);
		hmData.put("list", list);
		
		new Gson().toJson(hmData, response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
