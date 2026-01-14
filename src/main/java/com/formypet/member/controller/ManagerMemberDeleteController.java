package com.formypet.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.member.model.service.MemberService;

/**
 * Servlet implementation class ManagerMemberUpdateController
 */
@WebServlet("/delete.mm")
public class ManagerMemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = Integer.parseInt(request.getParameter("memberNo"));
		int result = new MemberService().deleteMember(userNo);
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 탈퇴되었습니다.");
		} else {
			request.getSession().setAttribute("alertMsg", "탈퇴에 실패했습니다.");
		}
		response.sendRedirect(request.getContextPath() + "/updateList.mm?page=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
