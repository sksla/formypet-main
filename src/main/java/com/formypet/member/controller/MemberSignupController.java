package com.formypet.member.controller;

import java.io.IOException;

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
 * Servlet implementation class MemberSignupController
 */
@WebServlet("/insert.me")
public class MemberSignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSignupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userBirth = request.getParameter("userBirth");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		String addressPost = request.getParameter("addressPost");
		int statusSns = Integer.parseInt(request.getParameter("statusSns"));
		int statusEmail = Integer.parseInt(request.getParameter("statusEmail"));
		String petType = request.getParameter("petType");
		String petName = request.getParameter("petName");
		String petKind = request.getParameter("petKind");
		int petAge = Integer.parseInt(request.getParameter("petAge"));
		String petGender = request.getParameter("petGender");
		
		Member m = new Member(userId, userPwd, userName, userBirth, gender
							, email, phone, address, addressDetail, addressPost 
							, statusSns, statusEmail, petType, petName, petKind
							, petAge, petGender);
		
		int result = new MemberService().insertMember(m);
	
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/success.me");
			
		}else {
			request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
			
			RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
			view.forward(request, response);
			
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
