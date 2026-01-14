package com.formypet.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxIdCheckController
 */
@WebServlet("/idCheck.me")
public class AjaxIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxIdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    String checkId = request.getParameter("checkId");
		
		if (checkId != null) {
		   int count = new MemberService().idCheck(checkId);
		        
		        // 응답데이터 : 사용불가능 => "NNNNN" // 사용가능 => "NNNNY"
		        // => 영문일경우 response.setContentType 생략가능
		   response.getWriter().print(count > 0 ? "NNNNN" : "NNNNY");
		   
		} else {
		        // checkId가 null일 경우 예외 처리 또는 적절한 처리를 수행
		        response.getWriter().print("Invalid request: checkId parameter is missing");
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
