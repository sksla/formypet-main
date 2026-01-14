package com.formypet.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.formypet.member.model.service.MemberService;
import com.formypet.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/login.me")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Member m = new MemberService().loginMember(userId, userPwd);

		if(m == null) {
	        request.setAttribute("errorMsg", "아이디 또는 비밀번호를 잘못 입력했습니다.\r\n"
	                + "입력하신 내용을 다시 확인해주세요.");
	        // 실패할 경우에만 로그인 페이지로 포워딩하여 모달 창을 표시
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/loginForm.me");
	        dispatcher.forward(request, response);
			
		} else {
	        HttpSession session = request.getSession(); // 세션
	        session.setAttribute("loginUser", m);
	        response.sendRedirect(request.getContextPath());
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
