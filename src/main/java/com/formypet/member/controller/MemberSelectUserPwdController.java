package com.formypet.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.member.model.service.MemberService;

/**
 * Servlet implementation class SelectUserPwdController
 */
@WebServlet("/selectPwd.me")
public class MemberSelectUserPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelectUserPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String errorMsg = null;
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		
		String userPwd = new MemberService().selectUserPwd(userId, email);
		
		if(userId == null) {
		    request.setAttribute("errorMsg", "noUser"); // errorMsg 설정
		} else {
			
			request.setAttribute("errorMsg", "userFound"); // errorMsg 설정
		}
		
		request.setAttribute("userId", userId);
		request.setAttribute("userPwd", userPwd);
		request.setAttribute("email", email);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/selectPwdForm.me");
	    dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
