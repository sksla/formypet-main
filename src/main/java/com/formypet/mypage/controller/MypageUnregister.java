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
 * Servlet implementation class MypageUnregister
 */
@WebServlet("/Unregister")
public class MypageUnregister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageUnregister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 한글 인코딩
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // 사용자 정보
	    int userNo = UserNumber.getUserNo(request);
	    String userPwd = request.getParameter("userPwd");
        
	    // 탈퇴 처리하기
	    int result = new MypageService().Unregister(userNo, userPwd);

	    System.out.println("userPwd : " + userPwd);
	    System.out.println("controller 결과 : " + result);
	    
	    response.getWriter().print(result);
   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
