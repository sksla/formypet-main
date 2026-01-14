package com.formypet.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.member.model.service.MemberService;
import com.formypet.member.model.vo.Member;

/**
 * Servlet implementation class AjaxKaKaoLoginController
 */
@WebServlet("/kakaoLogin.me")
public class AjaxKaKaoLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxKaKaoLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 요청 파라미터로부터 카카오 회원 정보 추출
		String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        
        int result = new MemberService().insertKakaoMember(userName, email);
    	
		if(result > 0) { //첫 로그인일 경우, 회원가입 성공페이지로 이동
			response.sendRedirect(request.getContextPath() + "/success.me");
			
		}else { //첫 로그인이 아닐 경우, 홈화면으로 이동S
			response.sendRedirect(request.getContextPath());
		}
        
		
        // 여기서는 단순히 회원 정보를 콘솔에 출력합니다. 실제로는 DB에 저장하거나 다른 처리를 수행해야 합니다.
        System.out.println("카카오 회원 정보 - 이메일: " + email + ", 닉네임: " + userName);

        // 응답으로 성공 메시지를 반환합니다.
        response.setContentType("text/plain; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("카카오 회원 정보 저장에 성공했습니다.");
        out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
