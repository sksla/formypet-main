package com.formypet.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.formypet.member.model.service.MemberService;
import com.formypet.member.model.vo.Member;

/**
 * Servlet implementation class ManagerMemberUpdateController
 */
@WebServlet("/update.mm")
public class ManagerMemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		int eStatus = Integer.parseInt(request.getParameter("emailStatus") == null ? "0" : "1");
		String phone = request.getParameter("phone");
		int sStatus = Integer.parseInt(request.getParameter("snsStatus") == null ? "0" : "1");
		String post = request.getParameter("post");
		String address = request.getParameter("address");
		String detail = request.getParameter("detail");
		String birth = request.getParameter("birth");
		String status = request.getParameter("status");
		String type = request.getParameter("petradio");
		Member m = new Member();
		if(!type.equals("N")) {
			String petName = request.getParameter("petName");
			String petKind = request.getParameter("petKind");
			int petAge = Integer.parseInt(request.getParameter("petAge"));
			String petGender = request.getParameter("genderradio");
			m.setPetName(petName);
			m.setPetKind(petKind);
			m.setPetAge(petAge);
			m.setPetGender(petGender);
		}
		m.setUserNo(no);
		m.setUserName(name);
		m.setEmail(email);
		m.setStatusEmail(eStatus);
		m.setPhone(phone);
		m.setStatusSns(sStatus);
		m.setAddressPost(post);
		m.setAddress(address);
		m.setAddressDetail(detail);
		m.setUserBirth(birth);
		m.setStatus(status);
		m.setPetType(type);
		
		int result = new MemberService().updateMember(m);
		System.out.println(result);
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/updateList.mm?page=1");
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
