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
 * Servlet implementation class MypageModificationUpdateController
 * 마이페이지 회원정보 수정
 */
@WebServlet("/MypageUpdate")
public class MypageModificationUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageModificationUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        // 사용자 정보
	    int userNo = UserNumber.getUserNo(request);
	    
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
		m.setUserNo(userNo); 
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
		
		int result = new MypageService().MypageUpdate(m);
		System.out.println(result);
	    if(result > 0) {
            request.getSession().setAttribute("alertMsg", "성공적으로 상품이 수정되었습니다.");
            request.getRequestDispatcher("/views/mypage/MypageModification.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("alertMsg", "상품 수정에 실패했습니다.");
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
